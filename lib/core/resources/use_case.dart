abstract class UseCase<DataType, Params> {
  Future<DataType> call({Params params});
}
