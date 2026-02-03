// Wait for the DOM to be fully loaded before executing
window.addEventListener('DOMContentLoaded', () => {
    // Highlight active navigation link based on the current page
    const navLinks = document.querySelectorAll('nav ul li a');
    const currentPage = window.location.pathname.split('/').pop();

    // Loop through each nav link and check if it matches the current page
    navLinks.forEach(link => {
        if (link.getAttribute('href') === currentPage) {
            link.classList.add('active'); // Add 'active' class if the link matches
        } else {
            link.classList.remove('active'); // Remove 'active' class if it doesn't match
        }
    });

    // Mobile dropdown menu toggle functionality
    const navToggle = document.querySelector('.nav-toggle');
    const navMenu = document.querySelector('nav ul');
	
	// Get the current year
	const currentYear = new Date().getFullYear();

	// Find the HTML element by its ID and set its text content
	document.getElementById('current-year').textContent = currentYear;

    // Toggle the 'show' class on the navMenu when the navToggle button is clicked
    navToggle.addEventListener('click', () => {
        navMenu.classList.toggle('show');
    });
	
});

