window.addEventListener("load", function(){

  document.querySelectorAll('.jsChart').forEach((c) => {
    const myChart = new Chart(c, {
      type: 'doughnut',
      data: {
          labels: c.dataset.categories.split(" "),
          datasets: [{
              label: '# of Votes',
              data: c.dataset.durations.split(" "),
              backgroundColor: c.dataset.colours.split(" "),
              borderColor: c.dataset.colours.split(" "),
              borderWidth: 1
          }]
      },
      options: {
          scales: {
              y: {
                  beginAtZero: true
              }
          }
      }
  });
  });






});
