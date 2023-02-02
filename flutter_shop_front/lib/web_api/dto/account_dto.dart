class AccountDto {
  String id;
  String email;
  String password;
  String fullName;
  String phoneNumber;
  bool isAdmin;

  AccountDto({
    required this.id,
    required this.email,
    required this.password,
    required this.fullName,
    required this.phoneNumber,
    required this.isAdmin,
  });

  factory AccountDto.fromJson(Map<String, dynamic> json) {
    return AccountDto(
      email: json['email'],
      fullName: json['full_name'],
      id: json['id'],
      isAdmin: json['is_admin'],
      password: json['password'],
      phoneNumber: json['phone_number'],
    );
  }
}
