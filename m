From: shuah@kernel.org (shuah)
Date: Tue, 26 Feb 2019 18:39:57 -0700
Subject: [PATCH v2 3/5] selftests/ima: define common logging functions
In-Reply-To: <1551223620-11586-4-git-send-email-zohar@linux.ibm.com>
References: <1551223620-11586-1-git-send-email-zohar@linux.ibm.com>
 <1551223620-11586-4-git-send-email-zohar@linux.ibm.com>
Message-ID: <69140d9c-7e76-9ef7-31af-65208a126f4b@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190227013957.qikP_C89386R6_0PnQ_VyX4f5FhbnEs2e--WmoYKLRo@z>

On 2/26/19 4:26 PM, Mimi Zohar wrote:
> Define log_info, log_pass, log_fail, and log_skip functions.
> 
> Suggested-by: Petr Vorel <pvorel at suse.cz>
> Signed-off-by: Mimi Zohar <zohar at linux.ibm.com>
> ---
>   tools/testing/selftests/ima/common_lib.sh      | 43 +++++++++++++++++++++++---
>   tools/testing/selftests/ima/test_kexec_load.sh | 19 +++---------
>   2 files changed, 43 insertions(+), 19 deletions(-)
> 
> diff --git a/tools/testing/selftests/ima/common_lib.sh b/tools/testing/selftests/ima/common_lib.sh
> index 5583ea74c14e..c6d04006281d 100755
> --- a/tools/testing/selftests/ima/common_lib.sh
> +++ b/tools/testing/selftests/ima/common_lib.sh
> @@ -1,5 +1,36 @@
>   #!/bin/sh
>   # SPDX-License-Identifier: GPL-2.0-or-later

Same here:

# SPDX-License-Identifier: GPL-2.0

thanks,
-- Shuah
