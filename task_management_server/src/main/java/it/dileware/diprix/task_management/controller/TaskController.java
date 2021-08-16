package it.dileware.diprix.task_management.controller;
import it.dileware.diprix.task_management.model.Task;
import it.dileware.diprix.task_management.repository.TaskRepository;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/v1")
public class TaskController {

    private final TaskRepository taskRepository;

    TaskController(TaskRepository taskRepository) {
        this.taskRepository = taskRepository;
    }


    @GetMapping("/tasks")
    List<Task> getTasks(){
       return taskRepository.findAll();
    }

    @GetMapping("/task/{taskId}")
    Task getTask(@PathVariable Long taskId){
        return taskRepository.findById(taskId).orElseThrow(RuntimeException::new);
    }

    @PutMapping("/task/{taskId}")
    Task updateTask(@PathVariable Long taskId, @RequestBody Task taskDTO){
        Task taskToUpdate = taskRepository.findById(taskId).orElseThrow(RuntimeException::new);
        taskToUpdate.setTitle(taskDTO.getTitle());
        taskToUpdate.setDescription(taskDTO.getDescription());
        taskToUpdate.setCompleted(taskDTO.getCompleted());

        return taskRepository.save(taskToUpdate);

    }

    @PostMapping("/task")
    Task createTask(@RequestBody Task newTask){
        return taskRepository.save(newTask);
    }

    @DeleteMapping("/task/{taskId}")
    void deleteTask(@PathVariable Long taskId){
        Task deleteTask = taskRepository.findById(taskId).orElseThrow(RuntimeException::new);
        taskRepository.delete(deleteTask);
    }



}
