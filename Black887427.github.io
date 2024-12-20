<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pension & Gratuity Calculator</title>
    <style>
        /* Import the Covolini font */
        @font-face {
            font-family: 'Covolini';
            src: url('fonts/Covolini.ttf') format('truetype');
            font-weight: normal;
            font-style: normal;
        }

        /* General Styling */
        body {
            font-family: 'Covolini', Arial, sans-serif;
            background-color: #f4f7fa;
            color: #333;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .container {
            background-color: #ffffff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 600px;
        }

        h1 {
            font-size: 2em;
            text-align: center;
            margin-bottom: 30px;
        }

        label {
            font-size: 1.1em;
            font-weight: 500;
            margin-bottom: 8px;
            color: #555;
        }

        input, select {
            width: 100%;
            padding: 12px;
            font-size: 1em;
            margin-bottom: 15px;
            border-radius: 8px;
            border: 1px solid #ccc;
            background-color: #f9f9f9;
            color: #333;
        }

        button {
            padding: 15px;
            background-color: #4caf50;
            color: white;
            font-size: 1.2em;
            border-radius: 8px;
            border: none;
            cursor: pointer;
            width: 100%;
        }

        button:hover {
            background-color: #45a049;
        }

        .results {
            margin-top: 30px;
            padding: 20px;
            background-color: #f9f9f9;
            border-radius: 8px;
            font-size: 1.1em;
            border: 1px solid #ccc;
        }

        .results span {
            font-weight: bold;
            color: #4caf50;
        }

        .amount-box {
            padding: 10px;
            background-color: #e3e3e3;
            border-radius: 5px;
            margin-bottom: 15px;
            font-weight: bold;
        }
    </style>
</head>
<body>

    <div class="container">
        <h1>Pension & Gratuity Calculator</h1>
        
        <!-- Joining and Retirement Dates -->
        <label for="joiningDate">Joining Date:</label>
        <input type="date" id="joiningDate" max="2005-12-31" required>

        <label for="retirementDate">Retirement Date:</label>
        <input type="date" id="retirementDate" required>

        <!-- Basic Salary Input -->
        <label for="basicSalary">Basic Salary:</label>
        <input type="number" id="basicSalary" placeholder="Enter Basic Salary" required>

        <button onclick="calculate()">Calculate</button>

        <!-- Results Display -->
        <div class="results" id="results" style="display:none;">
            <p><span id="gratuity">Gratuity:</span> </p>
            <p><span id="pension">Pension:</span> </p>
            <div class="amount-box" id="pensionSellAmount">40% of Pension Sold: </div>
            <p><span id="amountReceived">Amount After Selling Pension:</span> </p>
            <p><span id="pensionPerMonth">Pension Per Month:</span> </p>
        </div>
    </div>

    <script>
        function calculate() {
            let joiningDate = new Date(document.getElementById("joiningDate").value);
            let retirementDate = new Date(document.getElementById("retirementDate").value);
            let basicSalary = parseFloat(document.getElementById("basicSalary").value);

            let maxJoiningDate = new Date("2005-12-31");
            if (joiningDate > maxJoiningDate) {
                alert("Joining date must be on or before 31/12/2005.");
                return;
            }

            if (isNaN(joiningDate.getTime()) || isNaN(retirementDate.getTime()) || isNaN(basicSalary)) {
                alert("Please fill in all fields correctly.");
                return;
            }

            let diffTime = retirementDate - joiningDate;
            let diffDays = diffTime / (1000 * 3600 * 24);
            let years = Math.floor(diffDays / 365);
            let remainingDays = diffDays % 365;
            let months = Math.floor(remainingDays / 30);
            let days = Math.floor(remainingDays % 30);

            let totalService = years + months / 12 + days / 365;
            let gratuity = (basicSalary * 2 * Math.round(totalService)) / 4;

            let da = basicSalary * 0.5;
            let pension = basicSalary * 0.5 + da;

            let pension40 = da * 0.4;

            let factor = 8.371;
            let monthsInYear = 12;
            let amountReceived = pension40 * factor * monthsInYear;

            let pensionPerMonth = pension * 0.6;

            document.getElementById("results").style.display = "block";
            document.getElementById("gratuity").innerText = `Gratuity: ₹${gratuity.toFixed(2)}`;
            document.getElementById("pension").innerText = `Pension: ₹${pension.toFixed(2)}`;
            document.getElementById("pensionSellAmount").innerText = `40% of Pension Sold: ₹${pension40.toFixed(2)}`;
            document.getElementById("amountReceived").innerText = `Amount After Selling Pension: ₹${amountReceived.toFixed(2)}`;
            document.getElementById("pensionPerMonth").innerText = `Pension Per Month: ₹${pensionPerMonth.toFixed(2)}`;
        }
    </script>

</body>
</html>
