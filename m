From: anders.roxell at linaro.org (Anders Roxell)
Date: Thu, 31 Jan 2019 20:07:02 +0100
Subject: [PATCH] selftests/networking: remove timestamping clean target
In-Reply-To: <20190108092525.12817-1-anders.roxell@linaro.org>
References: <20190108092525.12817-1-anders.roxell@linaro.org>
Message-ID: <CADYN=9JAogKRqz7jwKgFZvEMqJNo8QT2aJVuJ0jqB+Ce_g6J1Q@mail.gmail.com>

On Tue, 8 Jan 2019 at 10:25, Anders Roxell <anders.roxell at linaro.org> wrote:
>
> Commit cda261f421ba ("selftests: add txtimestamp kselftest") introduced
> a warning:
>
> Makefile:14: warning: overriding recipe for target 'clean'
> ../../lib.mk:137: warning: ignoring old recipe for target 'clean'
>
> Theres no need for timestamping to have its own 'clean' target. The
> lib.mk file's 'clean' target gets included to the timestamping Makefile
> and that should be enough.
>
> Fixes: cda261f421ba ("selftests: add txtimestamp kselftest")
> Signed-off-by: Anders Roxell <anders.roxell at linaro.org>
> ---
>  tools/testing/selftests/networking/timestamping/Makefile | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/tools/testing/selftests/networking/timestamping/Makefile b/tools/testing/selftests/networking/timestamping/Makefile
> index 9050eeea5f5f..1de8bd8ccf5d 100644
> --- a/tools/testing/selftests/networking/timestamping/Makefile
> +++ b/tools/testing/selftests/networking/timestamping/Makefile
> @@ -9,6 +9,3 @@ all: $(TEST_PROGS)
>  top_srcdir = ../../../../..
>  KSFT_KHDR_INSTALL := 1
>  include ../../lib.mk
> -
> -clean:
> -       rm -fr $(TEST_GEN_FILES)
> --
> 2.20.1
>

Does this make sense?

Cheers,
Anders
