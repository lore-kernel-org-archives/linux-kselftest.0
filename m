From: pvorel at suse.cz (Petr Vorel)
Date: Fri, 1 Mar 2019 00:14:41 +0100
Subject: [PATCH v2 5/5] selftests/ima: loading kernel modules
In-Reply-To: <ab45b574-4791-d42a-f566-ab9886525549@kernel.org>
References: <1551223620-11586-1-git-send-email-zohar@linux.ibm.com>
 <1551223620-11586-6-git-send-email-zohar@linux.ibm.com>
 <19d494c6-ecb1-b884-2d23-5f556b3ec05b@kernel.org>
 <1551276893.10911.23.camel@linux.ibm.com>
 <ab45b574-4791-d42a-f566-ab9886525549@kernel.org>
Message-ID: <20190228231441.GF20335@dell5510>

Hi Shuah,

> We can do this as a separate effort in the interest of getting these
> in the interest of getting these in.

> We have common functions in ksefltest.h for c and we don't have them
> for tests scripts. We might be able to collect common routines such
> as get_kconfig into a common .sh and include in tests. If you have time
> to do this, that will be great. It can be done as a separate effort.
Some inspiration, what sort of helpers can be for shell see LTP shell API [1].
These helpers tests help tests to be short, readable and with unified output.
(I like library variables [2] which are self describing and making test even
shorter), setup and cleanup functions called automatically, ...
The same applies for C API [3] (e.g. SAFE_*() helpers for handling errors, ...).

I wonder if there is even any interest of having any sort of helpers or even
framework for shell, when so far there was nothing.

> thanks,
> -- Shuah


Kind regards,
Petr

[1] https://github.com/linux-test-project/ltp/wiki/Test-Writing-Guidelines#23-writing-a-testcase-in-shell
[2] https://github.com/linux-test-project/ltp/wiki/Test-Writing-Guidelines#232-library-variables
[3] https://github.com/linux-test-project/ltp/wiki/Test-Writing-Guidelines#22-writing-a-test-in-c
