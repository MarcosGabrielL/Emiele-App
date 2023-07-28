import '../../models/models2/models.dart';

abstract class BasePlacesRepository {
  Future<List<PlaceAutocomplete>?> getAutocomplete(String searchInput);
  Future<Place?> getPlace(String placeId);
}
