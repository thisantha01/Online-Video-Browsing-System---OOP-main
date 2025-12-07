// Sidebar Toggle
const menuToggle = document.getElementById('menuToggle');
const sidebar = document.getElementById('sidebar');
const overlay = document.getElementById('overlay');

menuToggle.addEventListener('click', () => {
    sidebar.classList.toggle('active');
    overlay.classList.toggle('active');
});

overlay.addEventListener('click', () => {
    sidebar.classList.remove('active');
    overlay.classList.remove('active');
});

// Profile Image Upload
const profileInput = document.getElementById('profilePhotoInput');
const imagePreview = document.getElementById('imagePreview');
const modal = document.getElementById('photoUploadModal');
let cropper;

profileInput.addEventListener('change', (e) => {
    const file = e.target.files[0];
    if (file) {
        const reader = new FileReader();
        reader.onload = (e) => {
            imagePreview.src = e.target.result;
            modal.style.display = 'flex';
            
            // Initialize Cropper
            if (cropper) cropper.destroy();
            cropper = new Cropper(imagePreview, {
                aspectRatio: 1,
                viewMode: 1,
            });
        };
        reader.readAsDataURL(file);
    }
});

// Modal Handlers
document.querySelectorAll('.close-modal, #cancelUpload').forEach(btn => {
    btn.addEventListener('click', () => {
        modal.style.display = 'none';
        profileInput.value = '';
        if (cropper) cropper.destroy();
    });
});

// Save Image
document.getElementById('savePhoto').addEventListener('click', () => {
    const canvas = cropper.getCroppedCanvas({
        width: 200,
        height: 200,
    });
    
    canvas.toBlob((blob) => {
        const url = URL.createObjectURL(blob);
        document.getElementById('profileImage').src = url;
        document.getElementById('headerProfileImage').src = url;
        modal.style.display = 'none';
    });
});

// Real-time Clock
function updateTime() {
    document.querySelector('.time').textContent = 
        new Date().toLocaleTimeString('en-US', { hour12: true });
}
setInterval(updateTime, 1000);
updateTime();