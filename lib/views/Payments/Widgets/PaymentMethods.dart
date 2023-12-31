import 'package:flutter/material.dart';

import '../../../Helpers/BookCarHelper.dart';
import '../../../models/Car.dart';
import '../../../utils/colors.dart';
import '../../Cars/CarPickupLocation.dart';
import 'PaymentCosts.dart';

class PaymentMethods extends StatefulWidget {
  const PaymentMethods({super.key,required this.car,required this.data});
 final Car car;
 final Object data;
  @override
  _PaymentMethodsState createState() {
    return _PaymentMethodsState();
  }
}

class _PaymentMethodsState extends State<PaymentMethods> {
  int _type = 1;
  void _handleRadio(Object? e) => setState(() {
    _type= e as int;
  });
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
        children:[
          SizedBox(height:40),
          Container(
              width:size.width,
              height:55,
              margin: EdgeInsets.only(right:20),
              decoration:BoxDecoration(
                border:_type == 1
                    ? Border.all(width:1,color:btnPrimary)
                    : Border.all(width:0.3,color:Colors.grey),
                borderRadius: BorderRadius.circular(5),
                color: Colors.transparent,
              ),
              child:Center(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Radio(value:1, groupValue: _type, onChanged: _handleRadio,
                                  activeColor:btnPrimary
                              ),
                              Text("Paypal",
                                  style: _type == 1
                                      ? TextStyle(fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black)
                                      : TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey
                                  )
                              ),
                            ]
                        ),
                        Spacer(),
                        Image.asset(
                            "assets/images/paypal.png",
                            width:150,
                            height:35,
                            fit:BoxFit.cover
                        )
                      ],
                    ),
                  )
              )
          ),
          SizedBox(height:15),
          Container(
              width:size.width,
              height:55,
              margin: EdgeInsets.only(right:20),
              decoration:BoxDecoration(
                border:_type == 2
                    ? Border.all(width:1,color:btnPrimary)
                    : Border.all(width:0.3,color:Colors.grey),
                borderRadius: BorderRadius.circular(5),
                color: Colors.transparent,
              ),
              child:Center(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Radio(
                                  value:2,
                                  groupValue: _type,
                                  onChanged: _handleRadio,
                                  activeColor:btnPrimary
                              ),
                              Text("Stripe",
                                  style: _type == 2
                                      ? const TextStyle(fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black)
                                      : const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey
                                  )
                              ),
                            ]
                        ),
                        Spacer(),
                        Image.asset(
                            "assets/images/stripe.png",
                            width:35,
                            height:35,
                            fit:BoxFit.cover
                        )
                      ],
                    ),
                  )
              )
          ),
          SizedBox(height:15),
          Container(
              width:size.width,
              height:55,
              margin: EdgeInsets.only(right:20),
              decoration:BoxDecoration(
                border:_type == 3
                    ? Border.all(width:1,color:btnPrimary)
                    : Border.all(width:0.3,color:Colors.grey),
                borderRadius: BorderRadius.circular(5),
                color: Colors.transparent,
              ),
              child:Center(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Radio(
                                  value:3,
                                  groupValue: _type,
                                  onChanged: _handleRadio,
                                  activeColor:btnPrimary
                              ),
                              Text("Credit card",
                                  style: _type == 3
                                      ? const TextStyle(fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black)
                                      : const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey
                                  )
                              ),
                            ]
                        ),
                        Spacer(),
                        Image.asset(
                            "assets/images/visa.png",
                            width:35,
                            fit:BoxFit.cover
                        ),
                        SizedBox(width: 8),
                        Image.asset(
                            "assets/images/mastercard.png",
                            width:35,
                            fit:BoxFit.cover
                        )
                      ],
                    ),
                  )
              )
          ),
          const SizedBox(height:100),
          PaymentCosts(),
          const Divider(
              height: 30,
              color:Colors.black,
          ),
          const Row(
              children:[
                Text(
                    "Total Payment",
                    style: TextStyle(
                        fontSize:15,
                        fontWeight: FontWeight.w500,
                    )
                ),
                Spacer(),
                Text(
                    "\$  380 " ,
                    style: TextStyle(
                        fontSize:15,
                        fontWeight: FontWeight.w500,
                        color:Colors.redAccent
                    )
                ),
              ]
          ),
          const SizedBox(height: 70),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: btnPrimary, // background
              onPrimary: Colors.white, // foreground
            ),
            onPressed: () async {
              if(widget.data != {}){
                BookCarHelper().bookCar(widget.data);
                Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  CarPickupLocation(car:widget.car)));
              }
            },
            child: Text('Confirm Payment'),
          )
        ]
    );
  }
}