From: shuah at kernel.org (shuah)
Date: Mon, 8 Apr 2019 11:51:45 -0600
Subject: [PATCH linux-next v9 7/7] selftests/ptrace: add a test case for
 PTRACE_GET_SYSCALL_INFO
In-Reply-To: <20190408174236.GH11889@altlinux.org>
References: <20190408174036.GA11889@altlinux.org>
 <20190408174236.GH11889@altlinux.org>
Message-ID: <f2f015da-35d4-7207-cd57-e6589cd9d2c4@kernel.org>

On 4/8/19 11:42 AM, Dmitry V. Levin wrote:
> Check whether PTRACE_GET_SYSCALL_INFO semantics implemented in the kernel
> matches userspace expectations.
> 
> Cc: Oleg Nesterov <oleg at redhat.com>
> Cc: Andy Lutomirski <luto at kernel.org>
> Cc: Shuah Khan <shuah at kernel.org>
> Cc: Elvira Khabirova <lineprinter at altlinux.org>
> Cc: Eugene Syromyatnikov <esyr at redhat.com>
> Cc: linux-kselftest at vger.kernel.org
> Signed-off-by: Dmitry V. Levin <ldv at altlinux.org>
> ---
> 
> Notes:
>      v9: unchanged
>      v8: unchanged
>      v7: unchanged
>      v6: made PTRACE_GET_SYSCALL_INFO return value checks strict
>      v5: initial revision
> 
>   tools/testing/selftests/ptrace/.gitignore     |   1 +
>   tools/testing/selftests/ptrace/Makefile       |   2 +-
>   .../selftests/ptrace/get_syscall_info.c       | 271 ++++++++++++++++++
>   3 files changed, 273 insertions(+), 1 deletion(-)
>   create mode 100644 tools/testing/selftests/ptrace/get_syscall_info.c
> 
> diff --git a/tools/testing/selftests/ptrace/.gitignore b/tools/testing/selftests/ptrace/.gitignore
> index b3e59d41fd82..cfcc49a7def7 100644
> --- a/tools/testing/selftests/ptrace/.gitignore
> +++ b/tools/testing/selftests/ptrace/.gitignore
> @@ -1 +1,2 @@
> +get_syscall_info
>   peeksiginfo
> diff --git a/tools/testing/selftests/ptrace/Makefile b/tools/testing/selftests/ptrace/Makefile
> index 8a2bc5562179..4bc550b6b845 100644
> --- a/tools/testing/selftests/ptrace/Makefile
> +++ b/tools/testing/selftests/ptrace/Makefile
> @@ -1,5 +1,5 @@
>   CFLAGS += -iquote../../../../include/uapi -Wall
>   
> -TEST_GEN_PROGS := peeksiginfo
> +TEST_GEN_PROGS := get_syscall_info peeksiginfo
>   
>   include ../lib.mk
> diff --git a/tools/testing/selftests/ptrace/get_syscall_info.c b/tools/testing/selftests/ptrace/get_syscall_info.c
> new file mode 100644
> index 000000000000..28e972825b74
> --- /dev/null
> +++ b/tools/testing/selftests/ptrace/get_syscall_info.c
> @@ -0,0 +1,271 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later
> + *

This should be just GPL-2.0+

The rest looks good to me. Assuming this patch has dependency on the
rest of the patches in this series and once the above change is made:

Acked-by: Shuah Khan <shuah at kernel.org>

thnaks,
-- Shuah
