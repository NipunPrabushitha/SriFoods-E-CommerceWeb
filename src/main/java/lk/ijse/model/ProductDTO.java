package lk.ijse.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data

public class ProductDTO {
    private long id;
    private String name;
    private String description;
    private double price;
    private int stock;
    private CategoryDTO category;
    private String imagePath;

    public ProductDTO(String name, String description, double price, int stock, CategoryDTO category, String imagePath) {
        this.name = name;
        this.description = description;
        this.price = price;
        this.stock = stock;
        this.category = category;
        this.imagePath = imagePath;
    }
}
