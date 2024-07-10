import 'package:flutter/material.dart';

class ProjectDetailPage extends StatefulWidget {
  const ProjectDetailPage({
    super.key,
    required this.project,
  });

  final String project;

  @override
  State<ProjectDetailPage> createState() => _ProjectDetailPageState();
}

class _ProjectDetailPageState extends State<ProjectDetailPage> {
  @override
  void initState() {
    super.initState();

    print(widget.project);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
