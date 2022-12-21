class HomeResponse {
  List<Items>? _items;
  bool? _hasMore;
  int? _quotaMax;
  int? _quotaRemaining;

  List<Items>? get items => _items;
  bool? get hasMore => _hasMore;
  int? get quotaMax => _quotaMax;
  int? get quotaRemaining => _quotaRemaining;

  HomeResponse({
    List<Items>? items,
    bool? hasMore,
    int? quotaMax,
    int? quotaRemaining,
  }) {
    _items = items;
    _hasMore = hasMore;
    _quotaMax = quotaMax;
    _quotaRemaining = quotaRemaining;
  }

  HomeResponse.fromJson(dynamic json) {
    if (json is Map) {
      _items = (json["items"] as List?)
          ?.map((dynamic e) => Items.fromJson(e))
          .toList();
      _hasMore = json["has_more"] as bool?;
      _quotaMax = json["quota_max"] as int?;
      _quotaRemaining = json["quota_remaining"] as int?;
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = {};
    map["items"] = _items?.map((e) => e.toJson());
    map["has_more"] = _hasMore;
    map["quota_max"] = _quotaMax;
    map["quota_remaining"] = _quotaRemaining;
    return map;
  }
}

class Items {
  List<String>? _tags;
  Owner? _owner;
  bool? _isAnswered;
  int? _viewCount;
  int? _answerCount;
  int? _score;
  int? _lastActivityDate;
  int? _creationDate;
  int? _questionId;
  String? _contentLicense;
  String? _link;
  String? _title;

  List<String>? get tags => _tags;
  Owner? get owner => _owner;
  bool? get isAnswered => _isAnswered;
  int? get viewCount => _viewCount;
  int? get answerCount => _answerCount;
  int? get score => _score;
  int? get lastActivityDate => _lastActivityDate;
  int? get creationDate => _creationDate;
  int? get questionId => _questionId;
  String? get contentLicense => _contentLicense;
  String? get link => _link;
  String? get title => _title;

  Items({
    List<String>? tags,
    Owner? owner,
    bool? isAnswered,
    int? viewCount,
    int? answerCount,
    int? score,
    int? lastActivityDate,
    int? creationDate,
    int? questionId,
    String? contentLicense,
    String? link,
    String? title,
  }) {
    _tags = tags;
    _owner = owner;
    _isAnswered = isAnswered;
    _viewCount = viewCount;
    _answerCount = answerCount;
    _score = score;
    _lastActivityDate = lastActivityDate;
    _creationDate = creationDate;
    _questionId = questionId;
    _contentLicense = contentLicense;
    _link = link;
    _title = title;
  }

  Items.fromJson(dynamic json) {
    if (json is Map) {
      _tags = (json["tags"] as List)
          .map((e) => e as String?)
          .whereType<String>()
          .toList();
      _owner = json["owner"] != null ? Owner.fromJson(json["owner"]) : null;
      _isAnswered = json["is_answered"] as bool?;
      _viewCount = json["view_count"] as int?;
      _answerCount = json["answer_count"] as int?;
      _score = json["score"] as int?;
      _lastActivityDate = json["last_activity_date"] as int?;
      _creationDate = json["creation_date"] as int?;
      _questionId = json["question_id"] as int?;
      _contentLicense = json["content_license"] as String?;
      _link = json["link"] as String?;
      _title = json["title"] as String?;
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = {};
    map["tags"] = _tags;
    map["owner"] = _owner?.toJson();
    map["is_answered"] = _isAnswered;
    map["view_count"] = _viewCount;
    map["answer_count"] = _answerCount;
    map["score"] = _score;
    map["last_activity_date"] = _lastActivityDate;
    map["creation_date"] = _creationDate;
    map["question_id"] = _questionId;
    map["content_license"] = _contentLicense;
    map["link"] = _link;
    map["title"] = _title;
    return map;
  }
}

class Owner {
  int? _accountId;
  int? _reputation;
  int? _userId;
  String? _userType;
  String? _profileImage;
  String? _displayName;
  String? _link;

  int? get accountId => _accountId;
  int? get reputation => _reputation;
  int? get userId => _userId;
  String? get userType => _userType;
  String? get profileImage => _profileImage;
  String? get displayName => _displayName;
  String? get link => _link;

  Owner({
    int? accountId,
    int? reputation,
    int? userId,
    String? userType,
    String? profileImage,
    String? displayName,
    String? link,
  }) {
    _accountId = accountId;
    _reputation = reputation;
    _userId = userId;
    _userType = userType;
    _profileImage = profileImage;
    _displayName = displayName;
    _link = link;
  }

  Owner.fromJson(dynamic json) {
    if (json is Map) {
      _accountId = json["account_id"] as int?;
      _reputation = json["reputation"] as int?;
      _userId = json["user_id"] as int?;
      _userType = json["user_type"] as String?;
      _profileImage = json["profile_image"] as String?;
      _displayName = json["display_name"] as String?;
      _link = json["link"] as String?;
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = {};
    map["account_id"] = _accountId;
    map["reputation"] = _reputation;
    map["user_id"] = _userId;
    map["user_type"] = _userType;
    map["profile_image"] = _profileImage;
    map["display_name"] = _displayName;
    map["link"] = _link;
    return map;
  }
}
