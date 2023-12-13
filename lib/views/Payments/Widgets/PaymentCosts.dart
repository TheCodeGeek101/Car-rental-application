import 'package:flutter/material.dart';

class PaymentCosts extends StatefulWidget {
  PaymentCosts({super.key});

  @override
  _PaymentCostsState createState() {
    return _PaymentCostsState();
  }
}

class _PaymentCostsState extends State<PaymentCosts> {
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
    // TODO: implement build
    return  Row(
        children:[
          Text(
              "sub-Total",
              style: TextStyle(
                  fontSize:15,
                  fontWeight: FontWeight.w400,
                  color:Colors.grey
              )
          ),
          Text(
              "\$300.50",
              style: TextStyle(
                  fontSize:15,
                  fontWeight: FontWeight.w400,
                  color:Colors.grey
              )
          ),
          Text(
              "Delivery",
              style: TextStyle(
                  fontSize:15,
                  fontWeight: FontWeight.w400,
                  color:Colors.grey
              )
          ),
          Text(
              "\$12.50",
              style: TextStyle(
                  fontSize:15,
                  fontWeight: FontWeight.w400,
                  color:Colors.grey
              )
          ),
        ]
    );
  }
}