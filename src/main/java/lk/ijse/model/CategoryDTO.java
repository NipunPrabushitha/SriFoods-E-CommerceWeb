package lk.ijse.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data

public class CategoryDTO {
    private int id;
    private String categoryName;
    private String description;
    private String filepath;

    public CategoryDTO(String categoryName, String description, String filepath) {
        this.categoryName = categoryName;
        this.description = description;
        this.filepath = filepath;
    }
}
