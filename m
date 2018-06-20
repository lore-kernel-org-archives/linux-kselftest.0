From: dave.hansen@intel.com (Dave Hansen)
Date: Wed, 20 Jun 2018 08:07:31 -0700
Subject: [PATCH v13 16/24] selftests/vm: clear the bits in shadow reg when
 a pkey is freed.
In-Reply-To: <1528937115-10132-17-git-send-email-linuxram@us.ibm.com>
References: <1528937115-10132-1-git-send-email-linuxram@us.ibm.com>
 <1528937115-10132-17-git-send-email-linuxram@us.ibm.com>
Message-ID: <0b534ee8-5747-2811-745c-d87b3e720955@intel.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180620150731.kcUf6w5sRJ6kdv3CaDWVBBdqXhtivN7rjkXACXwx3To@z>

On 06/13/2018 05:45 PM, Ram Pai wrote:
> --- a/tools/testing/selftests/vm/protection_keys.c
> +++ b/tools/testing/selftests/vm/protection_keys.c
> @@ -577,7 +577,8 @@ int sys_pkey_free(unsigned long pkey)
>  	int ret = syscall(SYS_pkey_free, pkey);
>  
>  	if (!ret)
> -		shadow_pkey_reg &= clear_pkey_flags(pkey, PKEY_DISABLE_ACCESS);
> +		shadow_pkey_reg &= clear_pkey_flags(pkey,
> +				PKEY_DISABLE_ACCESS | PKEY_DISABLE_WRITE);
>  	dprintf1("%s(pkey=%ld) syscall ret: %d\n", __func__, pkey, ret);
>  	return ret;
>  }

Why did you introduce this code earlier and then modify it now?

BTW, my original aversion to this code still stands.
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
