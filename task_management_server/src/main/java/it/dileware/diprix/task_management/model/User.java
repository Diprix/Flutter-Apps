package it.dileware.diprix.task_management.model;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Data
@Entity
public class User {

    private @Id
    @GeneratedValue
    Long id;

    private String nome;
    private String cognome;
    private String email;

    public User() {};

    public User(String nome, String cognome, String email) {
        super();
        this.nome = nome;
        this.cognome = cognome;
        this.email = email;
    }
}
