import 'package:effective_lab/widgets/custom_chip.dart';
import 'package:effective_lab/widgets/menu_item.dart';
import 'package:effective_lab/widgets/sub_header.dart';
import 'package:effective_lab/widgets/subscription.dart';
import 'package:flutter/material.dart';

const chips = [
  "Еда",
  "Саморазвитие",
  "Технологии",
  "Дом",
  "Досуг",
  "Забота о себе",
  "Наука"
];

var subscriptions = [
  new Subscription(
      imageUrl: "assets/images/sber_flag.png",
      title: "СберПрайм",
      subtitle: "Платеж 9 июля",
      caption: "199 ₽ в месяц"),
  new Subscription(
    imageUrl: "assets/images/percent.png",
    title: "Перевод",
    subtitle: "Автопродление",
    caption: "199 ₽ в месяц",
  )
];

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20),
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          SizedBox(
            height: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SubHeader(
                  title: "У вас подключено",
                  subtitle:
                      "Подписки, автоплатежи и сервисы на которые вы подписались"),
              SizedBox(
                height: 22,
              ),
              SizedBox(
                width: double.infinity,
                height: 130,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return subscriptions[index];
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        width: 8,
                      );
                    },
                    itemCount: 2),
              )
            ],
          ),
          SizedBox(
            height: 32,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SubHeader(
                  title: "Тарифы и лимиты",
                  subtitle: "Для операций в Сбербанк Онлайн"),
              Column(
                children: [
                  MenuItem(
                    imageUrl: "assets/images/speedometer.png",
                    title: "Изменить суточный лимит",
                    subtitle: "На платежи и переводы",
                  ),
                  MenuItem(
                    imageUrl: "assets/images/percent_unfilled.png",
                    title: "Переводы без комиссии",
                    subtitle: "Показать остаток в этом месяце",
                  ),
                  MenuItem(
                    imageUrl: "assets/images/arrows.png",
                    title: "Информация о тарифах и лимитах",
                    subtitle: "",
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 32,
          ),
          Column(
            children: [
              SubHeader(
                  title: "Интересы",
                  subtitle:
                      "Мы подбираем истории и предложения по темам, которые вам нравятся"),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.only(bottom: 32),
                child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    ...chips
                        .map((item) => CustomChip(label: item))
                        .toList()
                        .cast<Widget>()
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
