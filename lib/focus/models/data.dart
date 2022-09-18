import 'package:flutter_meditation/focus/models/style.dart';

import 'course.dart';

final _pos1 = Style(
  imageUrl: 'assets/pos1.jpg',
  name: 'Mountain Pose',
  vidurl: 'https://www.youtube.com/watch?v=ET_cKo1Ta1s',
  time: 2,
);
final _pos2 = Style(
  imageUrl: 'assets/pos2.jpg',
  name: 'Tree Pose',
  vidurl: 'https://www.youtube.com/watch?v=Dic293YNJI8',
  time: 2,
);
final _pos3 = Style(
  imageUrl: 'assets/pos3.jpg',
  name: 'Bound Angle',
  vidurl: 'https://www.youtube.com/watch?v=YXOeBUjmERI',
  time: 2,
);

final _pos4 = Style(
  imageUrl: 'assets/pos4.jpg',
  name: 'Downward Dog',
  vidurl: 'https://www.youtube.com/watch?v=6Ep5VzGqDRU',
  time: 5,
);
final _pos5 = Style(
  imageUrl: 'assets/pos5.jpg',
  name: 'Half Spinal Twist',
  vidurl: 'https://www.youtube.com/watch?v=yYy6w8_hLTE',
  time: 3,
);
final _pos6 = Style(
  imageUrl: 'assets/pos6.jpg',
  name: 'Pawanmukti Asan',
  vidurl: 'https://www.youtube.com/watch?v=sUJa5YiBUOc',
  time: 3,
);
final _pos7 = Style(
  imageUrl: 'assets/pos7.jpg',
  name: 'Figure Four Stretch',
  vidurl: 'https://www.youtube.com/watch?v=E6sqUHFt6Ng',
  time: 2,
);
final _pos8 = Style(
  imageUrl: 'assets/pos8.jpg',
  name: 'Spinal Pose',
  vidurl: 'https://www.youtube.com/watch?v=ezyMaQEaVaI',
  time: 2,
);
final _pos9 = Style(
  imageUrl: 'assets/pos9.jpg',
  name: 'Bird-Dog Pose',
  vidurl: 'https://www.youtube.com/watch?v=wiFNA3sqjCA',
  time: 1,
);

final styles = [_pos1, _pos2, _pos3, _pos4, _pos5, _pos6, _pos7, _pos8, _pos9];

final _course1 = Course(
    imageUrl: 'assets/course1.jpg',
    name: 'Surya Namaskar',
    time: 48,
    corurl: 'https://www.youtube.com/watch?v=EIqsDkpzOgo',
    students: 'Transformation');

final _course2 = Course(
    imageUrl: 'assets/course2.jpg',
    name: 'Morning Stretch',
    time: 15,
    corurl: 'https://www.youtube.com/watch?v=brjAjq4zEIE',
    students: 'Wake up Yoga');

final _course3 = Course(
    imageUrl: 'assets/course3.jpg',
    name: 'Evening Stretch',
    time: 22,
    corurl: 'https://www.youtube.com/watch?v=gXuq4M5rU9E',
    students: 'Relax & Unwind');

final _course4 = Course(
    imageUrl: 'assets/course3.jpg',
    name: 'Yoga - Weight Loss',
    time: 22,
    corurl: 'https://www.youtube.com/watch?v=3f1PNH6ZYfo',
    students: 'Lower Body Fat');

final _course5 = Course(
    imageUrl: 'assets/course3.jpg',
    name: 'Yoga - Healthy Eyes',
    time: 22,
    corurl: 'https://www.youtube.com/watch?v=VPenA4_GBQU',
    students: 'Eyes Exercise');

final _course6 = Course(
    imageUrl: 'assets/course3.jpg',
    name: 'Yoga - Healthy Skin',
    time: 11,
    corurl: 'https://www.youtube.com/watch?v=dfCvJekDuf0',
    students: 'Anti Aging Poses');

final _course7 = Course(
    imageUrl: 'assets/course3.jpg',
    name: 'Yoga - Healthy Joints',
    time: 17,
    corurl: 'https://www.youtube.com/watch?v=RJ8kQPSug0U',
    students: 'Improve Flexibility');

final _course8 = Course(
    imageUrl: 'assets/course3.jpg',
    name: 'Anxiety & Depression',
    time: 28,
    corurl: 'https://www.youtube.com/watch?v=hJbRpHZr_d0',
    students: 'Overcome Stress');

final _course9 = Course(
    imageUrl: 'assets/course3.jpg',
    name: 'Power Yoga',
    time: 39,
    corurl: 'https://www.youtube.com/watch?v=e4TKqJ_LwmM',
    students: 'Workout & Detox');

final List<Course> courses = [
  _course1,
  _course2,
  _course3,
  _course9,
  _course8,
  _course4,
  _course5,
  _course6,
  _course7,
];
