import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:restfood/app/modules/settings/controllers/settings_controller.dart';

import '../../../constants/constants.dart';
import '../../../utils/utils.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final SettingsController controller = SettingsController.to;

  @override
  void initState() {
    super.initState();
    SharedMethod.systemBarColor(
        AppStyles.colors.transparent, AppStyles.colors.white);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: false,
        title: Text(
          'Settings',
          style: AppStyles.textStyles.poppinsBold
              .copyWith(color: AppStyles.colors.bgDark, fontSize: 5.0.wp),
        ),
      ),
      body: Row(
        children: [
          SizedBox(
            width: 4.0.wp,
          ),
          SizedBox(
              width: 70.0.wp,
              child: Text(
                "Scheduling daily recommendation",
                style: AppStyles.textStyles.poppinsMedium
                    .copyWith(color: AppStyles.colors.bgDark.withOpacity(0.7)),
              )),
          Expanded(
            child: Obx(
              () => Switch.adaptive(
                value: controller.getScheduled,
                onChanged: (newValue) =>
                    controller.scheduledNotification(newValue),
                activeColor: Colors.cyan,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
