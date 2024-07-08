import 'package:flutter/material.dart';

class AddRewardPage extends StatefulWidget {
  const AddRewardPage({
    super.key,
    required this.projectId,
  });

  final String projectId;

  @override
  State<AddRewardPage> createState() => _AddRewardPageState();
}

class _AddRewardPageState extends State<AddRewardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("리워드"),
      ),
    );
  }
}
