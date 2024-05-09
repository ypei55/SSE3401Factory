import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:lab5_factory/dashboard.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyHomePage(),
  ));
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isChecked = false;
  int index = 0;
  String otp = '';

  TextEditingController telNum = TextEditingController();
  TextEditingController OTP = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color.fromRGBO(254, 251, 253, 1),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                'images/upm_logo.jpg',
                width: 200,
                height: 150,
              ),
              const Text(
                'Welcome!',
                style: TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.w900,
                ),
              ),

              Container(
                  height: MediaQuery.of(context).size.height * 0.51,
                  decoration: BoxDecoration(
                      color: index == 0
                          ?const Color.fromRGBO(254, 216, 217, 1)
                          :const Color.fromRGBO(254, 254, 254, 1),
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0, 3))
                      ]),
                  child: index == 0 ? buildMainUI() : buildOTPUI()
                  ),
              const SizedBox(
                height: 40,
              ),
              const Center(
                child: Text(
                  'Disclaimer | Privacy Statement',
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Center(
                child: Text(
                  'Copyright UPM & Kejuruteraan Minyak Sawit \nCCS Sdn. Bhd.',
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildMainUI() {
    return Padding(
        padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(
                    flex: 1,
                    child: Text(
                      'Enter your mobile number to activate your account.',
                      style: TextStyle(fontSize: 20),
                    )),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.info_outline_rounded),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(3, 60, 10, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CountryFlag.fromCountryCode(
                    'MY',
                    height: 40,
                    width: 45,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    '+60',
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(
                    width: 35,
                  ),
                  Expanded(
                    child: TextField(
                      controller: telNum,
                      maxLength: 10,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        counterText: '',
                      ),
                      keyboardType: TextInputType.number,
                      autofocus: false,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(
                  fillColor: const MaterialStatePropertyAll(Colors.blue),
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = !isChecked;
                      });
                    }),
                const Text(
                  'I agree to the term & conditions',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            const SizedBox(
              height: 13,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: telNum.text.length >= 9 &&
                          telNum.text.length <= 10 &&
                          isChecked
                      ? () {
                          setState(() {
                            index = 1;
                          });
                        }
                      : null,
                  style: ElevatedButton.styleFrom(fixedSize: const Size(280, 35)),
                  child: const Text('Get Activation Code',
                      style: TextStyle(fontSize: 20)),
                ),
              ],
            ),
          ],
        ));
  }

  Widget buildOTPUI() {
    return Padding(
        padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(
                    flex: 1,
                    child: Text(
                      'Enter the activation code you received via SMS .',
                      style: TextStyle(fontSize: 20),
                    )),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.info_outline_rounded),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 30, 15, 40),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: OTP,
                      textAlign: TextAlign.center,
                      maxLength: 6,
                      onChanged: (value) {
                        setState(() {
                          otp = value.substring(0, value.length.clamp(0, 6));
                        });
                      },
                      decoration: InputDecoration(
                        hintText: 'OTP',
                        counterText: '${otp.length}/6',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.black),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      autofocus: false,
                    ),
                  ),
                ],
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Didn't receive?",
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  ' Tap here',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.blue,
                      decoration: TextDecoration.underline),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed:  OTP.text.length == 6?() {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const Dashboard(),
                      ),
                    );
                  }
                  :null,
                  style: ElevatedButton.styleFrom(fixedSize: const Size(150, 35)),
                  child: const Text('Activate', style: TextStyle(fontSize: 20)),
                ),
              ],
            ),
          ],
        ));
  }
}
