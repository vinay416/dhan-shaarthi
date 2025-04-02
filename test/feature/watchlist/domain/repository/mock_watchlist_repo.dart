import 'package:dhan_saarthi/feature/watchlist/domain/repository/watchlist_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateMocks([WatchlistRepo])
class WatchlistRepo extends Mock implements WatchlistRepository {}
