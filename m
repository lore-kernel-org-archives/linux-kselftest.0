From: shuah@kernel.org (shuah)
Date: Wed, 13 Feb 2019 11:17:34 -0700
Subject: [PATCH net] selftests: fix timestamping Makefile
In-Reply-To: <20190213170914.11991-1-deepa.kernel@gmail.com>
References: <20190213170914.11991-1-deepa.kernel@gmail.com>
Message-ID: <afaa86d6-c1b3-0972-24c4-2eaaceeae3a9@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190213181734.ZsbpzVDf1Exlas0K2QBY3pKatY9Fo7GLADgMcPKqSJA@z>

On 2/13/19 10:09 AM, Deepa Dinamani wrote:
> The clean target in the makefile conflicts with the generic
> kselftests lib.mk, and fails to properly remove the compiled
> test programs.
> 
> Remove the redundant rule, the TEST_GEN_FILES will be already
> removed by the CLEAN macro in lib.mk.
> 
> Signed-off-by: Deepa Dinamani <deepa.kernel at gmail.com>
> ---
> 
> * Changes since v1: as per review comments
> 
>   tools/testing/selftests/networking/timestamping/Makefile | 3 ---
>   1 file changed, 3 deletions(-)
> 
> diff --git a/tools/testing/selftests/networking/timestamping/Makefile b/tools/testing/selftests/networking/timestamping/Makefile
> index 9050eeea5f5f..1de8bd8ccf5d 100644
> --- a/tools/testing/selftests/networking/timestamping/Makefile
> +++ b/tools/testing/selftests/networking/timestamping/Makefile
> @@ -9,6 +9,3 @@ all: $(TEST_PROGS)
>   top_srcdir = ../../../../..
>   KSFT_KHDR_INSTALL := 1
>   include ../../lib.mk
> -
> -clean:
> -	rm -fr $(TEST_GEN_FILES)
> 

Thanks for the patch.

Acked-by: Shuah Khan <shuah at kernel.org>

thanks,
-- Shuah
