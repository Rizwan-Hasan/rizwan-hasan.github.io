const dom = {
    select: document.querySelector.bind(document),
    slectAll: document.querySelectorAll.bind(document)
};
const burger = dom.select('.navbar-burger');
const menu = dom.select('.navbar-menu');
burger.addEventListener('click', () => {
    burger.classList.toggle('is-active');
    menu.classList.toggle('is-active');
});
dom.select(`.navbar-menu a[href$="${window.location.pathname}"]`).classList.add('is-active');