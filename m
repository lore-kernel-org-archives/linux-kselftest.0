From: dave.hansen at intel.com (Dave Hansen)
Date: Wed, 20 Jun 2018 07:53:57 -0700
Subject: [PATCH v13 13/24] selftests/vm: pkey register should match shadow
 pkey
In-Reply-To: <1528937115-10132-14-git-send-email-linuxram@us.ibm.com>
References: <1528937115-10132-1-git-send-email-linuxram@us.ibm.com>
 <1528937115-10132-14-git-send-email-linuxram@us.ibm.com>
Message-ID: <6246f823-77d9-6727-097e-73f103078a44@intel.com>

On 06/13/2018 05:45 PM, Ram Pai wrote:
> +++ b/tools/testing/selftests/vm/protection_keys.c
> @@ -916,10 +916,10 @@ void expected_pkey_fault(int pkey)
>  		pkey_assert(last_si_pkey == pkey);
>  
>  	/*
> -	 * The signal handler shold have cleared out PKEY register to let the
> +	 * The signal handler should have cleared out pkey-register to let the
>  	 * test program continue.  We now have to restore it.
>  	 */
> -	if (__read_pkey_reg() != 0)
> +	if (__read_pkey_reg() != shadow_pkey_reg)
>  		pkey_assert(0);
>  
>  	__write_pkey_reg(shadow_pkey_reg);

I think this is wrong on x86.

When we leave the signal handler, we zero out PKRU so that the faulting
instruction can continue, that's why we have the check against zero.
I'm actually kinda surprised this works.

Logically, this patch does:

	if (hardware != shadow)
		error();
	hardware = shadow;

That does not look right to me.  What we want is:

	if (hardware != signal_return_pkey_reg)
		error();
	hardware = shadow;
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
