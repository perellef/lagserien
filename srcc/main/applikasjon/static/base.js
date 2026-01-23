window.addEventListener('load', () => {
  const currentURL = window.location.pathname;
  deaktiverNav(currentURL)
  aktiverNav(currentURL);
});

function aktiverNav(url) {
  const navLinks = document.querySelectorAll('.nav-link');
  navLinks.forEach(link => {
      if ((url.startsWith(link.getAttribute('href')) && (link.getAttribute('href') !== '/')) || link.getAttribute('href') == url) {
          link.classList.add('active');
      }
  });
}

function deaktiverNav(url) {
  const navLinks = document.querySelectorAll('.nav-link');
  navLinks.forEach(link => {
      if (!(url.startsWith(link.getAttribute('href')) && (link.getAttribute('href') !== '/')) || link.getAttribute('href') == url) {
          link.classList.add('deactive');
      }
  });
}