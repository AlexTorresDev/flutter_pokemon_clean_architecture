# Flutter Pokemon App

Flutter app using clean architecture and BLoC pattern.

## Using on this app

- Clean Architecture
- sqflite
- go_route
- GetIt
- BLoC
- Mockito test
- [PokeApi](https://pokeapi.co/)

## Clean Architecture Diagram

![Image](clean_architecture_flutter.jpeg)

## Folder Structure
```
└── 📁lib
    └── 📁l10n
        └── app_localizations_en.dart
        └── app_localizations_es.dart
        └── app_localizations.dart
        └── intl_en.arb
        └── intl_es.arb
    └── 📁src
        └── 📁core
            └── 📁connections
                └── db_provider.dart
                └── network_connectivity.dart
            └── 📁errors
                └── exceptions.dart
                └── failure.dart
            └── 📁framework
                └── 📁router
                    └── router.dart
                └── themes.dart
                └── 📁utils
                    └── constants.dart
                    └── custom_shape_border.dart
                    └── utils.dart
            └── 📁network
                └── client_service.dart
            └── 📁params
                └── pokemon_param.dart
            └── use_case.dart
        └── 📁data
            └── 📁data_sources
                └── local_data_source.dart
                └── remote_data_source.dart
        └── 📁domain
            └── 📁models
                └── 📁pokemon
                    └── 📁gateway
                        └── pokemon_gateway.dart
                    └── pokemon.dart
                └── 📁sprite
                    └── 📁gateway
                        └── sprite_gateway.dart
                    └── sprite.dart
            └── 📁usecases
                └── 📁pokemon
                    └── pokemon_use_case.dart
        └── 📁infrastructure
            └── 📁driver-adapter
                └── 📁api
                    └── pokemon_api.dart
                └── 📁firebase
                    └── pokemon_firebase.dart
        └── 📁presentation
            └── my_app.dart
            └── 📁pages
                └── 📁details
                    └── details_page.dart
                └── 📁error
                    └── error_page.dart
                └── 📁home
                    └── home_page.dart
                    └── 📁widgets
                        └── pokemon_card.dart
                └── 📁login
                    └── login_page.dart
            └── 📁providers
                └── pokemon_provider.dart
            └── 📁widgets
                └── connection_status.dart
                └── loading.dart
    └── main.dart
```
 