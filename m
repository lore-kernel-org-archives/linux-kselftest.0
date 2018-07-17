From: linuxram@us.ibm.com (Ram Pai)
Date: Tue, 17 Jul 2018 09:05:16 -0700
Subject: [PATCH v13 17/24] selftests/vm: powerpc implementation to check
 support for pkey
In-Reply-To: <20bc9696-3ae9-4eb9-40ce-9c477a8aaea2@intel.com>
References: <1528937115-10132-1-git-send-email-linuxram@us.ibm.com>
 <1528937115-10132-18-git-send-email-linuxram@us.ibm.com>
 <20bc9696-3ae9-4eb9-40ce-9c477a8aaea2@intel.com>
Message-ID: <20180717160516.GE5790@ram.oc3035372033.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180717160516.5jKBpGkVhAbXExHevb6JWysLOPeTrCmHcKdx-d0_PoE@z>

On Wed, Jun 20, 2018@08:09:12AM -0700, Dave Hansen wrote:
> > -	if (cpu_has_pku()) {
> > -		dprintf1("SKIP: %s: no CPU support\n", __func__);
> > +	if (is_pkey_supported()) {
> > +		dprintf1("SKIP: %s: no CPU/kernel support\n", __func__);
> >  		return;
> >  	}
> 
> I actually kinda wanted a specific message for when the *CPU* doesn't
> support the feature.

is_pkey_supported() x86 implementation has specific messages. it will
print if the CPU doesn't support the feature.

RP

-- 
Ram Pai

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
