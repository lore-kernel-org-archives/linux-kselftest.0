From: dave.hansen at intel.com (Dave Hansen)
Date: Fri, 16 Mar 2018 15:26:09 -0700
Subject: [PATCH v12 15/22] selftests/vm: powerpc implementation to check
 support for pkey
In-Reply-To: <1519264541-7621-16-git-send-email-linuxram@us.ibm.com>
References: <1519264541-7621-1-git-send-email-linuxram@us.ibm.com>
 <1519264541-7621-16-git-send-email-linuxram@us.ibm.com>
Message-ID: <dc588e0e-eda5-1267-5806-91b9b95e28bf@intel.com>

On 02/21/2018 05:55 PM, Ram Pai wrote:
>  #define PAGE_SIZE (0x1UL << 16)
> -static inline int cpu_has_pku(void)
> +static inline bool is_pkey_supported(void)
>  {
> -	return 1;
> +	/*
> +	 * No simple way to determine this.
> +	 * lets try allocating a key and see if it succeeds.
> +	 */
> +	int ret = sys_pkey_alloc(0, 0);
> +
> +	if (ret > 0) {
> +		sys_pkey_free(ret);
> +		return true;
> +	}
> +	return false;
>  }

The point of doing this was to have a test for the CPU that way separate
from the syscalls.

Can you leave cpu_has_pkeys() in place?


--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
