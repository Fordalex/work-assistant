window.addEventListener('load', function() {
  const theme = document.querySelector('[data-theme]').dataset.theme;
  const themeColours = {
    'light' : {
      '--dark-bg-colour': '#fafcff',
      '--mid-bg-colour': '#fafcff',
      '--light-bg-colour': '#eff2f6',
      '--input-colour': '#f9f9f9',
      '--border-colour': '#f0f0f0',
      '--text-colour': 'rgb(0, 0, 0)',
      '--shadow-opacity': '0.1',
      '--glow-opacity': '0'
    },
    'dark' : {
      '--dark-bg-colour': '#181818',
      '--mid-bg-colour': '#222222',
      '--light-bg-colour': '#3d3d3d',
      '--input-colour': '#000',
      '--border-colour': '#424242',
      '--text-colour': 'rgb(221, 221, 221)',
      '--shadow-opacity': '0.8',
      '--glow-opacity': '0.3'
    }
  }

  Object.entries(themeColours[theme]).forEach(([k,v]) => {
    document.documentElement.style.setProperty(k,v);
  });
});
