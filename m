From: shuahkh@osg.samsung.com (Shuah Khan)
Date: Mon, 26 Mar 2018 08:44:04 -0600
Subject: [PATCH] selftests: Print the test we're running to /dev/kmsg
In-Reply-To: <20180323094427.21938-1-mpe@ellerman.id.au>
References: <20180323094427.21938-1-mpe@ellerman.id.au>
Message-ID: <5575d84d-5737-9610-5cef-bbfda909b704@osg.samsung.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180326144404.kJ-RbvKlLzmlg-1NKZZuqydoOQQMV787o3OndZ9SGPk@z>

On 03/23/2018 03:44 AM, Michael Ellerman wrote:
> Some tests cause the kernel to print things to the kernel log
> buffer (ie. printk), in particular oops and warnings etc. However when
> running all the tests in succession it's not always obvious which
> test(s) caused the kernel to print something.
> 
> We can narrow it down by printing which test directory we're running
> in to /dev/kmsg, if it's writable.
> 
> Example output:
> 
>   [  170.149149] kselftest: Running tests in powerpc
>   [  305.300132] kworker/dying (71) used greatest stack depth: 7776 bytes left
>   [  808.915456] kselftest: Running tests in pstore
> 
> Signed-off-by: Michael Ellerman <mpe at ellerman.id.au>
> ---
>  tools/testing/selftests/Makefile | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tools/testing/selftests/Makefile b/tools/testing/selftests/Makefile
> index 7442dfb73b7f..0fbe778efd5f 100644
> --- a/tools/testing/selftests/Makefile
> +++ b/tools/testing/selftests/Makefile
> @@ -130,6 +130,7 @@ ifdef INSTALL_PATH
>  		BUILD_TARGET=$$BUILD/$$TARGET;	\
>  		echo "echo ; echo Running tests in $$TARGET" >> $(ALL_SCRIPT); \
>  		echo "echo ========================================" >> $(ALL_SCRIPT); \
> +		echo "[ -w /dev/kmsg ] && echo \"kselftest: Running tests in $$TARGET\" >> /dev/kmsg" >> $(ALL_SCRIPT); \
>  		echo "cd $$TARGET" >> $(ALL_SCRIPT); \
>  		make -s --no-print-directory OUTPUT=$$BUILD_TARGET -C $$TARGET emit_tests >> $(ALL_SCRIPT); \
>  		echo "cd \$$ROOT" >> $(ALL_SCRIPT); \
> 

Thanks Michael. I will get this to 4.17-rc1

-- Shuah
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
