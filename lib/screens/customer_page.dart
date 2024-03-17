import 'dart:convert';
import 'package:assignment_for_internship/model/model_class.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CustomerListPage extends StatefulWidget {
  final String authToken;

  const CustomerListPage({super.key, required this.authToken});

  @override
  State<CustomerListPage> createState() => _CustomerListPageState();
}

class _CustomerListPageState extends State<CustomerListPage> {
  List<CustomerModel> customerList = [];
  bool isLoading = false;

  @override
  initState() {
    super.initState();
    _getCustomerList();
  }

  Future _getCustomerList() async {
    setState(() {
      isLoading = true;
    });
    String URL =
        "https://www.pqstec.com/InvoiceApps/Values/GetCustomerList?searchquery=&pageNo=1&pageSize=20&SortyBy=Balance";
    final response = await http.get(Uri.parse(URL),
        headers: {'Authorization': 'Bearer ${widget.authToken}'});
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      data['CustomerList'].forEach((item) {
        customerList.add(CustomerModel.fromJson(item));
      });
      setState(() {
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
      throw Exception('Failed to load customers');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Customer List'),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              itemCount: customerList.length,
              itemBuilder: (context, index) {
                final data = customerList[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(.12),
                            blurRadius: 4,
                          )
                        ]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 12),
                        Text(
                          "Name : ${data.name.toString()}",
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "Phone : ${data.phone.toString()}",
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "Collection : ${data.totalCollection.toString()}",
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "Sales : ${data.totalSalesValue.toString()}",
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "Due : ${data.totalDue.toString()}",
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "Date : ${data.lastTransactionDate.toString()}",
                          style: TextStyle(
                              color: Colors.black.withOpacity(.7),
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
