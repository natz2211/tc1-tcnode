package com.topcoder.web.aolicq.validation;

import com.topcoder.web.common.validation.NonEmptyValidator;
import com.topcoder.web.common.validation.ValidationInput;
import com.topcoder.web.common.validation.ValidationResult;
import com.topcoder.web.common.validation.Validator;

/**
 * @author dok
 * @version $Revision: 73726 $ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 31, 2006
 */
public class PrizeDescriptionValidator implements Validator {
    public ValidationResult validate(ValidationInput input) {
        return new NonEmptyValidator("Please enter the prize description for this contest.").validate(input);
    }
}
