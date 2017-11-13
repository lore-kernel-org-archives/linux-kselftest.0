From: linuxram at us.ibm.com (Ram Pai)
Date: Sun, 12 Nov 2017 16:54:51 -0800
Subject: [Linux-kselftest-mirror] [PATCH v9 23/51] powerpc: Enable pkey
	subsystem
In-Reply-To: <1509958663-18737-24-git-send-email-linuxram@us.ibm.com>
References: <1509958663-18737-1-git-send-email-linuxram@us.ibm.com>
 <1509958663-18737-24-git-send-email-linuxram@us.ibm.com>
Message-ID: <20171113005451.GF5546@ram.oc3035372033.ibm.com>

On Mon, Nov 06, 2017 at 12:57:15AM -0800, Ram Pai wrote:
> PAPR defines 'ibm,processor-storage-keys' property. It exports two
> values. The first value holds the number of data-access keys and the
> second holds the number of instruction-access keys.  Due to a bug in
> the  firmware, instruction-access  keys is  always  reported  as zero.
> However any key can be configured to disable data-access and/or disable
> execution-access. The inavailablity of the second value is not a
> big handicap, though it could have been used to determine if the
> platform supported disable-execution-access.
> 
> Non PAPR platforms do not define this property   in the device tree yet.
> Here, we   hardcode   CPUs   that   support  pkey by consulting
> PowerISA3.0
> 
> This patch calculates the number of keys supported by the platform.
> Alsi it determines the platform support for read/write/execution access
> support for pkeys.

> 
> Signed-off-by: Ram Pai <linuxram at us.ibm.com>
> ---
> 
....snip...

> +static inline bool pkey_mmu_enabled(void)
> +{
> +	if (firmware_has_feature(FW_FEATURE_LPAR))
> +		return pkeys_total;
> +	else
> +		return cpu_has_feature(CPU_FTR_PKEY);
> +}
> +
>  void __init pkey_initialize(void)
>  {
>  	int os_reserved, i;
> @@ -46,14 +54,9 @@ void __init pkey_initialize(void)
>  		     __builtin_popcountl(ARCH_VM_PKEY_FLAGS >> VM_PKEY_SHIFT)
>  				!= (sizeof(u64) * BITS_PER_BYTE));
> 
> -	/*
> -	 * Disable the pkey system till everything is in place. A subsequent
> -	 * patch will enable it.
> -	 */
> -	static_branch_enable(&pkey_disabled);
> -
> -	/* Lets assume 32 keys */
> -	pkeys_total = 32;

vvvvvvvvvvvvvvvvvvvv
> +	/* Let's assume 32 keys if we are not told the number of pkeys. */
> +	if (!pkeys_total)
> +		pkeys_total = 32;
^^^^^^^^^^^^^^^^^^^^

There is a small bug here. 

On a KVM guest or a LPAR, if the device tree
does not expose pkeys, the pkey-subsystem must be disabled.

Unfortunately, the code above blindly sets the pkeys_total to 32.
This confuses pkey_mmu_enabled() into returning true. Because of this
bug the guest errorneously enables pkey-subsystem. 

The fix is to delete the code marked above.

> 
>  	/*
>  	 * Adjust the upper limit, based on the number of bits supported by
> @@ -62,11 +65,19 @@ void __init pkey_initialize(void)
>  	pkeys_total = min_t(int, pkeys_total,
>  			(ARCH_VM_PKEY_FLAGS >> VM_PKEY_SHIFT));
> 
> +	if (!pkey_mmu_enabled() || radix_enabled() || !pkeys_total)
> +		static_branch_enable(&pkey_disabled);
> +	else
> +		static_branch_disable(&pkey_disabled);
> +

RP

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
