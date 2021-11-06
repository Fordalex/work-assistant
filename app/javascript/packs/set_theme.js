window.addEventListener('load', function() {
  const theme = document.querySelector('[data-theme]').dataset.theme;
  const themeColours = {
    'light' : {
      '--dark-bg-colour': '#fafcff',
      '--mid-bg-colour': '#ffffff',
      '--light-bg-colour': '#ffffff',
      '--text-colour': 'rgb(0, 0, 0)',
      '--shadow-opacity': '0.1',
      '--glow-opacity': '0'
    },
    'dark' : {
      '--dark-bg-colour': '#181818',
      '--mid-bg-colour': '#222222',
      '--light-bg-colour': '#3d3d3d',
      '--text-colour': 'rgb(221, 221, 221)',
      '--shadow-opacity': '0.8',
      '--glow-opacity': '0.7'
    }
  }

  Object.entries(themeColours[theme]).forEach(([k,v]) => {
    document.documentElement.style.setProperty(k,v);
  });
});
