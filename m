From: dave.hansen at intel.com (Dave Hansen)
Date: Wed, 20 Jun 2018 08:22:05 -0700
Subject: [PATCH v13 24/24] selftests/vm: test correct behavior of pkey-0
In-Reply-To: <1528937115-10132-25-git-send-email-linuxram@us.ibm.com>
References: <1528937115-10132-1-git-send-email-linuxram@us.ibm.com>
 <1528937115-10132-25-git-send-email-linuxram@us.ibm.com>
Message-ID: <0a7c79a9-8d2d-09cb-30c6-f0f7bca526db@intel.com>

On 06/13/2018 05:45 PM, Ram Pai wrote:
> Ensure pkey-0 is allocated on start.  Ensure pkey-0 can be attached
> dynamically in various modes, without failures.  Ensure pkey-0 can be
> freed and allocated.

I like this.  Looks very useful.

Acked-by: Dave Hansen <dave.hansen at intel.com>
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
