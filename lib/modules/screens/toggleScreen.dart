import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paymob/controller/payment_cubit_cubit.dart';
import 'package:paymob/core/network/contant.dart';
import 'package:paymob/modules/screens/ref_screen.dart';
import 'package:paymob/modules/screens/visaScreen.dart';

class ToggleScreen extends StatelessWidget {
  const ToggleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PaymentCubitCubit(),
      child: Scaffold(
          appBar: AppBar(
            title: Text("toggle screen"),
            centerTitle: true,
          ),
          body: BlocConsumer<PaymentCubitCubit, PaymentCubitState>(
            listener: (context, state) {
              if (state is PaymentGetRefCodeSuccessState) {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ReferenceScreen()));
              }
            },
            builder: (context, state) {
              var cubit = PaymentCubitCubit.get(context);
              return Padding(
                padding: EdgeInsets.all(18),
                child: Column(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          cubit.getRefCode();
                        },
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.yellow,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.black, width: 2),
                          ),
                          child: Image.network(AppImages.refCodeImage),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => VisaScreen()));
                        },
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.yellow,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.black, width: 2),
                          ),
                          child: Image.network(AppImages.visaImage),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          )),
    );
  }
}
