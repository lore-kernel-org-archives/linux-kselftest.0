From: shuah@kernel.org (shuah)
Date: Wed, 27 Feb 2019 08:33:49 -0700
Subject: [PATCH v2 5/5] selftests/ima: loading kernel modules
In-Reply-To: <1551276893.10911.23.camel@linux.ibm.com>
References: <1551223620-11586-1-git-send-email-zohar@linux.ibm.com>
 <1551223620-11586-6-git-send-email-zohar@linux.ibm.com>
 <19d494c6-ecb1-b884-2d23-5f556b3ec05b@kernel.org>
 <1551276893.10911.23.camel@linux.ibm.com>
Message-ID: <ab45b574-4791-d42a-f566-ab9886525549@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190227153349.n3pGH7sEUsEdNrpaKHb1I2ZtzBTyO9woOdUUWvmTMnA@z>

Hi Mimi,

On 2/27/19 7:14 AM, Mimi Zohar wrote:
> Hi Shuah,
> 
>>> diff --git a/tools/testing/selftests/ima/test_kernel_module.sh b/tools/testing/selftests/ima/test_kernel_module.sh
>>> new file mode 100755
>>> index 000000000000..4009e1b60b03
>>> --- /dev/null
>>> +++ b/tools/testing/selftests/ima/test_kernel_module.sh
>>> @@ -0,0 +1,96 @@
>>> +#!/bin/sh
>>> +# SPDX-License-Identifier: GPL-2.0-or-later
>>
>> Same here
>>
>> # SPDX-License-Identifier: GPL-2.0
> 
> Sure, I'll make the change here and in the other places.
> 
> 

Thanks.

>>> +get_secureboot_mode
>>> +if [ $? -eq 0 ]; then
>>> +	log_skip "secure boot not enabled"
>>> +fi
>>> +
>>> +# get the kernel config
>>> +get_kconfig
>>> +
>>
>> get_kconfig() will be good candidate as a kselftest common
>> function. Is that possible?
> 
> Sure, where would it go?  get_kconfig calls log_skip.  I didn't see
> any common logging functions.  Petr suggested defining a set of common
> logging functions.  Did you want to only make "log_skip" a common
> function or the other logging functions log_pass, log_fail, log_info
> as well?
> 

We can do this as a separate effort in the interest of getting these
in the interest of getting these in.

We have common functions in ksefltest.h for c and we don't have them
for tests scripts. We might be able to collect common routines such
as get_kconfig into a common .sh and include in tests. If you have time
to do this, that will be great. It can be done as a separate effort.

thanks,
-- Shuah
