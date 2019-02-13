From: willemdebruijn.kernel@gmail.com (Willem de Bruijn)
Date: Wed, 13 Feb 2019 09:44:49 -0500
Subject: [PATCH 1/1] selftests: fix timestamping Makefile
In-Reply-To: <20190213032932.2805-1-deepa.kernel@gmail.com>
References: <20190213032932.2805-1-deepa.kernel@gmail.com>
Message-ID:
 <CA+FuTSec8boukW_XLYxjqTfx2L+z3=qW__Y-NZ6HuG5N-atukg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190213144449.uSxEdM0puE-su_69ykB_pYDuHiFQab5Ca4kJuPxZglc@z>

On Tue, Feb 12, 2019@10:29 PM Deepa Dinamani <deepa.kernel@gmail.com> wrote:
>
> The clean target in the makefile conflicts with the generic
> kselftests lib.mk, and fails to properly remove the compiled
> test programs.
>
> Use TEST_GEN_PROGS macro to fit with lib.mk rules and
> remove the conflicting and redundant clean.

This is not the right fix. The files in TEST_GEN_PROGS are run
directly from kselftests.sh.

These tests are intended to be run from intermediate shell scripts, so
should be in TEST_GEN_FILES.

See also https://lkml.org/lkml/2018/5/4/215

Please also add netdev to networking test changes and mark as PATCH net.

>
> Signed-off-by: Deepa Dinamani <deepa.kernel at gmail.com>
> ---
>  tools/testing/selftests/networking/timestamping/Makefile | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/tools/testing/selftests/networking/timestamping/Makefile b/tools/testing/selftests/networking/timestamping/Makefile
> index 9050eeea5f5f..16ab85ba6409 100644
> --- a/tools/testing/selftests/networking/timestamping/Makefile
> +++ b/tools/testing/selftests/networking/timestamping/Makefile
> @@ -1,7 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0
>  CFLAGS += -I../../../../../usr/include
>
> -TEST_GEN_FILES := hwtstamp_config rxtimestamp timestamping txtimestamp
> +TEST_GEN_PROGS := hwtstamp_config rxtimestamp timestamping txtimestamp
>  TEST_PROGS := txtimestamp.sh
>
>  all: $(TEST_PROGS)
> @@ -9,6 +9,3 @@ all: $(TEST_PROGS)
>  top_srcdir = ../../../../..
>  KSFT_KHDR_INSTALL := 1
>  include ../../lib.mk
> -
> -clean:
> -       rm -fr $(TEST_GEN_FILES)
> --
> 2.17.1
>
