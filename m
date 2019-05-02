From: gregkh at linuxfoundation.org (Greg KH)
Date: Thu, 2 May 2019 13:03:47 +0200
Subject: [PATCH v2 16/17] kernel/sysctl-test: Add null pointer test for
 sysctl.c:proc_dointvec()
In-Reply-To: <20190501230126.229218-17-brendanhiggins@google.com>
References: <20190501230126.229218-1-brendanhiggins@google.com>
 <20190501230126.229218-17-brendanhiggins@google.com>
Message-ID: <20190502110347.GE12416@kroah.com>

On Wed, May 01, 2019 at 04:01:25PM -0700, Brendan Higgins wrote:
> From: Iurii Zaikin <yzaikin at google.com>
> 
> KUnit tests for initialized data behavior of proc_dointvec that is
> explicitly checked in the code. Includes basic parsing tests including
> int min/max overflow.
> 
> Signed-off-by: Iurii Zaikin <yzaikin at google.com>
> Signed-off-by: Brendan Higgins <brendanhiggins at google.com>
> ---
>  kernel/Makefile      |   2 +
>  kernel/sysctl-test.c | 292 +++++++++++++++++++++++++++++++++++++++++++
>  lib/Kconfig.debug    |   6 +
>  3 files changed, 300 insertions(+)
>  create mode 100644 kernel/sysctl-test.c
> 
> diff --git a/kernel/Makefile b/kernel/Makefile
> index 6c57e78817dad..c81a8976b6a4b 100644
> --- a/kernel/Makefile
> +++ b/kernel/Makefile
> @@ -112,6 +112,8 @@ obj-$(CONFIG_HAS_IOMEM) += iomem.o
>  obj-$(CONFIG_ZONE_DEVICE) += memremap.o
>  obj-$(CONFIG_RSEQ) += rseq.o
>  
> +obj-$(CONFIG_SYSCTL_KUNIT_TEST) += sysctl-test.o

You are going to have to have a "standard" naming scheme for test
modules, are you going to recommend "foo-test" over "test-foo"?  If so,
that's fine, we should just be consistant and document it somewhere.

Personally, I'd prefer "test-foo", but that's just me, naming is hard...

thanks,

greg k-h
