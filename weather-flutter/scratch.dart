//learning for sync, async-await, future
void main() {
  //performTasks();   //sync 123 , async 132
  //performTasksAsyc(); //13(/w null)2 -> async - await
  performTasksAsyc2(); //123(/w 2) -> async - await -> futures
}

void performTasks() {
  //sequential
  task1();
  task2();
  task3();
}

void performTasksAsyc() async {
  task1();
  String task4Res = task22();
  task33(task4Res);
}

void performTasksAsyc2() async {
  task1();
  String task4Res = await task222();
  task33(task4Res);
}

void task1() {
  String rsult = 'task 1 data';
  print('Task 1 completed');
}

void task2() {
  Duration threeSec = Duration(seconds: 3);
  /*Sync
  sleep(threeSec);
  String rsult='task 1 data';
  print('Task 3 completed');
  */

  //Async
  Future.delayed(threeSec, () {
    String rsult = 'task 2 data';
    print('Task 2 completed');
  });
}

String task22() {
  Duration threeSec = Duration(seconds: 3);
  String rsult;

  Future.delayed(threeSec, () {
    String rsult = 'task 2 data';
    print('Task 2 completed');
  });
  return rsult;
}

Future<String> task222() async {
  Duration threeSec = Duration(seconds: 3);
  String rsult;

  await Future.delayed(threeSec, () {
    rsult = 'task 2 data';
    print('Task 2 completed');
  });
  return rsult;
}

void task3() {
  String rsult = 'task 3 data';
  print('Task 3 completed ');
}

void task33(String task4Data) {
  String rsult = 'task 3 data';
  print('Task 3 completed with $task4Data');
}
