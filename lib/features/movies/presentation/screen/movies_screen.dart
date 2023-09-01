import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:getflix/core/network/server_api_constants.dart';
import 'package:getflix/features/movies/presentation/widgets/movie_card.dart';

import '../../../../core/dependency_injection/injection_container.dart';
import '../bloc/movies_bloc.dart';
import '../bloc/movies_state.dart';
import 'movie_detail_screen.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({super.key});

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {

  final MoviesBloc moviesBloc = getIt<MoviesBloc>();

  @override
  void initState() {

    moviesBloc.add(const GetMoviesEvent());

    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Getflix'),
      ),
      body: BlocProvider.value(
        value: moviesBloc,
        child: BlocBuilder<MoviesBloc, MoviesState>(
          builder: (context, state) {

            if(state is SuccessMoviesState) {
              
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: MasonryGridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
              
                  itemCount: state.moviesEntity.results.length,
                  itemBuilder: (context, index) {
                    
                    return Hero(
                      tag: 'movieImage${state.moviesEntity.results[index].id}',
                      child: MovieCard(
                        imageUrl: '${ServerApiConstants.baseImagesUrl}/original/${state.moviesEntity.results[index].posterPath}',
                        title: state.moviesEntity.results[index].title,
                        index: index,
                        onTap: (){
                          Navigator.push(
                            context, 
                            MaterialPageRoute(
                              builder: (context) => MovieDetailScreen(
                                id: state.moviesEntity.results[index].id,
                                imageUrl: '${ServerApiConstants.baseImagesUrl}/original/${state.moviesEntity.results[index].posterPath}',
                              )
                            ),
                          );
                        },
                      ),
                    );
                  }
                ),
              );
            }

            return const Center(
              child: CircularProgressIndicator(),
            );

          },
        ),
      ),
    );
  }
}