import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_worker/jobs/jobProvider.dart';

class FilterDialog extends StatefulWidget {
  @override
  _FilterDialogState createState() => _FilterDialogState();
}

class _FilterDialogState extends State<FilterDialog> {
  String value = 'All';
  bool isRemote = false;
  bool isOnsite = false;
  bool hasApplied = false;

  @override
  Widget build(BuildContext context) {
    return
        //hasApplied
        //? ApplicationSuccess(widget.findMoreJobs)
        //:
        AlertDialog(
      title: Text('Narrow Your Search'),
      content: Consumer(
        builder: (_, watch, __) {
          var jp = watch(jobProvider);
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Text('Location:'),
                  SizedBox(width: 10),
                  Card(
                      child: DropdownButton<String>(
                          onChanged: jp.onLocationChanged,
                          underline: SizedBox(),
                          value: jp.filterDropdownValue,
                          items: context
                              .read(jobProvider)
                              .filterList
                              .toList()
                              .map((location) => DropdownMenuItem<String>(
                                    child: Text(location),
                                    value: location,
                                  ))
                              .toList()))
                ],
              ),
              SizedBox(height: 15),
              Text('Job Type:'),
              Row(
                children: [
                  Checkbox(
                    value: jp.isRemote,
                    onChanged: jp.onRemoteChanged,
                  ),
                  Text('Remote'),
                  Checkbox(
                    value: jp.isOnsite,
                    onChanged: jp.onOnsiteChanged,
                  ),
                  Text('On-site'),
                ],
              ),
              ElevatedButton(
                onPressed: context.read(jobProvider).applyFilter,
                child: Text('Apply'),
              ),
            ],
          );
        },
      ),
    );
  }
}
