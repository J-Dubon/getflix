import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getflix/core/dependency_injection/injection_container.dart';
import 'package:getflix/core/widgets/cached_network_image_widget.dart';
import 'package:getflix/core/widgets/loader_widget.dart';
import 'package:getflix/features/movies/presentation/widgets/movie_detail_header.dart';

import '../../../../core/network/server_api_constants.dart';
import '../bloc/movies_bloc.dart';
import '../bloc/movies_state.dart';

class MovieDetailScreen extends StatefulWidget {
  const MovieDetailScreen({
    required this.id,
    required this.imageUrl,
    super.key
  });

  final int id;

  final String imageUrl;

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  final moviesBloc = getIt<MoviesBloc>();

  final ScrollController creditsScrollController = ScrollController();

  @override
  void initState() {
    moviesBloc.add(GetMovieInfoDetailEvent(movieId: widget.id));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Hero(
        tag: 'movieImage${widget.id}',
        child: BlocProvider.value(
          value: moviesBloc,
          child: BlocBuilder<MoviesBloc, MoviesState>(
            builder: (context, state) {

              if(state is SuccessMovieInfoDetailState){
                return CustomScrollView(
                  slivers: [

                    // Appbar
                    SliverAppBar(
                      expandedHeight: 200,
                      flexibleSpace: FlexibleSpaceBar(
                        background: CachedNetworkImageWidget(
                          imageUrl: widget.imageUrl,
                        ),
                      ),
                    ),

                    // Body
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
      
                            // Header with genres, title, year and clasification
                            MovieDetailHeader(
                              genres: state.movieDetail.genres, 
                              title: state.movieDetail.title,
                              year: '${state.movieDetail.releaseDate.year}',
                              status: state.movieDetail.status,
                              voteAverage: state.movieDetail.voteAverage,
                              overview: state.movieDetail.overview,
                            ),

                            // Actors
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10.0),
                              child: SizedBox(
                                height: 240,
                                child: ListView.builder(

                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemCount: state.cast.length,
                                  itemBuilder: (context, index) {
                                    return FadeInUp(
                                      delay: Duration(milliseconds: 550 + (100 * index)),
                                      child: SizedBox(
                                        width: 120,
                                        child: Column(
                                          children: [
                                            state.cast[index].profilePath != null ? 
                                              Image.network('${ServerApiConstants.baseImagesUrl}/original/${state.cast[index].profilePath}', fit: BoxFit.cover, height: 130, width: 100,) 
                                              : Image.asset('assets/images/profile-default.webp', fit: BoxFit.cover, height: 130, width: 100,),

                                            // Name of the actor
                                            Text(state.cast[index].name, 
                                              style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 12), 
                                              textAlign: TextAlign.center,
                                            ),

                                            // Character name
                                            Text(state.cast[index].character, 
                                              style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 10), 
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        )
                                      ),
                                    );
                                  },
                                ),
                              ),
                            )
                          ]
                        ),
                      ),
                    )

                  ],
                );
              }

              return const Center(
                child: LoaderWidget(
                  size: 100,
                ),
              );

            },
          ),
        ),
      ),
    );
  }
}
