import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:naruto_flutter/data/repository/repository.dart';
import 'package:naruto_flutter/model/naruto_model.dart';

part 'naruto_state.dart';

@injectable
class NarutoCubit extends Cubit<NarutoState> {

  final Repository _repository;

  NarutoCubit(this._repository) : super(NarutoInitial());

  void getCharacters() async {
    final box = Hive.box<NarutoModel>("naruto_box");
    if (box.isNotEmpty) {
      emit(Success(box.values.toList()));
    } else {
      emit(Loading());
    }

    final response = await _repository.getHttp();

    emit(Success(response));
  }
}
