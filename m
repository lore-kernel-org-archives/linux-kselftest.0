From: pvorel at suse.cz (Petr Vorel)
Date: Thu, 28 Feb 2019 20:54:35 +0100
Subject: [PATCH v2 2/5] selftests/ima: define a set of common functions
In-Reply-To: <1551223620-11586-3-git-send-email-zohar@linux.ibm.com>
References: <1551223620-11586-1-git-send-email-zohar@linux.ibm.com>
 <1551223620-11586-3-git-send-email-zohar@linux.ibm.com>
Message-ID: <20190228195435.GA20335@dell5510>

Hi Mimi,

> Define, update and move get_secureboot_mode() to a common file for use
> by other tests.

> Signed-off-by: Mimi Zohar <zohar at linux.ibm.com>
Reviewed-by: Petr Vorel <pvorel at suse.cz>

...
>  ifeq ($(ARCH),x86)
>  TEST_PROGS := test_kexec_load.sh
> +TEST_FILES := common_lib.sh
In case there might be some common library for whole selftest, I'd name this ima_lib.sh.
(even it won't be in the same directory it might be better for readability).

>  include ../lib.mk

> diff --git a/tools/testing/selftests/ima/common_lib.sh b/tools/testing/selftests/ima/common_lib.sh
> new file mode 100755
> index 000000000000..5583ea74c14e
> --- /dev/null
> +++ b/tools/testing/selftests/ima/common_lib.sh
> @@ -0,0 +1,24 @@
> +#!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0-or-later
I'm sorry, that was me who advised GPL v2+ instead of GPL v2 only :).

...

Kind regards,
Petr
