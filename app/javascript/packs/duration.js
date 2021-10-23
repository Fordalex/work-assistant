function displayDuration() {
  showContainer = document.getElementById(this.id.concat("Container"))
  showContainer.innerHTML = this.value
}

window.addEventListener("load", function(){
  durationInput = document.querySelectorAll(".duration-input");
  durationInput.forEach((d) => d.addEventListener("mousemove", displayDuration));
});
