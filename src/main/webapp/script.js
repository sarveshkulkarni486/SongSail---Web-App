/**
 * 
 */

// Wait for the DOM to load before running the JavaScript code
  document.addEventListener('DOMContentLoaded', () => {
    var menu_btn = document.querySelector("#menu-btn");
    var sidebar = document.querySelector("#sidebar");
    var container = document.querySelector(".my-container");
    menu_btn.addEventListener('click', () => {
      sidebar.classList.toggle("active-nav");
      container.classList.toggle("active-cont");
    });
  });


document.addEventListener("DOMContentLoaded", function() {
  const modalTrigger = document.querySelector('.openModal');
  const modal = document.getElementById('modal');
  const closeBtn = document.querySelector('.close');

  modalTrigger.addEventListener('click', function() {
    modal.style.display = 'block';
  });

  closeBtn.addEventListener('click', function() {
    modal.style.display = 'none';
  });

  window.addEventListener('click', function(event) {
    if(event.target === modal){
      modal.style.display='none';
    }
  })
})

