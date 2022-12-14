import 'package:flutter/material.dart';

class tombol extends StatelessWidget {
  var itombol;
  final String nmtombol;
  final VoidCallback onPressed;

  tombol(this.itombol, this.nmtombol, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(10),
      elevation: 10,
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
            color: Colors.lightBlueAccent,
            borderRadius: BorderRadius.circular(10)),
        child: InkWell(
          onTap: onPressed,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                itombol,
                size: 40,
                color: Colors.blue,
              ),
              Text(nmtombol)
            ],
          ),
        ),
      ),
    ) ;

  }
}