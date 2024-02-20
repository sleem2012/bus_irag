import 'package:flutter/material.dart';

class LocationCheckWrapper extends StatefulWidget {
  const LocationCheckWrapper({super.key, required this.child});

  final Widget child;

  @override
  State<LocationCheckWrapper> createState() => _LocationCheckWrapperState();
}

class _LocationCheckWrapperState extends State<LocationCheckWrapper> {
  @override
  initState() {
    super.initState();

    // LocationHelper.determinePosition()
    //     .then((value) => KStorage.i.setLocation(value));
    // WidgetsBinding.instance.addPostFrameCallback((_) => nav());
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox();

  }
}
