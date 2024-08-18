import 'dart:math';

import 'package:bmi_app/bloc_app/bloc.dart';
import 'package:bmi_app/bloc_app/event.dart';
import 'package:bmi_app/bloc_app/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
class BmiCalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BlocApp,AppState>(
        listener: (context, state) {
        },
        builder: (context, state) {
          return  Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.lightBlue,
              centerTitle: true,
              title: Text("BMI CALCULATOR",style: TextStyle(
                color: Colors.white,
                fontSize: 18.sp
              ),),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding:  EdgeInsets.all(4.0.w),
                    child:
                    Container(
                      height: 25.h,
                      child: Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                BlocApp.get(context).add(GenderSelected(true));
                              },
                              child: Container(

                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image(
                                      image: AssetImage("assets/image/male.png"),
                                      width: 10.w,
                                      height: 10.h,
                                      fit: BoxFit.cover,
                                      color: Colors.black,),
                                    SizedBox(height: 1.5.h),
                                    Text("MALE", style: TextStyle(
                                        fontSize: 22.sp,
                                        fontWeight: FontWeight.bold
                                    ),),
                                  ],),
                                decoration: BoxDecoration(
                                  color:BlocApp.get(context).isMale ? Colors.blue : Colors
                                      .grey[400],
                                  borderRadius: BorderRadius.circular(1.h),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 3.w,),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                BlocApp.get(context).add(GenderSelected(false));

                              },
                              child: Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image(image: AssetImage(
                                        "assets/image/female.png"),
                                      width: 10.w,
                                      height: 10.h,
                                      color: Colors.black,
                                    fit: BoxFit.cover,),
                                    SizedBox(height: 1.5.h,),
                                    Text("FEMALE", style: TextStyle(
                                        fontSize: 22.sp,
                                        fontWeight: FontWeight.bold
                                    ),),
                                  ],),
                                decoration: BoxDecoration(
                                  color: BlocApp.get(context).isMale ? Colors.grey[400] : Colors.blue,
                                  borderRadius: BorderRadius.circular(1.h),
                                ),
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 4.w),
                    child: Container(
                      height: 25.h,
                      decoration: BoxDecoration(
                        color: Colors.grey[400],
              
                        borderRadius: BorderRadius.circular(1.h),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("HEIGHT", style: TextStyle(
                              fontSize: 22.sp,
                              fontWeight: FontWeight.bold
                          ),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment
                                .baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text("${BlocApp.get(context).number
                                  .round()}", style: TextStyle(
                                  fontSize: 30.sp,
                                  fontWeight: FontWeight.w900
                              ),),
                              SizedBox(width: 2.w,),
                              Text("CM", style: TextStyle(
                                  fontSize: 20.0.sp,
                                  fontWeight: FontWeight.bold
                              ),),
              
                            ],),
                          Slider(
                            max: 220, min: 120, value:
                          BlocApp.get(context).number, onChanged: (value) {
                            BlocApp.get(context).add(SliderValueChanged(value));
                          },),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.all(4.w),
                    child: Container(
                      height: 25.h,
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey[400],
                                borderRadius: BorderRadius.circular(1.h),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,

                                children: [
                                  Text("WEIGHT", style: TextStyle(
                                      fontSize: 22.sp,
                                      fontWeight: FontWeight.bold
                                  ),),
                                  Text("${
                                      BlocApp.get(context).weight
                                          .round()}", style: TextStyle(
                                      fontSize: 30.sp,
                                      fontWeight: FontWeight.w900

                                  ),),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: 5.h,
                                        width: 10.w,
                                        child: FloatingActionButton(onPressed: () {
                                          BlocApp.get(context).add(ReduceWeight());
                                        },
                                          child: Icon(Icons.remove,size: 6.w,),
                                          mini: true,),
                                      ),
                                      SizedBox(width: 2.w,),
                                      SizedBox(
                                        height: 5.h,
                                        width: 10.w,
                                        child: FloatingActionButton(
                                          heroTag: "qw",
                                          onPressed: () {

                                            BlocApp.get(context).add(IncreaseWeight());

                                          },
                                          child: Icon(Icons.add,size: 6.w,),
                                          mini: true,),
                                      ),
                                    ],),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 3.w,),
                          Expanded(
                            child: Container(

                              decoration: BoxDecoration(
                                color: Colors.grey[400],
                                borderRadius: BorderRadius.circular(1.h),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text("AGE", style: TextStyle(
                                      fontSize: 22.sp,
                                      fontWeight: FontWeight.bold
                                  ),),
                                  Text("${BlocApp.get(context).age
                                      .round()}", style: TextStyle(
                                      fontSize: 30.sp,
                                      fontWeight: FontWeight.w900
                                  ),),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: 5.h,
                                        width: 10.w,
                                        child: FloatingActionButton(onPressed: () {
                                          BlocApp.get(context).add(ReduceAge());
                                        },
                                          child: Icon(Icons.remove,size: 6.w,),
                                          mini: true,),
                                      ),
                                      SizedBox(width: 2.w,),

                                      SizedBox(
                                        height: 5.h,
                                        width: 10.w,
                                        child: FloatingActionButton(onPressed: () {

                                          BlocApp.get(context).add(IncreaseAge());
                                        },
                                          child: Icon(Icons.add,size: 6.w,),
                                          mini: true,),
                                      ),
                                    ],),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                      width: double.infinity,
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "/bmi_result");
              
                        },
                        child: Text(
                          "CALCULATOR",
                          style: TextStyle(color: Colors.white,fontSize: 20.sp),
                        ),
                        height: 8.h,
                        color: Colors.lightBlue,
                      ))
                ],
              ),
            ),
          );
        },
      );
  }
}

