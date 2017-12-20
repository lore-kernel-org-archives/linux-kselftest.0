From: linuxram at us.ibm.com (Ram Pai)
Date: Wed, 20 Dec 2017 09:50:22 -0800
Subject: [Linux-kselftest-mirror] [PATCH v9 29/51] mm/mprotect,
 powerpc/mm/pkeys, x86/mm/pkeys: Add sysfs interface
In-Reply-To: <1513719296.2743.12.camel@kernel.crashing.org>
References: <1509958663-18737-1-git-send-email-linuxram@us.ibm.com>
 <1509958663-18737-30-git-send-email-linuxram@us.ibm.com>
 <bbc5593e-31ec-183a-01a5-1a253dc0c275@intel.com>
 <20171218221850.GD5461@ram.oc3035372033.ibm.com>
 <e7971d03-6ad1-40d5-9b79-f01242db5293@intel.com>
 <1513719296.2743.12.camel@kernel.crashing.org>
Message-ID: <20171220175022.GB5619@ram.oc3035372033.ibm.com>

On Wed, Dec 20, 2017 at 08:34:56AM +1100, Benjamin Herrenschmidt wrote:
> On Mon, 2017-12-18 at 14:28 -0800, Dave Hansen wrote:
> > > We do not have generic support for something like that on ppc.
> > > The kernel looks at the device tree to determine what hardware features
> > > are available. But does not have mechanism to tell the hardware to track
> > > which of its features are currently enabled/used by the kernel; atleast
> > > not for the memory-key feature.
> > 
> > Bummer.  You're missing out.
> > 
> > But, you could still do this with a syscall.  "Hey, kernel, do you
> > support this feature?"
> 
> I'm not sure I understand Ram's original (quoted) point, but informing
> userspace of CPU features is what AT_HWCAP's are about.

Ben, my original point was -- we developed this patch to satisfy a concern
you raised back on July 11th;  cut-n-pasted below.

-------------------------------------------------------------------
That leads to the question... How do you tell userspace.

(apologies if I missed that in an existing patch in the series)

How do we inform userspace of the key capabilities ? There are
at least two things userspace may want to know already:

	 - What protection bits are supported for a key

	 - How many keys exist

	 - Which keys are available for use by userspace. On PowerPC,
	 the kernel can reserve some keys for itself, so can the
	 hypervisor. In fact, they do.
--------------------------------------------------------------------


The argument against this patch is --  it should not be baked into
the ABI as yet, since we do not have clarity on what applications need.

As it stands today the only way to figure out the information from
userspace is by probing the kernel through calls to sys_pkey_alloc().

AT_HWCAP can be used, but that will certainly not be capable of
providing all the information that userspace might expect.

Your thoughts?
RP

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
