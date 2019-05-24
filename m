From: borntraeger at de.ibm.com (Christian Borntraeger)
Date: Fri, 24 May 2019 10:37:39 +0200
Subject: [PATCH 3/9] kvm: selftests: aarch64: fix default vm mode
In-Reply-To: <20190523164309.13345-4-thuth@redhat.com>
References: <20190523164309.13345-1-thuth@redhat.com>
 <20190523164309.13345-4-thuth@redhat.com>
Message-ID: <b6fb1542-5679-c52d-6fd1-f4d4f1a2d36b@de.ibm.com>



On 23.05.19 18:43, Thomas Huth wrote:
> From: Andrew Jones <drjones at redhat.com>
> 
> VM_MODE_P52V48_4K is not a valid mode for AArch64. Replace its
> use in vm_create_default() with a mode that works and represents
> a good AArch64 default. (We didn't ever see a problem with this
> because we don't have any unit tests using vm_create_default(),
> but it's good to get it fixed in advance.)
> 
> Reported-by: Thomas Huth <thuth at redhat.com>
> Signed-off-by: Andrew Jones <drjones at redhat.com>

I will add Thomas Signed-off-by here as well.


> ---
>  tools/testing/selftests/kvm/lib/aarch64/processor.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/kvm/lib/aarch64/processor.c b/tools/testing/selftests/kvm/lib/aarch64/processor.c
> index e8c42506a09d..fa6cd340137c 100644
> --- a/tools/testing/selftests/kvm/lib/aarch64/processor.c
> +++ b/tools/testing/selftests/kvm/lib/aarch64/processor.c
> @@ -226,7 +226,7 @@ struct kvm_vm *vm_create_default(uint32_t vcpuid, uint64_t extra_mem_pages,
>  	uint64_t extra_pg_pages = (extra_mem_pages / ptrs_per_4k_pte) * 2;
>  	struct kvm_vm *vm;
>  
> -	vm = vm_create(VM_MODE_P52V48_4K, DEFAULT_GUEST_PHY_PAGES + extra_pg_pages, O_RDWR);
> +	vm = vm_create(VM_MODE_P40V48_4K, DEFAULT_GUEST_PHY_PAGES + extra_pg_pages, O_RDWR);
>  
>  	kvm_vm_elf_load(vm, program_invocation_name, 0, 0);
>  	vm_vcpu_add_default(vm, vcpuid, guest_code);
> 
