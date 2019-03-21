From: kevin.brodsky@arm.com (Kevin Brodsky)
Date: Thu, 21 Mar 2019 17:52:37 +0000
Subject: [PATCH v13 10/20] kernel, arm64: untag user pointers in
 prctl_set_mm*
In-Reply-To: <76f96eb9162b3a7fa5949d71af38bf8fdf6924c4.1553093421.git.andreyknvl@google.com>
References: <cover.1553093420.git.andreyknvl@google.com>
 <76f96eb9162b3a7fa5949d71af38bf8fdf6924c4.1553093421.git.andreyknvl@google.com>
Message-ID: <c5b9f421-0dd8-d56f-c591-0c841cbdfe3b@arm.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190321175237.YArhoQW89kqvOyzE0DiTBb4FaAmwySBLyBklO9ax8wo@z>

On 20/03/2019 14:51, Andrey Konovalov wrote:
> This patch is a part of a series that extends arm64 kernel ABI to allow to
> pass tagged user pointers (with the top byte set to something else other
> than 0x00) as syscall arguments.
>
> prctl_set_mm() and prctl_set_mm_map() use provided user pointers for vma
> lookups and do some pointer comparisons to perform validation, which can
> only by done with untagged pointers.
>
> Untag user pointers in these functions for vma lookup and validity checks.
>
> Signed-off-by: Andrey Konovalov <andreyknvl at google.com>
> ---
>   kernel/sys.c | 44 ++++++++++++++++++++++++++++++--------------
>   1 file changed, 30 insertions(+), 14 deletions(-)
>
> diff --git a/kernel/sys.c b/kernel/sys.c
> index 12df0e5434b8..fe26ccf3c9e6 100644
> --- a/kernel/sys.c
> +++ b/kernel/sys.c
> @@ -1885,11 +1885,12 @@ static int prctl_set_mm_exe_file(struct mm_struct *mm, unsigned int fd)
>    * WARNING: we don't require any capability here so be very careful
>    * in what is allowed for modification from userspace.
>    */
> -static int validate_prctl_map(struct prctl_mm_map *prctl_map)
> +static int validate_prctl_map(struct prctl_mm_map *tagged_prctl_map)
>   {
>   	unsigned long mmap_max_addr = TASK_SIZE;
>   	struct mm_struct *mm = current->mm;
>   	int error = -EINVAL, i;
> +	struct prctl_mm_map prctl_map;
>   
>   	static const unsigned char offsets[] = {
>   		offsetof(struct prctl_mm_map, start_code),
> @@ -1905,12 +1906,25 @@ static int validate_prctl_map(struct prctl_mm_map *prctl_map)
>   		offsetof(struct prctl_mm_map, env_end),
>   	};
>   
> +	memcpy(&prctl_map, tagged_prctl_map, sizeof(prctl_map));
> +	prctl_map.start_code	= untagged_addr(prctl_map.start_code);
> +	prctl_map.end_code	= untagged_addr(prctl_map.end_code);
> +	prctl_map.start_data	= untagged_addr(prctl_map.start_data);
> +	prctl_map.end_data	= untagged_addr(prctl_map.end_data);
> +	prctl_map.start_brk	= untagged_addr(prctl_map.start_brk);
> +	prctl_map.brk		= untagged_addr(prctl_map.brk);
> +	prctl_map.start_stack	= untagged_addr(prctl_map.start_stack);
> +	prctl_map.arg_start	= untagged_addr(prctl_map.arg_start);
> +	prctl_map.arg_end	= untagged_addr(prctl_map.arg_end);
> +	prctl_map.env_start	= untagged_addr(prctl_map.env_start);
> +	prctl_map.env_end	= untagged_addr(prctl_map.env_end);
> +
>   	/*
>   	 * Make sure the members are not somewhere outside
>   	 * of allowed address space.
>   	 */
>   	for (i = 0; i < ARRAY_SIZE(offsets); i++) {
> -		u64 val = *(u64 *)((char *)prctl_map + offsets[i]);
> +		u64 val = *(u64 *)((char *)&prctl_map + offsets[i]);
>   
>   		if ((unsigned long)val >= mmap_max_addr ||
>   		    (unsigned long)val < mmap_min_addr)
> @@ -1921,8 +1935,8 @@ static int validate_prctl_map(struct prctl_mm_map *prctl_map)
>   	 * Make sure the pairs are ordered.
>   	 */
>   #define __prctl_check_order(__m1, __op, __m2)				\
> -	((unsigned long)prctl_map->__m1 __op				\
> -	 (unsigned long)prctl_map->__m2) ? 0 : -EINVAL
> +	((unsigned long)prctl_map.__m1 __op				\
> +	 (unsigned long)prctl_map.__m2) ? 0 : -EINVAL
>   	error  = __prctl_check_order(start_code, <, end_code);
>   	error |= __prctl_check_order(start_data, <, end_data);
>   	error |= __prctl_check_order(start_brk, <=, brk);
> @@ -1937,23 +1951,24 @@ static int validate_prctl_map(struct prctl_mm_map *prctl_map)
>   	/*
>   	 * @brk should be after @end_data in traditional maps.
>   	 */
> -	if (prctl_map->start_brk <= prctl_map->end_data ||
> -	    prctl_map->brk <= prctl_map->end_data)
> +	if (prctl_map.start_brk <= prctl_map.end_data ||
> +	    prctl_map.brk <= prctl_map.end_data)
>   		goto out;
>   
>   	/*
>   	 * Neither we should allow to override limits if they set.
>   	 */
> -	if (check_data_rlimit(rlimit(RLIMIT_DATA), prctl_map->brk,
> -			      prctl_map->start_brk, prctl_map->end_data,
> -			      prctl_map->start_data))
> +	if (check_data_rlimit(rlimit(RLIMIT_DATA), prctl_map.brk,
> +			      prctl_map.start_brk, prctl_map.end_data,
> +			      prctl_map.start_data))
>   			goto out;
>   
>   	/*
>   	 * Someone is trying to cheat the auxv vector.
>   	 */
> -	if (prctl_map->auxv_size) {
> -		if (!prctl_map->auxv || prctl_map->auxv_size > sizeof(mm->saved_auxv))
> +	if (prctl_map.auxv_size) {
> +		if (!prctl_map.auxv || prctl_map.auxv_size >
> +						sizeof(mm->saved_auxv))
>   			goto out;
>   	}
>   
> @@ -1962,7 +1977,7 @@ static int validate_prctl_map(struct prctl_mm_map *prctl_map)
>   	 * change /proc/pid/exe link: only local sys admin should
>   	 * be allowed to.
>   	 */
> -	if (prctl_map->exe_fd != (u32)-1) {
> +	if (prctl_map.exe_fd != (u32)-1) {
>   		if (!ns_capable(current_user_ns(), CAP_SYS_ADMIN))
>   			goto out;
>   	}
> @@ -2120,13 +2135,14 @@ static int prctl_set_mm(int opt, unsigned long addr,
>   	if (opt == PR_SET_MM_AUXV)
>   		return prctl_set_auxv(mm, addr, arg4);
>   
> -	if (addr >= TASK_SIZE || addr < mmap_min_addr)
> +	if (untagged_addr(addr) >= TASK_SIZE ||
> +			untagged_addr(addr) < mmap_min_addr)
>   		return -EINVAL;
>   
>   	error = -EINVAL;
>   
>   	down_write(&mm->mmap_sem);
> -	vma = find_vma(mm, addr);
> +	vma = find_vma(mm, untagged_addr(addr));
>   
>   	prctl_map.start_code	= mm->start_code;
>   	prctl_map.end_code	= mm->end_code;

I think this new version is consistent w.r.t. tagged/untagged pointer usage. However, 
I also note that a significant change has been introduced: it is now possible to set 
MM fields to tagged addresses (tags are ignored by validate_prctl_map()). I am not 
opposed to this as such, but have you considered the implications? Does it make sense 
to have a tagged value for e.g. prctl_map.arg_start? Is the kernel able to handle 
tagged values in those fields? I have the feeling that it's safer to discard tags for 
now, and if necessary allow them to be preserved later on.

Kevin
