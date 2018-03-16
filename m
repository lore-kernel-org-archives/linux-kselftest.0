From: dave.hansen@intel.com (Dave Hansen)
Date: Fri, 16 Mar 2018 15:06:44 -0700
Subject: [PATCH v12 06/22] selftests/vm: fix the wrong assert in
 pkey_disable_set()
In-Reply-To: <1519264541-7621-7-git-send-email-linuxram@us.ibm.com>
References: <1519264541-7621-1-git-send-email-linuxram@us.ibm.com>
 <1519264541-7621-7-git-send-email-linuxram@us.ibm.com>
Message-ID: <efe141d5-b609-c21e-8860-c0184e167770@intel.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180316220644.ce55ntOWOImKCEhLx6as-JTKWZva0RbEjwG3ogUeTWc@z>

On 02/21/2018 05:55 PM, Ram Pai wrote:
> If the flag is 0, no bits will be set. Hence we cant expect
> the resulting bitmap to have a higher value than what it
> was earlier.
> 
> cc: Dave Hansen <dave.hansen at intel.com>
> cc: Florian Weimer <fweimer at redhat.com>
> Signed-off-by: Ram Pai <linuxram at us.ibm.com>
> ---
>  tools/testing/selftests/vm/protection_keys.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/tools/testing/selftests/vm/protection_keys.c b/tools/testing/selftests/vm/protection_keys.c
> index 83216c5..0109388 100644
> --- a/tools/testing/selftests/vm/protection_keys.c
> +++ b/tools/testing/selftests/vm/protection_keys.c
> @@ -443,7 +443,7 @@ void pkey_disable_set(int pkey, int flags)
>  	dprintf1("%s(%d) pkey_reg: 0x%lx\n",
>  		__func__, pkey, rdpkey_reg());
>  	if (flags)
> -		pkey_assert(rdpkey_reg() > orig_pkey_reg);
> +		pkey_assert(rdpkey_reg() >= orig_pkey_reg);
>  	dprintf1("END<---%s(%d, 0x%x)\n", __func__,
>  		pkey, flags);
>  }

I'm not sure about this one.  Did this cause a problem for you?

Why would you call this and ask no bits to be set?

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
