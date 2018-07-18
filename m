From: dave.hansen at intel.com (Dave Hansen)
Date: Wed, 18 Jul 2018 09:52:11 -0700
Subject: [PATCH v14 16/22] selftests/vm: fix an assertion in
 test_pkey_alloc_exhaust()
In-Reply-To: <1531835365-32387-17-git-send-email-linuxram@us.ibm.com>
References: <1531835365-32387-1-git-send-email-linuxram@us.ibm.com>
 <1531835365-32387-17-git-send-email-linuxram@us.ibm.com>
Message-ID: <36450dc3-0206-d355-0b58-5a42b43f53c4@intel.com>

On 07/17/2018 06:49 AM, Ram Pai wrote:
> The maximum number of keys that can be allocated has to
> take into consideration, that some keys are reserved by
> the architecture for   specific   purpose. Hence cannot
> be allocated.

Back to incomplete sentences, I see. :)

How about:

	Some pkeys which are valid to the hardware are not available
	for application use.  Those can not be allocated.

	test_pkey_alloc_exhaust() tries to account for these but
	___FILL_IN_WHAT_IT_DID_WRONG____.  We fix this by
	___FILL_IN_WAY_IT_WAS_FIXED____.

> diff --git a/tools/testing/selftests/vm/protection_keys.c b/tools/testing/selftests/vm/protection_keys.c
> index d27fa5e..67d841e 100644
> --- a/tools/testing/selftests/vm/protection_keys.c
> +++ b/tools/testing/selftests/vm/protection_keys.c
> @@ -1171,15 +1171,11 @@ void test_pkey_alloc_exhaust(int *ptr, u16 pkey)
>  	pkey_assert(i < NR_PKEYS*2);
>  
>  	/*
> -	 * There are 16 pkeys supported in hardware.  Three are
> -	 * allocated by the time we get here:
> -	 *   1. The default key (0)
> -	 *   2. One possibly consumed by an execute-only mapping.
> -	 *   3. One allocated by the test code and passed in via
> -	 *      'pkey' to this function.
> -	 * Ensure that we can allocate at least another 13 (16-3).
> +	 * There are NR_PKEYS pkeys supported in hardware. arch_reserved_keys()
> +	 * are reserved. And one key is allocated by the test code and passed
> +	 * in via 'pkey' to this function.
>  	 */
> -	pkey_assert(i >= NR_PKEYS-3);
> +	pkey_assert(i >= (NR_PKEYS-arch_reserved_keys()-1));
>  
>  	for (i = 0; i < nr_allocated_pkeys; i++) {
>  		err = sys_pkey_free(allocated_pkeys[i]);

You also killed my nice, shiny, new comment.  You made an attempt to
make up for it two patches ago, but it pales in comparison to mine.  The
fact that I wrote it only a few short week ago makes me very attached to
it, kinda like a new puppy.  I don't want to throw it to the wolves
quite yet.  So, please preserve as much of it as possible, even if it
has to live in the x86 header.

For bonus points, axe this comment in the same patch that you create the
x86 header comment for easier review.
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
