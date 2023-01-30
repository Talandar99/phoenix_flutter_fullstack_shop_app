import 'account_dto.dart';

class AccountsDto {
  List<AccountDto> accounts;

  AccountsDto({
    required this.accounts,
  });

  factory AccountsDto.fromJson(Map<String, dynamic> json) {
    return AccountsDto(
      accounts: json[''] != null
          ? json['']
              .map<AccountDto>(
                (json) => AccountDto.fromJson(json),
              )
              .toList()
          : [],
    );
  }
}
