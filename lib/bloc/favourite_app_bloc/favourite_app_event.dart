part of 'favourite_app_bloc.dart';

abstract class FavouriteAppEvent extends Equatable {
  const FavouriteAppEvent();

  @override
  List<Object> get props => [];
}

class FetchFavouriteList extends FavouriteAppEvent {}

class FavouriteItem extends FavouriteAppEvent {
  final FavouriteItemModel favouriteItemModel;
  FavouriteItem({required this.favouriteItemModel});
}

class SelectItem extends FavouriteAppEvent {
  final FavouriteItemModel item;
  SelectItem({required this.item});
}

class UnSelectItem extends FavouriteAppEvent {
  final FavouriteItemModel item;
  const UnSelectItem({required this.item});
}

class DeleteItem extends FavouriteAppEvent {}
