// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/business_logic/bloc/news_state_bloc.dart';
import '../../data/repo/getnews.dart';
import 'customeTileWidget.dart';

class CallingWidgets extends StatelessWidget {
  String newsType;
  String title;
  CallingWidgets({
    Key? key,
    required this.newsType,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => NewSGettingRepository(),
      child: BlocProvider(
        create: (context) => NewsStateBloc(
            RepositoryProvider.of<NewSGettingRepository>(context), newsType)
          ..add(LoadNewsEvent()),
        child: Container(
          padding: EdgeInsets.all(MediaQuery.of(context).size.aspectRatio * 50),
          margin:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.03),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.aspectRatio * 10,
              ),
              Text(
                "Here is your $title news",
                style: const TextStyle(
                    fontWeight: FontWeight.normal, fontSize: 12),
              ),
              BlocBuilder<NewsStateBloc, NewsStateState>(
                builder: (context, state) {
                  if (state is NewsLoadingState) {
                    return Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.3),
                      child: const Center(
                        child: CircularProgressIndicator.adaptive(),
                      ),
                    );
                  } else if (state is NewSLoadedState) {
                    return state.newsResponse.isNotEmpty
                        ? Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.3),
                            child: const Center(
                              child: Text(
                                  "No News for now please refresh after some times"),
                            ),
                          )
                        : Expanded(
                            child: ListView.builder(
                              itemBuilder: (context, index) => Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical:
                                        20), // Adjust the spacing as needed
                                child: CustomTileWidget(
                                  newsItem: state.newsResponse[index],
                                ),
                              ),
                              itemCount: 5,
                              itemExtent:
                                  150, // Adjust the item height as needed
                            ),
                          );
                  } else {
                    return const Text(
                        "We are facing some trouble when fetching data please try again");
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
