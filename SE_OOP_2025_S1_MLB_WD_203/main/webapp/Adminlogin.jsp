<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>

<!DOCTYPE html>
<html>

<head>


    <title>Admin Login</title>
    <link rel="icon" type="image/x-icon" href="Images/logo/LogoORG1.png">
    
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <style>
    
        :root {
            --primary-color: #4f46e5;
            --primary-light: #818cf8;
            --primary-dark: #3730a3;
            --primary-gradient: linear-gradient(135deg, #4f46e5 0%, #6366f1 100%);
            --secondary-color: #10b981;
            --error-color: #ef4444;
            --text-color: #1f2937;
            --text-light: #6b7280;
            --bg-color: #f9fafb;
            --card-bg: #ffffff;
            --border-color: #e5e7eb;
            --shadow-sm: 0 1px 2px 0 rgba(0, 0, 0, 0.05);
            --shadow-md: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
            --shadow-lg: 0 10px 15px -3px rgba(0, 0, 0, 0.1), 0 4px 6px -2px rgba(0, 0, 0, 0.05);
            --shadow-xl: 0 20px 25px -5px rgba(0, 0, 0, 0.1), 0 10px 10px -5px rgba(0, 0, 0, 0.04);
            --shadow-inner: inset 0 2px 4px 0 rgba(0, 0, 0, 0.06);
            --shadow-outline: 0 0 0 3px rgba(79, 70, 229, 0.45);
            --transition-fast: 150ms cubic-bezier(0.4, 0, 0.2, 1);
            --transition-normal: 300ms cubic-bezier(0.4, 0, 0.2, 1);
            --transition-slow: 500ms cubic-bezier(0.4, 0, 0.2, 1);
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-10px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @keyframes pulse {
            0%, 100% { transform: scale(1); }
            50% { transform: scale(1.05); }
        }

        @keyframes gradient-shift {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', system-ui, -apple-system, BlinkMacSystemFont, sans-serif;
        }

        body {
            background-color: var(--bg-color);
            background-image: 
                radial-gradient(circle at 25px 25px, rgba(79, 70, 229, 0.15) 2%, transparent 0%),
                radial-gradient(circle at 75px 75px, rgba(79, 70, 229, 0.1) 2%, transparent 0%);
            background-size: 100px 100px;
            color: var(--text-color);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 2rem 1rem;
        }

        .signin-container {
            width: 100%;
            max-width: 450px;
            perspective: 1000px;
            animation: fadeIn var(--transition-normal) ease-out forwards;
        }

        .box {
            background-color: var(--card-bg);
            border-radius: 1rem;
            box-shadow: var(--shadow-xl);
            padding: 3rem 2.5rem;
            position: relative;
            overflow: hidden;
            transform-style: preserve-3d;
            transform: rotateX(0deg);
            transition: transform var(--transition-normal), box-shadow var(--transition-normal);
        }

        .box:hover {
            box-shadow: var(--shadow-xl), 0 0 40px rgba(79, 70, 229, 0.2);
            transform: rotateX(2deg) translateY(-5px);
        }

        .box::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 5px;
            background: var(--primary-gradient);
            background-size: 200% 200%;
            animation: gradient-shift 3s ease infinite;
        }

        h1 {
            font-size: 1.875rem;
            font-weight: 700;
            color: var(--text-color);
            margin-bottom: 2rem;
            text-align: center;
            position: relative;
            padding-bottom: 0.75rem;
        }

        h1::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 50px;
            height: 3px;
            background: var(--primary-gradient);
            border-radius: 3px;
        }

        form {
            display: flex;
            flex-direction: column;
            gap: 1.75rem;
        }

        .form-group {
            position: relative;
        }

        .form-group label {
            position: absolute;
            left: 1rem;
            top: 0.25rem;
            color: var(--text-light);
            font-size: 1rem;
            pointer-events: none;
            transition: var(--transition-normal);
            transform-origin: left top;
            margin-bottom: 100px;
        }

        .form-group input {
            width: 100%;
            padding: 0.75rem 1rem;
            font-size: 1rem;
            border: 2px solid var(--border-color);
            border-radius: 0.5rem;
            background-color: transparent;
            transition: border-color var(--transition-normal), box-shadow var(--transition-normal);
            color: var(--text-color);
            z-index: 1;
        }

        .form-group input:focus,
        .form-group input:not(:placeholder-shown) {
            border-color: var(--primary-color);
            outline: none;
            box-shadow: var(--shadow-outline);
        }

        .form-group input:focus + label,
        .form-group input:not(:placeholder-shown) + label {
            transform: translateY(-1.5rem) scale(0.85);
            color: var(--primary-color);
            font-weight: 500;
        }

        .form-group input::placeholder {
            color: transparent;
        }

        button {
            margin-top: 1rem;
            padding: 0.875rem 1.5rem;
            background: var(--primary-gradient);
            background-size: 200% 200%;
            color: white;
            border: none;
            border-radius: 0.5rem;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            transition: transform var(--transition-fast), box-shadow var(--transition-fast), background-position var(--transition-normal);
            position: relative;
            overflow: hidden;
            box-shadow: 0 4px 10px rgba(79, 70, 229, 0.3);
            animation: gradient-shift 3s ease infinite;
        }

        button:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 15px rgba(79, 70, 229, 0.4);
        }

        button:active {
            transform: translateY(0);
            box-shadow: 0 2px 5px rgba(79, 70, 229, 0.4);
        }

        button::after {
            content: '';
            position: absolute;
            top: 50%;
            left: 50%;
            width: 5px;
            height: 5px;
            background: rgba(255, 255, 255, 0.5);
            opacity: 0;
            border-radius: 100%;
            transform: scale(1, 1) translate(-50%);
            transform-origin: 50% 50%;
        }

        button:focus:not(:active)::after {
            animation: ripple 1s ease-out;
        }

        @keyframes ripple {
            0% {
                transform: scale(0, 0);
                opacity: 0.5;
            }
            100% {
                transform: scale(20, 20);
                opacity: 0;
            }
        }

        .error-message {
            margin-top: 1.25rem;
            padding: 0.75rem 1rem;
            background-color: rgba(239, 68, 68, 0.1);
            border-left: 3px solid var(--error-color);
            border-radius: 0.375rem;
            font-size: 0.875rem;
            color: var(--error-color);
            transform: translateY(-10px);
            opacity: 0;
            animation: fadeIn var(--transition-normal) forwards;
        }

        @media (max-width: 640px) {
            .signin-container {
                max-width: 100%;
            }
            
            .box {
                padding: 2rem 1.5rem;
                border-radius: 0.75rem;
            }

            h1 {
                font-size: 1.5rem;
                margin-bottom: 1.5rem;
            }
        }

  
        .decoration {
            position: absolute;
            border-radius: 50%;
            background: var(--primary-gradient);
            opacity: 0.1;
            z-index: -1;
        }

        .decoration-1 {
            width: 150px;
            height: 150px;
            top: -75px;
            right: -75px;
        }

        .decoration-2 {
            width: 100px;
            height: 100px;
            bottom: -50px;
            left: -50px;
        }
        
    </style>
    
</head>

<body>


    <div class="signin-container">
    
        <div class="box">
        
            <div class="decoration decoration-1"></div>
            <div class="decoration decoration-2"></div>
            
            <h1>Welcome Admin!</h1>
            
            <form action="adminlogincontroller" method="POST">
            
            
                <div class="form-group">
                
                    <input id="email" name="mail" type="email" placeholder=" " required>
                    <label for="email">Admin email</label>
                    
                </div>
                
                
                <div class="form-group">
                
                    <input id="password" name="pwd" type="password" placeholder=" " required>
                    <label for="password">Password</label>
                    
                </div>
                
                <button type="submit">
                
                    Login
                    
                </button>
                
            </form>
            
            
                <p style="color:red;">
            
                ${errorMessage != null ? errorMessage : ""}
                
            	</p>
            
        
        </div>
    </div>
    
    
</body>
</html>