import 'package:flutter/material.dart';

// Defining the WithdrawPage class
class WithdrawPage extends StatefulWidget {
  @override
  _WithdrawPageState createState() => _WithdrawPageState();
}

class _WithdrawPageState extends State<WithdrawPage> {
  // Controllers to manage the input fields
  final TextEditingController amountController = TextEditingController(); // Controller for withdrawal amount input
  final TextEditingController pinController = TextEditingController(); // Controller for PIN input
  final TextEditingController agentNumberController = TextEditingController(); // Controller for agent number input

  // List of withdrawal options
  final List<String> withdrawalMethods = ['ATM', 'Agent']; // Available withdrawal methods
  String? selectedMethod; // Variable to store the selected method

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Withdraw'), // Title displayed in the AppBar
        backgroundColor: Colors.teal, // Background color of the AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Padding around the form content
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center the column's content vertically
          children: [
            // Dropdown for selecting the withdrawal method
            DropdownButton<String>(
              hint: Text('Select Withdrawal Method'), // Placeholder text
              value: selectedMethod, // Current selected method
              onChanged: (String? newValue) {
                setState(() { // Update state with setState to notify UI
                  selectedMethod = newValue; // Update the selected method
                });
              },
              items: withdrawalMethods.map<DropdownMenuItem<String>>((String method) {
                return DropdownMenuItem<String>(
                  value: method, // Value to be set on selection
                  child: Text(method), // Displayed text for each item
                );
              }).toList(),
            ),
            SizedBox(height: 16.0), // Space between the dropdown and the input fields

            // Input field for withdrawal amount
            TextField(
              controller: amountController, // Connects the controller to manage the amount input
              decoration: InputDecoration(
                labelText: 'Withdrawal Amount', // Label for the amount input field
                border: OutlineInputBorder(), // Outline border around the input field
              ),
              keyboardType: TextInputType.number, // Numeric keyboard for entering the amount
            ),
            SizedBox(height: 16.0), // Space between the input fields

            // Input field for PIN
            TextField(
              controller: pinController, // Connects the controller to manage the PIN input
              decoration: InputDecoration(
                labelText: 'Enter PIN', // Label for the PIN input field
                border: OutlineInputBorder(), // Outline border around the input field
              ),
              obscureText: true, // Hides the input text for security
              keyboardType: TextInputType.number, // Numeric keyboard for entering the PIN
            ),
            SizedBox(height: 16.0), // Space between the PIN input and agent number input

            // Conditional input field for agent number
            if (selectedMethod == 'Agent') ...[
              TextField(
                controller: agentNumberController, // Connects the controller to manage the agent number input
                decoration: InputDecoration(
                  labelText: 'Agent Number', // Label for the agent number input field
                  border: OutlineInputBorder(), // Outline border around the input field
                ),
                keyboardType: TextInputType.phone, // Numeric keyboard for entering the agent number
              ),
              SizedBox(height: 16.0), // Space between the input fields
            ],

            // Withdraw button
            ElevatedButton(
              onPressed: () {
                // Logic to handle the withdrawal action when the button is pressed
                String amount = amountController.text; // Get the withdrawal amount from the input field
                String pin = pinController.text; // Get the PIN from the input field
                String agentNumber = agentNumberController.text; // Get the agent number from the input field

                // Add your withdrawal logic here (e.g., API call)
                if (selectedMethod == 'Agent') {
                  print('Withdrawing $amount from Agent $agentNumber with PIN: $pin'); // Debug output to console
                } else {
                  print('Withdrawing $amount from ATM with PIN: $pin'); // Debug output for ATM
                }

                // Optionally, you can show a confirmation message or navigate to another page after the operation
              },
              child: Text('Withdraw'), // Text displayed on the button
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal, // Background color of the button
                padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0), // Padding inside the button
              ),
            ),
          ],
        ),
      ),
    );
  }
}