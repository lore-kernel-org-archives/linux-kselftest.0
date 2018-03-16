From: dave.hansen@intel.com (Dave Hansen)
Date: Fri, 16 Mar 2018 15:23:28 -0700
Subject: [PATCH v12 13/22] selftests/vm: powerpc implementation for
 generic abstraction
In-Reply-To: <1519264541-7621-14-git-send-email-linuxram@us.ibm.com>
References: <1519264541-7621-1-git-send-email-linuxram@us.ibm.com>
 <1519264541-7621-14-git-send-email-linuxram@us.ibm.com>
Message-ID: <5e27e966-d1b9-e56d-45cd-43524fd4448c@intel.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180316222328.AmSZpcOMx551en-AFLG7FZrJ_NjzvsyxH2_e2ak4Kw4@z>

On 02/21/2018 05:55 PM, Ram Pai wrote:
>  static inline u32 pkey_to_shift(int pkey)
>  {
> +#if defined(__i386__) || defined(__x86_64__) /* arch */
>  	return pkey * PKEY_BITS_PER_PKEY;
> +#elif __powerpc64__ /* arch */
> +	return (NR_PKEYS - pkey - 1) * PKEY_BITS_PER_PKEY;
> +#endif /* arch */
>  }

I really detest the #if #else style.  Can't we just have a pkey_ppc.h
and a pkey_x86.h or something?
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
