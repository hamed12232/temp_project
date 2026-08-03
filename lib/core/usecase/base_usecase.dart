import 'package:equatable/equatable.dart';
import '../network/models/api_result.dart';

abstract class BaseUseCase<T, Parameters> {
  Future<ApiResult<T>> call(Parameters parameters);
}

class NoParameters extends Equatable {
  const NoParameters();

  @override
  List<Object> get props => [];
}
