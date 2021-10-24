function hoveredIcon() {
  this.src = this.src.replace(".png","_selected.png")
  console.log(this.src)
}

function normalIcon() {
  this.src = this.src.replace("_selected", "")
}

window.addEventListener("load", function() {
  iconHover = document.querySelectorAll(".icon-hover");
  iconHover.forEach((i) => i.addEventListener("mouseover", hoveredIcon))
  iconHover.forEach((i) => i.addEventListener("mouseleave", normalIcon))
})
