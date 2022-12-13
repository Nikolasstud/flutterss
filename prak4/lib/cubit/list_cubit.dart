import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'list_state.dart';

class ListCubit extends Cubit<ListState> {
  ListCubit() : super(ListInitial());

  int counts = 0;
  List<String> elements = <String>[];

  void ClickAdd(int count, Brightness currTheme){

    if(currTheme == Brightness.light){
      elements.add("Цифра: $count White");
    } else {
      elements.add("Цифры: $count Dark".replaceAll("Entry", ""));
    }
    
    counts++;

    emit(OnClickAdd());
  }
}
