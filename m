From: rostedt@goodmis.org (Steven Rostedt)
Date: Fri, 15 Mar 2019 16:14:14 -0400
Subject: [PATCH v11 10/14] tracing, arm64: untag user pointers in
 seq_print_user_ip
In-Reply-To: <355e7c0dadaa2bb79d22e0b7aac7e4efc1114d49.1552679409.git.andreyknvl@google.com>
References: <cover.1552679409.git.andreyknvl@google.com>
 <355e7c0dadaa2bb79d22e0b7aac7e4efc1114d49.1552679409.git.andreyknvl@google.com>
Message-ID: <20190315161414.4b31fb03@gandalf.local.home>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190315201414.khbVg4203oK9Noc7ALaqWIrdBOa8XR2S_IabaaFgU4o@z>

On Fri, 15 Mar 2019 20:51:34 +0100
Andrey Konovalov <andreyknvl@google.com> wrote:

> This patch is a part of a series that extends arm64 kernel ABI to allow to
> pass tagged user pointers (with the top byte set to something else other
> than 0x00) as syscall arguments.
> 
> seq_print_user_ip() uses provided user pointers for vma lookups, which
> can only by done with untagged pointers.
> 
> Untag user pointers in this function.
> 
> Signed-off-by: Andrey Konovalov <andreyknvl at google.com>
> ---
>  kernel/trace/trace_output.c |  5 +++--
>  p                           | 45 +++++++++++++++++++++++++++++++++++++
>  2 files changed, 48 insertions(+), 2 deletions(-)
>  create mode 100644 p
> 
> diff --git a/kernel/trace/trace_output.c b/kernel/trace/trace_output.c
> index 54373d93e251..6376bee93c84 100644
> --- a/kernel/trace/trace_output.c
> +++ b/kernel/trace/trace_output.c
> @@ -370,6 +370,7 @@ static int seq_print_user_ip(struct trace_seq *s, struct mm_struct *mm,
>  {
>  	struct file *file = NULL;
>  	unsigned long vmstart = 0;
> +	unsigned long untagged_ip = untagged_addr(ip);
>  	int ret = 1;
>  
>  	if (s->full)
> @@ -379,7 +380,7 @@ static int seq_print_user_ip(struct trace_seq *s, struct mm_struct *mm,
>  		const struct vm_area_struct *vma;
>  
>  		down_read(&mm->mmap_sem);
> -		vma = find_vma(mm, ip);
> +		vma = find_vma(mm, untagged_ip);
>  		if (vma) {
>  			file = vma->vm_file;
>  			vmstart = vma->vm_start;
> @@ -388,7 +389,7 @@ static int seq_print_user_ip(struct trace_seq *s, struct mm_struct *mm,
>  			ret = trace_seq_path(s, &file->f_path);
>  			if (ret)
>  				trace_seq_printf(s, "[+0x%lx]",
> -						 ip - vmstart);
> +						 untagged_ip - vmstart);
>  		}
>  		up_read(&mm->mmap_sem);
>  	}
> diff --git a/p b/p
> new file mode 100644
> index 000000000000..9d6fa5386e55
> --- /dev/null
> +++ b/p
> @@ -0,0 +1,45 @@
> +commit 1fa6fadf644859e8a6a8ecce258444b49be8c7ee
> +Author: Andrey Konovalov <andreyknvl at google.com>
> +Date:   Mon Mar 4 17:20:32 2019 +0100
> +
> +    kasan: fix coccinelle warnings in kasan_p*_table
> +    
> +    kasan_p4d_table, kasan_pmd_table and kasan_pud_table are declared as
> +    returning bool, but return 0 instead of false, which produces a coccinelle
> +    warning. Fix it.
> +    
> +    Fixes: 0207df4fa1a8 ("kernel/memremap, kasan: make ZONE_DEVICE with work with KASAN")
> +    Reported-by: kbuild test robot <lkp at intel.com>
> +    Signed-off-by: Andrey Konovalov <andreyknvl at google.com>

Did you mean to append this commit to this patch?

-- Steve

> +
> +diff --git a/mm/kasan/init.c b/mm/kasan/init.c
> +index 45a1b5e38e1e..fcaa1ca03175 100644
> +--- a/mm/kasan/init.c
> ++++ b/mm/kasan/init.c
> +@@ -42,7 +42,7 @@ static inline bool kasan_p4d_table(pgd_t pgd)
> + #else
> + static inline bool kasan_p4d_table(pgd_t pgd)
> + {
> +-	return 0;
> ++	return false;
> + }
> + #endif
> + #if CONFIG_PGTABLE_LEVELS > 3
> +@@ -54,7 +54,7 @@ static inline bool kasan_pud_table(p4d_t p4d)
> + #else
> + static inline bool kasan_pud_table(p4d_t p4d)
> + {
> +-	return 0;
> ++	return false;
> + }
> + #endif
> + #if CONFIG_PGTABLE_LEVELS > 2
> +@@ -66,7 +66,7 @@ static inline bool kasan_pmd_table(pud_t pud)
> + #else
> + static inline bool kasan_pmd_table(pud_t pud)
> + {
> +-	return 0;
> ++	return false;
> + }
> + #endif
> + pte_t kasan_early_shadow_pte[PTRS_PER_PTE] __page_aligned_bss;
