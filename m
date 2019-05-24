From: pbonzini at redhat.com (Paolo Bonzini)
Date: Fri, 24 May 2019 21:24:24 +0200
Subject: [PATCH] KVM: selftests: Wrap vcpu_nested_state_get/set functions
 with x86 guard
In-Reply-To: <20190523093114.18182-1-thuth@redhat.com>
References: <20190523093114.18182-1-thuth@redhat.com>
Message-ID: <1cb9f031-3483-b721-2e74-b12664b705ec@redhat.com>

On 23/05/19 11:31, Thomas Huth wrote:
> struct kvm_nested_state is only available on x86 so far. To be able
> to compile the code on other architectures as well, we need to wrap
> the related code with #ifdefs.
> 
> Signed-off-by: Thomas Huth <thuth at redhat.com>
> ---
>  tools/testing/selftests/kvm/include/kvm_util.h | 2 ++
>  tools/testing/selftests/kvm/lib/kvm_util.c     | 2 ++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
> index 8c6b9619797d..a5a4b28f14d8 100644
> --- a/tools/testing/selftests/kvm/include/kvm_util.h
> +++ b/tools/testing/selftests/kvm/include/kvm_util.h
> @@ -118,10 +118,12 @@ void vcpu_events_get(struct kvm_vm *vm, uint32_t vcpuid,
>  		     struct kvm_vcpu_events *events);
>  void vcpu_events_set(struct kvm_vm *vm, uint32_t vcpuid,
>  		     struct kvm_vcpu_events *events);
> +#ifdef __x86_64__
>  void vcpu_nested_state_get(struct kvm_vm *vm, uint32_t vcpuid,
>  			   struct kvm_nested_state *state);
>  int vcpu_nested_state_set(struct kvm_vm *vm, uint32_t vcpuid,
>  			  struct kvm_nested_state *state, bool ignore_error);
> +#endif
>  
>  const char *exit_reason_str(unsigned int exit_reason);
>  
> diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
> index cf62de377310..633b22df46a4 100644
> --- a/tools/testing/selftests/kvm/lib/kvm_util.c
> +++ b/tools/testing/selftests/kvm/lib/kvm_util.c
> @@ -1248,6 +1248,7 @@ void vcpu_events_set(struct kvm_vm *vm, uint32_t vcpuid,
>  		ret, errno);
>  }
>  
> +#ifdef __x86_64__
>  void vcpu_nested_state_get(struct kvm_vm *vm, uint32_t vcpuid,
>  			   struct kvm_nested_state *state)
>  {
> @@ -1279,6 +1280,7 @@ int vcpu_nested_state_set(struct kvm_vm *vm, uint32_t vcpuid,
>  
>  	return ret;
>  }
> +#endif
>  
>  /*
>   * VM VCPU System Regs Get
> 

Queued, thanks.

Paolo
