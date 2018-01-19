From: ebiederm@xmission.com (Eric W. Biederman)
Date: Fri, 19 Jan 2018 10:09:41 -0600
Subject: [Linux-kselftest-mirror] [PATCH v10 27/27] mm: display pkey in
	smaps if arch_pkeys_enabled() is true
In-Reply-To: <1516326648-22775-28-git-send-email-linuxram@us.ibm.com> (Ram
 Pai's message of "Thu, 18 Jan 2018 17:50:48 -0800")
References: <1516326648-22775-1-git-send-email-linuxram@us.ibm.com>
 <1516326648-22775-28-git-send-email-linuxram@us.ibm.com>
Message-ID: <87shb1de4a.fsf@xmission.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180119160941.cjYC9gmR3mxwwv2fjna-ayvU0JF4NYOFvUMsLuFiuR0@z>

Ram Pai <linuxram at us.ibm.com> writes:

> Currently the  architecture  specific code is expected to
> display  the  protection  keys  in  smap  for a given vma.
> This can lead to redundant code and possibly to divergent
> formats in which the key gets displayed.
>
> This  patch  changes  the implementation. It displays the
> pkey only if the architecture support pkeys.
>
> x86 arch_show_smap() function is not needed anymore.
> Delete it.
>
> Signed-off-by: Ram Pai <linuxram at us.ibm.com>
> ---
>  arch/x86/kernel/setup.c |    8 --------
>  fs/proc/task_mmu.c      |   11 ++++++-----
>  2 files changed, 6 insertions(+), 13 deletions(-)
>
> diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
> index 8af2e8d..ddf945a 100644
> --- a/arch/x86/kernel/setup.c
> +++ b/arch/x86/kernel/setup.c
> @@ -1326,11 +1326,3 @@ static int __init register_kernel_offset_dumper(void)
>  	return 0;
>  }
>  __initcall(register_kernel_offset_dumper);
> -
> -void arch_show_smap(struct seq_file *m, struct vm_area_struct *vma)
> -{
> -	if (!boot_cpu_has(X86_FEATURE_OSPKE))
> -		return;
> -
> -	seq_printf(m, "ProtectionKey:  %8u\n", vma_pkey(vma));
> -}
> diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
> index 0edd4da..4b39a94 100644
> --- a/fs/proc/task_mmu.c
> +++ b/fs/proc/task_mmu.c
> @@ -18,6 +18,7 @@
>  #include <linux/page_idle.h>
>  #include <linux/shmem_fs.h>
>  #include <linux/uaccess.h>
> +#include <linux/pkeys.h>
>  
>  #include <asm/elf.h>
>  #include <asm/tlb.h>
> @@ -728,10 +729,6 @@ static int smaps_hugetlb_range(pte_t *pte, unsigned long hmask,
>  }
>  #endif /* HUGETLB_PAGE */
>  
> -void __weak arch_show_smap(struct seq_file *m, struct vm_area_struct *vma)
> -{
> -}
> -
>  static int show_smap(struct seq_file *m, void *v, int is_pid)
>  {
>  	struct proc_maps_private *priv = m->private;
> @@ -851,9 +848,13 @@ static int show_smap(struct seq_file *m, void *v, int is_pid)
>  			   (unsigned long)(mss->pss >> (10 + PSS_SHIFT)));
>  
>  	if (!rollup_mode) {
> -		arch_show_smap(m, vma);
> +#ifdef CONFIG_ARCH_HAS_PKEYS
> +		if (arch_pkeys_enabled())
> +			seq_printf(m, "ProtectionKey:  %8u\n", vma_pkey(vma));
> +#endif

Would it be worth it making vma_pkey a noop on architectures that don't
support protection keys so that we don't need the #ifdef here?

Eric


>  		show_smap_vma_flags(m, vma);
>  	}
> +
>  	m_cache_vma(m, vma);
>  	return ret;
>  }
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
