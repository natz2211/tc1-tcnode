/*
 * Copyright (C) 2012 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.ejb.pacts;

import java.sql.SQLException;

/**
 * Payment for bug fixes work associated with a cockpit project.
 *
 * VERY IMPORTANT: remember to update serialVersionUID if needed
 *
 * @author VolodymyrK
 */
public class ProjectBugFixesPayment extends CockpitProjectReferencePayment {

    /**
     * Please change that number if you affect the fields in a way that will affect the
     * serialization for this object, i.e. when data members are changed.
     * @see http://java.sun.com/j2se/1.3/docs/guide/serialization/spec/version.doc7.html
     */
    private static final long serialVersionUID = 1L;

    /**
     * Create a bug fix payment associated with a cockpit project.
     *
     * @param coderId coder to be paid.
     * @param grossAmount amount to be paid.
     * @param client the client of the project.
     * @param projectId project that is being paid.
     */
    public ProjectBugFixesPayment(long coderId, double grossAmount, String client, long projectId) {
        super(PROJECT_BUG_FIXES_PAYMENT, coderId, grossAmount, client, projectId);
    }

    /**
     * Create a bug fix payment associated with a cockpit project.
     *
     * @param coderId coder to be paid.
     * @param grossAmount amount to be paid.
     * @param projectId project that is being paid.
     * @param placed the place of the coder in the contest.
     */
    public ProjectBugFixesPayment(long coderId, double grossAmount, long projectId) {
        this(coderId, grossAmount, null, projectId);
    }

    /**
     * Get a processor for this type of payment.
     *
     * @return a processor for this type of payment.
     */
    @Override
    protected BasePayment.Processor getProcessor() {
        return new Processor();
    }

    /**
     * Processor for bug fixes payments.
     *
     * This class will implement <code>lookupDescription</code> to allow custom description
     * generation for the copilot payment.
     */
    protected static class Processor extends CockpitProjectReferencePayment.Processor {
        /**
         * Get the description for the payment.
         *
         * @param payment payment to create its description.
         * @return the description for the payment.
         * @throws SQLException if any error occurs while accessing the database.
         */
        @Override
        public String lookupDescription(BasePayment payment) throws SQLException {
            return super.lookupReferenceDescription(payment) + " - Bug Fixes";
        }
    }
}
