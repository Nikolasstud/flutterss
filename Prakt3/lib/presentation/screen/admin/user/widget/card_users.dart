import 'package:flutter/material.dart';

import '../../../../../domain/entity/role_entity.dart';

class CardUser extends StatelessWidget {
  const CardUser({
    super.key,
    required this.id,
    required this.login,
    required this.idRole,
    required this.onTap,
  });
  final int id;
  final String login;
  final RoleEnum idRole;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 300),
        child: InkWell(
        borderRadius: BorderRadius.circular(5),
        highlightColor: Color(0x40ad5880),
        focusColor: Color(0x20ad5880),
        onTap: () => onTap,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                SizedBox(
                  width: 35,
                  child: Text(
                    id.toString(),
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(child: Text(login)),
                const SizedBox(width: 5)
              ],
            ),
          ),
        )
      )
    );
  }
}
