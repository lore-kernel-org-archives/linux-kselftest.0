From: thuth at redhat.com (Thomas Huth)
Date: Mon, 27 May 2019 09:39:09 +0200
Subject: [PATCH] KVM: s390: fix memory slot handling for
 KVM_SET_USER_MEMORY_REGION
In-Reply-To: <20190524140623.104033-1-borntraeger@de.ibm.com>
References: <20190524140623.104033-1-borntraeger@de.ibm.com>
Message-ID: <54e7751b-53a0-fd69-2ce0-d7836411a8e6@redhat.com>

On 24/05/2019 16.06, Christian Borntraeger wrote:
> kselftests exposed a problem in the s390 handling for memory slots.
> Right now we only do proper memory slot handling for creation of new
> memory slots. Neither MOVE, nor DELETION are handled properly. Let us
> implement those.
> 
> Signed-off-by: Christian Borntraeger <borntraeger at de.ibm.com>
> ---
>  arch/s390/kvm/kvm-s390.c | 35 +++++++++++++++++++++--------------
>  1 file changed, 21 insertions(+), 14 deletions(-)
> 
> diff --git a/arch/s390/kvm/kvm-s390.c b/arch/s390/kvm/kvm-s390.c
> index 871d2e99b156..6ec0685ab2c7 100644
> --- a/arch/s390/kvm/kvm-s390.c
> +++ b/arch/s390/kvm/kvm-s390.c
> @@ -4525,21 +4525,28 @@ void kvm_arch_commit_memory_region(struct kvm *kvm,
>  				const struct kvm_memory_slot *new,
>  				enum kvm_mr_change change)
>  {
> -	int rc;
> +	int rc = 0;
>  
> -	/* If the basics of the memslot do not change, we do not want
> -	 * to update the gmap. Every update causes several unnecessary
> -	 * segment translation exceptions. This is usually handled just
> -	 * fine by the normal fault handler + gmap, but it will also
> -	 * cause faults on the prefix page of running guest CPUs.
> -	 */
> -	if (old->userspace_addr == mem->userspace_addr &&
> -	    old->base_gfn * PAGE_SIZE == mem->guest_phys_addr &&
> -	    old->npages * PAGE_SIZE == mem->memory_size)
> -		return;

This check is now gone in the new code. Maybe mention the reason in the
patch description?

> -	rc = gmap_map_segment(kvm->arch.gmap, mem->userspace_addr,
> -		mem->guest_phys_addr, mem->memory_size);
> +	switch (change) {
> +	case KVM_MR_DELETE:
> +		rc = gmap_unmap_segment(kvm->arch.gmap, old->base_gfn * PAGE_SIZE,
> +					old->npages * PAGE_SIZE);
> +		break;
> +	case KVM_MR_MOVE:
> +		rc = gmap_unmap_segment(kvm->arch.gmap, old->base_gfn * PAGE_SIZE,
> +					old->npages * PAGE_SIZE);
> +		if (rc)
> +			break;
> +		/* FALLTHROUGH */
> +	case KVM_MR_CREATE:
> +		rc = gmap_map_segment(kvm->arch.gmap, mem->userspace_addr,
> +				      mem->guest_phys_addr, mem->memory_size);
> +		break;
> +	case KVM_MR_FLAGS_ONLY:
> +		break;
> +	default:
> +		WARN(1, "Unknown KVM MR CHANGE: %d\n", change);
> +	}
>  	if (rc)
>  		pr_warn("failed to commit memory region\n");
>  	return;
> 

Looks good to me, but I'm not an expert in this area, so FWIW a weak:

Reviewed-by: Thomas Huth <thuth at redhat.com>
