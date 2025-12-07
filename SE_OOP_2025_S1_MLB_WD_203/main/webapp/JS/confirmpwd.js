
const form = document.querySelector('form');

form.addEventListener('submit', function (event)
{
    const pwd = document.getElementById('password').value;

    const cnfmpwd = document.getElementById('confirm').value;

        if (pwd !== cnfmpwd)
            {
                alert("Passwords do not match.");
                event.preventDefault();
            }
});