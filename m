Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447991;
	b=M5eQssg7TUAr/YH4KwLYkJgejJAF9hmXpmErlrZ2dwbKqMBUYFrbPMXm83SDDGNiCblz
	 TkzQUXXgmNj5BbHFQgBsLgYn9g6HSwn5qfeeqBu2PSRG8svE9ytRmiH/aKAXL8nEYoi0+
	 3wi+KqEx48pZmkh96kYsQbiyE5lwfpNJdRLJ5CpDT6N3SxJlQk94UtQnWv5F62I2pDW+3
	 lUkaMaz5cEkEWR8PazQShD1pRUIJoUJ2OvGM0/yEeMF5/x5d+/TJDLlLCASnS3wfhKsod
	 7uVeKHDcOkQdYXRxypKji4IX5NdsayNwYDtfjXDUWfg7zzYUNSlxLyMQOIdLEiQcI4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447991;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=P0HmEkR7XVIgQImbtvtX44VFrjVW2UkwB3zPu47siq4=;
	b=hOdOrz7+G5O8OnmpHa5VzP8YKytQ6WOrurw+a3fPDWJgcugRqJ2qrjcuERk+uvAr1P8A
	 VifnARaa4ss1LYDttG2HnyugrHtCqngaQ7l6NoXzypoWbVvbln8gcOLbtCrxZxz/dpFKx
	 /FDJRZSs+bGqSgsYZv5ToXh2TAdwWTdcpm3mmsJZaAn7vy9cBfcfrvWihX5jgzb0kC8rh
	 buoA5mf/JGIzpQD8iq23xNiL28aKtl+uk2qDclp3cLZN0g/choP7GtLYNWGf+/TwmlxzB
	 UJzHo3fgDPlEY7K8b9cvcCpQuMnHeieP+KgIfyPG9/K7TgmnvuN6o0eXDs+QR06CagA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=asu.edu;
	spf=pass smtp.mailfrom=asu.edu;
	dkim=pass header.d=asu.edu header.i=@asu.edu header.a=rsa-sha256 header.s=google header.b=FrKH2y0b;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B19F606A32A
	for <linux-kselftest@vger.kernel.org>; Mon, 23 Nov 2026 15:33:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B19F606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.a=rsa-sha256 header.s=google header.b=FrKH2y0b
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-38699cf08dfso3307698eec.1
        for <linux-kselftest@vger.kernel.org>; Mon, 23 Nov 2026 07:33:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asu.edu; s=google; t=1795447990; x=1796052790; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P0HmEkR7XVIgQImbtvtX44VFrjVW2UkwB3zPu47siq4=;
        b=FrKH2y0bcC6ghR/xaOyppJpaHBu1yn4n87Ls9TabAolNslQAgG/twQ3Z1+G/743gMV
         PDK95QGtBr9ewAQbJ5o/JHBTywWh6J2ScA+qMp2LwSkxfRXX82JS//T+vAgeQd6f64AS
         Biatf0d2WhGETOH0uBjR5elCkvX17EvLbQhdfXHGviub1aem2eqdZAwGl3+sryDYSB6E
         GJmlyEt70FmxnX0kZW5SpaIWH0W7HrB618ri5TaBcCZbUyt5rbpKunPhyTRuzMkILz2j
         3aSLEpcURdQQbQDKE4HIgJiD+2s7j/KOy3hCluawHTuc38NM0DhNSz6QGH0FU1/7wY1O
         bqTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447990; x=1796052790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=P0HmEkR7XVIgQImbtvtX44VFrjVW2UkwB3zPu47siq4=;
        b=yGRzW93ih2CmwYnxgZTxBj2/pyQKtwlwd2j3O4q6IzbqPHcRgNQuvkl4qzCjrxLwQE
         GsljhZwaFVZFnTWD9k2x6NJizr6r7RQUDo3CH4JTjVEzbdSqIs633RK56CrLEZ99DtcH
         A3S1nvlvVugbdZYsFyEZRkIOTATT902MCRF/Prbb0vTJm3H1MMEFjgvbPXbd+UfOXYbF
         tytKeePUjQsdGE40A2mYUchzNKjVYLMRXZXL0WF7exI1nDKilK4gK+LXJ/b+fQwm+aIL
         F7lbZLuSOZnDoPlLJfkLaFCQO+HTW8HgK8QGDBw0Gzo8AKA0ltrdzQa+uIjK16FaUQoF
         jWeA==
X-Forwarded-Encrypted: i=1; AL+hErHr797b3feiaVuMdptD7BiY7tvO93rsDbIhr9DwwUJjqsb7vq3L+R/5HDCjUKT4BpSI68VSWIEHVDS+oBKRhYI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+WZP2oslIL7TcHXpZ87tEtO664iVfgK4UzE3R2nHGNhHLOjZhM
	2tA3SA6X2wbWwDf2ZqRSjZ0xPIZ1RAk1um4lw2JJtsjOezL/oa8dcM+LugP3fDLQ8A==
X-Gm-Gg: AZFdTZf2qsxbGdChUXF4bQu3SsL4OeCOMP0SYcHwoYKLEKZKuourZ1jp3tydBJGb7I6
	3pOlMMtIGL8+Twfridm2L6xZQmMTbB9611neQwMDvdlBkpQvfZBsCpaC+ab+KZNVLi1pfAqZEnF
	z/h6F2saXg25MPyCVMJ8sP5wAWKKxFF93UEi8vksrJQaYr/F4nK8fCOI6mZRS8h8sYswtvIm/tt
	EjQDf/DeT1uo25/Y1czeOcH+fd8wR3HmjxCRYMXqXWDrL9+FBs+0Ox2PVygWfjpcBJNemmLild5
	0JDpXxI+M1dYTYs5TDE9RndTKKy/7bOew+HRg4fylyqNt9PGZImabNTJqVzcYijOpMmUhC4mSfU
	wuOplg30/z5Bn6nWZeNXk/yEhO1WwgHV/CYj5WpbKqW3E0fqQR456ZqYM8bEYYZra8WEgZGStp7
	yPV3cpd375knjyaRVv7aZn9qQoWvljykXw1/zM3Ajgdx2uUS2FPTqvWDJZY3XJZp6Y1Hs1wr+fK
	PT2rO6zXK6ARhfSBIdCEeFGNHRocIkgRrsiHd0Ylj4D/MS5aLPdqB5sRnFU+iottZmBdvYtewCb
	9Ls/RdJjRI7gLO/p0RFMQFP717Hcqtocc2z2XE1xqD3Hv967Uxnn+pynNrTlKUs=
X-Received: by 2002:a05:7300:d0a8:b0:386:9957:752f with SMTP id 5a478bee46e88-386995777f4mr8441803eec.25.1795447990313;
        Mon, 23 Nov 2026 07:33:10 -0800 (PST)
Received: from localhost.localdomain ([2600:8800:1e00:25f0:3391:10c3:1717:1522])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm34601237eec.16.2026.11.23.07.33.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:33:10 -0800 (PST)
From: Siddharth Mishra <smish149@asu.edu>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>
Cc: Shuah Khan <shuah@kernel.org>,
	Peter Xu <peterx@redhat.com>,
	James Houghton <jthoughton@google.com>,
	David Woodhouse <dwmw2@infradead.org>,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Siddharth Mishra <smish149@asu.edu>
Subject: [PATCH 2/2] KVM: selftests: Test dirty ring pushes from vCPU preemption
Date: Mon, 23 Nov 2026 08:32:38 -0700
Message-ID: <20261123153238.1036972-3-smish149@asu.edu>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261123153238.1036972-1-smish149@asu.edu>
References: <20261123153238.1036972-1-smish149@asu.edu>
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

Add a test that dirties pages in a dirty-logged memslot that also holds
the vCPU's steal-time structure, while a busy thread shares the vCPU
thread's CPU so that the vCPU task is preempted often.  After every
KVM_RUN, harvest the dirty ring and assert that no entry is left dirty,
which fails if kvm_steal_time_set_preempted() pushes to the ring in the
middle of kvm_dirty_ring_push().

Require PML, as flushing the PML buffer on VM-Exit is where KVM pushes
to the dirty ring with preemption enabled.  Pass -S to run without steal
time, and -t to change the run time from the default of 60 seconds.

Signed-off-by: Siddharth Mishra <smish149@asu.edu>
---
 tools/testing/selftests/kvm/Makefile.kvm      |   1 +
 .../kvm/x86/dirty_ring_steal_time_test.c      | 146 ++++++++++++++++++
 2 files changed, 147 insertions(+)
 create mode 100644 tools/testing/selftests/kvm/x86/dirty_ring_steal_time_test.c

diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
index 17a4256e9081..ab4dff45d306 100644
--- a/tools/testing/selftests/kvm/Makefile.kvm
+++ b/tools/testing/selftests/kvm/Makefile.kvm
@@ -78,6 +78,7 @@ TEST_GEN_PROGS_x86 = $(TEST_GEN_PROGS_COMMON)
 TEST_GEN_PROGS_x86 += x86/cpuid_test
 TEST_GEN_PROGS_x86 += x86/cr4_cpuid_sync_test
 TEST_GEN_PROGS_x86 += x86/dirty_log_page_splitting_test
+TEST_GEN_PROGS_x86 += x86/dirty_ring_steal_time_test
 TEST_GEN_PROGS_x86 += x86/feature_msrs_test
 TEST_GEN_PROGS_x86 += x86/evmcs_smm_controls_test
 TEST_GEN_PROGS_x86 += x86/exit_on_emulation_failure_test
diff --git a/tools/testing/selftests/kvm/x86/dirty_ring_steal_time_test.c b/tools/testing/selftests/kvm/x86/dirty_ring_steal_time_test.c
new file mode 100644
index 000000000000..6e65055e8c2d
--- /dev/null
+++ b/tools/testing/selftests/kvm/x86/dirty_ring_steal_time_test.c
@@ -0,0 +1,146 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#define _GNU_SOURCE
+#include <pthread.h>
+#include <sched.h>
+#include <stdlib.h>
+#include <time.h>
+#include <unistd.h>
+#include <asm/barrier.h>
+
+#include "kvm_util.h"
+#include "processor.h"
+#include "ucall_common.h"
+
+#define TEST_SLOT		1
+#define TEST_GPA		0x10000000ul
+#define TEST_PAGES		16384
+#define RING_ENTRIES		65536u
+#define DEFAULT_SECONDS		60
+
+static bool stop_hog;
+static int test_cpu;
+
+static void guest_code(u64 gva)
+{
+	u64 gen = 0, i;
+
+	for (;;) {
+		gen++;
+		for (i = 1; i < TEST_PAGES; i++)
+			WRITE_ONCE(*(u64 *)(gva + i * PAGE_SIZE), gen);
+		GUEST_SYNC(gen);
+	}
+}
+
+static void pin_self(int cpu)
+{
+	cpu_set_t set;
+
+	CPU_ZERO(&set);
+	CPU_SET(cpu, &set);
+	TEST_ASSERT(!pthread_setaffinity_np(pthread_self(), sizeof(set), &set),
+		    "Failed to pin to CPU %d", cpu);
+}
+
+static void *hog(void *arg)
+{
+	pin_self(test_cpu);
+	while (!READ_ONCE(stop_hog))
+		;
+	return NULL;
+}
+
+static u32 harvest(struct kvm_dirty_gfn *ring, u32 *fetch)
+{
+	struct kvm_dirty_gfn *e;
+	u32 n = 0, i;
+
+	for (;;) {
+		e = &ring[*fetch % RING_ENTRIES];
+		if (smp_load_acquire(&e->flags) != KVM_DIRTY_GFN_F_DIRTY)
+			break;
+		smp_store_release(&e->flags, KVM_DIRTY_GFN_F_RESET);
+		(*fetch)++;
+		n++;
+	}
+
+	for (i = 0; i < RING_ENTRIES; i++) {
+		TEST_ASSERT(READ_ONCE(ring[i].flags) != KVM_DIRTY_GFN_F_DIRTY,
+			    "Entry %u is dirty, but entry %u before it was never written",
+			    i, *fetch % RING_ENTRIES);
+	}
+	return n;
+}
+
+int main(int argc, char *argv[])
+{
+	int seconds = DEFAULT_SECONDS, opt;
+	struct kvm_dirty_gfn *ring;
+	bool steal_time = true;
+	struct kvm_vcpu *vcpu;
+	struct kvm_vm *vm;
+	u32 fetch = 0, n;
+	pthread_t thread;
+	struct ucall uc;
+	time_t end;
+
+	test_cpu = sched_getcpu();
+	while ((opt = getopt(argc, argv, "c:t:S")) != -1) {
+		switch (opt) {
+		case 'c':
+			test_cpu = atoi(optarg);
+			break;
+		case 't':
+			seconds = atoi(optarg);
+			break;
+		case 'S':
+			steal_time = false;
+			break;
+		default:
+			TEST_FAIL("Usage: %s [-c cpu] [-t seconds] [-S]", argv[0]);
+		}
+	}
+
+	TEST_REQUIRE(kvm_has_cap(KVM_CAP_DIRTY_LOG_RING) ||
+		     kvm_has_cap(KVM_CAP_DIRTY_LOG_RING_ACQ_REL));
+	TEST_REQUIRE(host_cpu_is_intel && get_kvm_intel_param_bool("pml"));
+	if (steal_time)
+		TEST_REQUIRE(kvm_cpu_has(X86_FEATURE_KVM_STEAL_TIME));
+
+	pin_self(test_cpu);
+
+	vm = __vm_create(VM_SHAPE_DEFAULT, 1, 0);
+	vm_enable_dirty_ring(vm, RING_ENTRIES * sizeof(struct kvm_dirty_gfn));
+	vcpu = vm_vcpu_add(vm, 0, guest_code);
+	kvm_arch_vm_finalize_vcpus(vm);
+
+	vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS, TEST_GPA,
+				    TEST_SLOT, TEST_PAGES,
+				    KVM_MEM_LOG_DIRTY_PAGES);
+	virt_map(vm, TEST_GPA, TEST_GPA, TEST_PAGES);
+	vcpu_args_set(vcpu, 1, TEST_GPA);
+	if (steal_time)
+		vcpu_set_msr(vcpu, MSR_KVM_STEAL_TIME,
+			     TEST_GPA | KVM_MSR_ENABLED);
+
+	ring = vcpu_map_dirty_ring(vcpu);
+	TEST_ASSERT(!pthread_create(&thread, NULL, hog, NULL),
+		    "Failed to create hog thread");
+
+	end = time(NULL) + seconds;
+	while (time(NULL) < end) {
+		vcpu_run(vcpu);
+		if (vcpu->run->exit_reason != KVM_EXIT_DIRTY_RING_FULL) {
+			TEST_ASSERT_KVM_EXIT_REASON(vcpu, KVM_EXIT_IO);
+			if (get_ucall(vcpu, &uc) == UCALL_ABORT)
+				REPORT_GUEST_ASSERT(uc);
+		}
+		n = harvest(ring, &fetch);
+		TEST_ASSERT_EQ(kvm_vm_reset_dirty_ring(vm), n);
+	}
+
+	WRITE_ONCE(stop_hog, true);
+	pthread_join(thread, NULL);
+	kvm_vm_free(vm);
+	return 0;
+}
-- 
2.54.0

