package it.dileware.diprix.task_management.model;

import lombok.Data;

import javax.persistence.*;
import java.util.List;

@Data
@Entity
public class Project {

    private @Id
    @GeneratedValue
    Long id;

    private String title;
    private String description;

    private @OneToOne
    User author;

    private @OneToMany List<Task> tasks;
    private @OneToMany List<User> members;

    public Project() {};

    public Project(String title, String description, User author, List<Task> tasks, List<User> members) {
        super();
        this.title = title;
        this.description = description;
        this.author = author;
        this.tasks = tasks;
        this.members = members;
    }
}
