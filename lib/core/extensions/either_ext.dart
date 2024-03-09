import 'package:dartz/dartz.dart';

extension EitherExt<K, V> on Either<K, V> {
  Future<V?> getOrCrash() {
    if (isLeft()) {
      return Future.value((this as Left).value);
    } else {
      return Future.value((this as Right).value);
    }
  }
}
