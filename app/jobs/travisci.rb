require 'travis'

def update_builds(repository, config)
  builds = []
  repo = nil

    Travis.access_token = ENV['TRAVIS_TOKEN']
    repo = Travis::Repository.find(repository)

  build = repo.last_build
  build_info = {
    label: "Build #{build.number}",
    value: "[#{build.branch_info}], #{build.state} in #{build.duration}s",
    state: build.state
  }
  builds << build_info

  builds
end
config_file = File.join(Rails.root, 'config', 'travisci.yml')
config = YAML::load(File.open(config_file))

Dashing.scheduler.every('2m', first_in: '1s') {
  config.each do |type, type_config|
    unless type_config["repositories"].nil?
      type_config["repositories"].each do |data_id, repo|
        Dashing.send_event(data_id, { items: update_builds(repo, type_config) })
      end
    else
      puts "No repositories for travis.#{type}"
    end
  end
}