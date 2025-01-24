package lk.ijse.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Data
public class Category {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(nullable = false, unique = true)
    private String CategoryName;

    private String description;

    private String file;

    public Category(String categoryName, String description, String file) {
        CategoryName = categoryName;
        this.description = description;
        this.file = file;
    }
}
