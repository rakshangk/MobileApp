class User {
  String m_strUsername;
  String m_strPassword;

  User(this.m_strUsername, this.m_strPassword);

  User.map(dynamic obj) {
    this.m_strUsername = obj["username"];
    this.m_strPassword = obj["password"];
  }

  String get username => m_strUsername;

  String get password => m_strPassword;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["username"] = m_strUsername;
    map["password"] = m_strPassword;
    return map;
  }
}
