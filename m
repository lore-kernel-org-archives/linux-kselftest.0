From: dave.hansen@intel.com (Dave Hansen)
Date: Fri, 16 Mar 2018 15:28:19 -0700
Subject: [PATCH v12 16/22] selftests/vm: fix an assertion in
 test_pkey_alloc_exhaust()
In-Reply-To: <1519264541-7621-17-git-send-email-linuxram@us.ibm.com>
References: <1519264541-7621-1-git-send-email-linuxram@us.ibm.com>
 <1519264541-7621-17-git-send-email-linuxram@us.ibm.com>
Message-ID: <98204562-7c91-23f0-101b-508954020353@intel.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180316222819.aHludoqZhi5Hdyc-gxLWd_656FBazwmZ-e1x_tcKT2I@z>

On 02/21/2018 05:55 PM, Ram Pai wrote:
> +static inline int arch_reserved_keys(void)
> +{
> +#if defined(__i386__) || defined(__x86_64__) /* arch */
> +	return NR_RESERVED_PKEYS;
> +#elif __powerpc64__ /* arch */
> +	if (sysconf(_SC_PAGESIZE) == 4096)
> +		return NR_RESERVED_PKEYS_4K;
> +	else
> +		return NR_RESERVED_PKEYS_64K;
> +#else /* arch */
> +	NOT SUPPORTED
> +#endif /* arch */
> +}

Yeah, this is hideous.

Please either do it in one header:

#ifdef x86..
static inline int arch_reserved_keys(void)
{
}
...
#elif ppc
static inline int arch_reserved_keys(void)
{
}
...
#else
#error
#endif

Or in multiple:

#ifdef x86..
#include <pkey_x86.h>
#elif ppc
#include <pkey_ppc.h>
#else
#error
#endif
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
