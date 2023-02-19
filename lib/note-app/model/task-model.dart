class Task{
  final String name;
  bool isdone;
  Task({required this.name,this.isdone=false});
  void doneChange(){
    isdone=!isdone;
  }
}