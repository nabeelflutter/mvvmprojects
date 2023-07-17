import 'package:flutter/material.dart';
import 'package:mvvmpattern/data/response/status.dart';

import 'package:mvvmpattern/utils/routes/routesname.dart';
import 'package:mvvmpattern/view_modal/moiew_view_model.dart';

import 'package:mvvmpattern/view_modal/user_view_model.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  MoviesViewModel moviesViewModel = MoviesViewModel();

  @override
  void initState() {
  
    moviesViewModel.getMoviesList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userPreference = Provider.of<UserViewModel>(context);
    return Scaffold(
        appBar: AppBar(
          actions: [
            InkWell(
                onTap: () {
                  userPreference.remove().then((value) {
                    Navigator.pushNamed(context, RoutesName.loginPage);
                  });
                },
                child: const Center(child: Text('LogOut')))
          ],
        ),
        body: ChangeNotifierProvider(
            create: (context) => moviesViewModel,
            child: Consumer<MoviesViewModel>(
              builder: (context, value, _) {
                switch (value.moviesList.status) {
                  case Status.LOADING:
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  case Status.ERROR:
                    return Center(
                      child: Text(value.moviesList.message.toString()),
                    );
                  case Status.COMPLETED:
                    return Center(
                      child: ListView.builder(
                        itemCount: value.moviesList.data!.movies!.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              color: Colors.blue,
                              child: ListTile(
                                leading: Image.network(value
                                    .moviesList.data!.movies![index].posterurl
                                    .toString()),
                                title: Text(value
                                    .moviesList.data!.movies![index].title
                                    .toString()),
                                subtitle: Text(value
                                    .moviesList.data!.movies![index].year
                                    .toString()),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(value.moviesList.data!.movies![index]
                                        .averageRating
                                        .toString()),
                                    const Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  default:
                    return Container();
                }
              },
            )));
  }
}
