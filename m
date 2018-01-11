From: shuah@kernel.org (Shuah Khan)
Date: Thu, 11 Jan 2018 10:21:04 -0700
Subject: [Linux-kselftest-mirror] [PATCH] tools/testing: Fix trailing
	semicolon
In-Reply-To: <20180111134607.12821-1-luisbg@kernel.org>
References: <20180111134607.12821-1-luisbg@kernel.org>
Message-ID: <c65087f8-d447-d603-be0a-a0577081570b@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180111172104.BH4I-vNogPY49ZCp5C1XtA2CIntqCOts0ndlsKXHaUE@z>

On 01/11/2018 06:46 AM, Luis de Bethencourt wrote:
> The trailing semicolon is an empty statement that does no operation.
> Removing it since it doesn't do anything.
> 
> Signed-off-by: Luis de Bethencourt <luisbg at kernel.org>
> ---
> 
> Hi Shuah,
> 
> After fixing the same thing in drivers/staging/rtl8723bs/, Joe Perches
> suggested I fix it treewide [0].
> 
> Best regards :)
> Luis
> 
> 
> [0] http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/2018-January/115410.html
> [1] http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/2018-January/115390.html
> 
>  tools/testing/selftests/nsfs/pidns.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/nsfs/pidns.c b/tools/testing/selftests/nsfs/pidns.c
> index 1182d4e437a2..e0d86e1668c0 100644
> --- a/tools/testing/selftests/nsfs/pidns.c
> +++ b/tools/testing/selftests/nsfs/pidns.c
> @@ -70,7 +70,7 @@ int main(int argc, char *argv[])
>  			return pr_err("NS_GET_PARENT returned a wrong namespace");
>  
>  		if (ioctl(pns, NS_GET_PARENT) >= 0 || errno != EPERM)
> -			return pr_err("Don't get EPERM");;
> +			return pr_err("Don't get EPERM");
>  	}
>  
>  	kill(pid, SIGKILL);
> 

Thanks for the patch. I will take this in for 4.16-rc1.

thanks,
-- Shuah
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
