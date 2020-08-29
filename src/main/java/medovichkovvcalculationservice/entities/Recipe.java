package medovichkovvcalculationservice.entities;

import lombok.*;
import medovichkovvcalculationservice.enums.PrivacyType;

import javax.persistence.*;
import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.Collection;
import java.util.Objects;

/**
 * @author ivand on 12.07.2020
 */

/**
 * Recipe
 */
@Entity
@Table(name = "MC_RECIPE")
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class Recipe implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "recipeSeq")
    @SequenceGenerator(name = "recipeSeq", sequenceName = "MC_RECIPE_SEQ")
    @Column(name = "ID", nullable = false)
    private Long id;

    @Column(name = "USER_ID", nullable = false)
    private Long userId;

    @OneToMany(mappedBy = "recipe")
    private Collection<Component> components;

    @Column(name = "NAME", nullable = false)
    private String name;

    @Column(name = "CREATION_DATE", nullable = false)
    private LocalDateTime creationDate;

    @Column(name = "FAVORITE")
    private boolean isFavorite;

    @Column(name = "PRIVACY", nullable = false)
    @Enumerated(value = EnumType.STRING)
    private PrivacyType privacyType;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Recipe recipe = (Recipe) o;
        return isFavorite == recipe.isFavorite &&
                userId.equals(recipe.userId) &&
                Objects.equals(components, recipe.components) &&
                name.equals(recipe.name) &&
                privacyType == recipe.privacyType;
    }

    @Override
    public int hashCode() {
        return Objects.hash(userId, components, name, isFavorite, privacyType);
    }
}
