import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:naruto_flutter/data/repository/repository.dart';
import 'package:naruto_flutter/model/naruto_model.dart';

part 'naruto_state.dart';

class NarutoCubit extends Cubit<NarutoState> {
  NarutoCubit() : super(NarutoInitial());

  void getCharacters() async {
    emit(Loading());
    final repository = Repository();
    final response = await repository.getHttp();
    emit(Success(response));
  }
}
