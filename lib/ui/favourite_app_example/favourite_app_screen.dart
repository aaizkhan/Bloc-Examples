import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/bloc/favourite_app_bloc/favourite_app_bloc.dart';
import 'package:flutter_bloc_example/model/favourite_item_model.dart';

class FavouriteAppScreen extends StatefulWidget {
  const FavouriteAppScreen({super.key});

  @override
  State<FavouriteAppScreen> createState() => _FavouriteAppScreenState();
}

class _FavouriteAppScreenState extends State<FavouriteAppScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<FavouriteAppBloc>().add(FetchFavouriteList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Favourite App",
          style: TextStyle(
              fontWeight: FontWeight.w700, fontSize: 25, color: Colors.blue),
        ),
        actions: [
          BlocBuilder<FavouriteAppBloc, FavouriteAppState>(
            builder: (context, state) {
              return Visibility(
                visible: state.temFavList.isNotEmpty ? true : false,
                child: IconButton(
                    onPressed: () {
                      context.read<FavouriteAppBloc>().add(DeleteItem());
                    },
                    icon: Icon(Icons.delete)),
              );
            },
          )
        ],
      ),
      body: BlocBuilder<FavouriteAppBloc, FavouriteAppState>(
          builder: (context, state) {
        switch (state.listStatus) {
          case ListStatus.loading:
            return Center(
              child: CircularProgressIndicator(),
            );
          case ListStatus.failed:
            return Center(
              child: Text("Failed to load data"),
            );
          case ListStatus.success:
            return ListView.builder(
                itemCount: state.favouriteItemList.length,
                itemBuilder: (context, index) {
                  final item = state.favouriteItemList[index];
                  return Card(
                    child: ListTile(
                      leading: Checkbox(
                          value: state.temFavList.contains(item) ? true : false,
                          onChanged: (value) {
                            if (value!) {
                              context
                                  .read<FavouriteAppBloc>()
                                  .add(SelectItem(item: item));
                            } else {
                              context
                                  .read<FavouriteAppBloc>()
                                  .add(UnSelectItem(item: item));
                            }
                          }),
                      title: Text(item.value.toString()),
                      trailing: IconButton(
                          onPressed: () {
                            FavouriteItemModel favouriteItemModel =
                                FavouriteItemModel(
                                    id: item.id,
                                    value: item.value,
                                    isFavourite:
                                        item.isFavourite ? false : true);
                            context.read<FavouriteAppBloc>().add(FavouriteItem(
                                favouriteItemModel: favouriteItemModel));
                          },
                          icon: Icon(item.isFavourite
                              ? Icons.favorite
                              : Icons.favorite_border)),
                    ),
                  );
                });
        }
      }),
    );
  }
}
