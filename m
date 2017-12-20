From: benh at kernel.crashing.org (Benjamin Herrenschmidt)
Date: Thu, 21 Dec 2017 09:49:13 +1100
Subject: [Linux-kselftest-mirror] [PATCH v9 29/51] mm/mprotect,
 powerpc/mm/pkeys, x86/mm/pkeys: Add sysfs interface
In-Reply-To: <20171220175022.GB5619@ram.oc3035372033.ibm.com>
References: <1509958663-18737-1-git-send-email-linuxram@us.ibm.com>
 <1509958663-18737-30-git-send-email-linuxram@us.ibm.com>
 <bbc5593e-31ec-183a-01a5-1a253dc0c275@intel.com>
 <20171218221850.GD5461@ram.oc3035372033.ibm.com>
 <e7971d03-6ad1-40d5-9b79-f01242db5293@intel.com>
 <1513719296.2743.12.camel@kernel.crashing.org>
 <20171220175022.GB5619@ram.oc3035372033.ibm.com>
Message-ID: <1513810153.2743.25.camel@kernel.crashing.org>

On Wed, 2017-12-20 at 09:50 -0800, Ram Pai wrote:
> The argument against this patch is --  it should not be baked into
> the ABI as yet, since we do not have clarity on what applications need.
> 
> As it stands today the only way to figure out the information from
> userspace is by probing the kernel through calls to sys_pkey_alloc().
> 
> AT_HWCAP can be used, but that will certainly not be capable of
> providing all the information that userspace might expect.
> 
> Your thoughts?

Well, there's one well known application wanting that whole keys
business, so why not ask them what works for them ?

In the meantime, that shouldn't block the rest of the patches.

Cheers,
Ben.

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
