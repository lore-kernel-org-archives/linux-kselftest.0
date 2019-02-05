From: jarkko.sakkinen@linux.intel.com (Jarkko Sakkinen)
Date: Tue, 5 Feb 2019 12:13:22 +0200
Subject: [PATCH v3] selftests: add TPM 2.0 tests
In-Reply-To: <20190204232910.GC14992@linux.intel.com>
References: <20190204131640.11429-1-jarkko.sakkinen@linux.intel.com>
 <20190204232910.GC14992@linux.intel.com>
Message-ID: <20190205101322.GA31095@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190205101322.gQomUjuObQYmrTgiYBaKvLVzsosw1n7CI4z3v-dOUCg@z>

On Tue, Feb 05, 2019@01:29:10AM +0200, Jarkko Sakkinen wrote:
> On Mon, Feb 04, 2019@03:16:40PM +0200, Jarkko Sakkinen wrote:
> > Added the tests that I've been using for testing TPM 2.0 functionality
> > for a long time but have been out-of-tree so far, residing in
> > 
> > https://github.com/jsakkine-intel/tpm2-scripts
> > 
> > Cc: Tadeusz Struk <tadeusz.struk at intel.com>
> > Signed-off-by: Jarkko Sakkinen <jarkko.sakkinen at linux.intel.com>
> > Acked-By: Joey Pabalinas <joeypabalinas at gmail.com>
> > Reviewed-by: Petr Vorel <petr.vorel at gmail.com>
> 
> Wondering if I can put this to my 5.1 PR?

I'll put it and see what happens. It does not interfere other selftests
anyway and cannot cause compilation errors given that it is pure Python.

/Jarkko
