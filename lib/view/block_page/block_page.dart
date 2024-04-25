import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/blocked_controller.dart';
import 'package:flutter_application_1/controller/login_provider.dart';
import 'package:flutter_application_1/widgets/app_bar.dart';
import 'package:provider/provider.dart';

class Block_page extends StatefulWidget {
  const Block_page({super.key});

  @override
  State<Block_page> createState() => _Block_pageState();
}

class _Block_pageState extends State<Block_page> {
  bool _isLoading = false;
  bool _dataFetched = false;
  @override
  void initState() {
    super.initState();
    if (!_dataFetched) {
      fetchData();
    }
  }

  Future<void> fetchData() async {
    setState(() {
      _isLoading = true;
    });
    final blockProvider = Provider.of<Block_Provider>(context, listen: false);
    final loginProvider = Provider.of<Login_provider>(context, listen: false);
    final success = await blockProvider.get_block_list(
      user_id: loginProvider.user_id,
      token: loginProvider.token,
    );
    setState(() {
      _isLoading = false;
      _dataFetched = success;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: app_bar(title: "Blocked Contacts", context: context),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : _dataFetched
              ? ListView.separated(
                  itemCount: Provider.of<Block_Provider>(context)
                          .block_responseData
                          ?.blockedUsers
                          .length ??
                      0,
                  itemBuilder: (context, index) {
                    var profile =
                        "http://localhost:8000${Provider.of<Block_Provider>(context, listen: false).block_responseData?.blockedUsers[index].profilePictureUrl}";
                    final blockedUser = Provider.of<Block_Provider>(context)
                        .block_responseData!
                        .blockedUsers[index];
                    print(profile);
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        title: Text(blockedUser.userName),
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(profile),
                          backgroundColor: Colors.black12,
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(),
                )
              : Center(
                  child: Text('Failed to fetch blocked contacts.'),
                ),
    );
  }
}
