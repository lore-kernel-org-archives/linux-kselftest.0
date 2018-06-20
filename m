From: dave.hansen@intel.com (Dave Hansen)
Date: Wed, 20 Jun 2018 08:16:44 -0700
Subject: [PATCH v13 19/24] selftests/vm: associate key on a mapped page
 and detect access violation
In-Reply-To: <1528937115-10132-20-git-send-email-linuxram@us.ibm.com>
References: <1528937115-10132-1-git-send-email-linuxram@us.ibm.com>
 <1528937115-10132-20-git-send-email-linuxram@us.ibm.com>
Message-ID: <048b1de9-85f8-22ff-a31a-b06a382769bb@intel.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180620151644.8b7n1EM4tdb4VpQTfbBhEyRLGKwKNpjFVNFjxK68KOk@z>

On 06/13/2018 05:45 PM, Ram Pai wrote:
> +void test_read_of_access_disabled_region_with_page_already_mapped(int *ptr,
> +		u16 pkey)
> +{
> +	int ptr_contents;
> +
> +	dprintf1("disabling access to PKEY[%02d], doing read @ %p\n",
> +				pkey, ptr);
> +	ptr_contents = read_ptr(ptr);
> +	dprintf1("reading ptr before disabling the read : %d\n",
> +			ptr_contents);
> +	read_pkey_reg();
> +	pkey_access_deny(pkey);
> +	ptr_contents = read_ptr(ptr);
> +	dprintf1("*ptr: %d\n", ptr_contents);
> +	expected_pkey_fault(pkey);
> +}

Looks fine to me.  I'm a bit surprised we didn't do this already, which
is a good thing for this patch.

FWIW, if you took patches like this and put them first, you could
probably get it merged now.  Yes, I know it would mean redoing some of
the later code move and rename ones.
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
