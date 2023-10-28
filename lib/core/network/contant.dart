class ApiContext {
  /*
  https://accept.paymob.com/api/auth/tokens*/
  static const String baseUrl = "https://accept.paymob.com/api";
  static const String getAuthToken = "/auth/tokens";
  static const String paymentApiKey =
      "ZXlKaGJHY2lPaUpJVXpVeE1pSXNJblI1Y0NJNklrcFhWQ0o5LmV5SmpiR0Z6Y3lJNklrMWxjbU5vWVc1MElpd2ljSEp2Wm1sc1pWOXdheUk2T1RBNE5EZ3dMQ0p1WVcxbElqb2lhVzVwZEdsaGJDSjkuNENsZ0VyczlIcndPY0QwMU9Wb3VFaklzcktmajJLakpaZVU3cVJ6Nl9Mc1lKdnBwMWVuSy1sdFp5OGVkRDlMQzFWN3Y4X2RudFZuY3U1UDV6NXVPSXc=";
  static const String getOrderId = "/ecommerce/orders";
  static const getPaymentId = "/acceptance/payment_keys";
  static const getRefCode = "/acceptance/payments/pay";
  static String visaUrl =
      '$baseUrl/acceptance/iframes/789965?payment_token=$finalToken';

  static String paymentFirstToken = "";
  static String finalToken = "";
  static String refCode = "";
  static String paymentOrderId = "";
  static String integrationIdKiosk = "4251033";
  static String integrationIdCard = "4236836";
}

class AppImages {
  static const String refCodeImage =
      "https://cdn-icons-png.flaticon.com/128/4090/4090458.png";
  static const String visaImage =
      "https://cdn-icons-png.flaticon.com/128/349/349221.png";
}
