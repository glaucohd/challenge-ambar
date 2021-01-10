import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Skeleton extends StatelessWidget {
  final int length;

  Skeleton({this.length});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: length,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          highlightColor: Colors.grey[100],
          baseColor: Colors.grey[300],
          child: Container(
            padding: const EdgeInsets.all(8.0),
            margin: EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 47,
                  height: 47,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(width: 18),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 15,
                        width: double.infinity,
                        color: Colors.grey,
                      ),
                      SizedBox(height: 5),
                      Container(
                        height: 15,
                        width: double.infinity,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
