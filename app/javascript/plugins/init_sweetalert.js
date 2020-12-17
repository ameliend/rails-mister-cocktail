import swal from 'sweetalert';

const initSweetalert = (selector, options = {}, callback = () => {}) => {
  const swalButtons = document.querySelectorAll(selector);
  if (swalButtons) { // protect other pages
    swalButtons.forEach((swalButton) => {
      swalButton.addEventListener('click', (e) => {
        swal(options).then((value) => {
          console.log("test", e)
          callback(value, e.target)
        }); // <-- add the `.then(callback)`
      });
    })
  }
};

export { initSweetalert };
