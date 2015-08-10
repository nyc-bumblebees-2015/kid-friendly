var count = 10;
function getBaseUrl() {
    var host = window.location.host
    var protocol = location.protocol
    var baseUrl = protocol + "//" + host
    return baseUrl;
  };

function countDown(){
    var timer = document.getElementById("timer");
    if(count > 0){
        count--;
        timer.innerHTML = "You will be automatically redirected in "+count+" seconds.";
        setTimeout("countDown()", 1000);
    }else{
        window.location.href = getBaseUrl();
    }
}
