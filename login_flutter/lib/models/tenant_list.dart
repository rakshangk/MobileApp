class TenantList {
  String m_strUsername;
  String m_strPassword;
  List arr_tenantList;
  String m_TenantID;
  String m_TenantName;

  TenantList(this.m_strUsername, this.m_strPassword, this.arr_tenantList,this.m_TenantID,this.m_TenantName);
  String get username => m_strUsername;
  String get password => m_strPassword;
  List get arrJobList => arr_tenantList;
  String get m_nId=>m_TenantID;
  String get m_strJobName=>m_TenantName;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["username"] = m_strUsername;
    map["password"] = m_strPassword;
    map["arrJobList"] = arr_tenantList;
    map["m_nId"]=m_TenantID;
    map["m_strJobName"]=m_TenantName;
    return map;
  }

  TenantList.map(dynamic obj) {
    this.arr_tenantList = obj["arrJobList"];
    this.m_strUsername = obj["username"];
    this.m_strPassword = obj["password"];
    this.m_TenantID=obj["m_nId"];
  this.m_TenantName=obj["m_strJobName"];
      
  }
}
