From: drjones at redhat.com (Andrew Jones)
Date: Thu, 23 May 2019 12:56:23 +0200
Subject: [RFC PATCH 4/4] KVM: selftests: Add the sync_regs test for s390x
In-Reply-To: <20190516111253.4494-5-thuth@redhat.com>
References: <20190516111253.4494-1-thuth@redhat.com>
 <20190516111253.4494-5-thuth@redhat.com>
Message-ID: <20190523105623.3zlnbleniovobwzk@kamzik.brq.redhat.com>

On Thu, May 16, 2019 at 01:12:53PM +0200, Thomas Huth wrote:
> The test is an adaption of the same test for x86. Note that there
> are some differences in the way how s390x deals with the kvm_valid_regs
> in struct kvm_run, so some of the tests had to be removed. Also this
> test is not using the ucall() interface on s390x yet (which would need
> some work to be usable on s390x), so it simply drops out of the VM with
> a diag 0x501 breakpoint instead.
> 
> Signed-off-by: Thomas Huth <thuth at redhat.com>
> ---
>  MAINTAINERS                                   |   1 +
>  tools/testing/selftests/kvm/Makefile          |   2 +
>  .../selftests/kvm/s390x/sync_regs_test.c      | 151 ++++++++++++++++++
>  3 files changed, 154 insertions(+)
>  create mode 100644 tools/testing/selftests/kvm/s390x/sync_regs_test.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 514d1f88ee26..68f76ee9e821 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8645,6 +8645,7 @@ F:	arch/s390/include/asm/gmap.h
>  F:	arch/s390/include/asm/kvm*
>  F:	arch/s390/kvm/
>  F:	arch/s390/mm/gmap.c
> +F:	tools/testing/selftests/kvm/s390x/
>  F:	tools/testing/selftests/kvm/*/s390x/

Do we need these lines added? We have tools/testing/selftests/kvm/ in the
common KVM section already. If we do want to specify them specifically,
then I guess we need x86 and arm MAINTAINERS updates as well.

Thanks,
drew
