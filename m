From: dave.hansen@intel.com (Dave Hansen)
Date: Tue, 13 Nov 2018 13:51:06 -0800
Subject: [PATCH RFC] selftests/x86: Add a selftest for SGX
In-Reply-To: <20181113214038.16136-1-jarkko.sakkinen@linux.intel.com>
References: <20181113214038.16136-1-jarkko.sakkinen@linux.intel.com>
Message-ID: <ace87d75-2ba0-38f6-0a77-25d45b692d7d@intel.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181113215106.XH6LSn6aqCTrhiBEBwFKKMKZt_Eip-XdNuPGeETg1KE@z>

On 11/13/18 1:40 PM, Jarkko Sakkinen wrote:
> +int main(int argc, char **argv)
> +{
> +	unsigned long bin_size = (unsigned long)&encl_bin_end -
> +				 (unsigned long)&encl_bin;
> +	struct sgx_secs secs;
> +	uint64_t result = 0;
> +
> +	if (!encl_load(&secs, bin_size))
> +		exit(1);
> +
> +	sgx_call((void *)&MAGIC, &result, (void *)secs.base);
> +	if (result != MAGIC) {
> +		fprintf(stderr, "0x%lx != 0x%lx\n", result, MAGIC);
> +		exit(1);
> +	}
> +
> +	exit(0);
> +}

Well, I guess 100 lines of code for something a wee bit shy of hello
world isn't bad. :)

In general, this looks fine, but probably needs some better commenting
and probably some messages that make it a bit more clear what is going on.

It would be _nice_, for instance to try to do some CPUID detection of
SGX so that the error (or success?) message can tell you whether you're
missing hardware support or kernel support.

Thanks for doing this, though.  It's sorely needed.
