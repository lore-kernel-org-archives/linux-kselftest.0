Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795096207;
	b=Mbq5x2ZU98gaN5fMqkmvTvPLrZ7+jh97pByvrTNb9sA5L9wPLuej+62WS5qQB5r5HP7A
	 IqKhqKSrljApZyBT/IUKeQXgIwQKRZp6ku9nXyk/rIFmOa4WozcaNi8cYXVe53032W8TY
	 MXoIursgcUnEH19HwpLb1UnQPhhFiqYz1XyXQklq4kQHbJrvNxVDwb9MUU/IhXb3U8HRF
	 a0vNZ831Gp3gNj8YIBJOAOx3pthKD7tZHXe/gG6MF8VkIJLDEscJPZ/Nnde6i6FpuvUWQ
	 awy2j7JvcbCFsKLlam9BfJtbYBqtY4i4hheSU4AG+DcuS1ACDywN1vAjN+Ouccu4AEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795096207;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=HZXe2WsTllAxnH0GSQ0TCwgJgD6PzDU4kFR67Fsqqrc=;
	b=xWwAwth4F2/qeJSatdQ1kpYfkD6GuRuaReNgu9Hp+fO+yH0xtnztFr8Gx23vuyir5iJD
	 OtAWFZhI3Y75bufj4yrOWAaNxhI748Eqw/I55JxqREOu4gnm3G7zZFuq2f1uSyjP9TtTr
	 7N8FczUjIAKE4WBJSFaK1psR7JugfGGn9wfPh7rmil0bHrrWeD3vtydUj88NPfKAj5tJJ
	 W+qZ9QR+GLSwSRZ8cLFLWEt5fukZ8XGRj2lts6mGUqfdCkH7pVHIg0YOr0451gxHHC/L0
	 JoMahhurgbqfec5hxHuPEOvFBRWlVufmgcIaiO1k0SdJ6cW27Bi5ebSseGPZ40jVo/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=gHeg8Lov;
	arc=none smtp.remote-ip=91.218.175.124
Received: from mta0.migadu.com (out-124.mta0.migadu.com [91.218.175.124])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A150E606E842
	for <linux-kselftest@vger.kernel.org>; Thu, 19 Nov 2026 13:50:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A150E606E842
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=gHeg8Lov
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=+aZWzXaOnWazBZdRZqNBkG1WS4ZSuBwHsa7ZQ3CC1Aw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795096205; v=1; x=1795701005;
 b=gHeg8LovCrEUOIFYMJxia3fq648kr+dprfcYjg0sCqG7C2KEGDkFMgTmb3xx99wPyA+Merrk
 veFRaN2W3dtkNqknpXqWHvD5dvqvXMHmax8zBtG2tA/0fEn6O98+8/lsRVVIseyfS+l3R0dRWRL
 bN8loF/DuUaWsYHiEmmP34MU=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 1dd83dad7dfadc2b;
	Thu, 19 Nov 2026 13:50:02 +0000
X-Mizu-Trace-ID: 1dd83dad7dfadc2b
X-Migadu-Flow: FLOW_OUT
Date: Thu, 19 Nov 2026 14:49:25 +0100
From: Andrew Jones <andrew.jones@linux.dev>
To: "Bingyu.Xian" <shanbeeyoo@gmail.com>
Cc: anup@brainfault.org, atish.patra@linux.dev, pjw@kernel.org, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	zhouquan@iscas.ac.cn, linux-kselftest@vger.kernel.org, shuah@kernel.org, 
	pbonzini@redhat.com, seanjc@google.com
Subject: Re: [PATCH] KVM: selftests: riscv: Test the SBI STA shared memory
 lifecycle
Message-ID: <av77j8rN593sxIDh@orel>
References: <20261115085457.889873-1-shanbeeyoo@gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261115085457.889873-1-shanbeeyoo@gmail.com>

On Sun, Nov 15, 2026 at 04:54:57PM +0800, Bingyu.Xian wrote:
> The RISC-V steal-time test checks the UAPI alignment constraints and
> compares stolen time with the host run delay. It does not exercise
> changes to the shared page after accounting has been enabled.
> 
> Extend the existing test to check that disabling STA stops shared-page
> updates and that reconfiguring it leaves the old shared page unchanged.
> Place the second STA structure at the end of another page and verify
> that updates mark the appropriate page dirty.
> 
> Discard the second backing page with MADV_DONTNEED and check that a
> subsequent KVM_RUN resumes STA updates on the replacement page and
> marks it dirty. Read the replacement page before KVM_RUN so that a
> stale write into the old backing page cannot satisfy the assertions.
> 
> Keep these checks in steal_time instead of adding another test binary.
> The test does not depend on a gfn-to-pfn cache implementation.
> 
> Assisted-by: YuanSheng: deepseek-v4-pro
> Co-developed-by: Quan Zhou <zhouquan@iscas.ac.cn>
> Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
> Signed-off-by: bingyu.xian <shanbeenyoo@gmail.com>
> ---
> Tested with a freshly built RISC-V kernel and KVM module from the base
> commit below, running as a QEMU TCG guest with H extension enabled:
>   - steal_time: 4 lifecycle checks and the existing 4 vCPU cases pass
>   - CONFIG_DEBUG_ATOMIC_SLEEP=y and CONFIG_PROVE_LOCKING=y
>   - no kernel diagnostics observed
>   - x86 steal_time build also passes (not run)
> 
> This exercises baseline STA behavior and does not depend on an STA
> caching implementation. The lifecycle checks also apply cleanly to
> riscv_kvm_next at 633b3931a87438282d6454646ff40c669a6896cb.
> 
> Test logs (verbatim excerpt from the 2026-11-15 QEMU run):
>   STA_LIFECYCLE_KERNEL=7.4.0-rc2-sta-lifecycle+
>   Random seed: 0x35d6f94c
>   TAP version 13
>   1..8
>   ok 1 STA shared page updates and is marked dirty
>   ok 2 STA disable stops shared page updates
>   ok 3 STA reconfiguration updates only the new page
>   ok 4 STA updates recover after backing page invalidation

I'm having trouble understanding what real world scenario these tests are
trying to model. VM migration?

>   # VCPU0: total-stolen-time=3269800 test-stolen-time=3269800
>   VCPU0:
>       sequence:  6
>       flags:     0
>       steal:     3269800
>       preempted: 0
>       pad:      00000000000000000000000000000000000000000000000
>   ok 5 vcpu0
>   # VCPU1: total-stolen-time=898700 test-stolen-time=898700 (BONUS: guest test-stolen-time even exactly matches test-run_delay)
>   VCPU1:
>       sequence:  4
>       flags:     0
>       steal:     898700
>       preempted: 0
>       pad:      00000000000000000000000000000000000000000000000
>   ok 6 vcpu1
>   # VCPU2: total-stolen-time=654000 test-stolen-time=654000 (BONUS: guest test-stolen-time even exactly matches test-run_delay)
>   VCPU2:
>       sequence:  4
>       flags:     0
>       steal:     654000
>       preempted: 0
>       pad:      00000000000000000000000000000000000000000000000
>   ok 7 vcpu2
>   # VCPU3: total-stolen-time=800700 test-stolen-time=800700 (BONUS: guest test-stolen-time even exactly matches test-run_delay)
>   VCPU3:
>       sequence:  4
>       flags:     0
>       steal:     800700
>       preempted: 0
>       pad:      00000000000000000000000000000000000000000000000
>   ok 8 vcpu3
>   # Totals: pass:8 fail:0 xfail:0 xpass:0 skip:0 error:0
>   STA_LIFECYCLE_STATUS=0
>   STA_LIFECYCLE_PASS
> 
>  tools/testing/selftests/kvm/steal_time.c | 113 +++++++++++++++++++++++
>  1 file changed, 113 insertions(+)
> 
> diff --git a/tools/testing/selftests/kvm/steal_time.c b/tools/testing/selftests/kvm/steal_time.c
> index 82b94a82d..059f7fa60 100644
> --- a/tools/testing/selftests/kvm/steal_time.c
> +++ b/tools/testing/selftests/kvm/steal_time.c
> @@ -8,6 +8,7 @@
>  #include <time.h>
>  #include <sched.h>
>  #include <pthread.h>
> +#include <sys/mman.h>
>  #include <linux/kernel.h>
>  #include <asm/kvm.h>
>  #ifdef __riscv
> @@ -329,6 +330,111 @@ static void steal_time_dump(struct kvm_vm *vm, u32 vcpu_idx)
>  	pr_info("\n");
>  }
>  
> +static gpa_t lifecycle_second_gpa;
> +
> +static void sta_lifecycle_guest(void)
> +{
> +	sta_set_shmem(ST_GPA_BASE, 0);
> +	GUEST_SYNC(0);
> +	/* The first update takes place on the next KVM_RUN. */
> +	GUEST_SYNC(1);
> +
> +	sta_set_shmem(INVALID_GPA, 0);
> +	GUEST_SYNC(2);
> +	GUEST_SYNC(3);
> +
> +	sta_set_shmem(lifecycle_second_gpa, 0);
> +	GUEST_SYNC(4);
> +	GUEST_SYNC(5);
> +
> +	/* Userspace discards the second backing page before resuming us. */
> +	GUEST_SYNC(6);
> +	sta_set_shmem(INVALID_GPA, 0);
> +	GUEST_DONE();
> +}
> +
> +static void sta_lifecycle_run(struct kvm_vcpu *vcpu, unsigned int stage)
> +{
> +	struct ucall uc;
> +
> +	vcpu_run(vcpu);
> +	switch (get_ucall(vcpu, &uc)) {
> +	case UCALL_SYNC:
> +		TEST_ASSERT_EQ(uc.args[1], stage);
> +		break;
> +	case UCALL_DONE:
> +		TEST_ASSERT_EQ(stage, 7);
> +		break;
> +	case UCALL_ABORT:
> +		REPORT_GUEST_ASSERT(uc);
> +	default:
> +		TEST_FAIL("Unexpected STA lifecycle exit at stage %u", stage);
> +	}
> +}
> +
> +static void check_sta_page(struct sta_struct *st)
> +{
> +	TEST_ASSERT(st->sequence && !(st->sequence & 1),
> +		    "Expected a completed STA update, sequence=%u", st->sequence);
> +	TEST_ASSERT_EQ(st->flags, 0);
> +	TEST_ASSERT_EQ(st->preempted, 0);
> +}
> +
> +static void check_sta_lifecycle(void)
> +{
> +	struct sta_struct snapshot, *first, *second;
> +	struct kvm_vcpu *vcpu;
> +	struct kvm_vm *vm;
> +	unsigned long dirty = 0;
> +	void *second_page;
> +
> +	vm = vm_create_with_one_vcpu(&vcpu, sta_lifecycle_guest);
> +	vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS, ST_GPA_BASE,
> +				    1, 2, KVM_MEM_LOG_DIRTY_PAGES);
> +	/* Also exercise an STA structure ending exactly at a page boundary. */
> +	WRITE_AND_SYNC_TO_GUEST(vm, lifecycle_second_gpa,
> +				ST_GPA_BASE + 2 * vm->page_size - sizeof(struct sta_struct));
> +	first = addr_gpa2hva(vm, ST_GPA_BASE);
> +	second = addr_gpa2hva(vm, lifecycle_second_gpa);
> +	second_page = addr_gpa2hva(vm, ST_GPA_BASE + vm->page_size);
> +
> +	sta_lifecycle_run(vcpu, 0);
> +	sta_lifecycle_run(vcpu, 1);
> +	check_sta_page(first);
> +	kvm_vm_get_dirty_log(vm, 1, &dirty);
> +	TEST_ASSERT(dirty & BIT(0), "STA update did not dirty the first page");
> +	ksft_test_result_pass("STA shared page updates and is marked dirty\n");
> +
> +	sta_lifecycle_run(vcpu, 2);
> +	snapshot = *first;
> +	sta_lifecycle_run(vcpu, 3);
> +	TEST_ASSERT(!memcmp(first, &snapshot, sizeof(snapshot)),
> +		    "Disabled STA shared page was modified");
> +	ksft_test_result_pass("STA disable stops shared page updates\n");
> +
> +	sta_lifecycle_run(vcpu, 4);
> +	sta_lifecycle_run(vcpu, 5);
> +	check_sta_page(second);
> +	TEST_ASSERT(!memcmp(first, &snapshot, sizeof(snapshot)),
> +		    "Old STA shared page was modified after reconfiguration");
> +	dirty = 0;
> +	kvm_vm_get_dirty_log(vm, 1, &dirty);
> +	TEST_ASSERT(dirty & BIT(1), "STA update did not dirty the new page");
> +	ksft_test_result_pass("STA reconfiguration updates only the new page\n");
> +
> +	TEST_ASSERT_EQ(madvise(second_page, vm->page_size, MADV_DONTNEED), 0);
> +	TEST_ASSERT_EQ(second->sequence, 0);
> +	sta_lifecycle_run(vcpu, 6);
> +	check_sta_page(second);
> +	dirty = 0;
> +	kvm_vm_get_dirty_log(vm, 1, &dirty);
> +	TEST_ASSERT(dirty & BIT(1), "Recovered STA update did not dirty the page");
> +	ksft_test_result_pass("STA updates recover after backing page invalidation\n");
> +
> +	sta_lifecycle_run(vcpu, 7);
> +	kvm_vm_free(vm);
> +}
> +
>  static void check_steal_time_uapi(void)
>  {
>  	struct kvm_vm *vm;
> @@ -535,9 +641,16 @@ int main(int ac, char **av)
>  
>  	ksft_print_header();
>  	TEST_REQUIRE(is_steal_time_supported(vcpus[0]));
> +#ifdef __riscv
> +	ksft_set_plan(NR_VCPUS + 4);
> +#else
>  	ksft_set_plan(NR_VCPUS);
> +#endif
>  
>  	check_steal_time_uapi();
> +#ifdef __riscv
> +	check_sta_lifecycle();
> +#endif

The #ifdefs aren't nice. Again, what are the tests trying to prove? And
why wouldn't the other architectures need the same coverage?

Thanks,
drew

>  
>  	/* Run test on each VCPU */
>  	for (i = 0; i < NR_VCPUS; ++i) {
> 
> base-commit: 23c62304dde29abe92013d85910d03a77dada35d
> -- 
> 2.34.1
> 
> 
> -- 
> kvm-riscv mailing list
> kvm-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kvm-riscv
