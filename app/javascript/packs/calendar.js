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
  calendarContainers = document.querySelectorAll('.calendar-dayContainer');
  calendarContainers.forEach((c) => c.addEventListener('click', openCalendar));

  calendarTimeSheet = document.querySelectorAll('.calendar-timeSheet');
  calendarTimeSheet.forEach((t) => t.scrollTo(0, 440))
}
