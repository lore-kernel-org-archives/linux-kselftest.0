From: dave.hansen@intel.com (Dave Hansen)
Date: Fri, 16 Mar 2018 15:19:12 -0700
Subject: [PATCH v12 11/22] selftests/vm: pkey register should match shadow
 pkey
In-Reply-To: <1519264541-7621-12-git-send-email-linuxram@us.ibm.com>
References: <1519264541-7621-1-git-send-email-linuxram@us.ibm.com>
 <1519264541-7621-12-git-send-email-linuxram@us.ibm.com>
Message-ID: <e9270064-4951-26dc-aeb0-1378fd7ab542@intel.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180316221912.5CayOT--yBKxlN1nHaWzQI7ryAhkAwrTVavO1XmZZc4@z>

On 02/21/2018 05:55 PM, Ram Pai wrote:
> expected_pkey_fault() is comparing the contents of pkey
> register with 0. This may not be true all the time. There
> could be bits set by default by the architecture
> which can never be changed. Hence compare the value against
> shadow pkey register, which is supposed to track the bits
> accurately all throughout
> 
> cc: Dave Hansen <dave.hansen at intel.com>
> cc: Florian Weimer <fweimer at redhat.com>
> Signed-off-by: Ram Pai <linuxram at us.ibm.com>
> ---
>  tools/testing/selftests/vm/protection_keys.c |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/testing/selftests/vm/protection_keys.c b/tools/testing/selftests/vm/protection_keys.c
> index 254b66d..6054093 100644
> --- a/tools/testing/selftests/vm/protection_keys.c
> +++ b/tools/testing/selftests/vm/protection_keys.c
> @@ -926,10 +926,10 @@ void expected_pkey_fault(int pkey)
>  	pkey_assert(last_pkey_faults + 1 == pkey_faults);
>  	pkey_assert(last_si_pkey == pkey);
>  	/*
> -	 * The signal handler shold have cleared out PKEY register to let the
> +	 * The signal handler shold have cleared out pkey-register to let the

Heh, you randomly changed the formatting and didn't bother with my awful
typo. :)

>  	 * test program continue.  We now have to restore it.
>  	 */
> -	if (__rdpkey_reg() != 0)
> +	if (__rdpkey_reg() != shadow_pkey_reg)
>  		pkey_assert(0);
>  
>  	__wrpkey_reg(shadow_pkey_reg);
> 

I don't think this should be "shadow_pkey_reg".  This was just trying to
double-check that the signal handler messed around with PKRU the way we
expected.

We could also just check that the disable bits for 'pkey' are clear at
this point.  That would be almost as good.
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
