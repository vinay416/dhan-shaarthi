import 'package:dhan_saarthi/feature/fund_detail/domain/usecase/get_fund_details.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateMocks([FundDetails])
class FundDetails extends Mock implements GetFundDetails {}
