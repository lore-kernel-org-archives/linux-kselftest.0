From: jarkko.sakkinen@linux.intel.com (Jarkko Sakkinen)
Date: Tue, 27 Nov 2018 15:15:39 -0800
Subject: [PATCH] selftests: add TPM 2.0 tests
In-Reply-To: <0929dfe2-83aa-ff39-e37e-35bc499aaa0a@intel.com>
References: <20181127221059.25966-1-jarkko.sakkinen@linux.intel.com>
 <0929dfe2-83aa-ff39-e37e-35bc499aaa0a@intel.com>
Message-ID: <20181127231539.GC26051@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181127231539.m_b-gFU9kH7QSASQFkcjhO5cbEs7lXqpsJIZQj1N_7E@z>

On Tue, Nov 27, 2018@02:34:39PM -0800, Tadeusz Struk wrote:
> On 11/27/18 2:10 PM, Jarkko Sakkinen wrote:
> > Added the tests that I've been using for testing TPM 2.0 functionality
> > for long time but have out-of-tree so far residing in
> > 
> > https://github.com/jsakkine-intel/tpm2-scripts
> > 
> > Cc: Tadeusz Struk <tadeusz.struk at intel.com>
> > Signed-off-by: Jarkko Sakkinen <jarkko.sakkinen at linux.intel.com>
> > ---
> > Tadeusz: does not include your test. Better that you send them after
> > this has been accepted to get proper SOB info.
> 
> Sure I can follow up after this is merged.
> Thanks,

Hey, noticed that there was extra parentheses in open() for tpmrm0. Not
a biggie, I fixed it in my tpm2-scripts tree, but when you actually go
on to make the commit and send it here for review run both test_smoke.sh
and test_space.sh.

/Jarkko
