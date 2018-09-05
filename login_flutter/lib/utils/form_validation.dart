
class FormValadation{
  String passwordNotMatched(var textbox,String value ) {
      if ((value != textbox.text)) 
        return "Password did not match";   
    }
}