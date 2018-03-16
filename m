From: dave.hansen@intel.com (Dave Hansen)
Date: Fri, 16 Mar 2018 14:58:16 -0700
Subject: [PATCH v12 04/22] selftests/vm: typecast the pkey register
In-Reply-To: <1519264541-7621-5-git-send-email-linuxram@us.ibm.com>
References: <1519264541-7621-1-git-send-email-linuxram@us.ibm.com>
 <1519264541-7621-5-git-send-email-linuxram@us.ibm.com>
Message-ID: <00081300-e891-3381-3acd-e3312e54fb58@intel.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180316215816.nAsxRaQBvCn2bdzIvVBCq1uS1DEFQIvkjfgAbyY_wj8@z>

On 02/21/2018 05:55 PM, Ram Pai wrote:
> -static inline unsigned int _rdpkey_reg(int line)
> +static inline pkey_reg_t _rdpkey_reg(int line)
>  {
> -	unsigned int pkey_reg = __rdpkey_reg();
> +	pkey_reg_t pkey_reg = __rdpkey_reg();
>  
> -	dprintf4("rdpkey_reg(line=%d) pkey_reg: %x shadow: %x\n",
> +	dprintf4("rdpkey_reg(line=%d) pkey_reg: %016lx shadow: %016lx\n",
>  			line, pkey_reg, shadow_pkey_reg);
>  	assert(pkey_reg == shadow_pkey_reg);

Hmm.  So we're using %lx for an int?  Doesn't the compiler complain
about this?
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
