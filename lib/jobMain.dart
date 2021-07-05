import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'job.dart';

class JobMain extends StatefulWidget {
  @override
  _JobMainstate createState() {
    return _JobMainstate();
  }
}

class _JobMainstate extends State<JobMain> {
  bool showMore = false;

  int currentNavIndex = 0;

  Widget buildAppName() {
    return Text(
      'StudentWorker',
      style: TextStyle(
          fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
    );
  }

  Widget buildJob() {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(8.00),
      child: Text(
        'Find your next job',
        style: TextStyle(
          color: Colors.black,
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget buildSearch() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          alignment: Alignment.topLeft,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(2),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 6,
                offset: Offset(0, 2),
              ),
            ],
          ),
          height: 30,
          child: TextField(
            keyboardType: TextInputType.text,
            style: TextStyle(
              color: Colors.black87,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(10),
                suffixIcon: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.black45,
                ),
                onPressed: () {},
                child: Icon(Icons.search, color: Colors.white)),
              hintText: 'Title/Keyword/Category',
              hintStyle: TextStyle(
                color: Colors.black38,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildExplore() {
    return Container(
      alignment: Alignment.centerLeft,
      // padding: EdgeInsets.all(8.00),
      child: Text(
        'Explore our categories',
        style: TextStyle(
          color: Colors.black,
          fontSize: 18,
          //fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget buildJobCategory() {
    return Container(
      child: Align(
        alignment: Alignment.centerLeft,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: <Widget>[
              jobCategory('Retail'),
              jobCategory('Marketing'),
              jobCategory('Catering'),
              jobCategory('Careers'),
            ],
          ),
        ),
      ),
    );
  }

  Widget jobCategory(String category) {
    return SizedBox(
      width: 100,
      height: 100,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                backgroundColor: Colors.grey,
              ),
              Text(category),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildRecentJob() {
    return Container(
      alignment: Alignment.centerLeft,
      // padding: EdgeInsets.all(8.00),
      child: Text(
        'Recent jobs',
        style: TextStyle(
          color: Colors.black,
          fontSize: 15,
          //fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget buildJobList() {
    List<JobModel> jobs =
        List<JobModel>.generate(showMore ? 10 : 3, (index) => JobModel());
    return ListView.builder(
      physics: ClampingScrollPhysics(),
      shrinkWrap: true,
      itemCount: jobs.length,
      itemBuilder: (_, i) => JobWidget(jobs[i]),
    );
  }

  void onNavItemTap(int i) {
    // Add a switch case statement here to perfom
    // some action for a perticular item
    setState(() {
      currentNavIndex = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 160,
        centerTitle: true,
        backgroundColor: Colors.grey,
        title: Column(children: [
          buildAppName(),
          SizedBox(height: 10),
          buildJob(),
          buildSearch(),
        ]),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: onNavItemTap,
        currentIndex: currentNavIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.work_outline), label: 'Jobs'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outlined), label: 'Applications'),
          BottomNavigationBarItem(
              icon: Icon(Icons.file_copy_outlined), label: 'Resume'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_pin), label: 'Profile'),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          // padding: EdgeInsets.symmetric(
          //   horizontal: 25,
          //   vertical: 120,
          // ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(height: 30),
              buildExplore(),
              SizedBox(height: 10),
              buildJobCategory(),
              SizedBox(height: 15),
              buildRecentJob(),
              SizedBox(),
              buildJobList(),
              TextButton(
                child: Text(
                  !showMore ? 'See more' : 'See less',
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
                onPressed: () {
                  setState(() {
                    showMore = !showMore;
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
