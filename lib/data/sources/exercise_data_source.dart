import 'exercises/pull_up.dart';
import 'exercises/squat.dart';
import 'exercises/push_up.dart';
import 'exercises/face_pull.dart';
import 'exercises/bench_press.dart';
import 'exercises/deadlift.dart';
import 'exercises/leg_press.dart';
import 'exercises/curl.dart';
import 'exercises/frog_pumps.dart';
import 'exercises/windshield_wiper.dart';
import 'exercises/dip.dart';
import 'exercises/arnold_press.dart';
import 'exercises/back_extension.dart';
import 'exercises/glute_bridge.dart';
import 'exercises/leg_raise.dart';
import 'exercises/burpee.dart';
import 'exercises/leg_extension.dart';
import 'exercises/hip_abduction.dart';
import 'exercises/plank.dart';
import 'exercises/glute_kickback.dart';
import 'exercises/lunge.dart';
import 'exercises/medicine_ball_throw.dart';
import 'exercises/row.dart';
import 'exercises/shoulder_press.dart';
import 'exercises/upright_row.dart';
import 'exercises/lateral_raise.dart';
import 'exercises/rear_delt_fly.dart';
import 'exercises/shrugs.dart';
import 'exercises/front_delt_raise.dart';
import 'exercises/rear_delt_row.dart';
import 'exercises/floor_press.dart';
import 'exercises/power_clean.dart';
import 'exercises/v_up.dart';
import 'exercises/hack_squat.dart';
import 'exercises/lat_pulldown.dart';
import 'exercises/lateral_walk.dart';
import 'exercises/sit_up.dart';
import 'exercises/chest_fly.dart';
import 'exercises/mountain_climbers.dart';
import 'exercises/tricep_pushdown.dart';
import 'exercises/wrist_curl.dart';
import 'exercises/overhead_press.dart';
import 'exercises/hip_thrust.dart';
import 'exercises/romanian_deadlift.dart';
import 'exercises/nordic_curl.dart';
import 'exercises/good_morning.dart';
import 'exercises/step_up.dart';
import 'exercises/leg_curl.dart';
import 'exercises/calf_raise.dart';
import 'exercises/chin_up.dart';
import 'exercises/inverted_row.dart';
import 'exercises/seal_row.dart';
import 'exercises/chest_supported_row.dart';
import 'exercises/cable_row.dart';
import 'exercises/tricep_extension.dart';
import 'exercises/skull_crusher.dart';
import 'exercises/wrist_extension.dart';
import 'exercises/farmers_carry.dart';
import 'exercises/snatch.dart';
import 'exercises/clean.dart';
import 'exercises/kettlebell_swing.dart';
import 'exercises/landmine_press.dart';
import 'exercises/pullover.dart';
import 'exercises/meadows_row.dart';
import 'exercises/band_pull_apart.dart';
import 'exercises/cable_external_rotation.dart';
import 'exercises/internal_rotation.dart';
import 'exercises/rack_pull.dart';
import 'exercises/hip_adduction.dart';
import 'exercises/box_jump.dart';
import 'exercises/wall_sit.dart';
import 'exercises/dead_bug.dart';
import 'exercises/pallof_press.dart';
import 'exercises/ab_wheel_rollout.dart';
import 'exercises/russian_twist.dart';
import 'exercises/knee_raise.dart';
import 'exercises/landmine_rotation.dart';
import 'exercises/cable_crunch.dart';
import 'exercises/reverse_hyperextension.dart';
import 'exercises/sled_push.dart';
import 'exercises/sled_pull.dart';
import 'exercises/y_raise.dart';

class ExerciseDataSource {
  Future<List<dynamic>> getExercises() async {
    return [
      pullUp,
      squat,
      pushUp,
      facePull,
      benchPress,
      deadlift,
      legPress,
      curl,
      frogPumps,
      windshieldWiper,
      dip,
      arnoldPress,
      backExtension,
      gluteBridge,
      legRaise,
      burpee,
      legExtension,
      hipAbduction,
      plank,
      gluteKickback,
      lunge,
      medicineBallThrow,
      row,
      shoulderPress,
      uprightRow,
      lateralRaise,
      rearDeltFly,
      shrugs,
      frontDeltRaise,
      rearDeltRow,
      floorPress,
      powerClean,
      vUp,
      hackSquat,
      latPulldown,
      lateralWalk,
      sitUp,
      chestFly,
      mountainClimbers,
      tricepPushdown,
      wristCurl,
      overheadPress,
      hipThrust,
      romanianDeadlift,
      nordicCurl,
      goodMorning,
      stepUp,
      legCurl,
      calfRaise,
      chinUp,
      invertedRow,
      sealRow,
      chestSupportedRow,
      cableRow,
      tricepExtension,
      skullCrusher,
      wristExtension,
      farmersCarry,
      snatch,
      clean,
      kettlebellSwing,
      landminePress,
      pullover,
      meadowsRow,
      bandPullApart,
      cableExternalRotation,
      internalRotation,
      rackPull,
      hipAdduction,
      boxJump,
      wallSit,
      deadBug,
      pallofPress,
      abWheelRollout,
      russianTwist,
      kneeRaise,
      landmineRotation,
      cableCrunch,
      reverseHyperextension,
      sledPush,
      sledPull,
      yRaise,
    ];
  }
}
