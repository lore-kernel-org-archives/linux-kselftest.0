From: jarkko.sakkinen at linux.intel.com (Jarkko Sakkinen)
Date: Thu, 15 Nov 2018 22:33:56 +0200
Subject: [PATCH RFC] selftests/x86: Add a selftest for SGX
In-Reply-To: <ace87d75-2ba0-38f6-0a77-25d45b692d7d@intel.com>
References: <20181113214038.16136-1-jarkko.sakkinen@linux.intel.com>
 <ace87d75-2ba0-38f6-0a77-25d45b692d7d@intel.com>
Message-ID: <20181115203356.GC26875@linux.intel.com>

On Tue, Nov 13, 2018 at 01:51:06PM -0800, Dave Hansen wrote:
> On 11/13/18 1:40 PM, Jarkko Sakkinen wrote:
> > +int main(int argc, char **argv)
> > +{
> > +	unsigned long bin_size = (unsigned long)&encl_bin_end -
> > +				 (unsigned long)&encl_bin;
> > +	struct sgx_secs secs;
> > +	uint64_t result = 0;
> > +
> > +	if (!encl_load(&secs, bin_size))
> > +		exit(1);
> > +
> > +	sgx_call((void *)&MAGIC, &result, (void *)secs.base);
> > +	if (result != MAGIC) {
> > +		fprintf(stderr, "0x%lx != 0x%lx\n", result, MAGIC);
> > +		exit(1);
> > +	}
> > +
> > +	exit(0);
> > +}
> 
> Well, I guess 100 lines of code for something a wee bit shy of hello
> world isn't bad. :)
> 
> In general, this looks fine, but probably needs some better commenting
> and probably some messages that make it a bit more clear what is going on.
> 
> It would be _nice_, for instance to try to do some CPUID detection of
> SGX so that the error (or success?) message can tell you whether you're
> missing hardware support or kernel support.
> 
> Thanks for doing this, though.  It's sorely needed.

Great, thanks, I see what I can do.

/Jarkko
