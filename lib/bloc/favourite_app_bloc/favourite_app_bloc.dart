import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_example/model/favourite_item_model.dart';
import 'package:flutter_bloc_example/repository/favourite_repository.dart';

part 'favourite_app_event.dart';
part 'favourite_app_state.dart';

class FavouriteAppBloc extends Bloc<FavouriteAppEvent, FavouriteAppState> {
  FavouriteRepository favouriteRepository;
  List<FavouriteItemModel> favouriteList = [];
  List<FavouriteItemModel> tempFavouriteList = [];
  FavouriteAppBloc(this.favouriteRepository)
      : super(const FavouriteAppState()) {
    on<FetchFavouriteList>(fetchList);
    on<FavouriteItem>(_addFavItem);
    on<SelectItem>(_selectItem);
    on<UnSelectItem>(_unSelectItem);
    on<DeleteItem>(_deleteItem);
  }

  void fetchList(
      FetchFavouriteList event, Emitter<FavouriteAppState> emit) async {
    favouriteList = await favouriteRepository.fetchItem();
    emit(state.copyWith(
        favouriteItemList: List.from(favouriteList),
        listStatus: ListStatus.success));
  }

  void _addFavItem(FavouriteItem event, Emitter<FavouriteAppState> emit) async {
    final index = favouriteList
        .indexWhere((element) => element.id == event.favouriteItemModel.id);
    if (event.favouriteItemModel.isFavourite) {
      if (tempFavouriteList.contains(favouriteList[index])) {
        tempFavouriteList.remove(favouriteList[index]);
        tempFavouriteList.add(event.favouriteItemModel);
      }
    } else {
      if (tempFavouriteList.contains(favouriteList[index])) {
        tempFavouriteList.remove(favouriteList[index]);
        tempFavouriteList.add(event.favouriteItemModel);
      }
    }
    favouriteList[index] = event.favouriteItemModel;
    emit(state.copyWith(
        favouriteItemList: List.from(favouriteList),
        temFavList: List.from(tempFavouriteList)));
  }

  void _selectItem(SelectItem event, Emitter<FavouriteAppState> emit) async {
    tempFavouriteList.add(event.item);
    emit(state.copyWith(temFavList: List.from(tempFavouriteList)));
  }

  void _unSelectItem(
      UnSelectItem event, Emitter<FavouriteAppState> emit) async {
    tempFavouriteList.remove(event.item);
    emit(state.copyWith(temFavList: List.from(tempFavouriteList)));
  }

  void _deleteItem(DeleteItem event, Emitter<FavouriteAppState> emit) async {
    for (int i = 0; i < tempFavouriteList.length; i++) {
      favouriteList.remove(tempFavouriteList[i]);
    }
    tempFavouriteList.clear();
    emit(state.copyWith(
        favouriteItemList: List.from(favouriteList),
        temFavList: List.from(tempFavouriteList)));
  }
}
