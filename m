From: jarkko.sakkinen at linux.intel.com (Jarkko Sakkinen)
Date: Mon, 4 Feb 2019 14:01:55 +0200
Subject: [PATCH] selftests: add TPM 2.0 tests
In-Reply-To: <20190203222654.GA28988@x230>
References: <20190201175054.26105-1-jarkko.sakkinen@linux.intel.com>
 <20190203222654.GA28988@x230>
Message-ID: <20190204120155.GE26799@linux.intel.com>

On Sun, Feb 03, 2019 at 11:26:55PM +0100, Petr Vorel wrote:
> Hi Jarkko,
> 
> > Added the tests that I've been using for testing TPM 2.0 functionality
> > for long time but have out-of-tree so far residing in
> 
> > https://github.com/jsakkine-intel/tpm2-scripts
> 
> > Cc: Tadeusz Struk <tadeusz.struk at intel.com>
> > Signed-off-by: Jarkko Sakkinen <jarkko.sakkinen at linux.intel.com>
> > Acked-By: Joey Pabalinas <joeypabalinas at gmail.com>
> Reviewed-by: Petr Vorel <petr.vorel at gmail.com>
> 
> > +++ b/tools/testing/selftests/tpm2/Makefile
> > @@ -0,0 +1,3 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
> > +
> > +TEST_PROGS := test_smoke.sh test_space.sh
> Maybe include lib.mk, to avoid make No targets error? (well, it's reported for
> more tests)
> 
> include ../lib.mk
> 
> make[1]: Entering directory '/home/pevik/install/src/linux.git/tools/testing/selftests/tpm2'
> make[1]: *** No targets.  Stop.
> 
> 
> Kind regards,
> Petr

Will do. Thanks for the review and the remark!

/Jarkko
