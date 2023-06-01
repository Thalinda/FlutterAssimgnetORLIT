import 'package:flutter/material.dart';

class CustomTileWidget extends StatelessWidget {
  const CustomTileWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.amber,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(10),
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.blue,
              width: 2,
            ),
          ),
          child: const CircleAvatar(
            backgroundImage: NetworkImage(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRGPp-dUgY85YiRLNOkOSPNsbTtDEcmTaqIKzjLTug4&s'),
          ),
        ),
        title: const Text(
          'Title',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Row(
            children: [
              Icon(Icons.access_time_outlined),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.015,
              ),
              const Text('Author - ')
            ],
          ),
        ),
      ),
    );
  }
}
