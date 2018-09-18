class SignUpModel {
   String m_strEmailId;
   String m_strFirstName;
   String m_strLastName;
   String m_strMobile;
   String m_strPassword;

  SignUpModel(this.m_strEmailId, this.m_strFirstName, this.m_strLastName, this.m_strMobile, this.m_strPassword);
  SignUpModel.fromJson(Map<String, dynamic> json)
      : m_strEmailId = json['strEmailId'],
        m_strFirstName = json['strFirstName'],
        m_strLastName=json['strLastName'],
        m_strMobile=json['strMobile'],
        m_strPassword=json['strPassword'];

  Map<String, dynamic> toJson() =>
    {
      'strEmailId': m_strEmailId,
      'strFirstName': m_strFirstName,
      'strLastName': m_strLastName,
      'strMobile': m_strMobile,
      'strPassword':m_strPassword,
    };
  
}
