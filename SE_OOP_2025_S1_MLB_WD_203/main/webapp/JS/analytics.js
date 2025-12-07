document.addEventListener('DOMContentLoaded', function() {
    // Elements
    const chartTypeSelect = document.getElementById('chartType');
    const datePicker = document.getElementById('datePicker');
    const tabTriggers = document.querySelectorAll('.tab-trigger');
    const chartIcon = document.getElementById('chartIcon');
    const chartMessage = document.querySelector('.chart-message');
    const chartDateInfo = document.querySelector('.chart-date-info');
    const analyticsChart = document.getElementById('analyticsChart');
    const chartPlaceholder = document.querySelector('.chart-placeholder');
    
 
    let chart = null;
    

    const today = new Date();
    const formattedDate = formatDate(today);
    datePicker.value = formattedDate;
    updateChartDateInfo(today);
    
  
    chartTypeSelect.addEventListener('change', updateChartType);
    datePicker.addEventListener('change', handleDateChange);
    
    tabTriggers.forEach(tab => {
        tab.addEventListener('click', () => {
       
            tabTriggers.forEach(t => t.classList.remove('active'));
            
            tab.classList.add('active');
         
            fetchAnalyticsData(tab.dataset.period);
        });
    });
    
    
    updateChartType();
    

    fetchAnalyticsData('daily');
    

    function updateChartType() {
        const chartType = chartTypeSelect.value;
        
 
        chartIcon.innerHTML = getChartIcon(chartType);
        
   
        const chartTypeName = chartType.charAt(0).toUpperCase() + chartType.slice(1);
        chartMessage.textContent = `${chartTypeName} chart will be displayed here`;
        

        if (chart) {
            updateChart();
        }
    }
    
    function handleDateChange() {
        const selectedDate = new Date(datePicker.value);
        updateChartDateInfo(selectedDate);
        
        // Fetch data for the selected date
        const activePeriod = document.querySelector('.tab-trigger.active').dataset.period;
        fetchAnalyticsData(activePeriod, selectedDate);
    }
    
    function updateChartDateInfo(date) {
        const options = { year: 'numeric', month: 'long', day: 'numeric' };
        chartDateInfo.textContent = `Data for ${date.toLocaleDateString('en-US', options)}`;
    }
    
    function getChartIcon(chartType) {
        switch(chartType) {
            case 'bar':
                return `<svg xmlns="http://www.w3.org/2000/svg" width="48" height="48" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect width="18" height="18" x="3" y="3" rx="2"/><path d="M7 16V9"/><path d="M11 16v-5"/><path d="M15 16v-3"/><path d="M19 16v-2"/></svg>`;
            case 'line':
                return `<svg xmlns="http://www.w3.org/2000/svg" width="48" height="48" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect width="18" height="18" x="3" y="3" rx="2"/><path d="M3 10h18"/><path d="m7 15 3-3 2 2 3-3 2 2"/></svg>`;
            case 'pie':
                return `<svg xmlns="http://www.w3.org/2000/svg" width="48" height="48" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M21.21 15.89A10 10 0 1 1 8 2.83"/><path d="M22 12A10 10 0 0 0 12 2v10z"/></svg>`;
            default:
                return `<svg xmlns="http://www.w3.org/2000/svg" width="48" height="48" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect width="18" height="18" x="3" y="3" rx="2"/><path d="M7 16V9"/><path d="M11 16v-5"/><path d="M15 16v-3"/><path d="M19 16v-2"/></svg>`;
        }
    }
    
    function formatDate(date) {
        const year = date.getFullYear();
        const month = String(date.getMonth() + 1).padStart(2, '0');
        const day = String(date.getDate()).padStart(2, '0');
        return `${year}-${month}-${day}`;
    }
    
    function fetchAnalyticsData(period, date = new Date(datePicker.value)) {
        // Show loading state
        chartPlaceholder.style.display = 'block';
        analyticsChart.style.display = 'none';
        
        // Format date for API request
        const formattedDate = formatDate(date);
       
        setTimeout(() => {
      
            const data = generateMockData(period);
            
       
            renderChart(data);
            
   
            updateMetrics(data);
            
         
            chartPlaceholder.style.display = 'none';
            analyticsChart.style.display = 'block';
        }, 500);
    }
    
    function generateMockData(period) {
       
        const labels = [];
        const values = [];
        
        switch(period) {
            case 'daily':
            
                for (let i = 0; i < 24; i++) {
                    labels.push(`${i}:00`);
                    values.push(Math.floor(Math.random() * 100) + 20);
                }
                break;
            case 'weekly':
                // Daily data for a week
                const days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
                days.forEach(day => {
                    labels.push(day);
                    values.push(Math.floor(Math.random() * 500) + 100);
                });
                break;
            case 'monthly':
                // Weekly data for a month
                for (let i = 1; i <= 4; i++) {
                    labels.push(`Week ${i}`);
                    values.push(Math.floor(Math.random() * 2000) + 500);
                }
                break;
        }
        
        return {
            labels,
            values
        };
    }
    
    function renderChart(data) {
        const ctx = analyticsChart.getContext('2d');
        const chartType = chartTypeSelect.value;
        
        // Destroy previous chart if it exists
        if (chart) {
            chart.destroy();
        }
        
        // Create new chart
        chart = new Chart(ctx, {
            type: chartType,
            data: {
                labels: data.labels,
                datasets: [{
                    label: 'Analytics Data',
                    data: data.values,
                    backgroundColor: chartType === 'pie' 
                        ? data.labels.map(() => getRandomColor()) 
                        : 'rgba(54, 162, 235, 0.5)',
                    borderColor: 'rgba(54, 162, 235, 1)',
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
        if (chart) {
            const chartType = chartTypeSelect.value;
            chart.config.type = chartType;
            chart.config.data.datasets[0].backgroundColor = chartType === 'pie'
                ? chart.config.data.labels.map(() => getRandomColor())
                : 'rgba(54, 162, 235, 0.5)';
            chart.update();
        }
    }
    
    function getRandomColor() {
        const letters = '0123456789ABCDEF';
        let color = '#';
        for (let i = 0; i < 6; i++) {
            color += letters[Math.floor(Math.random() * 16)];
        }
        return color;
    }
    
    function updateMetrics(data) {
        // In a real application, these would be calculated from the actual data
        // For demo purposes, we're just showing static values
        
        // You could update these based on the data if needed
        // const totalViews = document.querySelector('.metric-value');
        // totalViews.textContent = data.values.reduce((a, b) => a + b, 0);
    }
})