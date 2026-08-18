// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_l10n.dart';

// ignore_for_file: type=lint

/// The translations for Uzbek (`uz`).
class AppL10nUz extends AppL10n {
  AppL10nUz([String locale = 'uz']) : super(locale);

  @override
  String get appTitle => 'CallKit';

  @override
  String get actionRetry => 'Qayta urinish';

  @override
  String get actionSend => 'Yuborish';

  @override
  String get errorGenericTitle => 'Nimadir xato ketdi';

  @override
  String get conversationsTitle => 'Xabarlar';

  @override
  String get conversationsEmptyTitle => 'Hozircha suhbatlar yo‘q';

  @override
  String get conversationsEmptyMessage =>
      'Suhbat boshlang — u shu yerda ko‘rinadi.';

  @override
  String conversationsUnreadCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count',
      one: '$count',
      zero: '',
    );
    return '$_temp0';
  }

  @override
  String get chatEmptyTitle => 'Xabarlar yo‘q';

  @override
  String get chatEmptyMessage => 'Suhbatni boshlash uchun salom yozing.';

  @override
  String get chatInputHint => 'Xabar';

  @override
  String get chatSendFailed => 'Xabar yuborilmadi.';

  @override
  String get chatPresenceOnline => 'Onlayn';

  @override
  String get chatPresenceOffline => 'Oflayn';

  @override
  String get chatStartAudioCall => 'Audio qo‘ng‘iroq';

  @override
  String get chatStartVideoCall => 'Video qo‘ng‘iroq';

  @override
  String get dayToday => 'Bugun';

  @override
  String get dayYesterday => 'Kecha';

  @override
  String get callIncomingAudio => 'Kiruvchi qo‘ng‘iroq';

  @override
  String get callIncomingVideo => 'Kiruvchi video qo‘ng‘iroq';

  @override
  String get callOutgoingRinging => 'Chalinmoqda…';

  @override
  String get callConnecting => 'Ulanmoqda…';

  @override
  String get callEnded => 'Qo‘ng‘iroq tugadi';

  @override
  String get callDeclined => 'Rad etildi';

  @override
  String get callFailed => 'Qo‘ng‘iroq amalga oshmadi';

  @override
  String get callCameraOff => 'Kamera o‘chirilgan';

  @override
  String get callActionAccept => 'Qabul qilish';

  @override
  String get callActionDecline => 'Rad etish';

  @override
  String get callActionEnd => 'Tugatish';

  @override
  String get callActionMute => 'Ovozsiz';

  @override
  String get callActionUnmute => 'Ovozni yoqish';

  @override
  String get callActionSpeaker => 'Karnay';

  @override
  String get callActionCamera => 'Kamera';

  @override
  String get callActionSwitchCamera => 'Kamerani almashtirish';
}
