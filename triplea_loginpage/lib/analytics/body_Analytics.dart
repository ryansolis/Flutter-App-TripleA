import 'package:flutter/material.dart';
import 'package:triplea_loginpage/constants/EvacuationTableData.dart';
import 'package:triplea_loginpage/constants/Services.dart';
import 'package:triplea_loginpage/constants/constants.dart';
import 'package:animations/animations.dart';

class GraphScreen extends StatefulWidget {
  GraphScreen() : super();
  @override
  DataPage createState() => DataPage();
}

class DataPage extends State<GraphScreen> {
  List<EvacuationData> _dataTable;

  _getData() {
    Services.getDataTable().then((dataTable) {
      setState(() {
        _dataTable = dataTable;
      });
      print("Length: ${dataTable.length}");
    });
  }

  SingleChildScrollView _dataBody() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: [
            DataColumn(label: Text("DATE")),
            DataColumn(label: Text("PARTICIPANTS")),
            //DataColumn(label: Text("Total"))
          ],
          rows: _dataTable
              .map(
                (dataTable) => DataRow(cells: [
                  DataCell(Text(dataTable.date), onTap: () {
                    showModal(
                        configuration: FadeScaleTransitionConfiguration(),
                        context: context,
                        builder: (context) {
                          return _showDetails(dataTable);
                        });
                  }),
                  DataCell(Text("${dataTable.total} students"), onTap: () {
                    showModal(
                        configuration: FadeScaleTransitionConfiguration(),
                        context: context,
                        builder: (context) {
                          return _showDetails(dataTable);
                        });
                  }),
                  // DataCell(Text(dataTable.total), onTap: () {
                  //   showModal(
                  //       configuration: FadeScaleTransitionConfiguration(),
                  //       context: context,
                  //       builder: (context) {
                  //         return _showDetails(dataTable);
                  //       });
                  // }),
                ]),
              )
              .toList(),
        ),
      ),
    );
  }

  Dialog _showDetails(EvacuationData data) {
    return Dialog(
      child: Container(
        height: 230,
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Date: ${data.date}"),
            Text("Duration: ${data.duration} seconds"),
            Text(""),
            Text("Main Building: ${data.main_building}"),
            Text("HS Building: ${data.hs_building}"),
            Text("ST Building: ${data.st_building}"),
            Text("Main Canteen: ${data.main_canteen}"),
            Text("Archi Building: ${data.archi_building}"),
            Text("Total: ${data.total} students")
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _dataTable = [];
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 80,
          color: mainColor,
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Row(
            children: <Widget>[
              Text("Analytics",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      .copyWith(color: Colors.white, fontSize: 30)),
              Spacer(),
              IconButton(
                icon: Icon(
                  Icons.refresh,
                  size: 35,
                  color: Colors.white,
                ),
                onPressed: () {
                  _getData();
                },
              ),
            ],
          ),
        ),
        Expanded(child: _dataBody())
      ],
    );
  }
}
