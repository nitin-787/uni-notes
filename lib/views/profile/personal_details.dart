import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class PersonalDetails extends StatefulWidget {
  const PersonalDetails({Key? key}) : super(key: key);

  @override
  State<PersonalDetails> createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final bool _isLoading = false;
  bool passwordVisible = true;
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  final inputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: AppColors.mainColor));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Personal Details',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.mainColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              'Personal Information',
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              controller: _emailController,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person, color: AppColors.mainColor),
                  contentPadding: const EdgeInsets.all(8),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none),
                  focusedBorder: inputBorder,
                  enabledBorder: inputBorder,
                  label: const Text("Name"),
                  hintText: "Rohan Khanna",
                  hintStyle: const TextStyle(fontSize: 15),
                  alignLabelWithHint: true,
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  labelStyle:
                      const TextStyle(color: Colors.black, fontSize: 20)),
              keyboardType: TextInputType.name,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              controller: _emailController,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email, color: AppColors.mainColor),
                  contentPadding: const EdgeInsets.all(8),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none),
                  focusedBorder: inputBorder,
                  enabledBorder: inputBorder,
                  label: const Text("Email"),
                  hintText: "rohan55@gmail.com",
                  hintStyle: const TextStyle(fontSize: 15),
                  alignLabelWithHint: true,
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  labelStyle:
                      const TextStyle(color: Colors.black, fontSize: 20)),
              keyboardType: TextInputType.emailAddress,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock, color: AppColors.mainColor),
                  contentPadding: const EdgeInsets.all(8),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none),
                  focusedBorder: inputBorder,
                  enabledBorder: inputBorder,
                  label: const Text("Password"),
                  hintText: "*********",
                  hintStyle: const TextStyle(fontSize: 15),
                  alignLabelWithHint: true,
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  labelStyle:
                      const TextStyle(color: Colors.black, fontSize: 20)),
              keyboardType: TextInputType.visiblePassword,
            ),
          )
        ],
      )),
    );
  }
}
