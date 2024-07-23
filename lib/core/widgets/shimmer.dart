import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SkeletonLoader extends StatelessWidget {
  const SkeletonLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(

      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: 10,
          itemBuilder: (context, index) => ListTile(
            leading: const CircleAvatar(backgroundColor: Colors.grey),
            title: Container(
              color: Colors.grey,
              height: 20,
              width: double.infinity,
            ),
            subtitle: Container(
              color: Colors.grey,
              height: 20,
              width: double.infinity,
            ),
          ),
        ),
      ),
    );
  }
}
