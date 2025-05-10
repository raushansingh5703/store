import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/store_provider.dart';
import '../widgets/store_list_item.dart';
import '../widgets/store_map_view.dart';

class StoreScreen extends StatefulWidget {
  const StoreScreen({super.key});

  @override
  State<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  int? selectedIndex;
  final GlobalKey<StoreMapViewState> mapKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<StoreProvider>(context, listen: false).fetchStores());
  }

  void onStoreTap(int index) {
    final store = Provider.of<StoreProvider>(context, listen: false).stores[index];
    mapKey.currentState?.moveToStore(store);
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final storeProvider = Provider.of<StoreProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Stores',style: TextStyle(color: Colors.black),),centerTitle: true,),
      body: storeProvider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
        children: [
          Expanded(
            flex: 1,
            child: StoreMapView(
              key: mapKey,
              stores: storeProvider.stores,
            ),
          ),
          Expanded(
            flex: 1,
            child: ListView.builder(
              itemCount: storeProvider.stores.length,
              itemBuilder: (context, index) {
                final store = storeProvider.stores[index];
                return StoreListItem(
                  store: store,
                  isSelected: selectedIndex == index,
                  onTap: () => onStoreTap(index),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
