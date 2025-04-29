import 'package:flutter/material.dart';
import 'package:movie_app/app_core/app_core.dart';

/// @template genre_tag_widget
/// GenreTagWidget widget
/// @endtemplate

class GenreTagWidget extends StatelessWidget {
  /// {@macro genre_tag_widget}
  const GenreTagWidget({
    this.genreName = 'Name',
    this.isSelected = false,
    this.onTap,
    super.key,
  });

  /// The name of the genre.
  /// Defaults to 'Name'.
  final String genreName;

  /// Whether the genre is selected or not.
  /// Defaults to false.
  final bool isSelected;

  /// The callback function to be called when the genre is tapped.
  /// Defaults to null.
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryDark : AppColors.secondaryDark,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          genreName,
          style: AppTextStyles.bodySmall
              .copyWith(color: AppColors.white, fontSize: AppDimens.p14),
        ),
      ),
    );
  }
}
