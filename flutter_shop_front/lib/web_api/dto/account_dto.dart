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
      id: json['id'],
      email: json['email'],
      password: json['password'],
      fullName: json['full_name'],
      phoneNumber: json['phone_number'],
      isAdmin: json['is_admin'],
    );
  }
}
