Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.132
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794732910;
	b=zwDh96s60i4vmy/XuHzAn1ngqHQgZPqAbxVrnHLIBEw4qsQy72xRqNhYM4/n+YjVhsV3
	 2KsDMmgYgbOrS070YtLzS/AJbBXiNJ43jwBkGC1JOeCrKfseclFS0KbpQ5Q2ZGvGj1NSs
	 0MjXP7AH01J/hg6Pqx2ytJYhZRoGXbZ67YGoCJKOUquV/r0hwPd/2enc6/6hYSaQabYZv
	 +/ydx6EuKHn7K3APTOxXnmHiFG/z8VCDm4uiMBRiG0dIXczmNCQyJXWYpV4EdNHHOJDuf
	 LXrcTudrcNpunmt/k+E6FfXB4Qcg4hGu4MgQuim/laq6qoW0mgHflU0YiNj7DB/JkrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794732910;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=2W9g589hYI/qXRjeFg9GTGFNeMUzzFOuJrEl7Zvx7OU=;
	b=fbb9tcVi6I4G5ryC9kpnVIdjQt7j96+Pj7rnE6U6TWF1giIYayd0J8aR+xQZDeWO7KEP
	 riVy4Q+3NgKDzXuhE32oKhabiwaG0bK4MEYV6PdOSqs1enIF1ooSDv9W9WWwAX5+7N9Zd
	 llZ0y0kLqig+/GvdMOFcFDM28Ew537xTOtPHvQVGFXFOu3/zl4X7djjcAiL7XJGuVBWvX
	 0gO68Duv4kj+L+Cy4AOkx6taEHgH9TY99KdwxzKHArC/oYNqKZL7xSAWyl3I4ZxWSIhNS
	 m4ENJWzr1BlpFPvgIa0B1El5nY16kGTcft278Yfg96Vs8Z6YimdRwTzdzoUZ8V9tYQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="SGeRgf/z";
	arc=none smtp.remote-ip=74.125.227.132
Received: from mail-pj2-f4.google.com (mail-pj2-f4.google.com [74.125.227.132])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0258606A327
	for <linux-kselftest@vger.kernel.org>; Sun, 15 Nov 2026 08:55:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0258606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SGeRgf/z
Received: by mail-pj2-f4.google.com with SMTP id d9443c01a7336-2e96b8bfb43so7617965ad.0
        for <linux-kselftest@vger.kernel.org>; Sun, 15 Nov 2026 00:55:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794732909; x=1795337709; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2W9g589hYI/qXRjeFg9GTGFNeMUzzFOuJrEl7Zvx7OU=;
        b=SGeRgf/zTmXTFO/Meao9ef7XXArdfTx4NyVqdNIY9tHGowAM1YFhGCePO7ukhUTHtc
         KsorIap36rJYj+xZ8ecqWCUOkcNPt81shI9WXLvZ8A8hnPSOnDr34sIoOv4Lt00Wz6CZ
         FMG2N6Kp0j6488k2DV5SMxPPgrR6qaxgyRrWLXTM3PulbdXlqFwwSxy11s6MmTnGJODE
         hTym7EYH+wdwCreK/Id6ZuNjACN74YvvsJoMFdq82shwi0u6ZIbuWQuAznKtmdAn0PMH
         4lK10Sxai10BsDEd5NJ6V4HuPYxYw2vg6Lgngx/5OsoMbMzzscc2kSpGvB5C94gPpa0/
         SAMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794732909; x=1795337709;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2W9g589hYI/qXRjeFg9GTGFNeMUzzFOuJrEl7Zvx7OU=;
        b=Ar/NIJRwhntYrjfVKZVx2oMmS/jpBRKQGz40W35ISCqb7r9HfF9SiIRiNWBDOGyHZC
         EWcdDn1ImMzN3Au4ZsvPI87t4KBd9scQ/popuFJYFP7fDnKa2qIGNQdGU+2U9VtRRhLu
         1U/itqiJxe1LHtwy5ErTi4QQ+rQo7nKCz+C1sbLc83qT43G9ZHNziNTZbkd5QgJg9qmQ
         9luhUPkWUCq7bjoezK4Jkv8AWDcGhqU51NLlrJMHJeQgYhUFH/YRWpPTtOjLmTugCanj
         SjeyeZuTMRTCNlbX8oXIDbTjdUEDja3m9qh8W4dp04GtZmrRbPsU0hyI6wpvdteVB09E
         wz4Q==
X-Forwarded-Encrypted: i=1; AL+hErE0g5NjElNMqFLIF8pTMFFcjZDdp0BOGPNXqOJ7fve2yAozNGsWCJnwA6LjwTUafY5WbYgfL6uTLY6buSy2fN0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9BH6FAGRV6N2AjYIyyTpJ3hDUY1ZyUEj1rsQ9mlUmm9ahPSpI5
	KokuKRILeM4gtibbL2NMkex7uzAefGrIbk9///CM5ic35BNht4tN4g0p
X-Gm-Gg: AYBFou1svQzuYErKzS6W9BLKvkaInFBUbBVEToC7GJKhvYIBiQodvcIJ7Yr/JzDkQ0B
	9wwkYztDi2JHQbmMDZxNMR3sLF3d/DTlSHOlAnmwn2HGEL9Oku7JjZqjcngiYTcDGN6T9ASmbvq
	6owUEa7ErzKvu6fP9eXshG+HSRQWlb1R/tURXUrRznJ+kZ5dnX1BWeAAytCPPpLlruIWlbszPZa
	m9oEECms4iu7BZCfXduiB3Cr+22dPp/XgjTkUfb1AZXCCrkzxGgunpND5CEWpN0TEcJ8YmBaucp
	VeEaZ9C8PUCdgeki/8IiLraVgSUDIQqY58lvK3OFRtfTY8D3cvxkGbJnI1vuS6rCGEQ0Ni9zSom
	V1ew6tbfxEDY3GZP7ImxgWt6nbCgeUcizrpDjLWXIlujrQryFseHce98hCHpMEuVQHDX3r9Au47
	uu3ufnyPybfSblSEFDCjapeudt3ysjMuMo2jnj/mAxy7eTdrofK/VFTaRWlp2LBO30/vbPPq7bc
	ifBTdHiuQV9krISqnKkpTOJxmJrIw3UhF8DEB0mfBZ0BxWBA2Q+PHsS3yQ63oEBglZBmLQNLHHQ
	WfAROWqUmFWWFWIGvWCom5fe9hJD0pBo1o/nDmKcweA=
X-Received: by 2002:a17:90b:48c3:b0:3b0:b36b:66fc with SMTP id 98e67ed59e1d1-3b1b0cac932mr7318329a91.63.1794732908821;
        Sun, 15 Nov 2026 00:55:08 -0800 (PST)
Received: from q-Legion-Y7000-IRX9.. ([113.54.187.246])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc160a190sm2879089a12.2.2026.11.15.00.55.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 00:55:08 -0800 (PST)
From: "Bingyu.Xian" <shanbeeyoo@gmail.com>
To: anup@brainfault.org
Cc: atish.patra@linux.dev,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	zhouquan@iscas.ac.cn,
	shanbeeyoo@gmail.com,
	linux-kselftest@vger.kernel.org,
	shuah@kernel.org,
	pbonzini@redhat.com,
	seanjc@google.com
Subject: [PATCH] KVM: selftests: riscv: Test the SBI STA shared memory lifecycle
Date: Sun, 15 Nov 2026 16:54:57 +0800
Message-Id: <20261115085457.889873-1-shanbeeyoo@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The RISC-V steal-time test checks the UAPI alignment constraints and
compares stolen time with the host run delay. It does not exercise
changes to the shared page after accounting has been enabled.

Extend the existing test to check that disabling STA stops shared-page
updates and that reconfiguring it leaves the old shared page unchanged.
Place the second STA structure at the end of another page and verify
that updates mark the appropriate page dirty.

Discard the second backing page with MADV_DONTNEED and check that a
subsequent KVM_RUN resumes STA updates on the replacement page and
marks it dirty. Read the replacement page before KVM_RUN so that a
stale write into the old backing page cannot satisfy the assertions.

Keep these checks in steal_time instead of adding another test binary.
The test does not depend on a gfn-to-pfn cache implementation.

Assisted-by: YuanSheng: deepseek-v4-pro
Co-developed-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: bingyu.xian <shanbeenyoo@gmail.com>
---
Tested with a freshly built RISC-V kernel and KVM module from the base
commit below, running as a QEMU TCG guest with H extension enabled:
  - steal_time: 4 lifecycle checks and the existing 4 vCPU cases pass
  - CONFIG_DEBUG_ATOMIC_SLEEP=y and CONFIG_PROVE_LOCKING=y
  - no kernel diagnostics observed
  - x86 steal_time build also passes (not run)

This exercises baseline STA behavior and does not depend on an STA
caching implementation. The lifecycle checks also apply cleanly to
riscv_kvm_next at 633b3931a87438282d6454646ff40c669a6896cb.

Test logs (verbatim excerpt from the 2026-11-15 QEMU run):
  STA_LIFECYCLE_KERNEL=7.4.0-rc2-sta-lifecycle+
  Random seed: 0x35d6f94c
  TAP version 13
  1..8
  ok 1 STA shared page updates and is marked dirty
  ok 2 STA disable stops shared page updates
  ok 3 STA reconfiguration updates only the new page
  ok 4 STA updates recover after backing page invalidation
  # VCPU0: total-stolen-time=3269800 test-stolen-time=3269800
  VCPU0:
      sequence:  6
      flags:     0
      steal:     3269800
      preempted: 0
      pad:      00000000000000000000000000000000000000000000000
  ok 5 vcpu0
  # VCPU1: total-stolen-time=898700 test-stolen-time=898700 (BONUS: guest test-stolen-time even exactly matches test-run_delay)
  VCPU1:
      sequence:  4
      flags:     0
      steal:     898700
      preempted: 0
      pad:      00000000000000000000000000000000000000000000000
  ok 6 vcpu1
  # VCPU2: total-stolen-time=654000 test-stolen-time=654000 (BONUS: guest test-stolen-time even exactly matches test-run_delay)
  VCPU2:
      sequence:  4
      flags:     0
      steal:     654000
      preempted: 0
      pad:      00000000000000000000000000000000000000000000000
  ok 7 vcpu2
  # VCPU3: total-stolen-time=800700 test-stolen-time=800700 (BONUS: guest test-stolen-time even exactly matches test-run_delay)
  VCPU3:
      sequence:  4
      flags:     0
      steal:     800700
      preempted: 0
      pad:      00000000000000000000000000000000000000000000000
  ok 8 vcpu3
  # Totals: pass:8 fail:0 xfail:0 xpass:0 skip:0 error:0
  STA_LIFECYCLE_STATUS=0
  STA_LIFECYCLE_PASS

 tools/testing/selftests/kvm/steal_time.c | 113 +++++++++++++++++++++++
 1 file changed, 113 insertions(+)

diff --git a/tools/testing/selftests/kvm/steal_time.c b/tools/testing/selftests/kvm/steal_time.c
index 82b94a82d..059f7fa60 100644
--- a/tools/testing/selftests/kvm/steal_time.c
+++ b/tools/testing/selftests/kvm/steal_time.c
@@ -8,6 +8,7 @@
 #include <time.h>
 #include <sched.h>
 #include <pthread.h>
+#include <sys/mman.h>
 #include <linux/kernel.h>
 #include <asm/kvm.h>
 #ifdef __riscv
@@ -329,6 +330,111 @@ static void steal_time_dump(struct kvm_vm *vm, u32 vcpu_idx)
 	pr_info("\n");
 }
 
+static gpa_t lifecycle_second_gpa;
+
+static void sta_lifecycle_guest(void)
+{
+	sta_set_shmem(ST_GPA_BASE, 0);
+	GUEST_SYNC(0);
+	/* The first update takes place on the next KVM_RUN. */
+	GUEST_SYNC(1);
+
+	sta_set_shmem(INVALID_GPA, 0);
+	GUEST_SYNC(2);
+	GUEST_SYNC(3);
+
+	sta_set_shmem(lifecycle_second_gpa, 0);
+	GUEST_SYNC(4);
+	GUEST_SYNC(5);
+
+	/* Userspace discards the second backing page before resuming us. */
+	GUEST_SYNC(6);
+	sta_set_shmem(INVALID_GPA, 0);
+	GUEST_DONE();
+}
+
+static void sta_lifecycle_run(struct kvm_vcpu *vcpu, unsigned int stage)
+{
+	struct ucall uc;
+
+	vcpu_run(vcpu);
+	switch (get_ucall(vcpu, &uc)) {
+	case UCALL_SYNC:
+		TEST_ASSERT_EQ(uc.args[1], stage);
+		break;
+	case UCALL_DONE:
+		TEST_ASSERT_EQ(stage, 7);
+		break;
+	case UCALL_ABORT:
+		REPORT_GUEST_ASSERT(uc);
+	default:
+		TEST_FAIL("Unexpected STA lifecycle exit at stage %u", stage);
+	}
+}
+
+static void check_sta_page(struct sta_struct *st)
+{
+	TEST_ASSERT(st->sequence && !(st->sequence & 1),
+		    "Expected a completed STA update, sequence=%u", st->sequence);
+	TEST_ASSERT_EQ(st->flags, 0);
+	TEST_ASSERT_EQ(st->preempted, 0);
+}
+
+static void check_sta_lifecycle(void)
+{
+	struct sta_struct snapshot, *first, *second;
+	struct kvm_vcpu *vcpu;
+	struct kvm_vm *vm;
+	unsigned long dirty = 0;
+	void *second_page;
+
+	vm = vm_create_with_one_vcpu(&vcpu, sta_lifecycle_guest);
+	vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS, ST_GPA_BASE,
+				    1, 2, KVM_MEM_LOG_DIRTY_PAGES);
+	/* Also exercise an STA structure ending exactly at a page boundary. */
+	WRITE_AND_SYNC_TO_GUEST(vm, lifecycle_second_gpa,
+				ST_GPA_BASE + 2 * vm->page_size - sizeof(struct sta_struct));
+	first = addr_gpa2hva(vm, ST_GPA_BASE);
+	second = addr_gpa2hva(vm, lifecycle_second_gpa);
+	second_page = addr_gpa2hva(vm, ST_GPA_BASE + vm->page_size);
+
+	sta_lifecycle_run(vcpu, 0);
+	sta_lifecycle_run(vcpu, 1);
+	check_sta_page(first);
+	kvm_vm_get_dirty_log(vm, 1, &dirty);
+	TEST_ASSERT(dirty & BIT(0), "STA update did not dirty the first page");
+	ksft_test_result_pass("STA shared page updates and is marked dirty\n");
+
+	sta_lifecycle_run(vcpu, 2);
+	snapshot = *first;
+	sta_lifecycle_run(vcpu, 3);
+	TEST_ASSERT(!memcmp(first, &snapshot, sizeof(snapshot)),
+		    "Disabled STA shared page was modified");
+	ksft_test_result_pass("STA disable stops shared page updates\n");
+
+	sta_lifecycle_run(vcpu, 4);
+	sta_lifecycle_run(vcpu, 5);
+	check_sta_page(second);
+	TEST_ASSERT(!memcmp(first, &snapshot, sizeof(snapshot)),
+		    "Old STA shared page was modified after reconfiguration");
+	dirty = 0;
+	kvm_vm_get_dirty_log(vm, 1, &dirty);
+	TEST_ASSERT(dirty & BIT(1), "STA update did not dirty the new page");
+	ksft_test_result_pass("STA reconfiguration updates only the new page\n");
+
+	TEST_ASSERT_EQ(madvise(second_page, vm->page_size, MADV_DONTNEED), 0);
+	TEST_ASSERT_EQ(second->sequence, 0);
+	sta_lifecycle_run(vcpu, 6);
+	check_sta_page(second);
+	dirty = 0;
+	kvm_vm_get_dirty_log(vm, 1, &dirty);
+	TEST_ASSERT(dirty & BIT(1), "Recovered STA update did not dirty the page");
+	ksft_test_result_pass("STA updates recover after backing page invalidation\n");
+
+	sta_lifecycle_run(vcpu, 7);
+	kvm_vm_free(vm);
+}
+
 static void check_steal_time_uapi(void)
 {
 	struct kvm_vm *vm;
@@ -535,9 +641,16 @@ int main(int ac, char **av)
 
 	ksft_print_header();
 	TEST_REQUIRE(is_steal_time_supported(vcpus[0]));
+#ifdef __riscv
+	ksft_set_plan(NR_VCPUS + 4);
+#else
 	ksft_set_plan(NR_VCPUS);
+#endif
 
 	check_steal_time_uapi();
+#ifdef __riscv
+	check_sta_lifecycle();
+#endif
 
 	/* Run test on each VCPU */
 	for (i = 0; i < NR_VCPUS; ++i) {

base-commit: 23c62304dde29abe92013d85910d03a77dada35d
-- 
2.34.1

