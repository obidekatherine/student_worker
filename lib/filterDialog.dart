import 'package:flutter/material.dart';

class FilterDialog extends StatefulWidget {
  @override
  _FilterDialogState createState() => _FilterDialogState();
}

class _FilterDialogState extends State<FilterDialog> {
  String value = 'All';
  bool isRemote = false;
  bool isOnsite = false;
  bool hasApplied = false;

  void onLocationChanged(newValue) => setState(() {
        value = newValue;
      });

  void onRemoteChanged(newValue) => setState(() {
        isRemote = newValue;
      });

  void onOnsiteChanged(newValue) => setState(() {
        isOnsite = newValue;
      });

  @override
  Widget build(BuildContext context) {
    return
        //hasApplied
        //? ApplicationSuccess(widget.findMoreJobs)
        //:
        AlertDialog(
      title: Text('Narrow Your Search'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Text('Location:'),
              SizedBox(width: 10),
              Card(
                child: DropdownButton<String>(
                    onChanged: onLocationChanged,
                    underline: SizedBox(),
                    value: value,
                    items: ['All', 'Lagos', 'Abuja', 'Osun', 'Sambisa Forest']
                        .map((e) => DropdownMenuItem<String>(
                              child: Text(e),
                              value: e,
                            ))
                        .toList()),
              )
            ],
          ),
          SizedBox(height: 15),
          Text('Job Type:'),
          Row(
            children: [
              Checkbox(
                value: isRemote,
                onChanged: onRemoteChanged,
              ),
              Text('Remote'),
              Checkbox(
                value: isOnsite,
                onChanged: onOnsiteChanged,
              ),
              Text('On-site'),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              // after making a successful call to the server
              Navigator.pop(context);
            },
            child: Text('Apply'),
          ),
        ],
      ),
    );
  }
}

class ApplicationSuccess extends StatelessWidget {
  final void Function() findMoreJobs;

  ApplicationSuccess(this.findMoreJobs);
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titlePadding: EdgeInsets.zero,
      title: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: CircleAvatar(
                radius: 23,
                backgroundColor: Colors.grey,
                child: Icon(Icons.check, color: Colors.white),
              ),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(height: 40, color: Colors.grey.withOpacity(.3)),
              SizedBox(height: 30),
              Text(
                'Your application has been submitted!',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                    // side: BorderSide(width: 1),
                    ),
                onPressed: () => findMoreJobs(),
                child: Text('Find more jobs'),
              ),
              SizedBox(height: 20),
            ],
          ),
        ],
      ),
    );
  }
}
