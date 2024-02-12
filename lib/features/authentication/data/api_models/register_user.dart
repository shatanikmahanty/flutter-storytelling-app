class RegisterUser {
  String firstName;
  String lastName;
  String? email;
  String phone;
  String? altPhone;
  String address;
  String pin;
  String? aadharNumber;

  RegisterUser({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.altPhone,
    required this.address,
    required this.pin,
    required this.aadharNumber,
  });

  Map<String, dynamic> toJson() => {
        'first_name': firstName,
        'last_name': lastName,
        'email': email,
        'phone': phone,
        'alt_phone': altPhone,
        'address': address,
        'pin': pin,
        'aadhar_number': aadharNumber,
      };

  factory RegisterUser.fromJson(Map<String, dynamic> json) => RegisterUser(
        firstName: json['first_name'],
        lastName: json['last_name'],
        email: json['email'],
        phone: json['phone'],
        altPhone: json['alt_phone'],
        address: json['address'],
        pin: json['pin'],
        aadharNumber: json['aadhar_number'],
      );
}
