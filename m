From: daniel@iogearbox.net (Daniel Borkmann)
Date: Mon, 14 May 2018 21:20:24 +0200
Subject: [PATCH v3] selftests: add headers_install to lib.mk
In-Reply-To: <20180514115809.9803-1-anders.roxell@linaro.org>
References: <20180413090351.25662-1-anders.roxell@linaro.org>
 <20180514115809.9803-1-anders.roxell@linaro.org>
Message-ID: <1a021bf3-cf93-aa12-c5a8-1ea6c7900fbb@iogearbox.net>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180514192024.Djxz8ZnIeqX7tTjroxIHjhei4fscIkyezWQjgKzonSA@z>

On 05/14/2018 01:58 PM, Anders Roxell wrote:
> If the kernel headers aren't installed we can't build all the tests.
> Add a new make target rule 'khdr' in the file lib.mk to generate the
> kernel headers and that gets include for every test-dir Makefile that
> includes lib.mk If the testdir in turn have its own sub-dirs the
> top_srcdir needs to be set to the linux-rootdir to be able to generate
> the kernel headers.
> 
> Signed-off-by: Anders Roxell <anders.roxell at linaro.org>
> Reviewed-by: Fathi Boudra <fathi.boudra at linaro.org>
> ---
>  Makefile                                          | 14 +-------------
>  scripts/subarch.include                           | 13 +++++++++++++
>  tools/testing/selftests/android/Makefile          |  2 +-
>  tools/testing/selftests/android/ion/Makefile      |  1 +
>  tools/testing/selftests/bpf/Makefile              |  5 ++---
>  tools/testing/selftests/futex/functional/Makefile |  1 +
>  tools/testing/selftests/gpio/Makefile             |  7 ++-----
>  tools/testing/selftests/kvm/Makefile              |  7 ++-----
>  tools/testing/selftests/lib.mk                    | 10 ++++++++++
>  tools/testing/selftests/vm/Makefile               |  4 ----
>  10 files changed, 33 insertions(+), 31 deletions(-)
>  create mode 100644 scripts/subarch.include
[...]
> diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftests/bpf/Makefile
> index 438d4f93875b..9741609a0eb1 100644
> --- a/tools/testing/selftests/bpf/Makefile
> +++ b/tools/testing/selftests/bpf/Makefile
> @@ -16,9 +16,8 @@ LDLIBS += -lcap -lelf -lrt -lpthread
>  TEST_CUSTOM_PROGS = $(OUTPUT)/urandom_read
>  all: $(TEST_CUSTOM_PROGS)
>  
> -$(TEST_CUSTOM_PROGS): urandom_read
> -
> -urandom_read: urandom_read.c
> +$(TEST_CUSTOM_PROGS):| khdr
> +$(TEST_CUSTOM_PROGS): urandom_read.c
>  	$(CC) -o $(TEST_CUSTOM_PROGS) -static $<
>  
>  # Order correspond to 'make run_tests' order

Can you elaborate on the error in BPF you're seeing that would force a
headers_install for it? Some people are running the tools/ infrastructure
(incl. BPF kselftests) outside of kernel tree where this dependency would
break their setup. Why BPF bits cannot be fixed otherwise?

Thanks,
Daniel
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
