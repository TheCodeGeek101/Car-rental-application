import 'package:flutter/material.dart';

import '../../../utils/colors.dart';

class FormFields extends StatefulWidget {
  FormFields({super.key});

  @override
  State<FormFields> createState() => _FormFieldsState();
}

class _FormFieldsState extends State<FormFields> {
  final formKey  = GlobalKey<FormState>();

  String name = " ";

  TextEditingController _controller = TextEditingController();

  TextEditingController _textController = TextEditingController();

  late TextEditingController settingsController;

  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return   Padding(
      padding: EdgeInsets.all(20.0),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            SizedBox(height: 15.0,),
            Card(
              color: backgroundColor,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              child:  TextFormField(
                  controller: _controller,
                  textAlign: TextAlign.center,
                  // textAlignVertical: TextAlignVertical.center,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    border: InputBorder.none,
                    // labelText: "Email Address",
                    labelStyle:  TextStyle(
                      fontSize: 14.0,
                    ),
                    fillColor:Colors.white,
                    hintText: "Email Address",
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 15.0,
                    ),
                  ),
                  validator: (value){
                    if(value!.isEmpty)
                    {
                      return "Email empty!.. Enter your email address";
                    }
                    else if(!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}').hasMatch(value))
                    {
                      return "Please enter an email address!";
                    }
                    else
                    {
                      return null;
                    }
                  }
              ),
            ),

            SizedBox(height: 15.0,),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              color: backgroundColor,
              child:
              TextFormField(
                  controller: _textController,
                  // textAlignVertical: TextAlignVertical.center,
                  textAlign: TextAlign.center,
                  obscureText: _isObscure,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                        icon: Icon(
                          _isObscure ? Icons.visibility : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        }),
                    border: InputBorder.none,
                    // labelText: "Password",
                    labelStyle:  TextStyle(
                      fontSize: 14.0,
                    ),
                    hintText: "Password",
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 15.0,
                    ),
                  ),
                  validator:
                      (value){
                    if(value!.isEmpty){
                      return "Password cannot be empty!! enter your password";
                    }
                    else
                    {
                      return null;
                    }
                  }
              ),
            ),

            SizedBox(height: 15.0,),
            ElevatedButton(
              onPressed: (){

              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(100, 50),
                textStyle: TextStyle(fontSize: 16),
                primary: btnPrimary,
                onPrimary: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: 8.0), // Add some space between icon and label
                  Text("Sign in"),
                  Icon(Icons.login), // Login icon
                  // Label text
                ],
              ),
            ),
            SizedBox(height: 30.0,),
            Text("Do not have an account?",style:TextStyle(fontSize: 13.0,fontFamily: "Brand Bold",color: Colors.grey.shade500,),),
          ],
        ),
      ),
    );
  }
}
