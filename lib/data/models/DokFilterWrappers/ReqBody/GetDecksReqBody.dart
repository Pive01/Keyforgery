import 'package:json_annotation/json_annotation.dart';

import 'GetDecksCardReqBody.dart';
import 'GetDecksConstraintReqBody.dart';

part 'GetDecksReqBody.g.dart';
@JsonSerializable()
class GetDecksReqBody{
  List<GetDecksCardReqBody> cards;
  bool completedAuction;
  List<GetDecksConstraintReqBody> constraints;
  List<String> excludedHouses;
  List<String> expansions;
  bool forAuction;
  bool forTrade;
  List<String> houses;
  bool myFavorites;
  bool notForSale;
  List<String> notTags;
  String notes;
  String noteUser;
  String owner;
  List<String> owners;
  int page;
  int pageSize;
  String previousOwner;
  String sort; // TODO make to enum
  String sortDirection; // TODO make to enum
  List<String> tags;
  bool teamDecks;

  @override
  String toString() {
    return 'GetDecksReqBody{cards: $cards, completedAuction: $completedAuction, constraints: $constraints, excludedHouses: $excludedHouses, expansions: $expansions, forAuction: $forAuction, forTrade: $forTrade, houses: $houses, myFavorites: $myFavorites, notForSale: $notForSale, notTags: $notTags, notes: $notes, noteUser: $noteUser, owner: $owner, owners: $owners, page: $page, pageSize: $pageSize, previousOwner: $previousOwner, sort: $sort, sortDirection: $sortDirection, tags: $tags, teamDecks: $teamDecks, title: $title, tournamentIds: $tournamentIds, withOwner: $withOwner}';
  }

  String title;
  List<String> tournamentIds;
  bool withOwner;

  GetDecksReqBody({
    this.cards = const [],
    this.completedAuction = false,
    this.constraints = const [],
    this.excludedHouses = const [],
    this.expansions = const [],
    this.forAuction = false,
    this.forTrade = false,
    this.houses  = const [],
    this.myFavorites = false,
    this.notForSale = false,
    this.notTags = const [],
    this.notes = "",
    this.noteUser = "",
    this.owner = "",
    this.owners = const [],
    this.page = 0,
    this.pageSize = 20,
    this.previousOwner = "",
    this.sort = "SAS_RATING",
    this.sortDirection = "DESC",
    this.tags = const [],
    this.teamDecks = false,
    this.title = "",
    this.tournamentIds = const [],
    this.withOwner = false
  });

  factory GetDecksReqBody.fromJson(Map<String, dynamic> json) => _$GetDecksReqBodyFromJson(json);

  Map<String, dynamic> toJson() => _$GetDecksReqBodyToJson(this);
}