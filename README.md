# clean_movies

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Project Tree

lib
│ ├── common
│ │ ├── constants
│ │ │ ├── languages.dart
│ │ │ ├── size_constants.dart
│ │ │ └── translation_constants.dart
│ │ ├── extensions
│ │ │ ├── num_extension.dart
│ │ │ ├── size_extension.dart
│ │ │ ├── string_extensions.dart
│ │ │ └── text_theme_extension.dart
│ │ ├── fade_page_route_builder.dart
│ │ ├── route_list.dart
│ │ ├── routes.dart
│ │ └── screenutil
│ │ └── screen_util.dart
│ ├── data
│ │ ├── core
│ │ │ ├── api_client.dart
│ │ │ └── api_constants.dart
│ │ ├── datasources
│ │ │ ├── authentication_local_data_source.dart
│ │ │ ├── authentication_remote_data_source.dart
│ │ │ ├── language_local_data_source.dart
│ │ │ ├── movie_local_data_source.dart
│ │ │ └── movie_remote_data_source.dart
│ │ ├── models
│ │ │ ├── cast_crew_result_model.dart
│ │ │ ├── movie_detail_model.dart
│ │ │ ├── movie_model.dart
│ │ │ ├── movie_result_model.dart
│ │ │ ├── request_model_token.dart
│ │ │ ├── video_model.dart
│ │ │ └── video_result_model.dart
│ │ ├── repositories
│ │ │ ├── app_repository_impl.dart
│ │ │ ├── authentication_repository_impl.dart
│ │ │ └── movie_repository_impl.dart
│ │ └── tables
│ │ ├── movie_table.dart
│ │ └── movie_table.g.dart
│ ├── di
│ │ └── get_it.dart
│ ├── domain
│ │ ├── app_localizations.dart
│ │ ├── entities
│ │ │ ├── app_error.dart
│ │ │ ├── cast_entity.dart
│ │ │ ├── language_entity.dart
│ │ │ ├── movie_detail_entity.dart
│ │ │ ├── movie_entity.dart
│ │ │ ├── movie_params.dart
│ │ │ ├── movie_search_params.dart
│ │ │ └── video_entity.dart
│ │ ├── repositories
│ │ │ ├── app_repository.dart
│ │ │ ├── authentication_repository.dart
│ │ │ └── movie_repository.dart
│ │ ├── usecase.dart
│ │ └── usecases
│ │ ├── check_if_favorite_movie.dart
│ │ ├── delete_favorite_movie.dart
│ │ ├── get_cast.dart
│ │ ├── get_coming_soon.dart
│ │ ├── get_favorite_movies.dart
│ │ ├── get_movie_detail.dart
│ │ ├── get_playing_now.dart
│ │ ├── get_popular.dart
│ │ ├── get_preferred_language.dart
│ │ ├── get_trending.dart
│ │ ├── get_videos.dart
│ │ ├── login_request_params.dart
│ │ ├── login_user.dart
│ │ ├── logout_user.dart
│ │ ├── no_params.dart
│ │ ├── save_movie.dart
│ │ ├── search_movies.dart
│ │ └── update_language.dart
│ ├── generated_plugin_registrant.dart
│ ├── main.dart
│ └── presentation
│ ├── blocs
│ │ ├── cast
│ │ │ ├── cast_bloc.dart
│ │ │ ├── cast_event.dart
│ │ │ └── cast_state.dart
│ │ ├── favorite
│ │ │ ├── favorite_bloc.dart
│ │ │ ├── favorite_event.dart
│ │ │ └── favorite_state.dart
│ │ ├── language_bloc
│ │ │ ├── language_bloc.dart
│ │ │ ├── language_event.dart
│ │ │ └── language_state.dart
│ │ ├── loading
│ │ │ ├── loading_bloc.dart
│ │ │ ├── loading_event.dart
│ │ │ └── loading_state.dart
│ │ ├── login
│ │ │ ├── login_bloc.dart
│ │ │ ├── login_event.dart
│ │ │ └── login_state.dart
│ │ ├── movie_backdrop
│ │ │ ├── moviebackdrop_bloc.dart
│ │ │ ├── moviebackdrop_event.dart
│ │ │ └── moviebackdrop_state.dart
│ │ ├── movie_carousel
│ │ │ ├── moviecarousel_bloc.dart
│ │ │ ├── moviecarousel_event.dart
│ │ │ └── moviecarousel_state.dart
│ │ ├── movie_detail
│ │ │ ├── movie_detail_bloc.dart
│ │ │ ├── movie_detail_event.dart
│ │ │ └── movie_detail_state.dart
│ │ ├── movie_tab
│ │ │ ├── movietab_bloc.dart
│ │ │ ├── movietab_event.dart
│ │ │ └── movietab_state.dart
│ │ ├── search_movies
│ │ │ ├── search_movies_bloc.dart
│ │ │ ├── search_movies_event.dart
│ │ │ └── search_movies_state.dart
│ │ └── videos
│ │ ├── videos_bloc.dart
│ │ ├── videos_event.dart
│ │ └── videos_state.dart
│ ├── journeys
│ │ ├── drawer
│ │ │ ├── navigation_expanded_list_item.dart
│ │ │ ├── navigation_list_item.dart
│ │ │ └── navigation_sublist_item.dart
│ │ ├── favorite
│ │ │ ├── favorite_movie_card_widget.dart
│ │ │ ├── favorite_movies_grid_view.dart
│ │ │ └── favorite_screen.dart
│ │ ├── home
│ │ │ └── home_screen.dart
│ │ ├── loading
│ │ │ ├── loading_circle.dart
│ │ │ └── loading_screen.dart
│ │ ├── login
│ │ │ ├── label_field_widget.dart
│ │ │ ├── login_form.dart
│ │ │ └── login_screen.dart
│ │ ├── movie_carousel
│ │ │ ├── animated_movie_card_widget.dart
│ │ │ ├── movie_backdrop_widget.dart
│ │ │ ├── movie_card_widget.dart
│ │ │ ├── movie_carousel_widget.dart
│ │ │ ├── movie_data_widget.dart
│ │ │ └── movie_page_view.dart
│ │ ├── movie_details
│ │ │ ├── big_poster.dart
│ │ │ ├── movie_detail_app_bar.dart
│ │ │ ├── movie_details_argument.dart
│ │ │ ├── movie_details_screen.dart
│ │ │ └── videos_widget.dart
│ │ ├── movie_tabs
│ │ │ ├── movie_list_view_widget.dart
│ │ │ ├── movie_tab_card_widget.dart
│ │ │ ├── movie_tabbed_constants.dart
│ │ │ ├── movie_tabbed_widget.dart
│ │ │ ├── tab.dart
│ │ │ └── tab_title_widget.dart
│ │ ├── search_movies
│ │ │ ├── custom_search_movie_delegate.dart
│ │ │ └── search_movie_card.dart
│ │ └── watch_video
│ │ ├── watch_video_screen.dart
│ │ └── watch_videos_arguments.dart
│ ├── movie_app.dart
│ ├── themes
│ │ ├── app_color.dart
│ │ └── theme_text.dart
│ └── widgets
│ ├── app_dialog.dart
│ ├── app_error_widget.dart
│ ├── button.dart
│ ├── logo.dart
│ ├── movie_app_bar.dart
│ ├── navigation_drawer.dart
│ └── separator.dart
