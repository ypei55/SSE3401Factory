import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:lab5_factory/dashboard.dart';

class Invitation extends StatefulWidget {
  final int currentFactoryIndex;
  const Invitation({super.key, this.currentFactoryIndex = 0});

  @override
  State<Invitation> createState() => _InvitationState();
}

class _InvitationState extends State<Invitation> {
  TextEditingController telNum = TextEditingController();
  TextEditingController name = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromRGBO(214, 214, 213, 1),
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const Dashboard(),
                ),
              );
            },
            icon: const Icon(
              Icons.chevron_left,
              size: 35,
            )),
        title: Text(
          'Factory ${widget.currentFactoryIndex}',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: Column(
              children: [
                const Text(
                  'Invitation',
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Text(
                  'Invite users',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 20,),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Owner's Name",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 5, 5, 35),
                  child: TextField(
                    controller: name,
                    decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        hintText: 'Type here',
                        hintStyle: TextStyle(
                          fontSize: 20,
                          color: Colors.grey,
                        )),
                  ),
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Owner's Phone Number",
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 4, 8, 20),
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
                        flex: 1,
                        child: TextField(
                          controller: telNum,
                          maxLength: 10,
                          decoration: const InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(),
                              counterText: '',
                              hintText: '  Enter your phone number',
                              hintStyle: TextStyle(
                                fontSize: 20,
                                color: Colors.grey,
                              )),
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
                    ElevatedButton(
                      onPressed: () {
                        validateAndSubmit();
                      },
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size(370, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          backgroundColor: const Color.fromRGBO(155, 154, 157, 1)),
                      child: const Text(
                        'Submit',
                        style: TextStyle(fontSize: 23),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateAndSubmit() {
    name.text.isEmpty
        ? showAlertDialog(context, 'Error', "Please enter the owner's name. ")
        : (telNum.text.length < 9 || telNum.text.length > 10)
            ? showAlertDialog(
                context, 'Error', 'Please enter a valid phone number.')
            : Navigator.of(context).pop();
  }

  void showAlertDialog(BuildContext context, String title, String content) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
