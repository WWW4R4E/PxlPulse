import 'package:flutter_application_1/common/widgets/user_page/record_list.dart';

class DiaryApi {
  List<DiaryData> getDiaryData(int level) {
    // level 1 == 日记
    // level 2 == 我的ai
    // level 3 == 我的历史浏览  待定
    // level 4 == 我的收藏夹  待定
    return [
      DiaryData(name: '日记1', interaction: '互动信息1'),
      DiaryData(name: '日记2', interaction: '互动信息2'),
      DiaryData(name: '日记3', interaction: '互动信息3'),
    ];
  }
}
