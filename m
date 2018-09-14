From: labbott@redhat.com (Laura Abbott)
Date: Fri, 14 Sep 2018 11:30:08 -0700
Subject: [PATCH] Fix compilation error
In-Reply-To: <1536918418-5016-1-git-send-email-alexey.skidanov@intel.com>
References: <1536918418-5016-1-git-send-email-alexey.skidanov@intel.com>
Message-ID: <2108af5b-7877-5675-50d9-cbda82eed48d@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180914183008.-bGTRPHX4bkJ_PsYKsV6BFEQ1t7uhVPR2gNi3ErtJuY@z>

On 09/14/2018 02:46 AM, Alexey Skidanov wrote:
> ionmap_test compilation failed because there is no dma_buf.h on any of
> include paths. Moreover, it's better to use the dma_buf.h file of
> kernel under test and not the currently running one.
> 
> To fix this, add new target to the Makefile, installing Kernel headers
> for user space and direct compiler to look for dma_buf.h file there.
> 

This is what gpio has:

../../../../usr/include/linux/gpio.h:
         make -C ../../../.. headers_install INSTALL_HDR_PATH=$(shell pwd)/../../../../usr/

I'd like to be consistent with other selftests. Shuah, what's
your opinion on the best way to get the headers?

Thanks,
Laura

> Signed-off-by: Alexey Skidanov <alexey.skidanov at intel.com>
> ---
>   tools/testing/selftests/android/ion/Makefile | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/testing/selftests/android/ion/Makefile b/tools/testing/selftests/android/ion/Makefile
> index e036952..a4aac0e 100644
> --- a/tools/testing/selftests/android/ion/Makefile
> +++ b/tools/testing/selftests/android/ion/Makefile
> @@ -1,10 +1,14 @@
>   
> -INCLUDEDIR := -I. -I../../../../../drivers/staging/android/uapi/ -I../../../../../usr/include/
> +INCLUDEDIR := -I. -I../../../../../drivers/staging/android/uapi/ -I../../../../../uapi/include
>   CFLAGS := $(CFLAGS) $(INCLUDEDIR) -Wall -O2 -g
>   
>   TEST_GEN_FILES := ionapp_export ionapp_import ionmap_test
>   
> -all: $(TEST_GEN_FILES)
> +all: usr_headers $(TEST_GEN_FILES)
> +
> +usr_headers:
> +	cd ../../../../../
> +	make headers_install INSTALL_HDR_PATH=./uapi
>   
>   $(TEST_GEN_FILES): ipcsocket.c ionutils.c
>   
> 
