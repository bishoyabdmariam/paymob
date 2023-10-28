part of 'payment_cubit_cubit.dart';

@immutable
abstract class PaymentCubitState {}

class PaymentCubitInitial extends PaymentCubitState {}

class PaymentAuthLoadingState extends PaymentCubitState {}

class PaymentAuthSuccessState extends PaymentCubitState {}

class PaymentAuthErrorState extends PaymentCubitState {}

class PaymentGetOrderRegistrationIdState extends PaymentCubitState {}

class PaymentGetOrderRegistrationIdSuccessState extends PaymentCubitState {}

class PaymentGetOrderRegistrationIdLoadingState extends PaymentCubitState {}

class PaymentGetOrderRegistrationIdErrorState extends PaymentCubitState {}

class PaymentGetPaymentRequestLoadingState extends PaymentCubitState {}

class PaymentGetPaymentRequestSuccessState extends PaymentCubitState {}

class PaymentGetPaymentRequestErrorState extends PaymentCubitState {}

class PaymentGetRefCodeLoadingState extends PaymentCubitState {}

class PaymentGetRefCodeErrorState extends PaymentCubitState {}

class PaymentGetRefCodeSuccessState extends PaymentCubitState {}
