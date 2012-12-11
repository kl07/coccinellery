//
//  Add missing call to gdth_ioctl_free
//
// Target:  Linux
// Copyright:  Copyright: 2012 - LIP6/INRIA
// License:  Licensed under GPLv2 or any later version.
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
// URL: http://coccinelle.lip6.fr/ 
// URL: http://coccinellery.org/ 

@@
expression buf,ha,len,addr,E;
@@

buf = gdth_ioctl_alloc(ha, len, FALSE, &addr)
... when != false buf != NULL
    when != true buf == NULL
    when != \(E = buf\|buf = E\)
    when != gdth_ioctl_free(ha, len, buf, addr)
*return ...;
