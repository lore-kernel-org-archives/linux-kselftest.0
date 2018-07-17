From: linuxram@us.ibm.com (Ram Pai)
Date: Tue, 17 Jul 2018 09:08:28 -0700
Subject: [PATCH v13 18/24] selftests/vm: fix an assertion in
 test_pkey_alloc_exhaust()
In-Reply-To: <55227442-a573-62b1-3206-1f3065a4b55f@intel.com>
References: <1528937115-10132-1-git-send-email-linuxram@us.ibm.com>
 <1528937115-10132-19-git-send-email-linuxram@us.ibm.com>
 <55227442-a573-62b1-3206-1f3065a4b55f@intel.com>
Message-ID: <20180717160828.GF5790@ram.oc3035372033.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180717160828.PpffwuCrluK57IsoKdh7E24COkRIs3iFNri_KQaJvuI@z>

On Wed, Jun 20, 2018@08:11:07AM -0700, Dave Hansen wrote:
> On 06/13/2018 05:45 PM, Ram Pai wrote:
> >  	/*
> > -	 * There are 16 pkeys supported in hardware.  Three are
> > -	 * allocated by the time we get here:
> > -	 *   1. The default key (0)
> > -	 *   2. One possibly consumed by an execute-only mapping.
> > -	 *   3. One allocated by the test code and passed in via
> > -	 *      'pkey' to this function.
> > -	 * Ensure that we can allocate at least another 13 (16-3).
> > +	 * There are NR_PKEYS pkeys supported in hardware. arch_reserved_keys()
> > +	 * are reserved. One of which is the default key(0). One can be taken
> > +	 * up by an execute-only mapping.
> > +	 * Ensure that we can allocate at least the remaining.
> >  	 */
> > -	pkey_assert(i >= NR_PKEYS-3);
> > +	pkey_assert(i >= (NR_PKEYS-arch_reserved_keys()-1));
> 
> We recently had a bug here.  I fixed it and left myself a really nice
> comment so I and others wouldn't screw it up in the future.
> 
> Does this kill my nice, new comment?

part of your nice comment has been moved into the header file. The arch
specific header file explains where and how the reserved keys are used.

-- 
Ram Pai

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
