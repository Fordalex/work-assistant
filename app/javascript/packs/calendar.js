function openCalendar() {
  calendarContainers = document.querySelectorAll('.calendar-dayContainer');
  calendarContainers.forEach((c) => {
    c.classList.remove('calendar-open')
    c.classList.add('calendar-closed')
  });
  this.classList.remove('calendar-closed')
  this.classList.add('calendar-open')
}

window.onload = function() {
  calendarContainers = document.querySelectorAll('.calendar-dayContainer')
  calendarContainers.forEach((c) => c.addEventListener('click', openCalendar))
}
