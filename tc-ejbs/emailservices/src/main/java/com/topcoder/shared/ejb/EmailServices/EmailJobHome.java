package com.topcoder.shared.ejb.EmailServices;

import javax.ejb.CreateException;
import javax.ejb.EJBHome;
import java.rmi.RemoteException;

/**
 * @author   Eric Ellingson
 * @version  $Revision: 31146 $
 *
 */
public interface EmailJobHome extends EJBHome {
    /**
     *
     * @return
     * @throws CreateException
     * @throws RemoteException
     */
    public EmailJob create() throws CreateException, RemoteException;
}

