function openCalendar() {
  calendarContainers = document.querySelectorAll('.calendar-dayContainer');
  calendarContainers.forEach((c) => {
    c.classList.remove('calendar-open')
    c.classList.add('calendar-closed')
  });
  this.classList.remove('calendar-closed')
  this.classList.add('calendar-open')
}

function styleTimeSheet(s) {
  for (let i = 0; i < 24; i++) {
    time = i < 12 ? " am" : " pm"
    div = document.createElement('div');
    div.classList.add('hour-container');
    hr = document.createElement('hr');
    div.appendChild(hr);
    hourSpan = document.createElement('span');
    hour = document.createTextNode(i + time);
    hourSpan.appendChild(hour)
    div.appendChild(hourSpan);
    s.appendChild(div);
  }
}

window.onload = function() {
  calendarContainers = document.querySelectorAll('.calendar-dayContainer')
  calendarContainers.forEach((c) => c.addEventListener('click', openCalendar))

  timeSheets = document.querySelectorAll('.calendar-timeSheet');
  timeSheets.forEach((s) => {
    styleTimeSheet(s);
  })
}
