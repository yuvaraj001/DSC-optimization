<!DOCTYPE html>
<html>
<head>
    <title>Dropdown Selection and Table Display</title>
    <style>
        table, th, td {
            border: 1px solid black;
            border-collapse: collapse;
        }
        th, td {
            padding: 5px;
            text-align: left;
        }
    </style>
</head>
<body>
    <h2>Select Options</h2>
    <form id="selectionForm">
        <!-- Creating 10 dropdown fields -->
        <!-- Repeat the following block for dropdowns 2 to 10 -->
        <div>
            <label for="dropdown1">Dropdown 1:</label>
            <select id="dropdown1">
                <option value="Option 1">Option 1</option>
                <option value="Option 2">Option 2</option>
                <option value="Option 3">Option 3</option>
                <option value="Option 4">Option 4</option>
            </select>
        </div>

        <!-- ... repeat for dropdowns 2 to 10 ... -->

        <div>
            <label for="dropdown10">Dropdown 10:</label>
            <select id="dropdown10">
                <option value="Option 1">Option 1</option>
                <option value="Option 2">Option 2</option>
                <option value="Option 3">Option 3</option>
                <option value="Option 4">Option 4</option>
            </select>
        </div>

        <button type="button" onclick="showResult()">Show Results</button>
    </form>

    <h3>Selected Options:</h3>
    <table id="resultTable">
        <tr>
            <th>Dropdown</th>
            <th>Selected Option</th>
        </tr>
        <!-- Table rows will be added here dynamically -->
    </table>

    <script>
        function showResult() {
            var table = document.getElementById('resultTable');

            // Clear previous results
            table.innerHTML = '<tr><th>Dropdown</th><th>Selected Option</th></tr>';

            // Loop through each dropdown and add its value to the table
            for (var i = 1; i <= 10; i++) {
                var dropdown = document.getElementById('dropdown' + i);
                var row = table.insertRow(-1);
                var cell1 = row.insertCell(0);
                var cell2 = row.insertCell(1);
                cell1.innerHTML = 'Dropdown ' + i;
                cell2.innerHTML = dropdown.value;
            }
        }
    </script>
</body>
</html>
