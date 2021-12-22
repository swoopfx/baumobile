// import 'package:bau/provider/service_types.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'service_card.dart';
// import 'package:bau/model/service_type.dart';
import '../model/service_type.dart';
// import 'package:bau/provider/restservice.dart';
import '../provider/service_type_provider.dart';
import './partials/app_drawer.dart';

class ServicePage extends StatefulWidget {
  static const routeName = "/service-page";

  @override
  State<ServicePage> createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  var _isLoading = true;
  var _isInit = true;
  var _providerObject;
  List<ServiceType> _serviceTypeData = [];

  // const ServicePage({Key? key}) : super(key: key);
  Widget loadingWidget() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  // void getServiceTypep() {
  //   RestService().getServiceTye().then((value) {
  //     setState(() {
  //       _isLoading = false;
  //       serviceType = value["data"];
  //     });
  //   });
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   // await Provider.of<ServiceTypes>(context).fetchService();
  //   // getServiceTypep();
  // }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      _providerObject = Provider.of<ServiceTypes>(context, listen: false);
      await _providerObject.fetchService();
      // _providerObject.fetchService();
    }
    _isInit = false;
    setState(() {
      _isLoading = false;
    });
  }

  Widget _serviceContainerWidget(serviceType) {
    _serviceTypeData = _providerObject.items;
    // print(serviceType);
    return SingleChildScrollView(
        child: Column(
      children: [
        ..._serviceTypeData
            .map((e) => ServiceCards(
                key: ValueKey(e.id.toString()),
                servicename: e.servicename,
                serviceimage: e.serviceimage,
                serviceId: e.id.toString()))
            .toList()
      ],
    ));
  }

//  final  mediasss = MediaQuery.of(context)
  @override
  Widget build(BuildContext context) {
    // final serviceTypee = serviceTypeData.items;
    // print(serviceTypee);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Service"),
      ),
      drawer: const AppDrawer(),
      body: SafeArea(
          child: _isLoading
              ? loadingWidget()
              : _serviceContainerWidget(_serviceTypeData)),
    );
    //
  }
}
