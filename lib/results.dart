import 'package:body_mass_calculator/reusableCard.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

class Results extends StatelessWidget {
  Results({required this.result, required this.bmiInterpretation, required this.bmiResult});
  final String result;
  final String bmiResult;
  final String bmiInterpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
              child: Center(
                child: Container(
                  padding: EdgeInsets.all(15),
            alignment: Alignment.bottomLeft,
            child: Text('Your result', style: TextStyle(fontSize: 50, fontWeight: FontWeight.w700),),
          ),
              )),
          Expanded(
            flex: 4,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xFF1D1E33)
                ),
            margin: EdgeInsets.all(10),
            child: Expanded(

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    bmiResult,
                    style: TextStyle(color: Colors.green,fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                  Text(
                    result,
                    style: numbers.copyWith(
                      fontSize: 50
                    ),
                  ),
                  Text(
                    bmiInterpretation,
                    style: TextStyle(color: Colors.white,),textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          )),
          GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Container(
              color: bottomColor,
              height: bottomHeight,
              child: Center(child: Text('RE CALCULATE', style: TextStyle(fontSize: 18, color: Colors.white),)),
            ),
          )
        ],
      ),
    );
  }
}
