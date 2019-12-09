document.querySelectorAll("[data-copy-src]").forEach(el => {
  el.addEventListener("click", event => {
    navigator.clipboard.writeText(event.target.src);
  });
});
