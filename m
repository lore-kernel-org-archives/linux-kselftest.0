From: dave.hansen at intel.com (Dave Hansen)
Date: Wed, 20 Jun 2018 08:09:12 -0700
Subject: [PATCH v13 17/24] selftests/vm: powerpc implementation to check
 support for pkey
In-Reply-To: <1528937115-10132-18-git-send-email-linuxram@us.ibm.com>
References: <1528937115-10132-1-git-send-email-linuxram@us.ibm.com>
 <1528937115-10132-18-git-send-email-linuxram@us.ibm.com>
Message-ID: <20bc9696-3ae9-4eb9-40ce-9c477a8aaea2@intel.com>

> -	if (cpu_has_pku()) {
> -		dprintf1("SKIP: %s: no CPU support\n", __func__);
> +	if (is_pkey_supported()) {
> +		dprintf1("SKIP: %s: no CPU/kernel support\n", __func__);
>  		return;
>  	}

I actually kinda wanted a specific message for when the *CPU* doesn't
support the feature.
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
