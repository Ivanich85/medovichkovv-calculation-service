package medovichkovvcalculationservice.repository;

import medovichkovvcalculationservice.entity.Ingredient;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author ivand on 18.10.2020
 */
@Repository
@Transactional
public class IngredientRepository extends AbstractRepository  {

    @Transactional(readOnly = true)
    public List<Ingredient> getAllForUser(Long userId) {
        return entityManager.createQuery(
                "select i from Ingredient i " +
                        "where i.userId = :userId " +
                        "order by i.name ", Ingredient.class)
                .setParameter("userId", userId)
                .getResultList();
    }

    public Ingredient getByIdAndUser(Long ingredientId, Long userId) {
        return entityManager.createQuery(
                "select i from Ingredient i " +
                        "where i.id = :ingredientId " +
                        "and i.userId = :userId", Ingredient.class)
                .setParameter("ingredientId", ingredientId)
                .setParameter("userId", userId)
                .setMaxResults(1)
                .getResultList()
                .stream()
                .findFirst().orElse(null);

    }

    public Ingredient save(Ingredient ingredient) {
        if (ingredient.getId() == null) {
            entityManager.persist(ingredient);
            return ingredient;
        }
        return entityManager.merge(ingredient);
    }

    public void delete(Long ingredientId) {
        removeAllRelatedIngredients(List.of(ingredientId));
        entityManager.createQuery(
                "delete " +
                        "from Ingredient i " +
                        "where i.id = :ingredientId")
                .setParameter("ingredientId", ingredientId)
                .executeUpdate();
    }

    public void deleteIngredients(List<Long> ingredientIds) {
        removeAllRelatedIngredients(ingredientIds);
        entityManager.createQuery(
                "delete " +
                        "from Ingredient i " +
                        "where i.id in :ingredientIds")
                .setParameter("ingredientIds", ingredientIds)
                .executeUpdate();
    }

    private void removeAllRelatedIngredients(List<Long> ingredientIds) {
        entityManager.createQuery(
                "delete " +
                        "from RecipeIngredient ri " +
                        "where ri.ingredient.id in :ingredientIds")
                .setParameter("ingredientIds", ingredientIds)
                .executeUpdate();
    }
}
