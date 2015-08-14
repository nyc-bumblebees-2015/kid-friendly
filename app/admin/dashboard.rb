ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do

    # Here is an example of a simple dashboard with columns and panels.
    #
    columns do

      column do
        panel "Recent Locations" do
          table_for Location.order('created_at desc').limit(5) do
            column("Name")   {|location| link_to(location.name, admin_location_path(location))       }
            column("Overall Rating"){|location| location.star_rating("overall_rating") }
            column("Reviews Count"){|location| location.reviews.count }
            column("Created"){|location| time_ago_in_words(location.created_at) + " ago" }
          end
        end
      end

      column do
        panel "Recent Users" do
          table_for User.order('created_at desc').limit(5) do
            column("Username")   {|user| link_to(user.first_name + " " + user.last_name, admin_user_path(user))       }
            column("Email"){|user| user.email }
            column("Reviews Written"){|user| user.reviews.count }
            column("Reviews Liked"){|user| user.likes.count }
          end
        end
      end

      column do
        panel "Recent Reviews" do
          table_for Review.order('created_at desc').limit(5) do
            column("Created"){|review| link_to((time_ago_in_words(review.created_at) + " ago"), admin_review_path(review))  }
            column("User")   {|review| review.user.username }
            column("Location"){|review| review.location.name }
            column("Overall Rating"){|review| review.overall_rating }
            column("Liked Count"){|review| review.likes.count }
          end
        end
      end

    end
  end
end
