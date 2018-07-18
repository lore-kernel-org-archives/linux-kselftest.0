From: dave.hansen at intel.com (Dave Hansen)
Date: Wed, 18 Jul 2018 09:56:49 -0700
Subject: [PATCH v14 20/22] selftests/vm: testcases must restore
 pkey-permissions
In-Reply-To: <1531835365-32387-21-git-send-email-linuxram@us.ibm.com>
References: <1531835365-32387-1-git-send-email-linuxram@us.ibm.com>
 <1531835365-32387-21-git-send-email-linuxram@us.ibm.com>
Message-ID: <ea9c3220-c4dd-124a-2031-eaca6859b389@intel.com>

On 07/17/2018 06:49 AM, Ram Pai wrote:
> Generally the signal handler restores the state of the pkey register
> before returning. However there are times when the read/write operation
> can legitamely fail without invoking the signal handler.  Eg: A
> sys_read() operaton to a write-protected page should be disallowed.  In
> such a case the state of the pkey register is not restored to its
> original state.  Test cases may not remember to restoring the key
> register state. During cleanup generically restore the key permissions.

This would, indeed be a good thing to do for a well-behaved application.

But, for selftests, why does it matter what state we leave the key in?
Doesn't the test itself need to establish permissions?  Don't we *do*
that at pkey_alloc() anyway?

What problem does this solve?

> diff --git a/tools/testing/selftests/vm/protection_keys.c b/tools/testing/selftests/vm/protection_keys.c
> index 8a6afdd..ea3cf04 100644
> --- a/tools/testing/selftests/vm/protection_keys.c
> +++ b/tools/testing/selftests/vm/protection_keys.c
> @@ -1476,8 +1476,13 @@ void run_tests_once(void)
>  		pkey_tests[test_nr](ptr, pkey);
>  		dprintf1("freeing test memory: %p\n", ptr);
>  		free_pkey_malloc(ptr);
> +
> +		/* restore the permission on the key after use */
> +		pkey_access_allow(pkey);
> +		pkey_write_allow(pkey);
>  		sys_pkey_free(pkey);
>  
> +
>  		dprintf1("pkey_faults: %d\n", pkey_faults);
>  		dprintf1("orig_pkey_faults: %d\n", orig_pkey_faults);



--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
