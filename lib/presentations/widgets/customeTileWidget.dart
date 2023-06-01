// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';

import 'package:assigment/model/newsResponse.dart';

class CustomTileWidget extends StatelessWidget {
  NewsResponse newsItem;
  CustomTileWidget({Key? key, required this.newsItem}) : super(key: key);

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
          child: CircleAvatar(
            backgroundImage: NetworkImage(newsItem.imageUrl.toString() != ""
                ? newsItem.imageUrl.toString()
                : 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRGPp-dUgY85YiRLNOkOSPNsbTtDEcmTaqIKzjLTug4&s'),
          ),
        ),
        title: Text(
          newsItem.title.toString(),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
          overflow: TextOverflow.ellipsis, // Add ellipsis when text overflows
          maxLines: 2, // Specify the maximum number of lines
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Row(
            children: [
              const Icon(Icons.access_time_outlined),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.015,
              ),
              Text('Author : ${newsItem.author.toString()}')
            ],
          ),
        ),
      ),
    );
  }
}
