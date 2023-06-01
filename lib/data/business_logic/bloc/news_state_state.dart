part of 'news_state_bloc.dart';

abstract class NewsStateState extends Equatable {
  const NewsStateState();
}

class NewsLoadingState extends NewsStateState {
  @override
  List<Object> get props => [];
}

class NewSLoadedState extends NewsStateState {
  final List<NewsResponse> newsResponse;
  const NewSLoadedState({
    required this.newsResponse,
  });
  @override
  List<Object> get props => [newsResponse];
}

class NewsErrorState extends NewsStateState {
  final String error;
  const NewsErrorState({
    required this.error,
  });

  @override
  List<Object> get props => [error];
}
