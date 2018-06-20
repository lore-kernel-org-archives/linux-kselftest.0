From: dave.hansen at intel.com (Dave Hansen)
Date: Wed, 20 Jun 2018 07:47:02 -0700
Subject: [PATCH v13 08/24] selftests/vm: fix the wrong assert in
 pkey_disable_set()
In-Reply-To: <1528937115-10132-9-git-send-email-linuxram@us.ibm.com>
References: <1528937115-10132-1-git-send-email-linuxram@us.ibm.com>
 <1528937115-10132-9-git-send-email-linuxram@us.ibm.com>
Message-ID: <3c441309-1d35-eead-0c5d-1d7d20018219@intel.com>

On 06/13/2018 05:44 PM, Ram Pai wrote:
> If the flag is 0, no bits will be set. Hence we cant expect
> the resulting bitmap to have a higher value than what it
> was earlier
...
>  	if (flags)
> -		pkey_assert(read_pkey_reg() > orig_pkey_reg);
> +		pkey_assert(read_pkey_reg() >= orig_pkey_reg);
>  	dprintf1("END<---%s(%d, 0x%x)\n", __func__,
>  		pkey, flags);
>  }

This is the kind of thing where I'd love to hear the motivation and
background.  This "disable a key that was already disabled" operation
obviously doesn't happen today.  What motivated you to change it now?
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
