// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MVDeck.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MVDeck _$MVDeckFromJson(Map<String, dynamic> json) => MVDeck(
      json['name'] as String,
      json['expansion'] as int,
      json['power_level'] as int,
      json['chains'] as int,
      json['wins'] as int,
      json['losses'] as int,
      json['id'] as String,
      json['is_my_deck'] as bool,
      (json['notes'] as List<dynamic>).map((e) => e as String).toList(),
      json['is_my_favorite'] as bool,
      json['is_on_my_watchlist'] as bool,
      json['casual_wins'] as int,
      json['casual_losses'] as int,
      EraCards.fromJson(json['set_era_cards'] as Map<String, dynamic>),
      json['shards_bonus'] as int?,
      Links.fromJson(json['_links'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MVDeckToJson(MVDeck instance) => <String, dynamic>{
      'name': instance.name,
      'expansion': instance.expansion,
      'power_level': instance.power_level,
      'chains': instance.chains,
      'wins': instance.wins,
      'losses': instance.losses,
      'id': instance.id,
      'is_my_deck': instance.is_my_deck,
      'notes': instance.notes,
      'is_my_favorite': instance.is_my_favorite,
      'is_on_my_watchlist': instance.is_on_my_watchlist,
      'casual_wins': instance.casual_wins,
      'casual_losses': instance.casual_losses,
      'set_era_cards': instance.set_era_cards,
      'shards_bonus': instance.shards_bonus,
      '_links': instance.links,
    };
