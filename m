From: aneesh.kumar@linux.vnet.ibm.com (Aneesh Kumar K.V)
Date: Sun, 21 Jan 2018 21:04:02 +0530
Subject: [Linux-kselftest-mirror] [PATCH v10 01/27] mm, powerpc,
	x86: define VM_PKEY_BITx bits if CONFIG_ARCH_HAS_PKEYS is enabled
In-Reply-To: <1516326648-22775-2-git-send-email-linuxram@us.ibm.com>
References: <1516326648-22775-1-git-send-email-linuxram@us.ibm.com>
 <1516326648-22775-2-git-send-email-linuxram@us.ibm.com>
Message-ID: <87mv17rzth.fsf@linux.vnet.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180121153402.m9Z2Ap_7qVhnkrCOE85MLchylhmK3GPnyT1KBZMU5Vk@z>

Ram Pai <linuxram at us.ibm.com> writes:

> VM_PKEY_BITx are defined only if CONFIG_X86_INTEL_MEMORY_PROTECTION_KEYS
> is enabled. Powerpc also needs these bits. Hence lets define the
> VM_PKEY_BITx bits for any architecture that enables
> CONFIG_ARCH_HAS_PKEYS.
>

Reviewed-by: Aneesh Kumar K.V <aneesh.kumar at linux.vnet.ibm.com>

> Signed-off-by: Ram Pai <linuxram at us.ibm.com>
> ---
>  fs/proc/task_mmu.c |    4 ++--
>  include/linux/mm.h |    9 +++++----
>  2 files changed, 7 insertions(+), 6 deletions(-)
>
> diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
> index 339e4c1..b139617 100644
> --- a/fs/proc/task_mmu.c
> +++ b/fs/proc/task_mmu.c
> @@ -674,13 +674,13 @@ static void show_smap_vma_flags(struct seq_file *m, struct vm_area_struct *vma)
>  		[ilog2(VM_MERGEABLE)]	= "mg",
>  		[ilog2(VM_UFFD_MISSING)]= "um",
>  		[ilog2(VM_UFFD_WP)]	= "uw",
> -#ifdef CONFIG_X86_INTEL_MEMORY_PROTECTION_KEYS
> +#ifdef CONFIG_ARCH_HAS_PKEYS
>  		/* These come out via ProtectionKey: */
>  		[ilog2(VM_PKEY_BIT0)]	= "",
>  		[ilog2(VM_PKEY_BIT1)]	= "",
>  		[ilog2(VM_PKEY_BIT2)]	= "",
>  		[ilog2(VM_PKEY_BIT3)]	= "",
> -#endif
> +#endif /* CONFIG_ARCH_HAS_PKEYS */
>  	};
>  	size_t i;
>  
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index ea818ff..01381d3 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -228,15 +228,16 @@ extern int overcommit_kbytes_handler(struct ctl_table *, int, void __user *,
>  #define VM_HIGH_ARCH_4	BIT(VM_HIGH_ARCH_BIT_4)
>  #endif /* CONFIG_ARCH_USES_HIGH_VMA_FLAGS */
>  
> -#if defined(CONFIG_X86)
> -# define VM_PAT		VM_ARCH_1	/* PAT reserves whole VMA at once (x86) */
> -#if defined (CONFIG_X86_INTEL_MEMORY_PROTECTION_KEYS)
> +#ifdef CONFIG_ARCH_HAS_PKEYS
>  # define VM_PKEY_SHIFT	VM_HIGH_ARCH_BIT_0
>  # define VM_PKEY_BIT0	VM_HIGH_ARCH_0	/* A protection key is a 4-bit value */
>  # define VM_PKEY_BIT1	VM_HIGH_ARCH_1
>  # define VM_PKEY_BIT2	VM_HIGH_ARCH_2
>  # define VM_PKEY_BIT3	VM_HIGH_ARCH_3
> -#endif
> +#endif /* CONFIG_ARCH_HAS_PKEYS */
> +
> +#if defined(CONFIG_X86)
> +# define VM_PAT		VM_ARCH_1	/* PAT reserves whole VMA at once (x86) */
>  #elif defined(CONFIG_PPC)
>  # define VM_SAO		VM_ARCH_1	/* Strong Access Ordering (powerpc) */
>  #elif defined(CONFIG_PARISC)
> -- 
> 1.7.1
>
> --
> To unsubscribe, send a message with 'unsubscribe linux-mm' in
> the body to majordomo at kvack.org.  For more info on Linux MM,
> see: http://www.linux-mm.org/ .
> Don't email: <a href=mailto:"dont at kvack.org"> email at kvack.org </a>

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
