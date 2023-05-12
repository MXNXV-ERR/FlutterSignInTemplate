import 'package:flutter/material.dart';

Widget liftedBoxBuilder({required Widget child}) {
    return Center(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: IntrinsicHeight(
          child: IntrinsicWidth(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    )
                  ]),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0), child: child),
            ),
          ),
        ),
      ),
    );
  }