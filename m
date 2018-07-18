From: dave.hansen@intel.com (Dave Hansen)
Date: Wed, 18 Jul 2018 09:06:26 -0700
Subject: [PATCH v14 13/22] selftests/vm: generic cleanup
In-Reply-To: <1531835365-32387-14-git-send-email-linuxram@us.ibm.com>
References: <1531835365-32387-1-git-send-email-linuxram@us.ibm.com>
 <1531835365-32387-14-git-send-email-linuxram@us.ibm.com>
Message-ID: <07f89e3b-a538-0466-cf5c-b975c0cc0aa8@intel.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180718160626.hlvEf4yOWP8WeckFHUKloeEzCwXov59vGG46Z8pueq0@z>

On 07/17/2018 06:49 AM, Ram Pai wrote:
> cleanup the code to satisfy coding styles.
> 
> cc: Dave Hansen <dave.hansen at intel.com>
> cc: Florian Weimer <fweimer at redhat.com>
> Signed-off-by: Ram Pai <linuxram at us.ibm.com>
> ---
>  tools/testing/selftests/vm/protection_keys.c |   64 +++++++++++++++++--------
>  1 files changed, 43 insertions(+), 21 deletions(-)
> 
> diff --git a/tools/testing/selftests/vm/protection_keys.c b/tools/testing/selftests/vm/protection_keys.c
> index f50cce8..304f74f 100644
> --- a/tools/testing/selftests/vm/protection_keys.c
> +++ b/tools/testing/selftests/vm/protection_keys.c
> @@ -4,7 +4,7 @@
>   *
>   * There are examples in here of:
>   *  * how to set protection keys on memory
> - *  * how to set/clear bits in pkey registers (the rights register)
> + *  * how to set/clear bits in Protection Key registers (the rights register)

Huh?  Which coding style says that we can't say "pkey"?

>   *  * how to handle SEGV_PKUERR signals and extract pkey-relevant
>   *    information from the siginfo
>   *
> @@ -13,13 +13,18 @@
>   *	prefault pages in at malloc, or not
>   *	protect MPX bounds tables with protection keys?
>   *	make sure VMA splitting/merging is working correctly
> - *	OOMs can destroy mm->mmap (see exit_mmap()), so make sure it is immune to pkeys
> - *	look for pkey "leaks" where it is still set on a VMA but "freed" back to the kernel
> - *	do a plain mprotect() to a mprotect_pkey() area and make sure the pkey sticks
> + *	OOMs can destroy mm->mmap (see exit_mmap()),
> + *			so make sure it is immune to pkeys
> + *	look for pkey "leaks" where it is still set on a VMA
> + *			 but "freed" back to the kernel
> + *	do a plain mprotect() to a mprotect_pkey() area and make
> + *			 sure the pkey sticks

This makes it work substantially worse.  That's not acceptable, even if
you did move it under 80 columns.

>   * Compile like this:
> - *	gcc      -o protection_keys    -O2 -g -std=gnu99 -pthread -Wall protection_keys.c -lrt -ldl -lm
> - *	gcc -m32 -o protection_keys_32 -O2 -g -std=gnu99 -pthread -Wall protection_keys.c -lrt -ldl -lm
> + *	gcc      -o protection_keys    -O2 -g -std=gnu99
> + *			 -pthread -Wall protection_keys.c -lrt -ldl -lm
> + *	gcc -m32 -o protection_keys_32 -O2 -g -std=gnu99
> + *			 -pthread -Wall protection_keys.c -lrt -ldl -lm
>   */

Why was this on one line?  Because it was easier to copy and paste.
Please leave it on one line, CodingStyle be damned.

>  #define _GNU_SOURCE
>  #include <errno.h>
> @@ -263,10 +268,12 @@ void signal_handler(int signum, siginfo_t *si, void *vucontext)
>  			__read_pkey_reg());
>  	dprintf1("pkey from siginfo: %jx\n", siginfo_pkey);
>  	*(u64 *)pkey_reg_ptr = 0x00000000;
> -	dprintf1("WARNING: set PRKU=0 to allow faulting instruction to continue\n");
> +	dprintf1("WARNING: set PKEY_REG=0 to allow faulting instruction "
> +			"to continue\n");

It's actually totally OK to let printk strings go over 80 columns.

>  	pkey_faults++;
>  	dprintf1("<<<<==================================================\n");
>  	dprint_in_signal = 0;
> +	return;
>  }

Now we're just being silly.

>  
>  int wait_all_children(void)
> @@ -384,7 +391,7 @@ void pkey_disable_set(int pkey, int flags)
>  {
>  	unsigned long syscall_flags = 0;
>  	int ret;
> -	int pkey_rights;
> +	u32 pkey_rights;

This is not CodingStyle.  Shouldn't this be the pkey_reg_t that you
introduced earlier in the series?

> -int sys_pkey_alloc(unsigned long flags, unsigned long init_val)
> +int sys_pkey_alloc(unsigned long flags, u64 init_val)
>  {

Um, this is actually a 'unsigned long' in the ABI.

Can you go back through this and actually make sure that these are real
coding style cleanups?
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
