From: kevin.brodsky@arm.com (Kevin Brodsky)
Date: Mon, 18 Mar 2019 11:47:15 +0000
Subject: [PATCH v11 09/14] kernel, arm64: untag user pointers in
 prctl_set_mm*
In-Reply-To: <c4d65de9867cb3349af6800242da0de751260c6c.1552679409.git.andreyknvl@google.com>
References: <cover.1552679409.git.andreyknvl@google.com>
 <c4d65de9867cb3349af6800242da0de751260c6c.1552679409.git.andreyknvl@google.com>
Message-ID: <96675b72-d325-0682-4864-b6a96f63f8fd@arm.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190318114715.q6nz6RlCDlv7RTsDm9H5UFzwAvjl_ch5fs_a-msAv1g@z>

On 15/03/2019 19:51, Andrey Konovalov wrote:
> This patch is a part of a series that extends arm64 kernel ABI to allow to
> pass tagged user pointers (with the top byte set to something else other
> than 0x00) as syscall arguments.
>
> prctl_set_mm() and prctl_set_mm_map() use provided user pointers for vma
> lookups, which can only by done with untagged pointers.
>
> Untag user pointers in these functions.
>
> Signed-off-by: Andrey Konovalov <andreyknvl at google.com>
> ---
>   kernel/sys.c | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
>
> diff --git a/kernel/sys.c b/kernel/sys.c
> index 12df0e5434b8..8e56d87cc6db 100644
> --- a/kernel/sys.c
> +++ b/kernel/sys.c
> @@ -1993,6 +1993,18 @@ static int prctl_set_mm_map(int opt, const void __user *addr, unsigned long data
>   	if (copy_from_user(&prctl_map, addr, sizeof(prctl_map)))
>   		return -EFAULT;
>   
> +	prctl_map->start_code	= untagged_addr(prctl_map.start_code);
> +	prctl_map->end_code	= untagged_addr(prctl_map.end_code);
> +	prctl_map->start_data	= untagged_addr(prctl_map.start_data);
> +	prctl_map->end_data	= untagged_addr(prctl_map.end_data);
> +	prctl_map->start_brk	= untagged_addr(prctl_map.start_brk);
> +	prctl_map->brk		= untagged_addr(prctl_map.brk);
> +	prctl_map->start_stack	= untagged_addr(prctl_map.start_stack);
> +	prctl_map->arg_start	= untagged_addr(prctl_map.arg_start);
> +	prctl_map->arg_end	= untagged_addr(prctl_map.arg_end);
> +	prctl_map->env_start	= untagged_addr(prctl_map.env_start);
> +	prctl_map->env_end	= untagged_addr(prctl_map.env_end);

As the buildbot suggests, those -> should be . instead :) You might want to check 
your local build with CONFIG_CHECKPOINT_RESTORE=y.

> +
>   	error = validate_prctl_map(&prctl_map);
>   	if (error)
>   		return error;
> @@ -2106,6 +2118,8 @@ static int prctl_set_mm(int opt, unsigned long addr,
>   			      opt != PR_SET_MM_MAP_SIZE)))
>   		return -EINVAL;
>   
> +	addr = untagged_addr(addr);

This is a bit too coarse, addr is indeed used for find_vma() later on, but it is also 
used to access memory, by prctl_set_mm_mmap() and prctl_set_auxv().

Kevin

> +
>   #ifdef CONFIG_CHECKPOINT_RESTORE
>   	if (opt == PR_SET_MM_MAP || opt == PR_SET_MM_MAP_SIZE)
>   		return prctl_set_mm_map(opt, (const void __user *)addr, arg4);
