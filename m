From: cohuck at redhat.com (Cornelia Huck)
Date: Fri, 24 May 2019 11:13:23 +0200
Subject: [PATCH 8/9] KVM: s390: Do not report unusabled IDs via
 KVM_CAP_MAX_VCPU_ID
In-Reply-To: <20190523164309.13345-9-thuth@redhat.com>
References: <20190523164309.13345-1-thuth@redhat.com>
 <20190523164309.13345-9-thuth@redhat.com>
Message-ID: <20190524111323.656afbff.cohuck@redhat.com>

On Thu, 23 May 2019 18:43:08 +0200
Thomas Huth <thuth at redhat.com> wrote:

In the subject: s/unusabled/unusable/

> KVM_CAP_MAX_VCPU_ID is currently always reporting KVM_MAX_VCPU_ID on all
> architectures. However, on s390x, the amount of usable CPUs is determined
> during runtime - it is depending on the features of the machine the code
> is running on. Since we are using the vcpu_id as an index into the SCA
> structures that are defined by the hardware (see e.g. the sca_add_vcpu()
> function), it is not only the amount of CPUs that is limited by the hard-
> ware, but also the range of IDs that we can use.
> Thus KVM_CAP_MAX_VCPU_ID must be determined during runtime on s390x, too.
> So the handling of KVM_CAP_MAX_VCPU_ID has to be moved from the common
> code into the architecture specific code, and on s390x we have to return
> the same value here as for KVM_CAP_MAX_VCPUS.
> This problem has been discovered with the kvm_create_max_vcpus selftest.
> With this change applied, the selftest now passes on s390x, too.
> 
> Signed-off-by: Thomas Huth <thuth at redhat.com>
> ---
>  arch/mips/kvm/mips.c       | 3 +++
>  arch/powerpc/kvm/powerpc.c | 3 +++
>  arch/s390/kvm/kvm-s390.c   | 1 +
>  arch/x86/kvm/x86.c         | 3 +++
>  virt/kvm/arm/arm.c         | 3 +++
>  virt/kvm/kvm_main.c        | 2 --
>  6 files changed, 13 insertions(+), 2 deletions(-)

Reviewed-by: Cornelia Huck <cohuck at redhat.com>
