document.addEventListener('DOMContentLoaded', function() {
    // Elements
    const sidebar = document.getElementById('sidebar');
    const mainContent = document.getElementById('mainContent');
    const menuToggle = document.getElementById('menuToggle');
    const overlay = document.getElementById('overlay');
    
    // Initialize the dashboard
    initDashboard();
    
    // Update time
    updateTime();
    setInterval(updateTime, 1000);
    
 //side menu
    menuToggle.addEventListener('click', function() {
        toggleSidebar();
    });
    
   
    overlay.addEventListener('click', function() {
        toggleSidebar();
    });
    

    document.getElementById('chartType').addEventListener('change', function() {
        updateChart();
    });
    
   
    document.getElementById('datePicker').addEventListener('change', function() {
        fetchAnalyticsData();
    });
    
 
    document.getElementById('exportChart').addEventListener('click', function() {
        exportChart();
    });
    

    function toggleSidebar() {
        sidebar.classList.toggle('active');
        overlay.classList.toggle('active');
        
     
        if (window.innerWidth >= 992) {
            mainContent.classList.toggle('shifted');
        }
    }
    

    window.addEventListener('resize', function() {
        if (window.innerWidth < 992 && mainContent.classList.contains('shifted')) {
            mainContent.classList.remove('shifted');
        } else if (window.innerWidth >= 992 && sidebar.classList.contains('active') && !mainContent.classList.contains('shifted')) {
            mainContent.classList.add('shifted');
        }
    });
});


function initDashboard() {
    
    const today = new Date();
    const formattedDate = formatDate(today);
    document.getElementById('datePicker').value = formattedDate;
    
   
    fetchSystemStats();
    fetchAnalyticsData();
    fetchVideoData();
}


function updateTime() {
    const now = new Date();
    const timeString = now.toLocaleTimeString();
    document.querySelector('.time').textContent = timeString;
}


function formatDate(date) {
    const year = date.getFullYear();
    const month = String(date.getMonth() + 1).padStart(2, '0');
    const day = String(date.getDate()).padStart(2, '0');
    return `${year}-${month}-${day}`;
}


function fetchSystemStats() {
   
    

    setTimeout(() => {
      
        document.getElementById('totalUsers').textContent = '1200';
        document.getElementById('totalVideos').textContent = '5400';
        document.getElementById('pendingReviews').textContent = '23';
    }, 300);
}


function fetchAnalyticsData() {
  
    document.getElementById('analyticsChart').style.opacity = '0.5';
    

    const selectedDate = document.getElementById('datePicker').value;
    

    setTimeout(() => {
        
        const data = {
            labels: ['Users', 'Videos', 'Reviews'],
            values: [1200, 5400, 23]
        };
        

        renderChart(data);
        

        document.getElementById('analyticsChart').style.opacity = '1';
    }, 500);
}


let chart = null;
function renderChart(data) {
    const ctx = document.getElementById('analyticsChart').getContext('2d');
    const chartType = document.getElementById('chartType').value;
 
    if (chart) {
        chart.destroy();
    }
 
    let backgroundColor = [];
    let borderColor = [];
    
    if (chartType === 'pie') {
        backgroundColor = [
            'rgba(54, 162, 235, 0.7)',
            'rgba(75, 192, 192, 0.7)',
            'rgba(255, 99, 132, 0.7)'
        ];
        borderColor = [
            'rgba(54, 162, 235, 1)',
            'rgba(75, 192, 192, 1)',
            'rgba(255, 99, 132, 1)'
        ];
    } else {
        backgroundColor = [
            'rgba(54, 162, 235, 0.7)',
            'rgba(75, 192, 192, 0.7)',
            'rgba(255, 99, 132, 0.7)'
        ];
        borderColor = [
            'rgba(54, 162, 235, 1)',
            'rgba(75, 192, 192, 1)',
            'rgba(255, 99, 132, 1)'
        ];
    }
    
   
    chart = new Chart(ctx, {
        type: chartType,
        data: {
            labels: data.labels,
            datasets: [{
                label: 'System Analytics',
                data: data.values,
                backgroundColor: backgroundColor,
                borderColor: borderColor,
                borderWidth: 1
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            scales: chartType !== 'pie' ? {
                y: {
                    beginAtZero: true
                }
            } : {}
        }
    });
}


function updateChart() {
    fetchAnalyticsData();
}


function exportChart() {
    if (!chart) return;
    
    const canvas = document.getElementById('analyticsChart');
    const image = canvas.toDataURL('image/png');
    
 
    const link = document.createElement('a');
    link.href = image;
    link.download = 'analytics-chart.png';
    link.click();
}

function fetchVideoData() {
    // Simulate fetching data from the server
    setTimeout(() => {
        const videos = [
            { id: 1, title: 'Intro to JavaScript', uploader: 'user123', status: 'Pending' },
            { id: 2, title: 'React Basics', uploader: 'coderMike', status: 'Approved' },
            { id: 3, title: 'Java Spring Boot Tutorial', uploader: 'javaGuru', status: 'Pending' },
            { id: 4, title: 'CSS Grid Layout', uploader: 'designPro', status: 'Approved' },
            { id: 5, title: 'Node.js for Beginners', uploader: 'webDev', status: 'Rejected' }
        ];
        
        populateVideoTable(videos);
    }, 400);
}

function populateVideoTable(videos) {
    const tableBody = document.getElementById('videoTableBody');
    tableBody.innerHTML = ''; // Clear existing rows

    videos.forEach(video => {
        const row = document.createElement('tr');

        const titleCell = document.createElement('td');
        titleCell.textContent = video.title;
        row.appendChild(titleCell);

        const uploaderCell = document.createElement('td');
        uploaderCell.textContent = video.uploader;
        row.appendChild(uploaderCell);

        const statusCell = document.createElement('td');
        statusCell.textContent = video.status;
        row.appendChild(statusCell);

        // Action buttons
        const actionsCell = document.createElement('td');
        const actionButtons = document.createElement('div');
        actionButtons.className = 'action-buttons';

        if (video.status === 'Pending') {
            const approveBtn = document.createElement('button');
            approveBtn.className = 'btn btn-primary';
            approveBtn.textContent = 'Approve';
            approveBtn.addEventListener('click', () => approveVideo(video.id));
            actionButtons.appendChild(approveBtn);
        }

        const deleteBtn = document.createElement('button');
        deleteBtn.className = 'btn btn-danger';
        deleteBtn.textContent = 'Delete';
        deleteBtn.addEventListener('click', () => deleteVideo(video.id));
        actionButtons.appendChild(deleteBtn);

        actionsCell.appendChild(actionButtons);
        row.appendChild(actionsCell);

        tableBody.appendChild(row);
    });
}



function approveVideo(videoId) {
    
    alert(`Video ${videoId} approved!`);
  
    fetchVideoData();
}

function deleteVideo(videoId) {

    if (confirm(`Are you sure you want to delete video ${videoId}?`)) {
        alert(`Video ${videoId} deleted!`);
       
        fetchVideoData();
    }
}

document.addEventListener('DOMContentLoaded', function() {
 
   

    initProfilePhotoUpload();
});


function initProfilePhotoUpload() {
    const profilePhotoInput = document.getElementById('profilePhotoInput');
    const profileImage = document.getElementById('profileImage');
    const imagePreview = document.getElementById('imagePreview');
    const photoUploadModal = document.getElementById('photoUploadModal');
    const savePhotoBtn = document.getElementById('savePhoto');
    const cancelUploadBtn = document.getElementById('cancelUpload');
    const closeModalBtn = document.querySelector('.close-modal');
    
    
    profilePhotoInput.addEventListener('change', function(e) {
        if (e.target.files && e.target.files[0]) {
            const reader = new FileReader();
            
            reader.onload = function(e) {
              
                imagePreview.src = e.target.result;
                
     
                photoUploadModal.style.display = 'block';
            };
            
            reader.readAsDataURL(e.target.files[0]);
        }
    });
    

    savePhotoBtn.addEventListener('click', function() {
     
        profileImage.src = imagePreview.src;

        const headerProfileImage = document.querySelector('.user-img img');
        if (headerProfileImage) {
            headerProfileImage.src = imagePreview.src;
        }
        
       
        uploadProfilePhotoToServer(imagePreview.src);
        
    
        photoUploadModal.style.display = 'none';
    });
    
  
    cancelUploadBtn.addEventListener('click', function() {
       
        photoUploadModal.style.display = 'none';
      
        profilePhotoInput.value = '';
    });
    

    closeModalBtn.addEventListener('click', function() {
        photoUploadModal.style.display = 'none';
        profilePhotoInput.value = '';
    });
    
    
    window.addEventListener('click', function(e) {
        if (e.target === photoUploadModal) {
            photoUploadModal.style.display = 'none';
            profilePhotoInput.value = '';
        }
    });
}


function uploadProfilePhotoToServer(photoDataUrl) {
    
    console.log('Uploading profile photo to server...');
    
 
    setTimeout(() => {
        console.log('Profile photo uploaded successfully!');
        
       
        alert('Profile photo updated successfully!');
    }, 1000);
}

