import 'package:flutter/material.dart';

class Jobs extends StatefulWidget {
  final String strUsername;
  final String strPassword;
  final Map<String, dynamic> arrJobList;

  Jobs({Key key, this.strUsername, this.strPassword, this.arrJobList})
      : super(key: key);

  @override
  JobState createState() => new JobState();
}

class JobState extends State<Jobs> {
  @override
  Widget build(BuildContext context) {
    JobDataSource oTenantDataSource = new JobDataSource(widget.arrJobList);
    final labelWelcomeText = Text(
      'Welcome : ' + widget.strUsername.toString(),
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.blue,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
    );
  
    final tableTenant = Center(
        child: new PaginatedDataTable(
      header: Center(child: const Text('Jobs')),
      source: oTenantDataSource,
      columns: <DataColumn>[
        new DataColumn(
          label: Text('Job ID'),
        ),
        new DataColumn(
          label: Text('Job Name'),
        ),
      ],
    ));

    return Scaffold(
        body: Center(
            child: ListView(
      padding: EdgeInsets.only(left: 24.0, right: 24.0),
      children: <Widget>[
        SizedBox(height: 60.0),
        labelWelcomeText,
        tableTenant,
        SizedBox(height: 60.0),
      ],
    )));
  }
}

class Job {
  Job(this.m_JobID, this.m_JobName);
  final String m_JobID;
  final String m_JobName;

  bool selected = false;
}

class JobDataSource extends DataTableSource {
  List<Job> listJobs = <Job>[];

  int _selectedCount = 0;

  JobDataSource(Map<String, dynamic> arrJobList) {
    List list = arrJobList['arrJobList'];
    for (int nIndex = 0; nIndex < list.length; nIndex++) {
      Map<String, dynamic> arrList = list[nIndex];
        listJobs.add(new Job(arrList['m_nId'].toString(),
            arrList['m_strJobName'].toString()));
    }
  }

  @override
  DataRow getRow(int index) {
    assert(index >= 0);
    if (index >= listJobs.length) return null;
    final Job oTenant = listJobs[index];
    return new DataRow(cells: <DataCell>[
      new DataCell(new Text('${oTenant.m_JobID}')),
      new DataCell(new Text('${oTenant.m_JobName}')),
    ]);
  }

  @override
  int get rowCount => listJobs.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;
}
