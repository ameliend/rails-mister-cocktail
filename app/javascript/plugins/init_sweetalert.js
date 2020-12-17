import swal from 'sweetalert';

const initSweetalert = (selector, options = {}, callback = () => {}) => {
  const swalButtons = document.querySelectorAll(selector);
  if (swalButtons) { // protect other pages
    swalButtons.forEach((swalButton) => {
      swalButton.addEventListener('click', (e) => {
        swal(options).then(() => {
          console.log("test", e)
          callback(e.target)
        }); // <-- add the `.then(callback)`
      });
    })
  }
};

export { initSweetalert };
