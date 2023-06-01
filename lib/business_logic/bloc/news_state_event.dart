part of 'news_state_bloc.dart';

abstract class NewsStateEvent extends Equatable {
  const NewsStateEvent();
}

class LoadNewsEvent extends NewsStateEvent {
  @override
  List<Object> get props => [];
}
