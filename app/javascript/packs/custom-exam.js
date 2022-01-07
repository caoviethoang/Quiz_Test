Session("StartTime") = DateTime.Now
var endTime = Session("StartTime");

const startingMenutes = 30;
let time = startingMenutes * 60;

const countDownElement = document.getElementById("countdown");

setInterval(updateCountdown, 1000);

function updateCountdown() {
  const minutes = Math.floor(time / 60);
  let seconds = time % 60;

  seconds = seconds < 10 ? "0" + seconds : seconds;

  countDownElement.innerHTML = `${minutes}:${seconds}`;
  time--;
}

const start_btn = document.querySelector(".start-btn button");
const info_box = document.querySelector(".info-box");
const exit_btn = document.querySelector(".start .quit");
const continue_btn = document.querySelector(".start .continue");

start_btn.onclick = () => {
  info_box.classList.add("activeInfo");
};

exit_btn.onclick = () => {
  info_box.classList.remove("activeInfo");
};

continue_btn.onclick = () => {
  info_box.classList.remove("activeInfo");
  document.getElementById("content-start").style.display = "none";

  var question = document.getElementById("content-question");
  var side = document.getElementById("right-bar");

  question.style.display = "block";
  side.style.display = "block";

  question.className += "content-question col-12 col-md-9";
  side.className += "right-bar col-6 col-md-3";
};
