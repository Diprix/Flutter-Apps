package it.dileware.diprix.task_management.controller;

import it.dileware.diprix.task_management.model.Project;
import it.dileware.diprix.task_management.repository.ProjectRepository;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/v1")
public class ProjectController {

    private final ProjectRepository projectRepository;

    ProjectController(ProjectRepository projectRepository) {
        this.projectRepository = projectRepository;
    }

    @GetMapping("/projects")
    List<Project> getProgetti(){
        return projectRepository.findAll();
    }


    @PostMapping("/project")
    Project creaProgetto(@RequestBody Project newProject) {
        return projectRepository.save(newProject);
    }
}
