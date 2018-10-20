pragma solidity ^0.4.19;

contract todolist {
    
    struct task  {
        string Description;
        uint MinimumTimeReqired;
        uint TaskFinishPeriod;
        uint Priority;
        uint TaskSettingTime;
        uint TaskEndingTime;
        string Status;
    }
    
    struct Task {
        
        task[10] tasks;
    }
    
    mapping (address => Task)  Tasks;
    mapping (address => uint) lastBid;
    
    function AddNewTask (string _Description, uint _MinimumTimeRequired , uint _TaskFinishPeriod, uint _Priority) returns(string ){
        
        Tasks[msg.sender].tasks[lastBid[msg.sender]].Description = _Description;
        Tasks[msg.sender].tasks[lastBid[msg.sender]].MinimumTimeReqired = _MinimumTimeRequired;
        Tasks[msg.sender].tasks[lastBid[msg.sender]].TaskFinishPeriod = _TaskFinishPeriod;
        Tasks[msg.sender].tasks[lastBid[msg.sender]].Priority = _Priority;
        Tasks[msg.sender].tasks[lastBid[msg.sender]].Status = "Not Complited";
        Tasks[msg.sender].tasks[lastBid[msg.sender]].TaskSettingTime = now;
        Tasks[msg.sender].tasks[lastBid[msg.sender]].TaskEndingTime = now + (3600*_TaskFinishPeriod);
        
        return("New Task Added");
    }
    
    function ShowTasks () returns(string Description, uint MinimumTimeReqired ,uint TaskFinishPeriod,uint Priority , string Status, uint RemainingTime ) {
        uint i=0;
        //for(i=0;i<10;i++)
        return(Tasks[msg.sender].tasks[i].Description,Tasks[msg.sender].tasks[i].MinimumTimeReqired,Tasks[msg.sender].tasks[i].TaskFinishPeriod,Tasks[msg.sender].tasks[i].Priority,Tasks[msg.sender].tasks[i].Status,Tasks[msg.sender].tasks[i].TaskFinishPeriod-now);
        i=1;
        return(Tasks[msg.sender].tasks[i].Description,Tasks[msg.sender].tasks[i].MinimumTimeReqired,Tasks[msg.sender].tasks[i].TaskFinishPeriod,Tasks[msg.sender].tasks[i].Priority,Tasks[msg.sender].tasks[i].Status,Tasks[msg.sender].tasks[i].TaskFinishPeriod-now);
    }

    function ShowTasksUsingMapping() returns(Task ){
        return(Tasks[msg.sender]);
    } 
    
    function ShowTaskUsingArray() returns(task[10]){
        return (Tasks[msg.sender].tasks);
    }
    
    function DriverFunction() {
        AddNewTask("TO make to do list",1,24,1);
    }
    
    
}


