// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_l10n.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppL10nEn extends AppL10n {
  AppL10nEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'CallKit';

  @override
  String get actionRetry => 'Retry';

  @override
  String get actionSend => 'Send';

  @override
  String get errorGenericTitle => 'Something went wrong';

  @override
  String get conversationsTitle => 'Messages';

  @override
  String get conversationsEmptyTitle => 'No conversations yet';

  @override
  String get conversationsEmptyMessage =>
      'Start a chat and it will show up here.';

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
  String get chatEmptyTitle => 'No messages yet';

  @override
  String get chatEmptyMessage => 'Say hello to start the conversation.';

  @override
  String get chatInputHint => 'Message';

  @override
  String get chatSendFailed => 'Message could not be sent.';

  @override
  String get chatPresenceOnline => 'Online';

  @override
  String get chatPresenceOffline => 'Offline';

  @override
  String get chatStartAudioCall => 'Start audio call';

  @override
  String get chatStartVideoCall => 'Start video call';

  @override
  String get dayToday => 'Today';

  @override
  String get dayYesterday => 'Yesterday';

  @override
  String get callIncomingAudio => 'Incoming call';

  @override
  String get callIncomingVideo => 'Incoming video call';

  @override
  String get callOutgoingRinging => 'Ringing…';

  @override
  String get callConnecting => 'Connecting…';

  @override
  String get callEnded => 'Call ended';

  @override
  String get callDeclined => 'Call declined';

  @override
  String get callFailed => 'Call failed';

  @override
  String get callCameraOff => 'Camera is off';

  @override
  String get callActionAccept => 'Accept';

  @override
  String get callActionDecline => 'Decline';

  @override
  String get callActionEnd => 'End call';

  @override
  String get callActionMute => 'Mute';

  @override
  String get callActionUnmute => 'Unmute';

  @override
  String get callActionSpeaker => 'Speaker';

  @override
  String get callActionCamera => 'Camera';

  @override
  String get callActionSwitchCamera => 'Switch camera';
}
