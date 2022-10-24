// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'GetDecksReqBody.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetDecksReqBody _$GetDecksReqBodyFromJson(Map<String, dynamic> json) =>
    GetDecksReqBody(
      cards: (json['cards'] as List<dynamic>?)
              ?.map((e) =>
                  GetDecksCardReqBody.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      completedAuction: json['completedAuction'] as bool? ?? false,
      constraints: (json['constraints'] as List<dynamic>?)
              ?.map((e) =>
                  GetDecksConstraintReqBody.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      excludedHouses: (json['excludedHouses'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      expansions: (json['expansions'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      forAuction: json['forAuction'] as bool? ?? false,
      forTrade: json['forTrade'] as bool? ?? false,
      houses: (json['houses'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      myFavorites: json['myFavorites'] as bool? ?? false,
      notForSale: json['notForSale'] as bool? ?? false,
      notTags: (json['notTags'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      notes: json['notes'] as String? ?? "",
      noteUser: json['noteUser'] as String? ?? "",
      owner: json['owner'] as String? ?? "",
      owners: (json['owners'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      page: json['page'] as int? ?? 0,
      pageSize: json['pageSize'] as int? ?? 20,
      previousOwner: json['previousOwner'] as String? ?? "",
      sort: json['sort'] as String? ?? "SAS_RATING",
      sortDirection: json['sortDirection'] as String? ?? "DESC",
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      teamDecks: json['teamDecks'] as bool? ?? false,
      title: json['title'] as String? ?? "",
      tournamentIds: (json['tournamentIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      withOwner: json['withOwner'] as bool? ?? false,
    );

Map<String, dynamic> _$GetDecksReqBodyToJson(GetDecksReqBody instance) =>
    <String, dynamic>{
      'cards': instance.cards,
      'completedAuction': instance.completedAuction,
      'constraints': instance.constraints,
      'excludedHouses': instance.excludedHouses,
      'expansions': instance.expansions,
      'forAuction': instance.forAuction,
      'forTrade': instance.forTrade,
      'houses': instance.houses,
      'myFavorites': instance.myFavorites,
      'notForSale': instance.notForSale,
      'notTags': instance.notTags,
      'notes': instance.notes,
      'noteUser': instance.noteUser,
      'owner': instance.owner,
      'owners': instance.owners,
      'page': instance.page,
      'pageSize': instance.pageSize,
      'previousOwner': instance.previousOwner,
      'sort': instance.sort,
      'sortDirection': instance.sortDirection,
      'tags': instance.tags,
      'teamDecks': instance.teamDecks,
      'title': instance.title,
      'tournamentIds': instance.tournamentIds,
      'withOwner': instance.withOwner,
    };
