class AnswerResponse {
  List<AnswerItems>? _items;
  bool? _hasMore;
  int? _quotaMax;
  int? _quotaRemaining;

  List<AnswerItems>? get items => _items;
  bool? get hasMore => _hasMore;
  int? get quotaMax => _quotaMax;
  int? get quotaRemaining => _quotaRemaining;

  AnswerResponse({
    List<AnswerItems>? items,
    bool? hasMore,
    int? quotaMax,
    int? quotaRemaining,
  }) {
    _items = items;
    _hasMore = hasMore;
    _quotaMax = quotaMax;
    _quotaRemaining = quotaRemaining;
  }

  AnswerResponse.fromJson(dynamic json) {
    if (json is Map) {
      _items = (json["items"] as List?)
          ?.map((dynamic e) => AnswerItems.fromJson(e))
          .toList();
      _hasMore = json["has_more"] as bool?;
      _quotaMax = json["quota_max"] as int?;
      _quotaRemaining = json["quota_remaining"] as int?;
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _map = {};
    _map["items"] = _items?.map((e) => e.toJson());
    _map["has_more"] = _hasMore;
    _map["quota_max"] = _quotaMax;
    _map["quota_remaining"] = _quotaRemaining;
    return _map;
  }
}

class AnswerItems {
  Owner? _owner;
  bool? _isAccepted;
  int? _score;
  int? _lastActivityDate;
  int? _creationDate;
  int? _answerId;
  int? _questionId;
  String? _contentLicense;

  Owner? get owner => _owner;
  bool? get isAccepted => _isAccepted;
  int? get score => _score;
  int? get lastActivityDate => _lastActivityDate;
  int? get creationDate => _creationDate;
  int? get answerId => _answerId;
  int? get questionId => _questionId;
  String? get contentLicense => _contentLicense;

  AnswerItems({
    Owner? owner,
    bool? isAccepted,
    int? score,
    int? lastActivityDate,
    int? creationDate,
    int? answerId,
    int? questionId,
    String? contentLicense,
  }) {
    _owner = owner;
    _isAccepted = isAccepted;
    _score = score;
    _lastActivityDate = lastActivityDate;
    _creationDate = creationDate;
    _answerId = answerId;
    _questionId = questionId;
    _contentLicense = contentLicense;
  }

  AnswerItems.fromJson(dynamic json) {
    if (json is Map) {
      _owner = json["owner"] != null ? Owner.fromJson(json["owner"]) : null;
      _isAccepted = json["is_accepted"] as bool?;
      _score = json["score"] as int?;
      _lastActivityDate = json["last_activity_date"] as int?;
      _creationDate = json["creation_date"] as int?;
      _answerId = json["answer_id"] as int?;
      _questionId = json["question_id"] as int?;
      _contentLicense = json["content_license"] as String?;
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _map = {};
    _map["owner"] = _owner?.toJson();
    _map["is_accepted"] = _isAccepted;
    _map["score"] = _score;
    _map["last_activity_date"] = _lastActivityDate;
    _map["creation_date"] = _creationDate;
    _map["answer_id"] = _answerId;
    _map["question_id"] = _questionId;
    _map["content_license"] = _contentLicense;
    return _map;
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
    final Map<String, dynamic> _map = {};
    _map["account_id"] = _accountId;
    _map["reputation"] = _reputation;
    _map["user_id"] = _userId;
    _map["user_type"] = _userType;
    _map["profile_image"] = _profileImage;
    _map["display_name"] = _displayName;
    _map["link"] = _link;
    return _map;
  }
}
