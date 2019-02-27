From: zohar at linux.ibm.com (Mimi Zohar)
Date: Wed, 27 Feb 2019 13:37:52 -0500
Subject: [PATCH v2 5/5] selftests/ima: loading kernel modules
In-Reply-To: <ab45b574-4791-d42a-f566-ab9886525549@kernel.org>
References: <1551223620-11586-1-git-send-email-zohar@linux.ibm.com>
 <1551223620-11586-6-git-send-email-zohar@linux.ibm.com>
 <19d494c6-ecb1-b884-2d23-5f556b3ec05b@kernel.org>
 <1551276893.10911.23.camel@linux.ibm.com>
 <ab45b574-4791-d42a-f566-ab9886525549@kernel.org>
Message-ID: <1551292672.10911.68.camel@linux.ibm.com>


> >>> +get_secureboot_mode
> >>> +if [ $? -eq 0 ]; then
> >>> +	log_skip "secure boot not enabled"
> >>> +fi
> >>> +
> >>> +# get the kernel config
> >>> +get_kconfig
> >>> +
> >>
> >> get_kconfig() will be good candidate as a kselftest common
> >> function. Is that possible?
> > 
> > Sure, where would it go?  get_kconfig calls log_skip.  I didn't see
> > any common logging functions.  Petr suggested defining a set of common
> > logging functions.  Did you want to only make "log_skip" a common
> > function or the other logging functions log_pass, log_fail, log_info
> > as well?
> > 
> 
> We can do this as a separate effort in the interest of getting these
> in the interest of getting these in.
> 
> We have common functions in ksefltest.h for c and we don't have them
> for tests scripts. We might be able to collect common routines such
> as get_kconfig into a common .sh and include in tests. If you have time
> to do this, that will be great. It can be done as a separate effort.

Ok.  For now, I'm waiting for some review/ack's.

Mimi
