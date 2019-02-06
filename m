From: mcgrof@kernel.org (Luis Chamberlain)
Date: Wed, 6 Feb 2019 11:52:02 -0800
Subject: [PATCH 1/2] test_sysctl: add tests for >32-bit values written to
 32-bit integers
Message-ID: <20190206195202.GF11489@garbanzo.do-not-panic.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190206195202.lS9dIXisiY2c2rDFqtHL8Y91fKgHFTaIBIzT7_tfZc8@z>

Thanks for the patches, please include akpm at linux-foundation.org in the
future, as we can merge the changes through Andrew as well.

Also please Cc yzaikin at google.com, brendanhiggins at google.com in follow
ups for now.  They are looking at the sysctl testing code as well.

Some feedback below:

In-Reply-To: <20181227111231.12912-2-zev at bewilderbeest.net>

On Thu, Dec 27, 2018@05:12:29AM -0600, Zev Weiss wrote:
> +run_wideint_tests()
> +{
> +	# check negative and positive 64-bit values, with and without
> +	# bits set in the lower 31, and with and without bit 31 (sign
> +	# bit of a 32-bit int) set.  None of these are representable
> +	# in 32 bits, and hence all should fail.
> +	check_failure 0x0000010000000000
> +	check_failure 0x0000010080000000
> +	check_failure 0x000001ff7fffffff
> +	check_failure 0x000001ffffffffff
> +	check_failure 0xffffffff7fffffff


> +	check_failure 0xffffffffffffffff

This s64 version of -1

> +	check_failure 0xffffff0000000000
> +	check_failure 0xffffff0080000000
> +}

It was still unclear from the comments and manually looking at the
values why they are clear candidates to always test from all respective
64-bit values. A comment per each would be useful.

  Luis
