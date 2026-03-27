import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Skill {
  final String name;
  // dynamic aceita tanto IconData (Material) quanto FaIconData (FontAwesome)
  final dynamic icon;
  final Color iconColor;
  final bool isFaIcon;

  Skill._({
    required this.name,
    required this.icon,
    required this.iconColor,
    this.isFaIcon = false,
  });

  factory Skill.fromId(String id) {
    switch (id.toLowerCase()) {
      case 'flutter':
        return Skill._(
          name: 'Flutter',
          icon: Icons.flutter_dash,
          iconColor: Colors.blue,
        );
      case 'sql':
        return Skill._(
          name: 'SQL',
          icon: FontAwesomeIcons.database,
          iconColor: Colors.grey,
          isFaIcon: true,
        );
      case 'git':
        return Skill._(
          name: 'Git/GitHub',
          icon: FontAwesomeIcons.github,
          iconColor: Colors.white,
          isFaIcon: true,
        );
      case 'node':
        return Skill._(
          name: 'NodeJS',
          icon: FontAwesomeIcons.nodeJs,
          iconColor: Colors.green,
          isFaIcon: true,
        );
      case 'ts':
        return Skill._(
          name: 'TypeScript',
          icon: FontAwesomeIcons.code,
          iconColor: const Color(0xFF3178C6),
          isFaIcon: true,
        );
      case 'rest':
        return Skill._(
          name: 'API REST',
          icon: Icons.api,
          iconColor: Colors.orange,
        );
      case 'supabase':
        return Skill._(
          name: 'Supabase',
          icon: FontAwesomeIcons.bolt,
          iconColor: const Color(0xFF3ECF8E),
          isFaIcon: true,
        );
      default:
        return Skill._(
          name: 'Unknown',
          icon: Icons.help_outline,
          iconColor: Colors.white,
        );
    }
  }

  static List<Skill> get mainSkills => [
    Skill.fromId('flutter'),
    Skill.fromId('sql'),
    Skill.fromId('git'),
    Skill.fromId('rest'),
    Skill.fromId('node'),
    Skill.fromId('ts'),
  ];
}