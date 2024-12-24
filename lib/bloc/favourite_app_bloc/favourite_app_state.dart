part of 'favourite_app_bloc.dart';

enum ListStatus { loading, success, failed }

class FavouriteAppState extends Equatable {
  final List<FavouriteItemModel> temFavList;
  final List<FavouriteItemModel> favouriteItemList;
  final ListStatus listStatus;
  const FavouriteAppState(
      {this.favouriteItemList = const [],
      this.listStatus = ListStatus.loading,
      this.temFavList = const []});

  FavouriteAppState copyWith(
      {List<FavouriteItemModel>? favouriteItemList,
      ListStatus? listStatus,
      List<FavouriteItemModel>? temFavList}) {
    return FavouriteAppState(
      favouriteItemList: favouriteItemList ?? this.favouriteItemList,
      listStatus: listStatus ?? this.listStatus,
      temFavList: temFavList ?? this.temFavList,
    );
  }

  @override
  List<Object> get props => [favouriteItemList, listStatus, temFavList];
}
