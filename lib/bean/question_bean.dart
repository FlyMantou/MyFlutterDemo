/// question_id : "5"
/// title : "中医&&学理论体系形成的&&&&基础有111"
/// title_img : "http://test.tcm.lanjiyin.com.cn/Uploads/Admin/2020/10/20/5f8e88f4bd29d.png"
/// s_num : "1"
/// number : "2015N121X"
/// chapter_id : "256"
/// chapter_parent_id : "166"
/// year : "2015"
/// restore : "（P2）“1.中医＜img＞学理论&&体系形成的条件此时，自然科学迅速发展，为中医学理论体系的形成奠定了科学技术基础”（A对）。（P3）“（4）古代哲学思想对医学的渗透”（B对）。（P4）“通过对人体生命现象的整体观察…于是构建了以功能联系为主导的藏象理论体系”（C对）。（P3）“（3）医药实践基础中国古代&&&&医药学家通过长期的医疗实践…为中医学理论体系构建提供了医药实践的基础”（D对。"
/// explain : "中医学理论<img>体系形成于战国至两汉时期，其形成基础主要有：古代自然科学和社会科学的相互渗透（A对）；古代哲学思想的深刻影响（B对）；长期医疗经验的积累和总结（D对）；对人体生命现象和自然现象的长期观察（C对）。"
/// explain_img : ""
/// type : "2"
/// answer : "A,B,C,D"
/// difficulty : "1"
/// is_del : "0"
/// ctime : "1603182969"
/// media_id : "1"
/// question_type : "X"
/// syllabus : ""
/// restore_img : ""
/// score : "2"
/// chapter_disorder_id : "256"
/// chapter_disorder_parent_id : "166"
/// recovery : "（P2）“（2）&&科学技术基础 战国&&时期天文、地理、气象、历算、物候、农学、植物学、矿物学、冶炼、酿造等有诸多创新，为中医学理论体系的构建提供了科学技术基础”（A对）。（P2）“（4）古代哲学思想对医学的渗透”（B对）。（九版教材P4）“通过对人体生命现象的整体观察……于是构建了以功能联系为主导的藏象理论体系”（C对）。（P2）“（3）医药实践基础 从远古社会医药的起源，到战国时期这一漫长的历史过程中，中国古代医药学家通过长期的医疗实践，积累了丰富的医药学知识，并将其总结、升华为中医理论”（D对）。"
/// recovery_img : ""
/// tags_remarks : ""
/// blanks_answer : ""
/// materials_id : "0"
/// y_num : "121"
/// year_id : "2015"
/// year_parent_id : "2015"
/// is_case : "0"
/// option : [{"key":"A","value":"古代自然科学的渗透","img":""},{"key":"B","value":"古代哲学思想的影响","img":""},{"key":"C","value":"对生命现象的长期观察","img":""},{"key":"D","value":"长期医疗经验的积累","img":""}]
/// explainn : "中医学理论<img>体系形成于战国至两汉时期，其形成基础主要有：古代自然科学和社会科学的相互渗透（A对）；古代哲学思想的深刻影响（B对）；长期医疗经验的积累和总结（D对）；对人体生命现象和自然现象的长期观察（C对）。"
/// restoren : "（P2）“1.中医＜img＞学理论&&体系形成的条件此时，自然科学迅速发展，为中医学理论体系的形成奠定了科学技术基础”（A对）。（P3）“（4）古代哲学思想对医学的渗透”（B对）。（P4）“通过对人体生命现象的整体观察…于是构建了以功能联系为主导的藏象理论体系”（C对）。（P3）“（3）医药实践基础中国古代&&&&医药学家通过长期的医疗实践…为中医学理论体系构建提供了医药实践的基础”（D对。"
/// is_high_test : "0"
/// explainn_img : ""
/// media_img : "http://test.tcm.lanjiyin.com.cn/Uploads/Admin/2019/08/09/5d4d1697baa86.png"
/// chapter_title : "绪论2222"
/// chapter_parent_title : "中医基础理论1"
/// is_wrong : "1"
/// is_coll : "0"
/// is_comment : "0"
/// is_note : "0"
/// right_count : "67066"
/// wrong_count : "11686"
/// comment_count : "192"
/// collect_count : "1047"
/// cron_comment_count : "0"
/// user_answer : "B,C"
/// is_right : "0"
/// user_right_count : "0"
/// user_wrong_count : "3"
///


class QuestionResultEntity {
  List<QuestionBean> _list;

  List<QuestionBean> get list => _list;

  QuestionResultEntity.fromJson(Map<String, dynamic> json) {
    _list = json['list'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['list'] = this._list;
    return data;
  }
}

class QuestionBean {
  String _questionId;
  String _title;
  String _titleImg;
  String _sNum;
  String _number;
  String _chapterId;
  String _chapterParentId;
  String _year;
  String _restore;
  String _explain;
  String _explainImg;
  String _type;
  String _answer;
  String _difficulty;
  String _isDel;
  String _ctime;
  String _mediaId;
  String _questionType;
  String _syllabus;
  String _restoreImg;
  String _score;
  String _chapterDisorderId;
  String _chapterDisorderParentId;
  String _recovery;
  String _recoveryImg;
  String _tagsRemarks;
  String _blanksAnswer;
  String _materialsId;
  String _yNum;
  String _yearId;
  String _yearParentId;
  String _isCase;
  List<Option> _option;
  String _explainn;
  String _restoren;
  String _isHighTest;
  String _explainnImg;
  String _mediaImg;
  String _chapterTitle;
  String _chapterParentTitle;
  String _isWrong;
  String _isColl;
  String _isComment;
  String _isNote;
  String _rightCount;
  String _wrongCount;
  String _commentCount;
  String _collectCount;
  String _cronCommentCount;
  String _userAnswer;
  String _isRight;
  String _userRightCount;
  String _userWrongCount;

  String get questionId => _questionId;
  String get title => _title;
  String get titleImg => _titleImg;
  String get sNum => _sNum;
  String get number => _number;
  String get chapterId => _chapterId;
  String get chapterParentId => _chapterParentId;
  String get year => _year;
  String get restore => _restore;
  String get explain => _explain;
  String get explainImg => _explainImg;
  String get type => _type;
  String get answer => _answer;
  String get difficulty => _difficulty;
  String get isDel => _isDel;
  String get ctime => _ctime;
  String get mediaId => _mediaId;
  String get questionType => _questionType;
  String get syllabus => _syllabus;
  String get restoreImg => _restoreImg;
  String get score => _score;
  String get chapterDisorderId => _chapterDisorderId;
  String get chapterDisorderParentId => _chapterDisorderParentId;
  String get recovery => _recovery;
  String get recoveryImg => _recoveryImg;
  String get tagsRemarks => _tagsRemarks;
  String get blanksAnswer => _blanksAnswer;
  String get materialsId => _materialsId;
  String get yNum => _yNum;
  String get yearId => _yearId;
  String get yearParentId => _yearParentId;
  String get isCase => _isCase;
  List<Option> get option => _option;
  String get explainn => _explainn;
  String get restoren => _restoren;
  String get isHighTest => _isHighTest;
  String get explainnImg => _explainnImg;
  String get mediaImg => _mediaImg;
  String get chapterTitle => _chapterTitle;
  String get chapterParentTitle => _chapterParentTitle;
  String get isWrong => _isWrong;
  String get isColl => _isColl;
  String get isComment => _isComment;
  String get isNote => _isNote;
  String get rightCount => _rightCount;
  String get wrongCount => _wrongCount;
  String get commentCount => _commentCount;
  String get collectCount => _collectCount;
  String get cronCommentCount => _cronCommentCount;
  String get userAnswer => _userAnswer;
  String get isRight => _isRight;
  String get userRightCount => _userRightCount;
  String get userWrongCount => _userWrongCount;


  QuestionBean({
      String questionId, 
      String title, 
      String titleImg, 
      String sNum, 
      String number, 
      String chapterId, 
      String chapterParentId, 
      String year, 
      String restore, 
      String explain, 
      String explainImg, 
      String type, 
      String answer, 
      String difficulty, 
      String isDel, 
      String ctime, 
      String mediaId, 
      String questionType, 
      String syllabus, 
      String restoreImg, 
      String score, 
      String chapterDisorderId, 
      String chapterDisorderParentId, 
      String recovery, 
      String recoveryImg, 
      String tagsRemarks, 
      String blanksAnswer, 
      String materialsId, 
      String yNum, 
      String yearId, 
      String yearParentId, 
      String isCase, 
      List<Option> option, 
      String explainn, 
      String restoren, 
      String isHighTest, 
      String explainnImg, 
      String mediaImg, 
      String chapterTitle, 
      String chapterParentTitle, 
      String isWrong, 
      String isColl, 
      String isComment, 
      String isNote, 
      String rightCount, 
      String wrongCount, 
      String commentCount, 
      String collectCount, 
      String cronCommentCount, 
      String userAnswer, 
      String isRight, 
      String userRightCount, 
      String userWrongCount}){
    _questionId = questionId;
    _title = title;
    _titleImg = titleImg;
    _sNum = sNum;
    _number = number;
    _chapterId = chapterId;
    _chapterParentId = chapterParentId;
    _year = year;
    _restore = restore;
    _explain = explain;
    _explainImg = explainImg;
    _type = type;
    _answer = answer;
    _difficulty = difficulty;
    _isDel = isDel;
    _ctime = ctime;
    _mediaId = mediaId;
    _questionType = questionType;
    _syllabus = syllabus;
    _restoreImg = restoreImg;
    _score = score;
    _chapterDisorderId = chapterDisorderId;
    _chapterDisorderParentId = chapterDisorderParentId;
    _recovery = recovery;
    _recoveryImg = recoveryImg;
    _tagsRemarks = tagsRemarks;
    _blanksAnswer = blanksAnswer;
    _materialsId = materialsId;
    _yNum = yNum;
    _yearId = yearId;
    _yearParentId = yearParentId;
    _isCase = isCase;
    _option = option;
    _explainn = explainn;
    _restoren = restoren;
    _isHighTest = isHighTest;
    _explainnImg = explainnImg;
    _mediaImg = mediaImg;
    _chapterTitle = chapterTitle;
    _chapterParentTitle = chapterParentTitle;
    _isWrong = isWrong;
    _isColl = isColl;
    _isComment = isComment;
    _isNote = isNote;
    _rightCount = rightCount;
    _wrongCount = wrongCount;
    _commentCount = commentCount;
    _collectCount = collectCount;
    _cronCommentCount = cronCommentCount;
    _userAnswer = userAnswer;
    _isRight = isRight;
    _userRightCount = userRightCount;
    _userWrongCount = userWrongCount;
}

  QuestionBean.fromJson(dynamic json) {
    _questionId = json["question_id"];
    _title = json["title"];
    _titleImg = json["title_img"];
    _sNum = json["s_num"];
    _number = json["number"];
    _chapterId = json["chapter_id"];
    _chapterParentId = json["chapter_parent_id"];
    _year = json["year"];
    _restore = json["restore"];
    _explain = json["explain"];
    _explainImg = json["explain_img"];
    _type = json["type"];
    _answer = json["answer"];
    _difficulty = json["difficulty"];
    _isDel = json["is_del"];
    _ctime = json["ctime"];
    _mediaId = json["media_id"];
    _questionType = json["question_type"];
    _syllabus = json["syllabus"];
    _restoreImg = json["restore_img"];
    _score = json["score"];
    _chapterDisorderId = json["chapter_disorder_id"];
    _chapterDisorderParentId = json["chapter_disorder_parent_id"];
    _recovery = json["recovery"];
    _recoveryImg = json["recovery_img"];
    _tagsRemarks = json["tags_remarks"];
    _blanksAnswer = json["blanks_answer"];
    _materialsId = json["materials_id"];
    _yNum = json["y_num"];
    _yearId = json["year_id"];
    _yearParentId = json["year_parent_id"];
    _isCase = json["is_case"];
    if (json["option"] != null) {
      _option = [];
      json["option"].forEach((v) {
        _option.add(Option.fromJson(v));
      });
    }
    _explainn = json["explainn"];
    _restoren = json["restoren"];
    _isHighTest = json["is_high_test"];
    _explainnImg = json["explainn_img"];
    _mediaImg = json["media_img"];
    _chapterTitle = json["chapter_title"];
    _chapterParentTitle = json["chapter_parent_title"];
    _isWrong = json["is_wrong"];
    _isColl = json["is_coll"];
    _isComment = json["is_comment"];
    _isNote = json["is_note"];
    _rightCount = json["right_count"];
    _wrongCount = json["wrong_count"];
    _commentCount = json["comment_count"];
    _collectCount = json["collect_count"];
    _cronCommentCount = json["cron_comment_count"];
    _userAnswer = json["user_answer"];
    _isRight = json["is_right"];
    _userRightCount = json["user_right_count"];
    _userWrongCount = json["user_wrong_count"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["question_id"] = _questionId;
    map["title"] = _title;
    map["title_img"] = _titleImg;
    map["s_num"] = _sNum;
    map["number"] = _number;
    map["chapter_id"] = _chapterId;
    map["chapter_parent_id"] = _chapterParentId;
    map["year"] = _year;
    map["restore"] = _restore;
    map["explain"] = _explain;
    map["explain_img"] = _explainImg;
    map["type"] = _type;
    map["answer"] = _answer;
    map["difficulty"] = _difficulty;
    map["is_del"] = _isDel;
    map["ctime"] = _ctime;
    map["media_id"] = _mediaId;
    map["question_type"] = _questionType;
    map["syllabus"] = _syllabus;
    map["restore_img"] = _restoreImg;
    map["score"] = _score;
    map["chapter_disorder_id"] = _chapterDisorderId;
    map["chapter_disorder_parent_id"] = _chapterDisorderParentId;
    map["recovery"] = _recovery;
    map["recovery_img"] = _recoveryImg;
    map["tags_remarks"] = _tagsRemarks;
    map["blanks_answer"] = _blanksAnswer;
    map["materials_id"] = _materialsId;
    map["y_num"] = _yNum;
    map["year_id"] = _yearId;
    map["year_parent_id"] = _yearParentId;
    map["is_case"] = _isCase;
    if (_option != null) {
      map["option"] = _option.map((v) => v.toJson()).toList();
    }
    map["explainn"] = _explainn;
    map["restoren"] = _restoren;
    map["is_high_test"] = _isHighTest;
    map["explainn_img"] = _explainnImg;
    map["media_img"] = _mediaImg;
    map["chapter_title"] = _chapterTitle;
    map["chapter_parent_title"] = _chapterParentTitle;
    map["is_wrong"] = _isWrong;
    map["is_coll"] = _isColl;
    map["is_comment"] = _isComment;
    map["is_note"] = _isNote;
    map["right_count"] = _rightCount;
    map["wrong_count"] = _wrongCount;
    map["comment_count"] = _commentCount;
    map["collect_count"] = _collectCount;
    map["cron_comment_count"] = _cronCommentCount;
    map["user_answer"] = _userAnswer;
    map["is_right"] = _isRight;
    map["user_right_count"] = _userRightCount;
    map["user_wrong_count"] = _userWrongCount;
    return map;
  }

}

/// key : "A"
/// value : "古代自然科学的渗透"
/// img : ""

class Option {
  String _key;
  String _value;
  String _img;

  String get key => _key;
  String get value => _value;
  String get img => _img;

  Option({
      String key, 
      String value, 
      String img}){
    _key = key;
    _value = value;
    _img = img;
}

  Option.fromJson(dynamic json) {
    _key = json["key"];
    _value = json["value"];
    _img = json["img"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["key"] = _key;
    map["value"] = _value;
    map["img"] = _img;
    return map;
  }

}