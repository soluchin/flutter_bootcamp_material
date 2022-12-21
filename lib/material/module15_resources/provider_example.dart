import 'package:flutter/material.dart';
import 'package:bootcamp_material/material/module15_resources/shared_state.dart';
import 'package:provider/provider.dart';

class ProviderExample extends StatefulWidget {
  const ProviderExample({super.key});

  @override
  State<ProviderExample> createState() => _ProviderExampleState();
}

class _ProviderExampleState extends State<ProviderExample> {
  int _counter = 0;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DateValueNotifier>(
      create: (BuildContext context) {
        return DateValueNotifier();
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).canvasColor,
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(Icons.close),
              color: Colors.red,
            )
          ],
        ),
        body: SafeArea(
            child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("This is an Odd or Even App"),
              SizedBox(
                height: 20,
              ),
              Consumer<DateValueNotifier>(
                builder: (context, value, child) => Container(
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                      color: value.isEven() ? Colors.green : Colors.amber,
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "${value.date.day}",
                        style: TextStyle(
                            fontSize: 172,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Text(
                        value.isEven() ? "Even" : "Odd",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  )),
                ),
              )
            ],
          ),
        )),
        floatingActionButton: Consumer<DateValueNotifier>(
          builder: (context, value, child) => FloatingActionButton(
            onPressed: () {
              showDatePicker(
                      context: context,
                      initialDate: value.getDate,
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2099))
                  .then((pickedDate) {
                value.picked(pickedDate!);
              });
            },
            child: Icon(Icons.calendar_month),
          ),
        ),
      ),
    );
  }
}
