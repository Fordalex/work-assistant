window.addEventListener("load", function(){

  const ctx = document.getElementById('myChart');
  console.log(ctx.dataset.colours)
  const myChart = new Chart(ctx, {
      type: 'doughnut',
      data: {
          labels: ctx.dataset.categories.split(" "),
          datasets: [{
              label: '# of Votes',
              data: ctx.dataset.durations.split(" "),
              backgroundColor: ctx.dataset.colours.split(" "),
              borderColor: ctx.dataset.colours.split(" "),
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
