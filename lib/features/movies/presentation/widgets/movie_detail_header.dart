import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:getflix/features/movies/presentation/widgets/radial_progress.dart';

import '../../domain/entities/film_genre_entity.dart';

class MovieDetailHeader extends StatelessWidget {
  const MovieDetailHeader({
    required this.genres,
    required this.title,
    required this.year,
    required this.status,
    required this.voteAverage,
    required this.overview,
    super.key
  });

  /// List of genres
  final List<FilmGenreEntity> genres;

  /// Title of the movie
  final String title;

  /// Year of the movie
  final String year;

  /// Status of the movie
  final String status;

  /// Vote average of the movie
  final double voteAverage;

  /// Overview of the movie
  final String overview;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        // Genres, title, year and status
        Material(
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
        
                // Title
                FadeInUp(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Text(title, style: Theme.of(context).textTheme.titleLarge,),
                  ),
                ),
        
                FadeInUp(
                  delay: const Duration(milliseconds: 100),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Row(
                      children: [
                        
                        // Status
                        Text(status, style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: calculateColorFromStatus()),),
                        
                        const Text(' - '),
                  
                        // Year
                        Text(year, style: Theme.of(context).textTheme.bodyMedium,),
                
                      ],
                    ),
                  ),
                ),
              ]
            ),
            
            // Vote average radial progress
            trailing: FadeInUp(
              delay: const Duration(milliseconds: 200),
              child: SizedBox(
                width: 100,
                height: 200,
                child: RadialProgress(
                  value: voteAverage,
                  color: calculateColorFromVoteAverage(),
                  strokeWidth: 4,
                  strokeWidthLine: 3,
                ),
              ),
            ),
          ),
        ),
                
        // Genre
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Wrap(children: genres.asMap().entries.map((e) => FadeInUp(
            delay: Duration(milliseconds: 300 + (e.key * 100)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3.0, vertical: 0),
              child: Chip(
                label: Text(e.value.name),
              ),
            ),
          )).toList()),
        ),

        // Overview
        FadeInUp(
          delay: const Duration(milliseconds: 450),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Text(overview, style: Theme.of(context).textTheme.bodyLarge,),
          ),
        ),
      ],
    );
  }

  /// Calculate the color of the radial progress
  Color calculateColorFromVoteAverage() {

    if(voteAverage >= 7.5) {
      return Colors.green;
    } 
    
    if(voteAverage >= 5.0) {
      return Colors.yellow;
    } 
    
    return Colors.red;
    
  }

  /// Calculate the color of the status
  Color calculateColorFromStatus() {

    if(status == 'Released') {
      return Colors.green;
    } 
    
    if(status == 'Post Production') {
      return Colors.yellow;
    } 
    
    return Colors.red;
    
  }
}