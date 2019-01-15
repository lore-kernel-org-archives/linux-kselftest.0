From: drjones@redhat.com (Andrew Jones)
Date: Tue, 15 Jan 2019 17:32:45 +0100
Subject: [PATCH] kvm: selftests: Fix region overlap check in kvm_util
In-Reply-To: <20190114190653.203837-1-bgardon@google.com>
References: <20190114190653.203837-1-bgardon@google.com>
Message-ID: <20190115163245.sdntpkpgdesdoo2w@kamzik.brq.redhat.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190115163245.51b682cclIi4p-Pb555_ozEO8qJD487k61aKCCNdHFI@z>

On Mon, Jan 14, 2019@11:06:53AM -0800, Ben Gardon wrote:
> Fix a call to userspace_mem_region_find to conform to its spec of
> taking an inclusive, inclusive range. It was previously being called
> with an inclusive, exclusive range. Also remove a redundant region bounds
> check in vm_userspace_mem_region_add. Region overlap checking is already
> performed by the call to userspace_mem_region_find.
> 
> Tested: Compiled tools/testing/selftests/kvm with -static
> 	Ran all resulting test binaries on an Intel Haswell test machine
> 	All tests passed
> 
> Signed-off-by: Ben Gardon <bgardon at google.com>
> Reviewed-by: Jim Mattson <jmattson at google.com>
> ---
>  tools/testing/selftests/kvm/lib/kvm_util.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
> index 23022e9d32eb81..461e1a50779762 100644
> --- a/tools/testing/selftests/kvm/lib/kvm_util.c
> +++ b/tools/testing/selftests/kvm/lib/kvm_util.c
> @@ -571,7 +571,7 @@ void vm_userspace_mem_region_add(struct kvm_vm *vm,
>  	 * already exist.
>  	 */
>  	region = (struct userspace_mem_region *) userspace_mem_region_find(
> -		vm, guest_paddr, guest_paddr + npages * vm->page_size);
> +		vm, guest_paddr, (guest_paddr + npages * vm->page_size) + 1);

This should be '- 1', not '+ 1'.

>  	if (region != NULL)
>  		TEST_ASSERT(false, "overlapping userspace_mem_region already "
>  			"exists\n"
> @@ -587,11 +587,6 @@ void vm_userspace_mem_region_add(struct kvm_vm *vm,
>  		region = region->next) {
>  		if (region->region.slot == slot)
>  			break;
> -		if ((guest_paddr <= (region->region.guest_phys_addr
> -				+ region->region.memory_size))
> -			&& ((guest_paddr + npages * vm->page_size)
> -				>= region->region.guest_phys_addr))
> -			break;
>  	}
>  	if (region != NULL)
>  		TEST_ASSERT(false, "A mem region with the requested slot "

This assert's message also states "or overlapping physical memory range",
which should now be removed.

Thanks,
drew
