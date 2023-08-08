import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  /// get data from SharedPreferences
  Future<List<String>> getResultData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> saveList = prefs.getStringList('saveList') ?? [];
    return saveList;
  }

  /// Clear all data
  Future<void> deleteAll() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HISTORY"),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () async {
             setState(() {
               deleteAll();
             });
            },
            icon: const Icon(Icons.delete_forever),
          ),
        ],
      ),
      body: FutureBuilder(
          future: getResultData(),
          builder: (_, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasData && snapshot.connectionState == ConnectionState.done) {
              List<String> resultList = snapshot.data ?? [];
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: resultList.isEmpty ? buildEmptyView() : buildListView(resultList),
                  ),
                ],
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }

  Widget buildEmptyView() {
    return Center(
      child: Text(
        "Empty!",
        style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 20.0),
      ),
    );
  }

  Widget buildListView(List<String> resultList) {
    return ListView.separated(
      padding: const EdgeInsets.all(15),
      separatorBuilder: (_, index) {
        return const SizedBox(
          height: 10,
        );
      },
      itemCount: resultList.length,
      itemBuilder: (_, index) {
        String result = resultList[index];
        var resultItems = jsonDecode(result);
        return Card(
          shadowColor: const Color(0xFF7776fe),
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            tileColor: Color(
              int.parse(
                resultItems['statusColor'],
                radix: 16,
              ),
            ).withOpacity(0.3),
            title: Text(resultItems['status']),
            subtitle: Text(resultItems['formattedDate']),
            contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            leading: Text(
              resultItems['bmi'],
              style: const TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Color(0xff5e5f61)),
            ),
          ),
        );
      },
    );
  }
}
