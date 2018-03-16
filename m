From: dave.hansen at intel.com (Dave Hansen)
Date: Fri, 16 Mar 2018 14:55:26 -0700
Subject: [PATCH v12 02/22] selftests/vm: rename all references to pkru to
 a generic name
In-Reply-To: <1519264541-7621-3-git-send-email-linuxram@us.ibm.com>
References: <1519264541-7621-1-git-send-email-linuxram@us.ibm.com>
 <1519264541-7621-3-git-send-email-linuxram@us.ibm.com>
Message-ID: <61350ceb-974f-6039-ae1e-f2626c405676@intel.com>

On 02/21/2018 05:55 PM, Ram Pai wrote:
>  int pkey_set(int pkey, unsigned long rights, unsigned long flags)
>  {
>  	u32 mask = (PKEY_DISABLE_ACCESS|PKEY_DISABLE_WRITE);
> -	u32 old_pkru = __rdpkru();
> -	u32 new_pkru;
> +	u32 old_pkey_reg = __rdpkey_reg();
> +	u32 new_pkey_reg;

If we're not using the _actual_ instruction names ("rdpkru"), I think
I'd rather this be something more readable, like: __read_pkey_reg().

But, it's OK-ish the way it is.

Reviewed-by: Dave Hansen <dave.hansen at intel.com>
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
