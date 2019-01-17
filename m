From: drjones@redhat.com (Andrew Jones)
Date: Thu, 17 Jan 2019 09:28:11 +0100
Subject: [PATCH v2] kvm: selftests: Fix region overlap check in kvm_util
In-Reply-To: <20190116174115.95225-1-bgardon@google.com>
References: <20190116174115.95225-1-bgardon@google.com>
Message-ID: <20190117082811.nu7ffa35aulxpwcq@hawk.localdomain>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190117082811.uJX1j6opCRPsY8cthEg9gENDnibOMvEYT8LtKoSQ7h0@z>

On Wed, Jan 16, 2019@09:41:15AM -0800, Ben Gardon wrote:
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
>  tools/testing/selftests/kvm/lib/kvm_util.c | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
> 
> diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
> index 23022e9d32eb81..b52cfdefecbfe9 100644
> --- a/tools/testing/selftests/kvm/lib/kvm_util.c
> +++ b/tools/testing/selftests/kvm/lib/kvm_util.c
> @@ -571,7 +571,7 @@ void vm_userspace_mem_region_add(struct kvm_vm *vm,
>  	 * already exist.
>  	 */
>  	region = (struct userspace_mem_region *) userspace_mem_region_find(
> -		vm, guest_paddr, guest_paddr + npages * vm->page_size);
> +		vm, guest_paddr, (guest_paddr + npages * vm->page_size) - 1);
>  	if (region != NULL)
>  		TEST_ASSERT(false, "overlapping userspace_mem_region already "
>  			"exists\n"
> @@ -587,15 +587,10 @@ void vm_userspace_mem_region_add(struct kvm_vm *vm,
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
> -			"or overlapping physical memory range already exists.\n"
> +			"already exists.\n"
>  			"  requested slot: %u paddr: 0x%lx npages: 0x%lx\n"
>  			"  existing slot: %u paddr: 0x%lx size: 0x%lx",
>  			slot, guest_paddr, npages,
> -- 
> 2.20.1.97.g81188d93c3-goog
>

Reviewed-by: Andrew Jones <drjones at redhat.com>
