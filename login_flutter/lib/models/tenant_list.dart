class TenantList {
  String m_strUsername;
  String m_strPassword;
  List arr_tenantList;

  TenantList(this.m_strUsername, this.m_strPassword, this.arr_tenantList);
  String get username => m_strUsername;
  String get password => m_strPassword;
  List get arrJobList => arr_tenantList;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["username"] = m_strUsername;
    map["password"] = m_strPassword;
    map["arrJobList"] = arr_tenantList;
    return map;
  }

  TenantList.map(dynamic obj) {
    this.arr_tenantList = obj["arrJobList"];
    this.m_strUsername = obj["username"];
    this.m_strPassword = obj["password"];
  }
}
