// ignore_for_file: non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:papara/screens/profile_page.dart';
import '../constants/strings_to_other.dart';

class PasswordPage extends StatefulWidget {
  const PasswordPage({Key? key}) : super(key: key);

  @override
  State<PasswordPage> createState() => _PasswordPageState();
}

class _PasswordPageState extends State<PasswordPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const ProfilePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Column(
        children: [
          const SizedBox(height: 50.0),
          Center(
            child: Text(passwordDeclareText, style: passwordDeclareTextStyle),
          ),
          const SizedBox(height: 25.0),
          const CircleAvatar(
            child: Icon(Icons.fingerprint, size: 60, color: Colors.purple),
            radius: 40,
            backgroundColor: Colors.transparent,
          ),
          Text(
            tryPasswordText,
            style: tryPasswordTextStyle,
          ),
          const SizedBox(height: 50.0),
          Row(
            children: [
              PasswordNumberAreaBuild(),
              PasswordNumberAreaBuild(),
              PasswordNumberAreaBuild(),
              PasswordNumberAreaBuild(),
              PasswordNumberAreaBuild(),
              PasswordNumberAreaBuild(),
            ],
          ),
        ],
      ),
    );
  }

  Expanded PasswordNumberAreaBuild() {
    return Expanded(
      child: SizedBox(
        height: 75.0,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              border: Border.all(
                color: Color.fromARGB(255, 121, 118, 118),
              ),
            ),
            child: const Center(
              child: TextField(
                decoration: InputDecoration(border: InputBorder.none),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      actions: [
        Padding(
          padding: const EdgeInsets.only(top: 12.0, right: 12.0),
          child: Text(
            passwordActionsText,
            style: passwordActionTextStyle,
          ),
        ),
      ],
    );
  }
}
