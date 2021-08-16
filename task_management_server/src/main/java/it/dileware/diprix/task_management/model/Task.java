package it.dileware.diprix.task_management.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import lombok.Data;

@Data
@Entity
public class Task {

    private @Id @GeneratedValue Long id;

    private String title;
    private String description;
    private Boolean completed = false;
    private String assignedId;

    public Task() {}

    public Task(String title, String description, Boolean completed, String assignedId) {
        super();
        this.title = title;
        this.description = description;
        this.completed = completed;
        this.assignedId = assignedId;
    }

}
