From: shuah@kernel.org (Shuah Khan)
Date: Wed, 11 Jul 2018 10:17:37 -0600
Subject: [PATCH v2] selftests/android: initialize heap_type to avoid
 compiling warning
In-Reply-To: <1531274880-9375-1-git-send-email-lizhijian@cn.fujitsu.com>
References: <1531274880-9375-1-git-send-email-lizhijian@cn.fujitsu.com>
Message-ID: <53f02d65-9a91-2661-3052-d46032389e3a@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180711161737.f7QdNZ_W35XoNndYYUfpXbC1PVXWgxuAr4pKsY6lf7M@z>

On 07/10/2018 08:08 PM, Li Zhijian wrote:
> root at vm-lkp-nex04-8G-7 ~/linux-v4.18-rc2/tools/testing/selftests/android# make
> make[1]: warning: jobserver unavailable: using -j1.  Add '+' to parent make rule.
> make[1]: Entering directory '/root/linux-v4.18-rc2/tools/testing/selftests/android/ion'
> gcc  -I. -I../../../../../drivers/staging/android/uapi/ -I../../../../../usr/include/ -Wall -O2 -g    ionapp_export.c ipcsocket.c ionutils.c   -o ionapp_export
> ionapp_export.c: In function 'main':
> ionapp_export.c:91:2: warning: 'heap_type' may be used uninitialized in
> this function [-Wmaybe-uninitialized]
>   printf("heap_type: %ld, heap_size: %ld\n", heap_type, heap_size);
>   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> CC: Shuah Khan <shuah at kernel.org>
> CC: Pintu Agarwal <pintu.ping at gmail.com>
> Signed-off-by: Li Zhijian <lizhijian at cn.fujitsu.com>
> ---
>  tools/testing/selftests/android/ion/ionapp_export.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tools/testing/selftests/android/ion/ionapp_export.c b/tools/testing/selftests/android/ion/ionapp_export.c
> index a944e72..b5fa0a2 100644
> --- a/tools/testing/selftests/android/ion/ionapp_export.c
> +++ b/tools/testing/selftests/android/ion/ionapp_export.c
> @@ -51,6 +51,7 @@ int main(int argc, char *argv[])
>  
>  	heap_size = 0;
>  	flags = 0;
> +	heap_type = ION_HEAP_TYPE_SYSTEM;
>  
>  	while ((opt = getopt(argc, argv, "hi:s:")) != -1) {
>  		switch (opt) {
> 

Thanks. Applied to linux-kselftest next after updating the commit message

"Initialize heap_type to ION_HEAP_TYPE_SYSTEM to avoid "used uninitialized"
compiler warning. heap_type gets used after initialization, this change is
to just keep the compiler happy."

thanks,
-- Shuah

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
