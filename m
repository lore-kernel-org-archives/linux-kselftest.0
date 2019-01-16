From: shuah@kernel.org (shuah)
Date: Wed, 16 Jan 2019 16:11:55 -0700
Subject: [PATCH v1] selftests: add binderfs selftests
In-Reply-To: <20190116222745.26217-1-christian@brauner.io>
References: <20190116222745.26217-1-christian@brauner.io>
Message-ID: <e9f13d9b-69bf-bb01-d48a-52af77d76db4@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190116231155.Ax7xY4KzjnWWKXRjQaazvqYGgzHmDzMJ3svgoluIyiI@z>

Hi Christian,

On 1/16/19 3:27 PM, Christian Brauner wrote:
> This adds the promised selftest for binderfs. It will verify the following
> things:
> - binderfs mounting works
> - binder device allocation works
> - performing a binder ioctl() request through a binderfs device works
> - binder device removal works
> - binder-control removal fails
> - binderfs unmounting works
> 

Thanks for the patch. A few comments below.

> Cc: Todd Kjos <tkjos at google.com>
> Signed-off-by: Christian Brauner <christian.brauner at ubuntu.com>
> ---
> /* Changelog */
> 
> v1:
> - check for ENODEV on mount failure to detect whether binderfs is
>    available
>    If it is not, skip the test and exit with success.
> ---
>   tools/testing/selftests/Makefile              |   1 +
>   .../selftests/filesystems/binderfs/.gitignore |   1 +
>   .../selftests/filesystems/binderfs/Makefile   |   6 +
>   .../filesystems/binderfs/binderfs_test.c      | 126 ++++++++++++++++++
>   .../selftests/filesystems/binderfs/config     |   3 +
>   5 files changed, 137 insertions(+)
>   create mode 100644 tools/testing/selftests/filesystems/binderfs/.gitignore
>   create mode 100644 tools/testing/selftests/filesystems/binderfs/Makefile
>   create mode 100644 tools/testing/selftests/filesystems/binderfs/binderfs_test.c
>   create mode 100644 tools/testing/selftests/filesystems/binderfs/config
> 
> diff --git a/tools/testing/selftests/Makefile b/tools/testing/selftests/Makefile
> index 1a2bd15c5b6e..400ee81a3043 100644
> --- a/tools/testing/selftests/Makefile
> +++ b/tools/testing/selftests/Makefile
> @@ -10,6 +10,7 @@ TARGETS += drivers/dma-buf
>   TARGETS += efivarfs
>   TARGETS += exec
>   TARGETS += filesystems
> +TARGETS += filesystems/binderfs
>   TARGETS += firmware
>   TARGETS += ftrace
>   TARGETS += futex
> diff --git a/tools/testing/selftests/filesystems/binderfs/.gitignore b/tools/testing/selftests/filesystems/binderfs/.gitignore
> new file mode 100644
> index 000000000000..8a5d9bf63dd4
> --- /dev/null
> +++ b/tools/testing/selftests/filesystems/binderfs/.gitignore
> @@ -0,0 +1 @@
> +binderfs_test
> diff --git a/tools/testing/selftests/filesystems/binderfs/Makefile b/tools/testing/selftests/filesystems/binderfs/Makefile
> new file mode 100644
> index 000000000000..58cb659b56b4
> --- /dev/null
> +++ b/tools/testing/selftests/filesystems/binderfs/Makefile
> @@ -0,0 +1,6 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +CFLAGS += -I../../../../../usr/include/
> +TEST_GEN_PROGS := binderfs_test
> +
> +include ../../lib.mk
> diff --git a/tools/testing/selftests/filesystems/binderfs/binderfs_test.c b/tools/testing/selftests/filesystems/binderfs/binderfs_test.c
> new file mode 100644
> index 000000000000..34361efcb9c8
> --- /dev/null
> +++ b/tools/testing/selftests/filesystems/binderfs/binderfs_test.c
> @@ -0,0 +1,126 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#define _GNU_SOURCE
> +#include <errno.h>
> +#include <fcntl.h>
> +#include <sched.h>
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <string.h>
> +#include <sys/ioctl.h>
> +#include <sys/mount.h>
> +#include <sys/stat.h>
> +#include <sys/types.h>
> +#include <unistd.h>
> +#include <linux/android/binder.h>
> +#include <linux/android/binderfs.h>
> +#include "../../kselftest.h"
> +
> +int main(int argc, char *argv[])
> +{
> +	int fd, ret, saved_errno;
> +	size_t len;
> +	struct binderfs_device device = { 0 };
> +	struct binder_version version = { 0 };
> +
> +	ret = unshare(CLONE_NEWNS);
> +	if (ret < 0)
> +		ksft_exit_fail_msg("%s - Failed to unshare mount namespace\n",
> +				   strerror(errno));
> +
> +	ret = mount(NULL, "/", NULL, MS_REC | MS_PRIVATE, 0);
> +	if (ret < 0)
> +		ksft_exit_fail_msg("%s - Failed to mount / as private\n",
> +				   strerror(errno));
> +

If this test requires user to be root, please add check for root uid and
do a skip the test with kselftest skip code.

> +	ret = mkdir("/dev/binderfs", 0755);
> +	if (ret < 0 && errno != EEXIST)
> +		ksft_exit_fail_msg(
> +			"%s - Failed to create binderfs mountpoint\n",
> +			strerror(errno));
> +
> +	ret = mount(NULL, "/dev/binderfs", "binder", 0, 0);
> +	if (ret < 0) {
> +		if (errno != ENODEV)
> +			ksft_exit_fail_msg("%s - Failed to mount binderfs\n",
> +					   strerror(errno));
> +
> +		ksft_test_result_skip(
> +			"The Android binderfs filesystem is not available\n")

Use ksft_exit_skip() instead of ksft_test_result_skip()

> +		ksft_exit_pass();

ksft_exit_pass() would result in false pass cases. Skip is the correct
exit code.

Think about other exit paths to see if skip is more appropriate.

thanks,
-- Shuah
