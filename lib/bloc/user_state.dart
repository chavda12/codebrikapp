
class UserState {
  final String name;
  final String nuserName;
  final String password;
  final String retypePassword;
  final String mobileNo;
  final String city;
  final String credit;
  final String remark;
  final String profittloss;
  final String brk;
  final List<String> exchangeDataList;
  final List<String> tradeDataList;
  UserState({
    this.name = '',
    this.nuserName = '',
    this.password = '',
    this.retypePassword = '',
    this.mobileNo = '',
    this.city = '',
    this.credit = '',
    this.remark = '',
    this.profittloss = '',
    this.brk = '',
    this.exchangeDataList = const [],
    this.tradeDataList = const [],
  });

  UserState copyWith({
    String? name,
    String? nuserName,
    String? password,
    String? retypePassword,
    String? mobileNo,
    String? city,
    String? credit,
    String? remark,
    String? profittloss,
    String? brk,
    List<String>? exchangeDataList,
    List<String>? tradeDataList,
  }) {
    return UserState(
      name: name ?? this.name,
      nuserName: nuserName ?? this.nuserName,
      password: password ?? this.password,
      retypePassword: retypePassword ?? this.retypePassword,
      mobileNo: mobileNo ?? this.mobileNo,
      city: city ?? this.city,
      credit: credit ?? this.credit,
      remark: remark ?? this.remark,
      profittloss: profittloss ?? this.profittloss,
      brk: brk ?? this.brk,
      exchangeDataList: exchangeDataList ?? this.exchangeDataList,
      tradeDataList: tradeDataList ?? this.tradeDataList,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'nuserName': nuserName,
      'password': password,
      'retypePassword': retypePassword,
      'mobileNo': mobileNo,
      'city': city,
      'credit': credit,
      'remark': remark,
      'profittloss': profittloss,
      'brk': brk,
      'exchangeDataList': exchangeDataList,
      'tradeDataList': tradeDataList,
    };
  }

  factory UserState.fromMap(Map<String, dynamic> map) {
    return UserState(
      name: map['name'] ?? '',
      nuserName: map['nuserName'] ?? '',
      password: map['password'] ?? '',
      retypePassword: map['retypePassword'] ?? '',
      mobileNo: map['mobileNo'] ?? '',
      city: map['city'] ?? '',
      credit: map['credit'] ?? '',
      remark: map['remark'] ?? '',
      profittloss: map['profittloss'] ?? '',
      brk: map['brk'] ?? '',
      exchangeDataList: map['exchangeDataList'] ?? [],
      tradeDataList: map['tradeDataList'] ?? [],
    );
  }
}
