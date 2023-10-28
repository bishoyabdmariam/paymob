import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paymob/controller/payment_cubit_cubit.dart';
import 'package:paymob/modules/screens/toggleScreen.dart';
import 'package:paymob/modules/widgets/default_bottom.dart';
import 'package:paymob/modules/widgets/default_textform.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    TextEditingController firstName = TextEditingController();
    TextEditingController lastName = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController phone = TextEditingController();
    TextEditingController price = TextEditingController();
    GlobalKey<FormState> formKey =
        GlobalKey<FormState>(); // Use FormState for GlobalKey
    return BlocProvider(
      create: (context) => PaymentCubitCubit()..getAuthToken(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Payment Integration",
          ),
        ),
        body: BlocConsumer<PaymentCubitCubit, PaymentCubitState>(
          listener: (context, state) {
            if (state is PaymentGetPaymentRequestSuccessState) {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ToggleScreen()));
            }
          },
          builder: (context, state) {
            var cubit = PaymentCubitCubit.get(context);
            return Padding(
              padding: const EdgeInsets.all(18.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 350,
                      child: Image.asset("assets/images/Delivery.png"),
                    ),
                    Form(
                      key: formKey,
                      child: Column(
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: DefaultTextFormFiled(
                                  controller: firstName,
                                  type: TextInputType.text,
                                  hintText: "first name",
                                  prefix: Icons.person,
                                  validate: (String? value) {
                                    if (value!.isEmpty) {
                                      return "please enter name";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: DefaultTextFormFiled(
                                  controller: lastName,
                                  type: TextInputType.text,
                                  hintText: "last name",
                                  prefix: Icons.person,
                                  validate: (String? value) {
                                    if (value!.isEmpty) {
                                      return "please enter name";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          DefaultTextFormFiled(
                            controller: email,
                            type: TextInputType.emailAddress,
                            hintText: "email address",
                            prefix: Icons.mail,
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return "please enter name";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          DefaultTextFormFiled(
                            controller: phone,
                            type: TextInputType.phone,
                            hintText: "phone",
                            prefix: Icons.phone,
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return "please enter name";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          DefaultTextFormFiled(
                            controller: price,
                            type: TextInputType.number,
                            hintText: "price",
                            prefix: Icons.monetization_on_outlined,
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return "please enter name";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          DefaultButton(
                            backgroundColor: Colors.purple.shade300,
                            radius: 10,
                            buttonWidget: const Text(
                              "Register",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                letterSpacing: 1.6,
                              ),
                            ),
                            function: () {
                              if (formKey.currentState!.validate()) {
                                cubit.getOrderRegistrationId(
                                  firstName: firstName.text.toString(),
                                  lastName: lastName.text.toString(),
                                  email: email.text.toString(),
                                  price: price.text.toString(),
                                  phone: phone.text.toString(),
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
