From: linuxram@us.ibm.com (Ram Pai)
Date: Tue, 17 Jul 2018 08:58:48 -0700
Subject: [PATCH v13 08/24] selftests/vm: fix the wrong assert in
 pkey_disable_set()
In-Reply-To: <3c441309-1d35-eead-0c5d-1d7d20018219@intel.com>
References: <1528937115-10132-1-git-send-email-linuxram@us.ibm.com>
 <1528937115-10132-9-git-send-email-linuxram@us.ibm.com>
 <3c441309-1d35-eead-0c5d-1d7d20018219@intel.com>
Message-ID: <20180717155848.GA5790@ram.oc3035372033.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180717155848.BP9zV92p3qoRMuXgUMLXCYeiNk-BuRJjhYA8zZSo96Q@z>

On Wed, Jun 20, 2018@07:47:02AM -0700, Dave Hansen wrote:
> On 06/13/2018 05:44 PM, Ram Pai wrote:
> > If the flag is 0, no bits will be set. Hence we cant expect
> > the resulting bitmap to have a higher value than what it
> > was earlier
> ...
> >  	if (flags)
> > -		pkey_assert(read_pkey_reg() > orig_pkey_reg);
> > +		pkey_assert(read_pkey_reg() >= orig_pkey_reg);
> >  	dprintf1("END<---%s(%d, 0x%x)\n", __func__,
> >  		pkey, flags);
> >  }
> 
> This is the kind of thing where I'd love to hear the motivation and
> background.  This "disable a key that was already disabled" operation
> obviously doesn't happen today.  What motivated you to change it now?

On powerpc, hardware supports READ_DISABLE and WRITE_DISABLE.
ACCESS_DISABLE is basically READ_DISABLE|WRITE_DISABLE on powerpc.

If access disable is called on a key followed by a write disable, the
second operation becomes a nop. In such cases, 
       read_pkey_reg() == orig_pkey_reg


Hence the code above is modified to 
	pkey_assert(read_pkey_reg() >= orig_pkey_reg);


-- 
Ram Pai

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
