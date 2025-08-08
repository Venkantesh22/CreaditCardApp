import 'package:flutter/material.dart';

Widget cardImg(img) {
  return Stack(
    children: [
      Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        clipBehavior: Clip.antiAlias,
        child: Image.asset(
          img,
          fit: BoxFit.cover,
          color: Colors.black.withValues(alpha: 0.5),
          colorBlendMode: BlendMode.darken,
        ),
      ),
      Positioned(
        top: 100,
        left: 0,
        right: 0,
        child: const Icon(Icons.lock_outline, color: Colors.white, size: 40),
      ),
    ],
  );
}
