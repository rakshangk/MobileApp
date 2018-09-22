class SignUpModel {
   String m_strEmailId;
   String m_strFirstName;
   String m_strLastName;
   String m_strMobile;
   String m_strPassword;

  SignUpModel(this.m_strEmailId, this.m_strFirstName, this.m_strLastName, this.m_strMobile, this.m_strPassword);
  
  SignUpModel.fromJson(Map<String, dynamic> json):
       // m_strEmailId = json['strEmailId'],
        m_strFirstName = json['strFirstName'],
        m_strLastName=json['strLastName'],
        m_strMobile=json['strMobile']
       // m_strPassword=json['m_strPassword']
       ;

  Map<String, dynamic> toJson() =>
    {
    //'m_strEmailId': m_strEmailId,
      'm_strFirstName': m_strFirstName,
      'm_strLastName': m_strLastName,
      'm_strMobile': m_strMobile,
    //'m_strPassword':m_strPassword,
    };
  
}
