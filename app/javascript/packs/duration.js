function displayDuration() {
  showContainer = document.getElementById(this.id.concat("Container"))
  mins = this.value
  hours = mins / 60
  remaining_mins = mins % 60
  remaining_mins = String(remaining_mins).length == 1 ? "0".concat(String(remaining_mins)) : remaining_mins

  showContainer.innerHTML = `${parseInt(hours)}h : ${(remaining_mins)}m`
}

window.addEventListener("load", function(){
  durationInput = document.querySelectorAll(".duration-input");
  durationInput.forEach((d) => d.addEventListener("mousemove", displayDuration));
});
