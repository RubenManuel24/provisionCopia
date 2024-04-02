import "package:flutter/material.dart";

class TaskComponent extends StatefulWidget {
  final nome_tarefa;
  final onChange; 
    const TaskComponent({super.key, required this.nome_tarefa, this.onChange,  });

  @override
  State<TaskComponent> createState() => _TaskComponentState();
}

class _TaskComponentState extends State<TaskComponent> {
  final bool _isChecked=false;
  final List=[];
  
  @override
  Widget build(BuildContext context)
  
  {
    return CheckboxListTile(
      title: Text(widget.nome_tarefa),
      value: _isChecked, 
      activeColor: Colors.orange,
      checkColor: Colors.black,
      tileColor: Colors.black12,
      controlAffinity: ListTileControlAffinity.leading,
      //tristate: true,

      onChanged: widget.onChange);
      
    
         
        
         
                    
                  
                  
  }
}