document.addEventListener('DOMContentLoaded', function() {
    // Handle Create New Profile button click
    document.getElementById('createNew').addEventListener('click', function() {
        // Navigate to the new profile JSP page
        window.location.href = 'ProfileCreate.jsp';
    });

   
    document.getElementById('profileForm').addEventListener('submit', function(e) {
       
        console.log('Form submitted');
        
    });
});