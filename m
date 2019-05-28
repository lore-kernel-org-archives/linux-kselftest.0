From: cohuck at redhat.com (Cornelia Huck)
Date: Tue, 28 May 2019 14:53:44 +0200
Subject: [PATCH 8/9] KVM: s390: Do not report unusabled IDs via
 KVM_CAP_MAX_VCPU_ID
In-Reply-To: <1deb73ac-9589-89cb-9a9b-f9957584733e@de.ibm.com>
References: <20190523164309.13345-1-thuth@redhat.com>
 <20190523164309.13345-9-thuth@redhat.com>
 <1deb73ac-9589-89cb-9a9b-f9957584733e@de.ibm.com>
Message-ID: <20190528145344.42fe6bc5.cohuck@redhat.com>

On Tue, 28 May 2019 13:00:30 +0200
Christian Borntraeger <borntraeger at de.ibm.com> wrote:

> Paolo, Radim,
> 
> would you consider this patch (or the full series) as 5.2 material or 5.3 material?

FWIW, I'd consider this patch 5.2 material, as we're currently relaying
wrong values to userspace.

> 
> 
> On 23.05.19 18:43, Thomas Huth wrote:
> > KVM_CAP_MAX_VCPU_ID is currently always reporting KVM_MAX_VCPU_ID on all
> > architectures. However, on s390x, the amount of usable CPUs is determined
> > during runtime - it is depending on the features of the machine the code
> > is running on. Since we are using the vcpu_id as an index into the SCA
> > structures that are defined by the hardware (see e.g. the sca_add_vcpu()
> > function), it is not only the amount of CPUs that is limited by the hard-
> > ware, but also the range of IDs that we can use.
> > Thus KVM_CAP_MAX_VCPU_ID must be determined during runtime on s390x, too.
> > So the handling of KVM_CAP_MAX_VCPU_ID has to be moved from the common
> > code into the architecture specific code, and on s390x we have to return
> > the same value here as for KVM_CAP_MAX_VCPUS.
> > This problem has been discovered with the kvm_create_max_vcpus selftest.
> > With this change applied, the selftest now passes on s390x, too.
> > 
> > Signed-off-by: Thomas Huth <thuth at redhat.com>
> > ---
> >  arch/mips/kvm/mips.c       | 3 +++
> >  arch/powerpc/kvm/powerpc.c | 3 +++
> >  arch/s390/kvm/kvm-s390.c   | 1 +
> >  arch/x86/kvm/x86.c         | 3 +++
> >  virt/kvm/arm/arm.c         | 3 +++
> >  virt/kvm/kvm_main.c        | 2 --
> >  6 files changed, 13 insertions(+), 2 deletions(-)
