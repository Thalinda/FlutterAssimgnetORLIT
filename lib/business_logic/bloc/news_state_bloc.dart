// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:assigment/model/newsResponse.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:assigment/data/repo/getnews.dart';
import 'package:flutter/foundation.dart';

part 'news_state_event.dart';
part 'news_state_state.dart';

class NewsStateBloc extends Bloc<NewsStateEvent, NewsStateState> {
  final NewSGettingRepository gettingRepository;
  final String newsType;
  NewsStateBloc(this.gettingRepository, this.newsType)
      : super(NewsLoadingState()) {
    on<NewsStateEvent>((event, emit) async {
      emit(NewsLoadingState());
      try {
        final data = await gettingRepository.getNews(newsType);

        emit(NewSLoadedState(newsResponse: data));
      } catch (e) {
        if (kDebugMode) {
          print(e.toString());
        }
        emit(NewsErrorState(error: e.toString()));
      }
    });
  }
}
