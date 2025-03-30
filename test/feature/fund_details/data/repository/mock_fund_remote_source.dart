import 'package:dhan_saarthi/feature/fund_detail/data/data_source/fund_details_remote_source.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateMocks([FundRemoteSource])
class FundRemoteSource extends Mock implements FundDetailsRemoteSource {}
