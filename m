From: zohar at linux.ibm.com (Mimi Zohar)
Date: Wed, 27 Feb 2019 09:14:53 -0500
Subject: [PATCH v2 5/5] selftests/ima: loading kernel modules
In-Reply-To: <19d494c6-ecb1-b884-2d23-5f556b3ec05b@kernel.org>
References: <1551223620-11586-1-git-send-email-zohar@linux.ibm.com>
 <1551223620-11586-6-git-send-email-zohar@linux.ibm.com>
 <19d494c6-ecb1-b884-2d23-5f556b3ec05b@kernel.org>
Message-ID: <1551276893.10911.23.camel@linux.ibm.com>

Hi Shuah,

> > diff --git a/tools/testing/selftests/ima/test_kernel_module.sh b/tools/testing/selftests/ima/test_kernel_module.sh
> > new file mode 100755
> > index 000000000000..4009e1b60b03
> > --- /dev/null
> > +++ b/tools/testing/selftests/ima/test_kernel_module.sh
> > @@ -0,0 +1,96 @@
> > +#!/bin/sh
> > +# SPDX-License-Identifier: GPL-2.0-or-later
> 
> Same here
> 
> # SPDX-License-Identifier: GPL-2.0

Sure, I'll make the change here and in the other places.


> > +get_secureboot_mode
> > +if [ $? -eq 0 ]; then
> > +	log_skip "secure boot not enabled"
> > +fi
> > +
> > +# get the kernel config
> > +get_kconfig
> > +
> 
> get_kconfig() will be good candidate as a kselftest common
> function. Is that possible?

Sure, where would it go?  get_kconfig calls log_skip.  I didn't see
any common logging functions.  Petr suggested defining a set of common
logging functions.  Did you want to only make "log_skip" a common
function or the other logging functions log_pass, log_fail, log_info
as well?

Thanks,

Mimi
