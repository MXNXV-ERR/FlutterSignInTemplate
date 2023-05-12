import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:signin_template/components/formfeilds.dart';

import '../components/liftedbox.dart';
import '../services/auth.dart';

class PhoneOtpScr extends StatefulWidget {
  const PhoneOtpScr({super.key});

  @override
  State<PhoneOtpScr> createState() => _PhoneOtpScrState();
}

class _PhoneOtpScrState extends State<PhoneOtpScr> {
  TextEditingController phoneController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _otpController =TextEditingController();
  String countryCode = '+91';
  String verificationId = '';
  bool _showOtpFeild = false;

  @override
  void dispose() {
    _phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black12,
        body: liftedBoxBuilder(
            child: Container(
                color: Colors.white,
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 10),
                    child: SizedBox(
                      width: 350,
                      child: Column(children: [
                        IntlPhoneField(
                          controller: null,
                          onCountryChanged: (country) {
                            setState(() {
                              countryCode = '+${country.dialCode}';
                            });
                          },
                          decoration: InputDecoration(
                            icon: const Icon(Icons.phone),
                            label: const Text('Phone Number'),
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                          ),
                          initialCountryCode: 'IN',
                          //initialValue: countryCode,
                          onChanged: (phone) {
                            debugPrint(phone.completeNumber);
                          },
                        ),
                        ElevatedButton(onPressed: () async {
                          await Auth.signInWithPhoneNumber(_phoneNumberController.text);
                          setState(() {  
                          _showOtpFeild=true;
                          });
                        }, child: const Text('Verify')),
                        if(_showOtpFeild)
                          TxtFrmFld(onChanged: (){}, validator: (value){}, label: "OTP", icon: Icons.lock, controller: _otpController)

                      
                      ])
                    )))));
  }
}
