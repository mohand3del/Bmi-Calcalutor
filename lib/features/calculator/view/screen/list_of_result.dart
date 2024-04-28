import 'package:bim_calculator/core/route/routes.dart';
import 'package:bim_calculator/features/calculator/data/model/results_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class ListOfResult extends StatefulWidget {
  const ListOfResult({super.key});

  @override
  State<ListOfResult> createState() => _ListOfResultState();
}

class _ListOfResultState extends State<ListOfResult> {
  ResultsModel? resultsModel;
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('bmi_data').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List of Result'),
        actions: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.popAndPushNamed(context, Routes.calculator);
            }
          )
        ]
      ),
      body: Container(
        child: StreamBuilder(
            stream: _usersStream,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Text('Something went wrong');
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ListView.builder(
                itemBuilder: (context, index) {
                  //var dateFormat = DateFormat('dd/MM/yyyy hh:mm');
                  return Card(
                    child: InkWell(
                      onTap: () {
                        // final documentId = resultsModel!.id;
                        final doc = snapshot.data!.docs[index].data()
                            as Map<String, dynamic>;
                        final resultsModel = ResultsModel.fromJson(doc);
                        Navigator.pushNamed(
                          context,
                          Routes.editResult,
                          arguments: resultsModel.id,
                        );
                      },
                      child: ListTile(
                        title: Text(snapshot.data!.docs[index]['result']),
                        subtitle:
                            Text(snapshot.data!.docs[index]['bmi'].toString()),
                        leading: Text(
                            ' ${snapshot.data!.docs[index]['age'].toString()}'),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () async {
                            final docRef = snapshot.data!.docs[index].reference;

                            await docRef.delete();

                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Item deleted successfully'),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  );
                },
                itemCount: snapshot.data!.docs.length,
              );
            }),
      ),
    );
  }
}
