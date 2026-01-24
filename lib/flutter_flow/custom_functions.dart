import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/auth/supabase_auth/auth_util.dart';

int calcularIdade(DateTime date) {
  final today = DateTime.now();
  return today.year -
      date.year -
      ((today.month < date.month ||
              (today.month == date.month && today.day < date.day))
          ? 1
          : 0);
}

DateTime? converteremDateTime(String? data) {
  // Verifica se o parâmetro data é nulo ou vazio
  if (data == null || data.isEmpty) {
    return null;
  }

  try {
    // Lista de formatos comuns de data para tentar fazer o parse
    List<String> formatosPossiveis = [
      'yyyy-MM-dd HH:mm:ss', // 2024-03-15 14:30:00
      'yyyy-MM-dd', // 2024-03-15
      'dd/MM/yyyy HH:mm:ss', // 15/03/2024 14:30:00
      'dd/MM/yyyy', // 15/03/2024
      'MM/dd/yyyy HH:mm:ss', // 03/15/2024 14:30:00
      'MM/dd/yyyy', // 03/15/2024
      'yyyy-MM-ddTHH:mm:ss', // 2024-03-15T14:30:00 (ISO format sem Z)
      'yyyy-MM-ddTHH:mm:ssZ', // 2024-03-15T14:30:00Z (ISO format com Z)
      'dd-MM-yyyy HH:mm:ss', // 15-03-2024 14:30:00
      'dd-MM-yyyy', // 15-03-2024
    ];

    // Primeiro, tenta usar DateTime.parse() para formatos ISO padrão
    try {
      return DateTime.parse(data);
    } catch (e) {
      // Se falhar, continua tentando outros formatos
    }

    // Tenta cada formato da lista
    for (String formato in formatosPossiveis) {
      try {
        DateFormat dateFormat = DateFormat(formato);
        return dateFormat.parse(data);
      } catch (e) {
        // Continua tentando o próximo formato
        continue;
      }
    }

    // Se nenhum formato funcionou, retorna null
    return null;
  } catch (e) {
    // Em caso de erro inesperado, retorna null
    return null;
  }
}

String? dataAniversaio(String? data) {
  // formatar data para padrao brasileiro dd/mm/aaaa
  DateTime? dateTime = converteremDateTime(data);
  if (dateTime == null) return null;
  return DateFormat('dd/MM/yyyy').format(dateTime);
}

bool isExpiredRental(
  DateTime expiresAt,
  DateTime rentedAt,
) {
  return expiresAt.isBefore(rentedAt);
}

String diffFromRented(DateTime expiresAt) {
  final now = DateTime.now();
  final diff = expiresAt.difference(now);

  final hours = diff.inHours.toString().padLeft(2, '0');
  final minutes = (diff.inMinutes % 60).toString().padLeft(2, '0');
  final seconds = (diff.inSeconds % 60).toString().padLeft(2, '0');

  return "$hours:$minutes:$seconds";
}

String normalizeSearch(String? input) {
  if (input == null || input.isEmpty) {
    return '';
  }

  const withAccents =
      'ÁÀÂÃÄÅáàâãäåÉÈÊËéèêëÍÌÎÏíìîïÓÒÔÕÖóòôõöÚÙÛÜúùûüÇçÑñÝŸýÿÆæØøŠšŽžŔŕ';
  const noAccents =
      'AAAAAAaaaaaaEEEEeeeeIIIIiiiiOOOOOoooooUUUUuuuuCcNnYYyyAaOoSsZzRr';

  String out = input;

  for (int i = 0; i < withAccents.length; i++) {
    out = out.replaceAll(withAccents[i], noAccents[i]);
  }

  return out.toLowerCase().trim();
}

String? converter(String? img) {
  // converter string em imagePath
  if (img == null || img.isEmpty) return null; // Check for null or empty string
  return 'assets/images/$img'; // Assuming images are stored in assets/images directory
}

DateTime? addTimeToDate(
  DateTime? base,
  int value,
  String unit,
) {
  if (base == null) return null;

  switch (unit) {
    case 'minutes':
      return base.add(Duration(minutes: value));
    case 'hours':
      return base.add(Duration(hours: value));
    case 'days':
      return base.add(Duration(days: value));
    default:
      return base;
  }
}
String getAvatarPath(
  String? profileUrl,
  String? userId,
) {
  if (profileUrl != null && profileUrl.isNotEmpty) {
    return profileUrl;
  }
  final index = ((userId?.hashCode ?? 0) % 11).abs() + 1;
  return 'assets/images/$index.png';
}
