import 'package:flutter/material.dart';
import '../models/store_model.dart';
import '../core/services/api_service.dart';

class StoreProvider with ChangeNotifier {
  List<StoreModel> _stores = [];
  bool _isLoading = false;

  List<StoreModel> get stores => _stores;
  bool get isLoading => _isLoading;

  Future<void> fetchStores() async {
    _isLoading = true;
    notifyListeners();

    try {
      _stores = await ApiService.fetchStores(); // Use ApiService here
    } catch (e) {
      print('API error in StoreProvider: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void selectStore(StoreModel selectedStore) {
    // Optional: Implement for map selection
  }
}
