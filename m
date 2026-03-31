Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD6E94657C6
	for <linux-kselftest@vger.kernel.org>; Tue, 31 Mar 2026 22:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774996404; cv=pass; b=JHrv4csHIR8OtpAMdgm/qLJs0cJhMjd6yYemaBSKcxem9q/hhWMKTtNGGASURLGno3n7O0IIR47P/cE5wDc78MwWj63WfiTcchX841WIxgosmUT1pQsoncK+y9D7SyEjARNRF9qBSpjezxVfZrbv5g6iict9kpzXwUMKkuvpl1s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774996404; c=relaxed/simple;
	bh=kSoKfcCAm8/gTpfZf+vjCSevgnCCnOACbGJyXLFwyWE=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rn74CP/Gr+Fx4DoDPZeKb56Q7AyuZhnMyzqeGI5eeSNWyRiqfZab/nCXhYs7uK9iS1HNwKBvtWu0adg9aTIVpxQh/77KcW0hLo6Sa4nswqTW48Ll9RzkqcMg7bXPVFDcp+NCTXz8bdZt1+OLFvdJTqcTcmlcmdiqLhLVAcqnGQ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uKt+Bh2t; arc=pass smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uKt+Bh2t"
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-94dcf70af41so1740185241.1
        for <linux-kselftest@vger.kernel.org>; Tue, 31 Mar 2026 15:33:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774996402; cv=none;
        d=google.com; s=arc-20240605;
        b=VepDjC4qCbkPGqRtBsp3j/ZmGBhOj4nb1l1bbBa6JzZ9jFsWKn6p/D7p+ml5HmuSBM
         eMJBStYNp3dtA1ocZoqFH0Qn82yu6mK0RUi3cgSoePozM3kTHStDqf5a2JmA8tdDIQv+
         Xxj3rL2I9EikwtU4de/tNgX8XI0yMY4HWYI1+1hIxsmJY0vAhv3SYKPMUSOHnQoUvaAf
         7rlGL2avNbEMxcVHh1jdaiSB6s8deLEXos0V2X8RuM0eg9FdtAgvTJ6YASeIentmhMRB
         dS4KrzU6NqHEGDRiVtF45PZE2nrxQMmltXfmKPgtlhJlo8x9dh/B5bMAhSAYEHMpNz27
         I7mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=t/sx/qLvnRMy19+TBDpUXhwm2KN2kFi93SeLbyugb9I=;
        fh=d4U2n/mXgxWsvYKahctqZw9n3Wb16cJO9AworiSsJj0=;
        b=P8TJ6OdQ/w4+M1DGpqzGm3gL0+Co95wDpO6PqHQAqcOPzbde+VeJOvM2KWoE9nJxsz
         ep3nx1FnQ0YueWYI1SP3wRhr3eqWqBaDCJpDEy2B21x7icZ3SmbTZt0p2VLsS77uh/JC
         Rg320+YtO+5TkGvtyFjR4dtyn1ihBChcRuz6h7IZuPnMNyVm+EtrDrtK0KWRKQRIVUKA
         qlqKwsI8xV+RUFnzOwQYVBIBbvV5qitdJw9npqR5Y3wdhvQ/jJ/fK/cGymtrYS5LZp84
         De97ocw8ghmJ7wUmLn/JYzBT6ChJjSZh7VMzbmJTe8xAR0SMGSrRzaAMwEPz3Emx5IWD
         qfYw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774996402; x=1775601202; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=t/sx/qLvnRMy19+TBDpUXhwm2KN2kFi93SeLbyugb9I=;
        b=uKt+Bh2t8W0KIuGpKieV3CyzODcnUOjEe/KZO6PjVMja/txD5rmq3nV1ok2y8movFk
         ZhP4wMkyUTQJoj37qC+Ak512OaQ2noS0xnn6lCeCzXwslvXWn2ZvmmuKA99rYo9xKBaR
         DIJjygL50EcqWIVokjljUtkG+DeY+IDjg+pycDSGu+OjjkZ1Rki3eIJyHMw52PlUFeXi
         54dz78gHqvn+J1utxFsHu8ojBPpaMzP0u2lXIOGkU/pcsE28Yr8J26ed1I2r9KwNXlHR
         KtesoQnN4Ng3JJxPlUPoxLeuvaRC5ifeRSw2acdXhg4IEHZ+7YtIK2C2myC8V9ENlxeR
         AbMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774996402; x=1775601202;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t/sx/qLvnRMy19+TBDpUXhwm2KN2kFi93SeLbyugb9I=;
        b=H1Cl/LUp95YQzryj7e2wOo7aVQcB2PLwD5i5Pxgady2lBBbEIrOrgDRGnXj81FyK4i
         kTvrij105YvdziuxgSbjfPPAcZ1cLgff3JqL5eYypCLww0U6OB50hGnzGC/KaT2WEMw+
         eQlxkE9+Pmc99N0wn6kZkDtgfSx7XztcPS//h2JjWkQs84gSQ/6qgAVdfsqZ5W8RzvY6
         SRJsuTq5vsSfYGvd6Q6kP2kMhLdVNw+NyWcHQBpvf5BSlg7jPJKNK0Cn0Vc/2GCRtZC5
         61ngdZu8MDp6DQmawdUaMtAiIAMpWFY5f5fBGb6aM9DRsip+nU4weY5EGGuPHsjZM0pa
         jI5w==
X-Forwarded-Encrypted: i=1; AJvYcCXh9LyceWRQetqZxiWOXhFUxXWvd1c6oTpdcV0Sls0D857a5bNj+W/3UOVJLZZdvswNY9ftUhlVkWuRymq3F3A=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrlXNIh1HMmTDY6NEhd83dXM2PsejU9yxe/vHSFTEx+o+Yswro
	OkOBfD+Aegyu/DmH/GJApKvZa0HdtsUDcZwqAs9anmf7g9yiJeIow+GcEF3S3aI8X7VlJZ80QSO
	qiJCHrooChqaNV3Q8fm2EvKB3tKt7uhQkCXCUDKeK
X-Gm-Gg: ATEYQzzl5joDETPsSqQ2wk+XtKsnjcZMhiERNchOY8DTIeGjOgrUEXvVNlDl254SLN8
	PCT7mTpygiHVXDxnpGdAQ5Xzq+ttsIZNllukXRbzfGd/MIDfCYKDNnFN+y9CIbTbhIf564T++nx
	yDyEmlWQvV5c8xtAL1W1O5CfaKLTtlxUwFs7D79nIQId9jQrdtsRf7nJoqyYqeV1c4S8iCZDbY1
	tiRaKzOwY8HcgzxDpUH2WIr5szKm6Or6NCGDARBhkPE9PlE+2kb0hZ2XP9fiYjaVGtqgyvIIWMh
	hLp9DVB29Mp4rQ3ff+z+PbIWHwMhmu2ZOppsJxHRCM6bFoubgyneQl2N/V9cXe+HxoKm3A==
X-Received: by 2002:a05:6102:6884:b0:605:23e7:30a4 with SMTP id
 ada2fe7eead31-605680faeeemr406939137.27.1774996401056; Tue, 31 Mar 2026
 15:33:21 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 31 Mar 2026 15:33:20 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 31 Mar 2026 15:33:19 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260326-gmem-inplace-conversion-v4-25-e202fe950ffd@google.com>
References: <20260326-gmem-inplace-conversion-v4-0-e202fe950ffd@google.com> <20260326-gmem-inplace-conversion-v4-25-e202fe950ffd@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 31 Mar 2026 15:33:19 -0700
X-Gm-Features: AQROBzAKk6Utt-XQ0U1-IucoHPkAd_A6svVmQ0C1L4caLlaffOGn0MEaGSZG1lo
Message-ID: <CAEvNRgE6Tn81Yddgbjqs-gs491NzpppjbDHKzpmdPCxgSPeUPQ@mail.gmail.com>
Subject: Re: [PATCH RFC v4 25/44] KVM: selftests: Test basic single-page
 conversion flow
To: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	ira.weiny@intel.com, jmattson@google.com, jroedel@suse.de, 
	jthoughton@google.com, michael.roth@amd.com, oupton@kernel.org, 
	pankaj.gupta@amd.com, qperret@google.com, rick.p.edgecombe@intel.com, 
	rientjes@google.com, shivankg@amd.com, steven.price@arm.com, tabba@google.com, 
	willy@infradead.org, wyihan@google.com, yan.y.zhao@intel.com, 
	forkloop@google.com, pratyush@kernel.org, suzuki.poulose@arm.com, 
	aneesh.kumar@kernel.org, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Shuah Khan <shuah@kernel.org>, Vishal Annapurve <vannapurve@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@kernel.org>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"

Ackerley Tng <ackerleytng@google.com> writes:

> Add a selftest for the guest_memfd memory attribute conversion ioctls.
> The test starts the guest_memfd as all-private (the default state), and
> verifies the basic flow of converting a single page to shared and then back
> to private.
>
> Add infrastructure that supports extensions to other conversion flow
> tests. This infrastructure will be used in upcoming patches for other
> conversion tests.
>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
> Co-developed-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  tools/testing/selftests/kvm/Makefile.kvm           |   1 +
>  .../selftests/kvm/guest_memfd_conversions_test.c   | 205 +++++++++++++++++++++
>  2 files changed, 206 insertions(+)
>
> diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
> index dc68371f76a33..0e2a9adfca57e 100644
> --- a/tools/testing/selftests/kvm/Makefile.kvm
> +++ b/tools/testing/selftests/kvm/Makefile.kvm
> @@ -147,6 +147,7 @@ TEST_GEN_PROGS_x86 += access_tracking_perf_test
>  TEST_GEN_PROGS_x86 += coalesced_io_test
>  TEST_GEN_PROGS_x86 += dirty_log_perf_test
>  TEST_GEN_PROGS_x86 += guest_memfd_test
> +TEST_GEN_PROGS_x86 += guest_memfd_conversions_test
>  TEST_GEN_PROGS_x86 += hardware_disable_test
>  TEST_GEN_PROGS_x86 += memslot_modification_stress_test
>  TEST_GEN_PROGS_x86 += memslot_perf_test
> diff --git a/tools/testing/selftests/kvm/guest_memfd_conversions_test.c b/tools/testing/selftests/kvm/guest_memfd_conversions_test.c
> new file mode 100644
> index 0000000000000..841b2824ae996
> --- /dev/null
> +++ b/tools/testing/selftests/kvm/guest_memfd_conversions_test.c
> @@ -0,0 +1,205 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2024, Google LLC.
> + */
> +#include <sys/mman.h>
> +#include <unistd.h>
> +
> +#include <linux/align.h>
> +#include <linux/kvm.h>
> +#include <linux/sizes.h>
> +
> +#include "kvm_util.h"
> +#include "kselftest_harness.h"
> +#include "test_util.h"
> +#include "ucall_common.h"
> +
> +FIXTURE(gmem_conversions) {
> +	struct kvm_vcpu *vcpu;
> +	int gmem_fd;
> +	/* HVA of the first byte of the memory mmap()-ed from gmem_fd. */
> +	char *mem;
> +};
> +
> +typedef FIXTURE_DATA(gmem_conversions) test_data_t;
> +
> +FIXTURE_SETUP(gmem_conversions) { }
> +
> +static uint64_t page_size;
> +
> +static void guest_do_rmw(void);
> +#define GUEST_MEMFD_SHARING_TEST_GVA 0x90000000ULL
> +
> +/*
> + * Defer setup until the individual test is invoked so that tests can specify
> + * the number of pages and flags for the guest_memfd instance.
> + */
> +static void gmem_conversions_do_setup(test_data_t *t, int nr_pages,
> +				      int gmem_flags)
> +{
> +	const struct vm_shape shape = {
> +		.mode = VM_MODE_DEFAULT,
> +		.type = KVM_X86_SW_PROTECTED_VM,
> +	};
> +	/*
> +	 * Use high GPA above APIC_DEFAULT_PHYS_BASE to avoid clashing with
> +	 * APIC_DEFAULT_PHYS_BASE.
> +	 */
> +	const uint64_t gpa = SZ_4G;
> +	const uint32_t slot = 1;
> +	u64 supported_flags;
> +	struct kvm_vm *vm;
> +
> +	vm = __vm_create_shape_with_one_vcpu(shape, &t->vcpu, nr_pages, guest_do_rmw);
> +
> +	supported_flags = vm_check_cap(vm, KVM_CAP_MEMORY_ATTRIBUTES2_FLAGS);
> +	TEST_REQUIRE(supported_flags & KVM_SET_MEMORY_ATTRIBUTES2_PRESERVE);
> +
> +	vm_mem_add(vm, VM_MEM_SRC_SHMEM, gpa, slot, nr_pages,
> +		   KVM_MEM_GUEST_MEMFD, -1, 0, gmem_flags);
> +
> +	t->gmem_fd = kvm_slot_to_fd(vm, slot);
> +	t->mem = addr_gpa2hva(vm, gpa);
> +	virt_map(vm, GUEST_MEMFD_SHARING_TEST_GVA, gpa, nr_pages);
> +}
> +
> +static void gmem_conversions_do_teardown(test_data_t *t)
> +{
> +	/* No need to close gmem_fd, it's owned by the VM structure. */
> +	kvm_vm_free(t->vcpu->vm);
> +}
> +
> +FIXTURE_TEARDOWN(gmem_conversions)
> +{
> +	gmem_conversions_do_teardown(self);
> +}
> +
> +/*
> + * In these test definition macros, __nr_pages and nr_pages is used to set up
> + * the total number of pages in the guest_memfd under test. This will be
> + * available in the test definitions as nr_pages.
> + */
> +
> +#define __GMEM_CONVERSION_TEST(test, __nr_pages, flags)				\
> +static void __gmem_conversions_##test(test_data_t *t, int nr_pages);		\
> +										\
> +TEST_F(gmem_conversions, test)							\
> +{										\
> +	gmem_conversions_do_setup(self, __nr_pages, flags);			\
> +	__gmem_conversions_##test(self, __nr_pages);				\
> +}										\
> +static void __gmem_conversions_##test(test_data_t *t, int nr_pages)		\
> +
> +#define GMEM_CONVERSION_TEST(test, __nr_pages, flags)				\
> +	__GMEM_CONVERSION_TEST(test, __nr_pages, (flags) | GUEST_MEMFD_FLAG_MMAP)
> +
> +#define __GMEM_CONVERSION_TEST_INIT_PRIVATE(test, __nr_pages)			\
> +	GMEM_CONVERSION_TEST(test, __nr_pages, 0)
> +
> +#define GMEM_CONVERSION_TEST_INIT_PRIVATE(test)					\
> +	__GMEM_CONVERSION_TEST_INIT_PRIVATE(test, 1)
> +
> +struct guest_check_data {
> +	void *mem;
> +	char expected_val;
> +	char write_val;
> +};
> +static struct guest_check_data guest_data;
> +
> +static void guest_do_rmw(void)
> +{
> +	for (;;) {
> +		char *mem = READ_ONCE(guest_data.mem);
> +
> +		GUEST_ASSERT_EQ(READ_ONCE(*mem), READ_ONCE(guest_data.expected_val));
> +		WRITE_ONCE(*mem, READ_ONCE(guest_data.write_val));
> +
> +		GUEST_SYNC(0);
> +	}
> +}
> +
> +static void run_guest_do_rmw(struct kvm_vcpu *vcpu, loff_t pgoff,
> +			     char expected_val, char write_val)
> +{
> +	struct ucall uc;
> +	int r;
> +
> +	guest_data.mem = (void *)GUEST_MEMFD_SHARING_TEST_GVA + pgoff * page_size;
> +	guest_data.expected_val = expected_val;
> +	guest_data.write_val = write_val;
> +	sync_global_to_guest(vcpu->vm, guest_data);
> +
> +	do {
> +		r = __vcpu_run(vcpu);
> +	} while (r == -1 && errno == EINTR);
> +
> +	TEST_ASSERT_EQ(r, 0);

TEST_ASSERT_EQ() ends up calling exit() on failures, which skips
FIXTURE_TEARDOWN().

Other than the explicit assertions not working with the
kselftest_harness, kvm selftest library functions like vm_mem_add() also
call TEST_ASSERT, which doesn't play nice with kselftest_harness.

Any suggestions for this? Should we use the kselftest framework with
these tests?

(I ran into this issue while trying to test something else, where I
needed FIXTURE_TEARDOWN() to clean up system state.)

Or is it "okay" in this case since FIXTURE_TEARDOWN() only cleans up
stuff that would happen if the program exits anyway?

>
> [...snip...]
>
