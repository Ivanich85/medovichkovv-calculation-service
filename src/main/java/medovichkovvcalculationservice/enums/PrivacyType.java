package medovichkovvcalculationservice.enums;

import lombok.Getter;

/**
 * Defines, who can watch user`s recipes
 *
 * ALL - all users
 * FRIEND - owner`s friends only
 * NONE - nobody but the owner only
 **/
public enum PrivacyType {
    ALL,
    FRIEND,
    NONE
}