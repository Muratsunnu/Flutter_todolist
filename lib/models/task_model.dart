import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class Task {
  final String id;
  final String title;
  final String? description;
  final DateTime? date;
  bool isCompleted;

  Task({
    required this.id,
    required this.title,
    this.description,
    this.date,
    this.isCompleted = false,
  });

  // JSON'a dönüştürme
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'date': date?.toIso8601String(),
      'isCompleted': isCompleted,
    };
  }

  // JSON'dan oluşturma
  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      date: json['date'] != null ? DateTime.parse(json['date']) : null,
      isCompleted: json['isCompleted'] ?? false,
    );
  }
}

class TaskProvider with ChangeNotifier {
  List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  // SharedPreferences'ten yükleme
  Future<void> loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final taskStrings = prefs.getStringList('tasks') ?? [];
    _tasks = taskStrings.map((str) => Task.fromJson(json.decode(str))).toList();
    notifyListeners();
  }

  // Task ekleme
  Future<void> addTask(Task task) async {
    _tasks.add(task);
    await _saveTasks();
    notifyListeners();
  }

  // Task silme
  Future<void> removeTask(String id) async {
    _tasks.removeWhere((task) => task.id == id);
    await _saveTasks();
    notifyListeners();
  }

  // Task tamamlama durumunu değiştirme
  Future<void> toggleTaskCompletion(String id) async {
    final index = _tasks.indexWhere((task) => task.id == id);
    if (index != -1) {
      _tasks[index].isCompleted = !_tasks[index].isCompleted;
      await _saveTasks();
      notifyListeners();
    }
  }

  // SharedPreferences'e kaydetme
  Future<void> _saveTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final taskStrings = _tasks.map((task) => json.encode(task.toJson())).toList();
    await prefs.setStringList('tasks', taskStrings);
  }

  // Örnek verilerle başlatma (isteğe bağlı)
  Future<void> initializeWithSampleData() async {
    if (_tasks.isEmpty) {
      _tasks = [
        Task(
          id: DateTime.now().toString(),
          title: 'Örnek görev 1',
          description: 'Bu bir açıklamadır',
          date: DateTime.now().add(const Duration(days: 1)),
        ),
        Task(
          id: DateTime.now().add(const Duration(seconds: 1)).toString(),
          title: 'Örnek görev 2',
          isCompleted: true,
        ),
      ];
      await _saveTasks();
      notifyListeners();
    }
  }
}