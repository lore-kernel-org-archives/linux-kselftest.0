From: pbonzini at redhat.com (Paolo Bonzini)
Date: Tue, 26 Jun 2018 13:32:49 +0200
Subject: [PATCH 1/1] kvm: selftests: add cr4_cpuid_sync_test
In-Reply-To: <1529984517-7843-1-git-send-email-wei@redhat.com>
References: <1529984517-7843-1-git-send-email-wei@redhat.com>
Message-ID: <e73137a6-6e4c-ab9b-0705-a3ce33d8df66@redhat.com>

On 26/06/2018 05:41, Wei Huang wrote:
> KVM is supposed to update some guest VM's CPUID bits (e.g. OSXSAVE) when
> CR4 is changed. A bug was found in KVM recently and it was fixed by
> Commit c4d2188206ba ("KVM: x86: Update cpuid properly when CR4.OSXAVE or
> CR4.PKE is changed"). This patch adds a test to verify the synchronization
> between guest VM's CR4 and CPUID bits.
> 
> Signed-off-by: Wei Huang <wei at redhat.com>
> ---
>  tools/testing/selftests/kvm/Makefile              |   1 +
>  tools/testing/selftests/kvm/cr4_cpuid_sync_test.c | 129 ++++++++++++++++++++++
>  2 files changed, 130 insertions(+)
>  create mode 100644 tools/testing/selftests/kvm/cr4_cpuid_sync_test.c
> 
> diff --git a/tools/testing/selftests/kvm/Makefile b/tools/testing/selftests/kvm/Makefile
> index d9d0031..65bda4f 100644
> --- a/tools/testing/selftests/kvm/Makefile
> +++ b/tools/testing/selftests/kvm/Makefile
> @@ -9,6 +9,7 @@ LIBKVM_x86_64 = lib/x86.c lib/vmx.c
>  TEST_GEN_PROGS_x86_64 = set_sregs_test
>  TEST_GEN_PROGS_x86_64 += sync_regs_test
>  TEST_GEN_PROGS_x86_64 += vmx_tsc_adjust_test
> +TEST_GEN_PROGS_x86_64 += cr4_cpuid_sync_test
>  
>  TEST_GEN_PROGS += $(TEST_GEN_PROGS_$(UNAME_M))
>  LIBKVM += $(LIBKVM_$(UNAME_M))
> diff --git a/tools/testing/selftests/kvm/cr4_cpuid_sync_test.c b/tools/testing/selftests/kvm/cr4_cpuid_sync_test.c
> new file mode 100644
> index 0000000..dbbaf3c
> --- /dev/null
> +++ b/tools/testing/selftests/kvm/cr4_cpuid_sync_test.c
> @@ -0,0 +1,129 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * CR4 and CPUID sync test
> + *
> + * Copyright 2018, Red Hat, Inc. and/or its affiliates.
> + *
> + * Author:
> + *   Wei Huang <wei at redhat.com>
> + */
> +
> +#include <fcntl.h>
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <string.h>
> +#include <sys/ioctl.h>
> +
> +#include "test_util.h"
> +
> +#include "kvm_util.h"
> +#include "x86.h"
> +
> +#define X86_FEATURE_XSAVE	(1<<26)
> +#define X86_FEATURE_OSXSAVE	(1<<27)
> +#define VCPU_ID			1
> +
> +enum {
> +	GUEST_UPDATE_CR4 = 0x1000,
> +	GUEST_FAILED,
> +	GUEST_DONE,
> +};
> +
> +static void exit_to_hv(uint16_t port)
> +{
> +	__asm__ __volatile__("in %[port], %%al"
> +			     :
> +			     : [port]"d"(port)
> +			     : "rax");
> +}
> +
> +static inline bool cr4_cpuid_is_sync(void)
> +{
> +	int func, subfunc;
> +	uint32_t eax, ebx, ecx, edx;
> +	uint64_t cr4;
> +
> +	func = 0x1;
> +	subfunc = 0x0;
> +	__asm__ __volatile__("cpuid"
> +			     : "=a"(eax), "=b"(ebx), "=c"(ecx), "=d"(edx)
> +			     : "a"(func), "c"(subfunc));
> +
> +	cr4 = get_cr4();
> +
> +	return (!!(ecx & X86_FEATURE_OSXSAVE)) == (!!(cr4 & X86_CR4_OSXSAVE));
> +}
> +
> +static void guest_code(void)
> +{
> +	uint64_t cr4;
> +
> +	/* turn on CR4.OSXSAVE */
> +	cr4 = get_cr4();
> +	cr4 |= X86_CR4_OSXSAVE;
> +	set_cr4(cr4);
> +
> +	/* verify CR4.OSXSAVE == CPUID.OSXSAVE */
> +	if (!cr4_cpuid_is_sync())
> +		exit_to_hv(GUEST_FAILED);
> +
> +	/* notify hypervisor to change CR4 */
> +	exit_to_hv(GUEST_UPDATE_CR4);
> +
> +	/* check again */
> +	if (!cr4_cpuid_is_sync())
> +		exit_to_hv(GUEST_FAILED);
> +
> +	exit_to_hv(GUEST_DONE);
> +}
> +
> +int main(int argc, char *argv[])
> +{
> +	struct kvm_run *run;
> +	struct kvm_vm *vm;
> +	struct kvm_sregs sregs;
> +	struct kvm_cpuid_entry2 *entry;
> +	int rc;
> +
> +	entry = kvm_get_supported_cpuid_entry(1);
> +	if (!(entry->ecx & X86_FEATURE_XSAVE)) {
> +		printf("XSAVE feature not supported, skipping test\n");
> +		return 0;
> +	}
> +
> +	/* Tell stdout not to buffer its content */
> +	setbuf(stdout, NULL);
> +
> +	/* Create VM */
> +	vm = vm_create_default_vmx(VCPU_ID, guest_code);
> +	vcpu_set_cpuid(vm, VCPU_ID, kvm_get_supported_cpuid());
> +	run = vcpu_state(vm, VCPU_ID);
> +
> +	while (1) {
> +		rc = _vcpu_run(vm, VCPU_ID);
> +
> +		if (run->exit_reason == KVM_EXIT_IO) {
> +			switch (run->io.port) {
> +			case GUEST_UPDATE_CR4:
> +				/* emulate hypervisor clearing CR4.OSXSAVE */
> +				vcpu_sregs_get(vm, VCPU_ID, &sregs);
> +				sregs.cr4 &= ~X86_CR4_OSXSAVE;
> +				vcpu_sregs_set(vm, VCPU_ID, &sregs);
> +				break;
> +			case GUEST_FAILED:
> +				TEST_ASSERT(false, "Guest CR4 bit (OSXSAVE) unsynchronized with CPUID bit.");
> +				break;
> +			case GUEST_DONE:
> +				goto done;
> +			default:
> +				TEST_ASSERT(false, "Unknown port 0x%x.",
> +					    run->io.port);
> +			}
> +		}
> +	}
> +
> +	kvm_vm_free(vm);
> +
> +done:
> +	return 0;
> +}
> 

Queued, thanks.

Paolo
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
