import 'package:apple_pencil_double_tap/apple_pencil_double_tap.dart';
import 'package:apple_pencil_double_tap/apple_pencil_double_tap_method_channel.dart';
import 'package:apple_pencil_double_tap/apple_pencil_double_tap_platform_interface.dart';
import 'package:apple_pencil_double_tap/entities/preferred_action.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockApplePencilDoubleTapPlatform
    with MockPlatformInterfaceMixin
    implements ApplePencilDoubleTapPlatform {
  bool listenCalled = false;
  bool disposeCalled = false;

  @override
  void listen({
    Function(PreferredAction p1)? v1Callback,
    Function(TapAction p1)? onTapAction,
    Function(SqueezeAction p1)? onSqueeze,
    Function(dynamic e)? onError,
  }) {
    listenCalled = true;
  }

  @override
  void dispose() {
    disposeCalled = true;
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('ApplePencilDoubleTap', () {
    test('can be instantiated', () {
      expect(ApplePencilDoubleTap(), isNotNull);
    });
  });

  group('ApplePencilDoubleTapPlatform', () {
    test('default instance is MethodChannelApplePencilDoubleTap', () {
      expect(
        ApplePencilDoubleTapPlatform.instance,
        isA<MethodChannelApplePencilDoubleTap>(),
      );
    });

    test('can set and get instance', () {
      final mock = MockApplePencilDoubleTapPlatform();
      ApplePencilDoubleTapPlatform.instance = mock;
      expect(ApplePencilDoubleTapPlatform.instance, mock);
    });
  });

  group('MethodChannelApplePencilDoubleTap', () {
    test('can be instantiated', () {
      expect(MethodChannelApplePencilDoubleTap(), isNotNull);
    });

    test('has correct method channel name', () {
      final channel = MethodChannelApplePencilDoubleTap();
      expect(
        channel.methodChannel.name,
        'tech.codegrowers.applepencildoubletap/apple_pencil_double_tap_plugin',
      );
    });
  });

  group('PreferredAction', () {
    test('fromString returns correct values', () {
      expect(PreferredAction.fromString('ignore'), PreferredAction.ignore);
      expect(
        PreferredAction.fromString('switchEraser'),
        PreferredAction.switchEraser,
      );
      expect(
        PreferredAction.fromString('switchPrevious'),
        PreferredAction.switchPrevious,
      );
      expect(
        PreferredAction.fromString('showColorPalette'),
        PreferredAction.showColorPalette,
      );
      expect(
        PreferredAction.fromString('showInkAttributes'),
        PreferredAction.showInkAttributes,
      );
      expect(
        PreferredAction.fromString('showContextualPalette'),
        PreferredAction.showContextualPalette,
      );
      expect(
        PreferredAction.fromString('runSystemShortcut'),
        PreferredAction.runSystemShortcut,
      );
    });

    test('fromString returns unknown for invalid input', () {
      expect(PreferredAction.fromString('invalid'), PreferredAction.unknown);
      expect(PreferredAction.fromString(''), PreferredAction.unknown);
      expect(PreferredAction.fromString('foo'), PreferredAction.unknown);
    });

    test('all enum values exist', () {
      expect(PreferredAction.values, contains(PreferredAction.ignore));
      expect(PreferredAction.values, contains(PreferredAction.switchEraser));
      expect(PreferredAction.values, contains(PreferredAction.switchPrevious));
      expect(
        PreferredAction.values,
        contains(PreferredAction.showColorPalette),
      );
      expect(
        PreferredAction.values,
        contains(PreferredAction.showInkAttributes),
      );
      expect(
        PreferredAction.values,
        contains(PreferredAction.showContextualPalette),
      );
      expect(
        PreferredAction.values,
        contains(PreferredAction.runSystemShortcut),
      );
      expect(PreferredAction.values, contains(PreferredAction.unknown));
    });
  });

  group('SqueezePhase', () {
    test('fromString returns correct values', () {
      expect(SqueezePhase.fromString('began'), SqueezePhase.began);
      expect(SqueezePhase.fromString('changed'), SqueezePhase.changed);
      expect(SqueezePhase.fromString('ended'), SqueezePhase.ended);
      expect(SqueezePhase.fromString('cancelled'), SqueezePhase.cancelled);
    });

    test('fromString returns unknown for invalid input', () {
      expect(SqueezePhase.fromString('invalid'), SqueezePhase.unknown);
      expect(SqueezePhase.fromString(''), SqueezePhase.unknown);
      expect(SqueezePhase.fromString('foo'), SqueezePhase.unknown);
    });

    test('all enum values exist', () {
      expect(SqueezePhase.values, contains(SqueezePhase.began));
      expect(SqueezePhase.values, contains(SqueezePhase.changed));
      expect(SqueezePhase.values, contains(SqueezePhase.ended));
      expect(SqueezePhase.values, contains(SqueezePhase.cancelled));
      expect(SqueezePhase.values, contains(SqueezePhase.unknown));
    });
  });

  group('TapAction', () {
    test('can be created with all parameters', () {
      final action = TapAction(
        preferredAction: PreferredAction.switchEraser,
        zOffset: 0.5,
        locationX: 100.0,
        locationY: 200.0,
      );

      expect(action.preferredAction, PreferredAction.switchEraser);
      expect(action.zOffset, 0.5);
      expect(action.locationX, 100.0);
      expect(action.locationY, 200.0);
    });

    test('can be created with null optional parameters', () {
      final action = TapAction(
        preferredAction: PreferredAction.ignore,
        zOffset: null,
        locationX: null,
        locationY: null,
      );

      expect(action.preferredAction, PreferredAction.ignore);
      expect(action.zOffset, isNull);
      expect(action.locationX, isNull);
      expect(action.locationY, isNull);
    });

    test('fromJson parses correctly with all values', () {
      final json = <Object?, Object?>{
        'preferredAction': 'switchEraser',
        'zOffset': 0.5,
        'locationX': 100.0,
        'locationY': 200.0,
      };

      final action = TapAction.fromJson(json);

      expect(action.preferredAction, PreferredAction.switchEraser);
      expect(action.zOffset, 0.5);
      expect(action.locationX, 100.0);
      expect(action.locationY, 200.0);
    });

    test('fromJson parses correctly with null values', () {
      final json = <Object?, Object?>{
        'preferredAction': 'ignore',
        'zOffset': null,
        'locationX': null,
        'locationY': null,
      };

      final action = TapAction.fromJson(json);

      expect(action.preferredAction, PreferredAction.ignore);
      expect(action.zOffset, isNull);
      expect(action.locationX, isNull);
      expect(action.locationY, isNull);
    });

    test('toJson returns correct map', () {
      final action = TapAction(
        preferredAction: PreferredAction.showColorPalette,
        zOffset: 0.3,
        locationX: 50.0,
        locationY: 75.0,
      );

      final json = action.toJson();

      expect(json['preferredAction'], PreferredAction.showColorPalette);
      expect(json['zOffset'], 0.3);
      expect(json['locationX'], 50.0);
      expect(json['locationY'], 75.0);
    });

    test('toString returns non-empty string', () {
      final action = TapAction(
        preferredAction: PreferredAction.switchPrevious,
        zOffset: 0.1,
        locationX: 10.0,
        locationY: 20.0,
      );

      expect(action.toString(), isNotEmpty);
      expect(action.toString(), contains('preferredAction'));
    });
  });

  group('SqueezeAction', () {
    test('can be created with all parameters', () {
      final action = SqueezeAction(
        preferredAction: PreferredAction.switchEraser,
        squeezePhase: SqueezePhase.began,
        zOffset: 0.5,
        locationX: 100.0,
        locationY: 200.0,
      );

      expect(action.preferredAction, PreferredAction.switchEraser);
      expect(action.squeezePhase, SqueezePhase.began);
      expect(action.zOffset, 0.5);
      expect(action.locationX, 100.0);
      expect(action.locationY, 200.0);
    });

    test('fromJson parses correctly', () {
      final json = <Object?, Object?>{
        'preferredAction': 'showColorPalette',
        'squeezePhase': 'ended',
        'zOffset': 0.8,
        'locationX': 150.0,
        'locationY': 250.0,
      };

      final action = SqueezeAction.fromJson(json);

      expect(action.preferredAction, PreferredAction.showColorPalette);
      expect(action.squeezePhase, SqueezePhase.ended);
      expect(action.zOffset, 0.8);
      expect(action.locationX, 150.0);
      expect(action.locationY, 250.0);
    });

    test('toJson returns correct map with squeezePhase', () {
      final action = SqueezeAction(
        preferredAction: PreferredAction.ignore,
        squeezePhase: SqueezePhase.changed,
        zOffset: 0.2,
        locationX: 30.0,
        locationY: 40.0,
      );

      final json = action.toJson();

      expect(json['preferredAction'], PreferredAction.ignore);
      expect(json['squeezePhase'], SqueezePhase.changed);
      expect(json['zOffset'], 0.2);
      expect(json['locationX'], 30.0);
      expect(json['locationY'], 40.0);
    });

    test('extends TapAction', () {
      final action = SqueezeAction(
        preferredAction: PreferredAction.switchEraser,
        squeezePhase: SqueezePhase.began,
        zOffset: null,
        locationX: null,
        locationY: null,
      );

      expect(action, isA<TapAction>());
    });

    test('toString returns non-empty string', () {
      final action = SqueezeAction(
        preferredAction: PreferredAction.switchPrevious,
        squeezePhase: SqueezePhase.cancelled,
        zOffset: 0.1,
        locationX: 10.0,
        locationY: 20.0,
      );

      expect(action.toString(), isNotEmpty);
      expect(action.toString(), contains('squeezePhase'));
    });

    test('can be created with null optional parameters', () {
      final action = SqueezeAction(
        preferredAction: PreferredAction.ignore,
        squeezePhase: SqueezePhase.began,
        zOffset: null,
        locationX: null,
        locationY: null,
      );

      expect(action.preferredAction, PreferredAction.ignore);
      expect(action.squeezePhase, SqueezePhase.began);
      expect(action.zOffset, isNull);
      expect(action.locationX, isNull);
      expect(action.locationY, isNull);
    });

    test('fromJson parses all squeeze phases correctly', () {
      for (final phase in ['began', 'changed', 'ended', 'cancelled']) {
        final json = <Object?, Object?>{
          'preferredAction': 'ignore',
          'squeezePhase': phase,
          'zOffset': null,
          'locationX': null,
          'locationY': null,
        };

        final action = SqueezeAction.fromJson(json);
        expect(action.squeezePhase, SqueezePhase.fromString(phase));
      }
    });

    test('fromJson handles unknown squeeze phase', () {
      final json = <Object?, Object?>{
        'preferredAction': 'ignore',
        'squeezePhase': 'invalid_phase',
        'zOffset': null,
        'locationX': null,
        'locationY': null,
      };

      final action = SqueezeAction.fromJson(json);
      expect(action.squeezePhase, SqueezePhase.unknown);
    });

    test('fromJson parses all preferred actions correctly', () {
      final actions = [
        'ignore',
        'switchEraser',
        'switchPrevious',
        'showColorPalette',
        'showInkAttributes',
        'showContextualPalette',
        'runSystemShortcut',
      ];

      for (final actionStr in actions) {
        final json = <Object?, Object?>{
          'preferredAction': actionStr,
          'squeezePhase': 'ended',
          'zOffset': null,
          'locationX': null,
          'locationY': null,
        };

        final action = SqueezeAction.fromJson(json);
        expect(action.preferredAction, PreferredAction.fromString(actionStr));
      }
    });

    test('squeeze lifecycle phases follow expected order', () {
      final phases = [
        SqueezePhase.began,
        SqueezePhase.changed,
        SqueezePhase.ended,
      ];

      for (var i = 0; i < phases.length; i++) {
        final action = SqueezeAction(
          preferredAction: PreferredAction.switchEraser,
          squeezePhase: phases[i],
          zOffset: 0.5,
          locationX: 100.0,
          locationY: 200.0,
        );

        expect(action.squeezePhase, phases[i]);
      }
    });

    test('squeeze cancelled phase is valid', () {
      final action = SqueezeAction(
        preferredAction: PreferredAction.switchEraser,
        squeezePhase: SqueezePhase.cancelled,
        zOffset: 0.5,
        locationX: 100.0,
        locationY: 200.0,
      );

      expect(action.squeezePhase, SqueezePhase.cancelled);
    });

    test('hover pose values are within expected range', () {
      final action = SqueezeAction(
        preferredAction: PreferredAction.switchEraser,
        squeezePhase: SqueezePhase.began,
        zOffset: 0.5,
        locationX: 100.0,
        locationY: 200.0,
      );

      expect(action.zOffset, greaterThanOrEqualTo(0.0));
      expect(action.zOffset, lessThanOrEqualTo(1.0));
    });

    test('inherits TapAction properties correctly', () {
      final action = SqueezeAction(
        preferredAction: PreferredAction.showColorPalette,
        squeezePhase: SqueezePhase.ended,
        zOffset: 0.3,
        locationX: 50.0,
        locationY: 75.0,
      );

      expect(action.preferredAction, PreferredAction.showColorPalette);
      expect(action.zOffset, 0.3);
      expect(action.locationX, 50.0);
      expect(action.locationY, 75.0);
    });
  });

  group('Squeeze integration scenarios', () {
    test('simulates complete squeeze gesture lifecycle', () {
      final squeezeEvents = <SqueezeAction>[];

      squeezeEvents.add(
        SqueezeAction(
          preferredAction: PreferredAction.switchEraser,
          squeezePhase: SqueezePhase.began,
          zOffset: 0.5,
          locationX: 100.0,
          locationY: 200.0,
        ),
      );

      for (var i = 0; i < 3; i++) {
        squeezeEvents.add(
          SqueezeAction(
            preferredAction: PreferredAction.switchEraser,
            squeezePhase: SqueezePhase.changed,
            zOffset: 0.5 - (i * 0.1),
            locationX: 100.0 + i,
            locationY: 200.0 + i,
          ),
        );
      }

      squeezeEvents.add(
        SqueezeAction(
          preferredAction: PreferredAction.switchEraser,
          squeezePhase: SqueezePhase.ended,
          zOffset: 0.2,
          locationX: 103.0,
          locationY: 203.0,
        ),
      );

      expect(squeezeEvents.first.squeezePhase, SqueezePhase.began);
      expect(squeezeEvents.last.squeezePhase, SqueezePhase.ended);
      expect(squeezeEvents.length, 5);

      for (var i = 1; i < squeezeEvents.length - 1; i++) {
        expect(squeezeEvents[i].squeezePhase, SqueezePhase.changed);
      }
    });

    test('simulates cancelled squeeze gesture', () {
      final squeezeEvents = <SqueezeAction>[];

      squeezeEvents.add(
        SqueezeAction(
          preferredAction: PreferredAction.switchEraser,
          squeezePhase: SqueezePhase.began,
          zOffset: 0.5,
          locationX: 100.0,
          locationY: 200.0,
        ),
      );

      squeezeEvents.add(
        SqueezeAction(
          preferredAction: PreferredAction.switchEraser,
          squeezePhase: SqueezePhase.cancelled,
          zOffset: null,
          locationX: null,
          locationY: null,
        ),
      );

      expect(squeezeEvents.first.squeezePhase, SqueezePhase.began);
      expect(squeezeEvents.last.squeezePhase, SqueezePhase.cancelled);
    });
  });
}
