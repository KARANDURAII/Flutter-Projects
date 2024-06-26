import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:model_app/otp.dart';

class register extends StatefulWidget {
  const register({super.key});

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController edit4 = TextEditingController();
  TextEditingController phonenumber = TextEditingController();

  void dispose() {
    edit4.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (selectedDate != null) {
      setState(() {
        edit4.text = DateFormat('yyyy-MM-dd').format(selectedDate);
      });
    }
  }

  bool _isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'images/logonew.jpeg',
                height: 70,
                width: 70,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Register account",
                style: TextStyle(
                    fontSize: 25,
                    color: Color.fromARGB(255, 1, 8, 48),
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 40,
                  right: 40,
                ),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Name",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Container(
                              height: 50,
                              width: 135,
                              child: TextField(
                                controller: firstname,
                                decoration: InputDecoration(
                                  hintText: "First name",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Container(
                          height: 50,
                          width: 135,
                          child: TextField(
                            controller: lastname,
                            decoration: InputDecoration(
                              hintText: "Last name",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 40, left: 40),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Email",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Container(
                        height: 50,
                        child: TextField(
                          controller: email,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 40, left: 40),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Date of birth",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Container(
                        height: 50,
                        child: TextField(
                          controller: edit4,
                          readOnly: true,
                          decoration: InputDecoration(
                            hintText: 'Select your date of birth',
                            suffixIcon: Icon(Icons.calendar_today),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          onTap: () => _selectDate(context),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 40, left: 40),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Phone number",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Container(
                        height: 50,
                        child: TextField(
                          controller: phonenumber,
                          keyboardType: TextInputType.phone,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(
                                13), // Limit the length to include +91
                            FilteringTextInputFormatter.allow(
                                RegExp(r'[0-9+]')), // Allow only numbers and +
                            _PhoneNumberInputFormatter(),
                          ],
                          decoration: InputDecoration(
                            hintText: 'Phone Number',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 40, left: 40),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Pincode",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Container(
                        height: 50,
                        child: TextField(
                          controller: email,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Center(
                  child: CheckboxListTile(
                    title: Text(
                      'I accept the terms and privacy policy',
                      style: TextStyle(fontSize: 13),
                    ),
                    value: _isChecked,
                    onChanged: (Value) {
                      setState(() {
                        _isChecked = Value!;
                      });
                    },
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Text(
                  '''"Notes:Terms and Conditions agreements are also known as Terms. More rarely, it may be called something like an End User Services Agreement (EUSA)."''',
                  style: TextStyle(fontSize: 13),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 40, left: 40),
                child: Container(
                  width: double.infinity,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => otp(),
                          ));
                    },
                    child: Text(
                      "Register",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor:
                          Color.fromARGB(255, 77, 0, 57), // Text color
                      elevation: 5, // Elevation
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(10), // Border radius
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PhoneNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.length == 0) {
      return newValue.copyWith(
        text: '+91',
        selection: TextSelection.collapsed(offset: 3),
      );
    } else if (newValue.text.length == 1 && newValue.text != '+') {
      return newValue.copyWith(
        text: '+91 ${newValue.text}',
        selection: TextSelection.collapsed(offset: newValue.text.length + 4),
      );
    } else if (newValue.text.length > 3 &&
        newValue.text.substring(0, 3) != '+91') {
      return newValue.copyWith(
        text: '+91${newValue.text.substring(3)}',
        selection: TextSelection.collapsed(offset: 4),
      );
    } else {
      return newValue;
    }
  }
}
