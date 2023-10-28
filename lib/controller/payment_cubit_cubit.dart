import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paymob/core/network/contant.dart';
import 'package:paymob/core/network/dio_helper.dart';

part 'payment_cubit_state.dart';

class PaymentCubitCubit extends Cubit<PaymentCubitState> {
  PaymentCubitCubit() : super(PaymentCubitInitial());

  static PaymentCubitCubit get(context) => BlocProvider.of(context);

  Future<void> getAuthToken() async {
    emit(PaymentAuthLoadingState());
    DioHelper.postDataDio(url: ApiContext.getAuthToken, data: {
      "api_key": ApiContext.paymentApiKey,
    }).then((value) {
      ApiContext.paymentFirstToken = value.data["token"].toString();
      print("payment first token  " + ApiContext.paymentFirstToken);
      print(
          '""""""""""""""""""""""""""""""""""""""object""""""""""""""""""""""""""""""""""""""');
      emit(PaymentAuthSuccessState());
    }).catchError((e) {
      emit(PaymentAuthErrorState());
    });
  }

  Future<void> getOrderRegistrationId({
    required String firstName,
    required String lastName,
    required String email,
    required String price,
    required String phone,
  }) async {
    emit(PaymentGetOrderRegistrationIdLoadingState());
    DioHelper.postDataDio(url: ApiContext.getOrderId, data: {
      "auth_token": ApiContext.paymentFirstToken,
      "delivery_needed": "false",
      "amount_cents": price,
      /*price not accepted*/
      /*خضعت*/
      "currency": "EGP",
      "merchant_order_id": 905,
      /*should be updated each time you order an order*/
      "items": [],
    }).then((value) {
      ApiContext.paymentOrderId = value.data["id"].toString();
      getPaymentRequest(
        firstName: firstName,
        lastName: lastName,
        email: email,
        price: price,
        phone: phone,
      );
      emit(PaymentGetOrderRegistrationIdSuccessState());
    }).catchError((e) {
      print(e.hashCode);
      print("id");
      print('"""""""""""""""""""object"""""""""""""""""""');
      print(e.toString());
      emit(PaymentGetOrderRegistrationIdErrorState());
    });
  }

  Future getPaymentRequest({
    required String firstName,
    required String lastName,
    required String email,
    required String price,
    required String phone,
  }) async {
    emit(PaymentGetPaymentRequestLoadingState());
    DioHelper.postDataDio(url: ApiContext.getPaymentId, data: {
      "auth_token": ApiContext.paymentFirstToken,
      "amount_cents": price,
      "expiration": 3600,
      "order_id": ApiContext.paymentOrderId,
      "billing_data": {
        "apartment": "803",
        "email": email,
        "floor": "42",
        "first_name": firstName,
        "street": "Ethan Land",
        "building": "8028",
        "phone_number": phone,
        "shipping_method": "PKG",
        "postal_code": "01898",
        "city": "Jaskolskiburgh",
        "country": "CR",
        "last_name": lastName,
        "state": "Utah"
      },
      "currency": "EGP",
      "integration_id": ApiContext.integrationIdCard,
      "lock_order_when_paid": "false"
    }).then((value) {
      ApiContext.finalToken = value.data["token"];
      print("final Token is " + ApiContext.finalToken);
      print(
          '""""""""""""""""""""""""""""""""""""""""object""""""""""""""""""""""""""""""""""""""""');
      emit(PaymentGetPaymentRequestSuccessState());
    }).catchError((e) {
      print(e.hashCode);
      print('"""""""""""""""""""object"""""""""""""""""""');
      print(e.toString());
      emit(PaymentGetPaymentRequestErrorState());
    });
  }

  Future getRefCode() async {
    emit(PaymentGetRefCodeLoadingState());
    DioHelper.postDataDio(
      url: ApiContext.getRefCode,
      data: {
        "source": {
          "identifier": "AGGREGATOR",
          "subtype": "AGGREGATOR",
        },
        "payment_token": ApiContext.finalToken,
      },
    ).then((value) {
      ApiContext.refCode = value.data["id"].toString();
      emit(PaymentGetRefCodeSuccessState());
    }).catchError((e) {
      print(e.toString());
      emit(PaymentGetRefCodeErrorState());
    });
  }
}
