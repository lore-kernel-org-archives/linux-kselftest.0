From: dave.hansen at intel.com (Dave Hansen)
Date: Fri, 16 Mar 2018 15:10:07 -0700
Subject: [PATCH v12 08/22] selftests/vm: clear the bits in shadow reg when
 a pkey is freed.
In-Reply-To: <1519264541-7621-9-git-send-email-linuxram@us.ibm.com>
References: <1519264541-7621-1-git-send-email-linuxram@us.ibm.com>
 <1519264541-7621-9-git-send-email-linuxram@us.ibm.com>
Message-ID: <a884e9eb-4da6-54af-e09e-acac7ceee397@intel.com>

On 02/21/2018 05:55 PM, Ram Pai wrote:
> When a key is freed, the  key  is  no  more  effective.
> Clear the bits corresponding to the pkey in the shadow
> register. Otherwise  it  will carry some spurious bits
> which can trigger false-positive asserts.
...
> diff --git a/tools/testing/selftests/vm/protection_keys.c b/tools/testing/selftests/vm/protection_keys.c
> index ca54a95..aaf9f09 100644
> --- a/tools/testing/selftests/vm/protection_keys.c
> +++ b/tools/testing/selftests/vm/protection_keys.c
> @@ -582,6 +582,9 @@ int alloc_pkey(void)
>  int sys_pkey_free(unsigned long pkey)
>  {
>  	int ret = syscall(SYS_pkey_free, pkey);
> +
> +	if (!ret)
> +		shadow_pkey_reg &= reset_bits(pkey, PKEY_DISABLE_ACCESS);
>  	dprintf1("%s(pkey=%ld) syscall ret: %d\n", __func__, pkey, ret);
>  	return ret;
>  }

Did this cause problems for you in practice?

On x86, sys_pkey_free() does not affect PKRU, so this isn't quite right.
 I'd much rather have the actual tests explicitly clear the PKRU bits
and also in the process clear the shadow bits.
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
