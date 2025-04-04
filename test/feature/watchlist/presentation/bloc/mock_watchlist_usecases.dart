import 'package:dhan_saarthi/feature/watchlist/domain/usecase/add_watchlist.dart';
import 'package:dhan_saarthi/feature/watchlist/domain/usecase/add_watchlist_funds.dart';
import 'package:dhan_saarthi/feature/watchlist/domain/usecase/delete_watchlist.dart';
import 'package:dhan_saarthi/feature/watchlist/domain/usecase/delete_watchlist_fund.dart';
import 'package:dhan_saarthi/feature/watchlist/domain/usecase/get_watchlist.dart';
import 'package:dhan_saarthi/feature/watchlist/domain/usecase/update_watchlist.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateMocks([MyGetWatchlist])
class MyGetWatchlist extends Mock implements GetWatchlist {}

@GenerateMocks([MyAddWatchlist])
class MyAddWatchlist extends Mock implements AddWatchlist {}

@GenerateMocks([MyUpdateWatchlist])
class MyUpdateWatchlist extends Mock implements UpdateWatchlist {}

@GenerateMocks([MyDeleteWatchlist])
class MyDeleteWatchlist extends Mock implements DeleteWatchlist {}

@GenerateMocks([MyDeleteWatchlistFund])
class MyDeleteWatchlistFund extends Mock implements DeleteWatchlistFund {}

@GenerateMocks([MyAddWatchlistFund])
class MyAddWatchlistFund extends Mock implements AddWatchlistFund {}
