import 'package:dhan_saarthi/feature/watchlist/data/data_source/watchlist_local_data_source.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateMocks([MyWatchlistLocalDataSource])
class MyWatchlistLocalDataSource extends Mock
    implements WatchlistLocalDataSource {}
