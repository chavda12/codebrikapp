class UserModel {
  final UserInfo? userInfo;
  final List<ActiveExchangeInfo> activeExchangeInfo;
  final List<HLTradeExchangeInfo> hLTradeExchangeInfo;
  final List<UserType> userType;

  factory UserModel.empty() {
    return UserModel(
      userInfo: null,
      activeExchangeInfo: [],
      hLTradeExchangeInfo: [],
      userType: [],
    );
  }

  const UserModel({
    required this.userInfo,
    required this.activeExchangeInfo,
    required this.hLTradeExchangeInfo,
    required this.userType,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userInfo: UserInfo.fromMap(map['UserInfo'] as Map<String, dynamic>),
      activeExchangeInfo: List<ActiveExchangeInfo>.from(
        (map['ActiveExchangeInfo']).map<ActiveExchangeInfo>(
          (x) => ActiveExchangeInfo.fromMap(Map.from(x)),
        ),
      ),
      hLTradeExchangeInfo: List<HLTradeExchangeInfo>.from(
        (map['HLTradeExchangeInfo']).map<HLTradeExchangeInfo>(
          (x) => HLTradeExchangeInfo.fromMap(Map.from(x)),
        ),
      ),
      userType: List<UserType>.from(
        (map['UserType']).map<UserType>(
          (x) => UserType.fromMap(Map.from(x)),
        ),
      ),
    );
  }

  @override
  String toString() {
    return 'UserModel(UserInfo: $UserInfo, ActiveExchangeInfo: $ActiveExchangeInfo, HLTradeExchangeInfo: $HLTradeExchangeInfo, UserType: $UserType)';
  }
}

class UserInfo {
  final int UserId;
  final String UserType;
  final String DisplayName;
  final bool AllowModifyTrade;
  final bool CanAddMaster;
  final int PLUpline;
  final int PLDownline;
  final int PLOur;
  final int BSUpline;
  final int BSDownline;
  final int BSOur;
  final bool CanAdd;
  final int TotalAmount;
  UserInfo({
    required this.UserId,
    required this.UserType,
    required this.DisplayName,
    required this.AllowModifyTrade,
    required this.CanAddMaster,
    required this.PLUpline,
    required this.PLDownline,
    required this.PLOur,
    required this.BSUpline,
    required this.BSDownline,
    required this.BSOur,
    required this.CanAdd,
    required this.TotalAmount,
  });

  UserInfo copyWith({
    int? UserId,
    String? UserType,
    String? DisplayName,
    bool? AllowModifyTrade,
    bool? CanAddMaster,
    int? PLUpline,
    int? PLDownline,
    int? PLOur,
    int? BSUpline,
    int? BSDownline,
    int? BSOur,
    bool? CanAdd,
    int? TotalAmount,
  }) {
    return UserInfo(
      UserId: UserId ?? this.UserId,
      UserType: UserType ?? this.UserType,
      DisplayName: DisplayName ?? this.DisplayName,
      AllowModifyTrade: AllowModifyTrade ?? this.AllowModifyTrade,
      CanAddMaster: CanAddMaster ?? this.CanAddMaster,
      PLUpline: PLUpline ?? this.PLUpline,
      PLDownline: PLDownline ?? this.PLDownline,
      PLOur: PLOur ?? this.PLOur,
      BSUpline: BSUpline ?? this.BSUpline,
      BSDownline: BSDownline ?? this.BSDownline,
      BSOur: BSOur ?? this.BSOur,
      CanAdd: CanAdd ?? this.CanAdd,
      TotalAmount: TotalAmount ?? this.TotalAmount,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'UserId': UserId,
      'UserType': UserType,
      'DisplayName': DisplayName,
      'AllowModifyTrade': AllowModifyTrade,
      'CanAddMaster': CanAddMaster,
      'PLUpline': PLUpline,
      'PLDownline': PLDownline,
      'PLOur': PLOur,
      'BSUpline': BSUpline,
      'BSDownline': BSDownline,
      'BSOur': BSOur,
      'CanAdd': CanAdd,
      'TotalAmount': TotalAmount,
    };
  }

  factory UserInfo.fromMap(Map<String, dynamic> map) {
    return UserInfo(
      UserId: map['UserId'].toInt() as int,
      UserType: map['UserType'] as String,
      DisplayName: map['DisplayName'] as String,
      AllowModifyTrade: map['AllowModifyTrade'] as bool,
      CanAddMaster: map['CanAddMaster'] as bool,
      PLUpline: map['PLUpline'].toInt() as int,
      PLDownline: map['PLDownline'].toInt() as int,
      PLOur: map['PLOur'].toInt() as int,
      BSUpline: map['BSUpline'].toInt() as int,
      BSDownline: map['BSDownline'].toInt() as int,
      BSOur: map['BSOur'].toInt() as int,
      CanAdd: map['CanAdd'] as bool,
      TotalAmount: map['TotalAmount'].toInt() as int,
    );
  }

  @override
  String toString() {
    return 'UserInfo(UserId: $UserId, UserType: $UserType, DisplayName: $DisplayName, AllowModifyTrade: $AllowModifyTrade, CanAddMaster: $CanAddMaster, PLUpline: $PLUpline, PLDownline: $PLDownline, PLOur: $PLOur, BSUpline: $BSUpline, BSDownline: $BSDownline, BSOur: $BSOur, CanAdd: $CanAdd, TotalAmount: $TotalAmount)';
  }
}

class GroupList {
  final int GroupId;
  final bool IsDefault;
  final String GroupName;
  final bool IsSelect;
  GroupList({
    required this.GroupId,
    required this.IsDefault,
    required this.GroupName,
    required this.IsSelect,
  });

  GroupList copyWith({
    int? GroupId,
    bool? IsDefault,
    String? GroupName,
    bool? IsSelect,
  }) {
    return GroupList(
      GroupId: GroupId ?? this.GroupId,
      IsDefault: IsDefault ?? this.IsDefault,
      GroupName: GroupName ?? this.GroupName,
      IsSelect: IsSelect ?? this.IsSelect,
    );
  }

  factory GroupList.fromMap(Map<String, dynamic> map) {
    return GroupList(
      GroupId: map['GroupId'].toInt() as int,
      IsDefault: map['IsDefault'] as bool,
      GroupName: map['GroupName'] as String,
      IsSelect: map['IsSelect'] as bool,
    );
  }

  @override
  String toString() {
    return 'GroupList(GroupId: $GroupId, IsDefault: $IsDefault, GroupName: $GroupName, IsSelect: $IsSelect)';
  }
}

class ActiveExchangeInfo {
  final int ExchangeId;
  final String ExchangeName;
  final String BrokarageType;
  final bool TrunoverWise;
  final bool SymbolWise;
  final List<GroupList> groupList;
  ActiveExchangeInfo({
    required this.ExchangeId,
    required this.ExchangeName,
    required this.BrokarageType,
    required this.TrunoverWise,
    required this.SymbolWise,
    required this.groupList,
  });

  ActiveExchangeInfo copyWith({
    int? ExchangeId,
    String? ExchangeName,
    String? BrokarageType,
    bool? TrunoverWise,
    bool? SymbolWise,
    List<GroupList>? groupList,
  }) {
    return ActiveExchangeInfo(
      ExchangeId: ExchangeId ?? this.ExchangeId,
      ExchangeName: ExchangeName ?? this.ExchangeName,
      BrokarageType: BrokarageType ?? this.BrokarageType,
      TrunoverWise: TrunoverWise ?? this.TrunoverWise,
      SymbolWise: SymbolWise ?? this.SymbolWise,
      groupList: groupList ?? this.groupList,
    );
  }

  factory ActiveExchangeInfo.fromMap(Map<String, dynamic> map) {
    return ActiveExchangeInfo(
      ExchangeId: map['ExchangeId'].toInt() as int,
      ExchangeName: map['ExchangeName'] as String,
      BrokarageType: map['BrokarageType'] as String,
      TrunoverWise: map['TrunoverWise'] as bool,
      SymbolWise: map['SymbolWise'] as bool,
      groupList: List<GroupList>.from(
        (map['GroupList']).map<GroupList>(
          (x) => GroupList.fromMap(Map.from(x)),
        ),
      ),
    );
  }

  @override
  String toString() {
    return 'ActiveExchangeInfo(ExchangeId: $ExchangeId, ExchangeName: $ExchangeName, BrokarageType: $BrokarageType, TrunoverWise: $TrunoverWise, SymbolWise: $SymbolWise, GroupList: $GroupList)';
  }
}

class HLTradeExchangeInfo {
  final int ExchangeID;
  final String ExchangeName;
  HLTradeExchangeInfo({
    required this.ExchangeID,
    required this.ExchangeName,
  });

  HLTradeExchangeInfo copyWith({
    int? ExchangeID,
    String? ExchangeName,
  }) {
    return HLTradeExchangeInfo(
      ExchangeID: ExchangeID ?? this.ExchangeID,
      ExchangeName: ExchangeName ?? this.ExchangeName,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'ExchangeID': ExchangeID,
      'ExchangeName': ExchangeName,
    };
  }

  factory HLTradeExchangeInfo.fromMap(Map<String, dynamic> map) {
    return HLTradeExchangeInfo(
      ExchangeID: map['ExchangeID'].toInt() as int,
      ExchangeName: map['ExchangeName'] as String,
    );
  }

  @override
  String toString() =>
      'HLTradeExchangeInfo(ExchangeID: $ExchangeID, ExchangeName: $ExchangeName)';
}

class UserType {
  final String Id;
  final String Name;
  UserType({
    required this.Id,
    required this.Name,
  });

  factory UserType.fromMap(Map<String, dynamic> map) {
    return UserType(
      Id: map['Id'] as String,
      Name: map['Name'] as String,
    );
  }

  @override
  String toString() => 'UserType(Id: $Id, Name: $Name)';
}
