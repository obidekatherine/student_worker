import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'filterDialog.dart';
import 'job.dart';
import 'jobProvider.dart';

class JobMain extends StatefulWidget {
  @override
  _JobMainstate createState() {
    return _JobMainstate();
  }
}

class _JobMainstate extends State<JobMain> {
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
          color: Colors.white,
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget buildSearch() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(5)),
            child: TextFormField(
              keyboardType: TextInputType.text,
              style: TextStyle(
                color: Colors.black87,
              ),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.all(10),
                suffixIcon: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      // primary: Colors.black45,
                    ),
                    onPressed: context.read(jobProvider).search,
                    child: Icon(Icons.search, color: Colors.white)),
                hintText: 'Title/Keyword/Category',
                hintStyle: TextStyle(
                  color: Colors.black38,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSearchBackground() {
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          constraints: BoxConstraints.expand(),
            child: Image.asset('assets/Rectangle 27.png',
                fit: BoxFit.fill)),
        Padding(
          padding: const EdgeInsets.only(bottom: 30.0),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                buildJob(),
                buildSearch(),
              ],
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

  Widget buildTotalJobCount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '12,000 Jobs',
          style: TextStyle(
            color: Colors.black,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextButton.icon(
              onPressed: () {
                showDialog(context: context, builder: (_) => FilterDialog());
              },
              icon: Icon(Icons.filter_alt_outlined),
              label: Text('Filter'),
            )
          ],
        )
      ],
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

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      // physics: ClampingScrollPhysics(),
      // shrinkWrap: true,
      slivers: [
        SliverAppBar(
          stretch: true,
          backgroundColor: Colors.grey,
          expandedHeight: 180.0,
          pinned: false,// context.read(jobProvider).pinned,
          snap: true, // context.read(jobProvider).snap,
          floating: true, //context.read(jobProvider).floating,
          flexibleSpace: FlexibleSpaceBar(
            title: Text('Student Worker'),
            background: buildSearchBackground(),
          ),
        ),
        SliverToBoxAdapter(
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            buildJobCategory(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: buildTotalJobCount(),
            ),
          ]),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Divider(),
                    InkWell(
                      onTap: () =>
                          context.read(jobProvider).onJobTap(JobModel()),
                      child: JobWidget(JobModel()),
                    ),
                  ],
                ),
              );
            },
            childCount: 10,
          ),
        ),
      ],
    );
  }
}
