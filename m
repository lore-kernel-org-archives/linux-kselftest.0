From: keescook@chromium.org (Kees Cook)
Date: Mon, 14 Jan 2019 15:16:17 -0800
Subject: [PATCH 05/12] selftests: seccomp: Fix test dependencies and rules
In-Reply-To: <20190114135144.26096-6-geert+renesas@glider.be>
References: <20190114135144.26096-1-geert+renesas@glider.be>
 <20190114135144.26096-6-geert+renesas@glider.be>
Message-ID:
 <CAGXu5j+SHuqv0=gxdsYBqraPyZMWdVD+uxrtYrepVZBX3ZzTKw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190114231617.Wi1NYvDpAjagXRR0y0uA0ZH1Cu7FjxYL2vvE362cM8w@z>

On Mon, Jan 14, 2019 at 5:51 AM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> When building kselftest in a separate output directory, the seccomp_bpf
> binary ends up in the source directory instead of in the output
> directory, and the build of seccomp_benchmark fails:
>
>     make[5]: *** No rule to make target 'seccomp_benchmark', needed by 'all'.  Stop.
>
> Fix this by declaring both test binaries using TEST_GEN_PROGS, and using
> the build support from lib.mk properly.
>
> Fixes: 967d7ba841513910 ("selftests/seccomp: Add simple seccomp overhead benchmark")
> Signed-off-by: Geert Uytterhoeven <geert+renesas at glider.be>
> ---
>  tools/testing/selftests/seccomp/Makefile | 15 +++------------
>  1 file changed, 3 insertions(+), 12 deletions(-)
>
> diff --git a/tools/testing/selftests/seccomp/Makefile b/tools/testing/selftests/seccomp/Makefile
> index fce7f4ce069251a6..c728bd7a366f78b9 100644
> --- a/tools/testing/selftests/seccomp/Makefile
> +++ b/tools/testing/selftests/seccomp/Makefile
> @@ -1,17 +1,8 @@
>  # SPDX-License-Identifier: GPL-2.0
> -all:
>
> -include ../lib.mk
> -
> -.PHONY: all clean
> -
> -BINARIES := seccomp_bpf seccomp_benchmark
>  CFLAGS += -Wl,-no-as-needed -Wall
> +LDFLAGS += -lpthread
>
> -seccomp_bpf: seccomp_bpf.c ../kselftest_harness.h
> -       $(CC) $(CFLAGS) $(LDFLAGS) -lpthread $< -o $@
> +TEST_GEN_PROGS = seccomp_bpf seccomp_benchmark

This breaks the dep on ../kselftest_harness.h. Changes go unnoticed if
this is changed:

$ touch tools/testing/selftests/kselftest_harness.h
$ make O=/tmp/kselftest -C tools/testing/selftests
...
make[1]: Entering directory
'/home/kees/src/linux/tools/testing/selftests/seccomp'
make[1]: Nothing to be done for 'all'.
make[1]: Leaving directory
'/home/kees/src/linux/tools/testing/selftests/seccomp'
...

>
> -TEST_PROGS += $(BINARIES)
> -EXTRA_CLEAN := $(BINARIES)
> -
> -all: $(BINARIES)
> +include ../lib.mk
> --
> 2.17.1
>


-- 
Kees Cook
