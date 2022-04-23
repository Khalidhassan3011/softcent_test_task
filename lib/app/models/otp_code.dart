import 'dart:convert';

class OtpCode {
  OtpCode({
    required this.otpCode,
  });

  // length 5
  String otpCode;

  factory OtpCode.fromRawJson(String str) => OtpCode.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory OtpCode.fromJson(Map<String, dynamic> json) => OtpCode(
    otpCode: json["otp_code"].toString(),
  );

  Map<String, dynamic> toJson() => {
    "otp_code": otpCode,
  };
}
