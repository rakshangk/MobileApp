import 'package:flutter/material.dart';
import 'package:login_flutter/Widgets/dynamic_Widgets.dart';
import 'package:login_flutter/data/rest_ds.dart';

class MainScreen extends StatefulWidget {
  final String strUsername;
  final String strPassword;
  final List<dynamic> arrTenantList;

  MainScreen({Key key, this.strUsername, this.strPassword, this.arrTenantList})
      : super(key: key);
  @override
  MainScreenState createState() => new MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  RestDatasource oRestDatasource = new RestDatasource();
  DynamicWidgets oDynamicWidgets = new DynamicWidgets();
  String strSelectedValue = 'Please choose Tenant';
  List<String> strings = new List();

  @override
  Widget build(BuildContext context) {
    final labelWelcomeText = Text(
      'Welcome : ' + widget.strUsername.toString(),
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.blue,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
    );

    final dropdownList = new Container(
      child: new DropdownButtonHideUnderline(
        child: new ButtonTheme(
          alignedDropdown: true,
          child: new DropdownButton<String>(
            items: widget.arrTenantList.map((dynamic value) {
              return new DropdownMenuItem<String>(
                value: value,
                child: new Text(value),
              );
            }).toList(),
            hint: Text(strSelectedValue),
            onChanged: (String value) {
              strSelectedValue = value;
              this.setState(() {
                strSelectedValue = value;
                oRestDatasource.getJobList(
                    widget.strUsername, widget.strPassword, context);
              });
            },
          ),
        ),
      ),
    );

    final btnLogout = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        borderRadius: BorderRadius.circular(15.0),
        shadowColor: Colors.lightBlueAccent.shade100,
        elevation: 5.0,
        child: MaterialButton(
          minWidth: 200.0,
          height: 50.0,
          color: Colors.blue,
          child: Text('Logout', style: TextStyle(color: Colors.white)),
          onPressed: () {
            oRestDatasource.logout(
                widget.strUsername, widget.strPassword, context);
          },
        ),
      ),
    );

    return Scaffold(
        body: Center(
            child: ListView(
      padding: EdgeInsets.only(left: 24.0, right: 24.0),
      children: <Widget>[
        SizedBox(height: 60.0),
        labelWelcomeText,
        SizedBox(height: 60.0),
        dropdownList,
        btnLogout
      ],
    )));
  }
}
