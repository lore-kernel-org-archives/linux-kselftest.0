From: dave.hansen@intel.com (Dave Hansen)
Date: Wed, 18 Jul 2018 08:34:37 -0700
Subject: [PATCH v14 07/22] selftests/vm: generic function to handle shadow
 key register
In-Reply-To: <1531835365-32387-8-git-send-email-linuxram@us.ibm.com>
References: <1531835365-32387-1-git-send-email-linuxram@us.ibm.com>
 <1531835365-32387-8-git-send-email-linuxram@us.ibm.com>
Message-ID: <ed8baf0c-7ccf-aa99-a88b-9b7697af89f4@intel.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180718153437.CZbpbeoLi2_NnY7HvYcIeAHctvDaxQD_PjMtcKbRdvQ@z>

On 07/17/2018 06:49 AM, Ram Pai wrote:
> -	shifted_pkey_reg = (pkey_reg >> (pkey * PKEY_BITS_PER_PKEY));
> +	shifted_pkey_reg = right_shift_bits(pkey, pkey_reg);
>  	dprintf2("%s() shifted_pkey_reg: "PKEY_REG_FMT"\n", __func__,
>  			shifted_pkey_reg);
>  	masked_pkey_reg = shifted_pkey_reg & mask;

I'm not a fan of how this looks.  This is almost certainly going to get
the argument order mixed up at some point.

Why do we need this?  The description doesn't say.
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
