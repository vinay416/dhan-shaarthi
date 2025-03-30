import 'package:dhan_saarthi/feature/fund_detail/domain/respository/fund_details_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateMocks([FundRepo])
class FundRepo extends Mock implements FundDetailsRepository {}
