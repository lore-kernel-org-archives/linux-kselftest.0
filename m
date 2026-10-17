Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A346046F484
	for <linux-kselftest@vger.kernel.org>; Sat, 17 Oct 2026 11:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792235014; cv=none; b=qnNtEf0xGsSA6lBFtGXkYGElVHKGZ0Q1jVTvTtoToHcfZMaw6Oeejq6pmxOWZ/keyYYkXKtfzC/JyHQE1uXj2FUDt3XP2CC3BmV7cfIwPTMEiVJ/PvTkWbbn5rEuzVCiArHdhCxRtVpVGelQTxObvoutewWFGJ12LZW3Zb9iiRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792235014; c=relaxed/simple;
	bh=7GJpk+Zm7RfMxIWiA/UAYftsuVNurXh/QNUDx1LsL7I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P7geg1tnSwUci/lA/7MPDByo8s049DFPUPx1j14GXBql+q8lE8RcrS8I50Gec6g6UnnwV585/Kt55QCvNqQXybwUV5xgcoJVl5LiXq7macaUVFdeoUr3XzDH96Uv3EqDl9ZVyDJIiDhnfMbUyxh+tWG2Jru6W6WFLEfqaVwIDyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=USj/93rV; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="USj/93rV"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2e5378b281aso2896935ad.2
        for <linux-kselftest@vger.kernel.org>; Sat, 17 Oct 2026 04:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792235012; x=1792839812; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tf4fy3DAykjNBLlmTR7a2o12P+Rb24NlY7yvH7wOMkE=;
        b=USj/93rVMZ7kMj/UgK8nl+8jzPWsmEaGOUYt0f2cZoNZ1EM2s0ybq5ydIlaZfOhRCK
         VecqvOHi7U0mAJ7m3LTuMngG4Lm/Q3H79Ubkf5SulOLs/tM54dWwHOjVOMZ9DtuBaJ2I
         WyThx+84LCg/d2c2hL8iS1XSw3c71q0TwYtE425zxQjlvNuK33YXqWFPyeCFdfBC0FXu
         MKP4NLnL90laYp7AbosLBtDuSdsRyJeRI1PtJOs3nVqKbUHhIlwAgVtvZR5qnf76w3b8
         sgQjwqrQdQ5elToLA7JJGLz1bwopr5gQNZ7QOaDGZLy4GAyERzrA2J75n1RRUnUizID6
         wC2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792235012; x=1792839812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Tf4fy3DAykjNBLlmTR7a2o12P+Rb24NlY7yvH7wOMkE=;
        b=yRiNgaIpQ3ps+05re3WeRhKXJCWnGiOEYdEnMBlEulVeY0EdSWJB4IHG1M696Jvo3g
         eEUDDA/WdTQCYS7TFKze0yaYx+w6j3QANnRgDNsBgoh6BoicU947WHOFqb66y6qXUFWc
         k1yvKg7owK6vy1o+MenDcNIPxwu072KWXHoWz2rmKFKtIGnHWA3VDgqQI6fwQCIktp+M
         UsJy92eWGQJbV1bAyaX8xF3p/Exd5Iiwoi0rGGa/aviltLztq1Exn6beFUBySZ1iTC4q
         l7RyTtD6NnGR2+z3tdZ4TqVCrRYVdcRuAut+Jb3Ndb0xfL85lPvALo0A7OlDz5PTTPX8
         azqA==
X-Forwarded-Encrypted: i=1; AKwUvBw23nHPZuZ2ldfBXl4bdA88Xea347oQJiEs2WBfCM7IlriF0lTbH8fdSkeLml8G1n9na5Wvd0o4LMLZ5eRm5SA=@vger.kernel.org
X-Gm-Message-State: AFq9FYK6T1JNZxSeE4rYF5t2eNNhzpyxky/H1/4NE2xtMzJVrTAfkOE2
	xiHkUXL81x4xX/MmhjD/nL4di1mWBjTf5KjXqq267P2frNEvm+uILxMb
X-Gm-Gg: AYBFou23FDyg+nqVeuXa/c5UWxnyXWxjZT0+UWB9hq/df9iJGutDdH4OO3xXPBVP7kE
	FguLKMrIjEFFhQwtgolDZ2F49tbrqjLRA6cVqw5Ikl6DCzHQ7u+CS7I8kD1MqwEYWDnWb6jjRRU
	b1yzvTi3t3VwQd0+Poex48tB2n5sguVTCqbz8M/QPhdQKN8RTAz3C1AOR9IcGtdzR2uYXVZBp0T
	Kls3/7rhXT7PPVCabWddV4rF//CenkKzq7Hfa/XiJtWn7XeqXDuGTADvMqk8huA2pFWgHggfKwf
	QABw3xk/AeWFQz8yQ6Q1cz9tZ9v9bZlf0sYPi/yNF7tgHZ1T9DISdF24hKS3NfNwlQN5vBSl0kL
	/I0vsFQI7i98Boo5dh7GXcfcrL7rtCvwH4ACoNdXTxp9dhyOzJi6GeAUWzg4qR4VIUiz2FjTT07
	wXdDj7UT2jEFlR2GcYyJrmsKFDYHsQk1490WjkIsWVNVDlTohxyOCQg3hzk+ORdUFm/8h1Rlsjy
	kY390pyxsJOxkLZhRMK+Q==
X-Received: by 2002:a17:902:e84c:b0:2e9:6b5b:3db6 with SMTP id d9443c01a7336-2e9a69e93d4mr22504755ad.30.1792235011936;
        Sat, 17 Oct 2026 04:03:31 -0700 (PDT)
Received: from x1c ([2405:9800:b670:b64b:7c65:ff3e:80ba:b06])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e804dd9sm20559955ad.16.2026.10.17.04.03.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 04:03:31 -0700 (PDT)
From: Tharit Tangkijwanichakul <tharitt97@gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>
Cc: Shuah Khan <shuah@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	jkoolstra@xs4all.nl,
	Tharit Tangkijwanichakul <tharitt97@gmail.com>
Subject: [PATCH 5/5] KVM: selftests: Test protection of the ucall MMIO region
Date: Sat, 17 Oct 2026 18:02:13 +0700
Message-ID: <20261017110213.46199-6-tharitt97@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261017110213.46199-1-tharitt97@gmail.com>
References: <20261017110213.46199-1-tharitt97@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Verify that creating a memslot overlapping the ucall MMIO region
fails with EEXIST and that ucalls work before and after the
attempt. Skip when MMIO ucalls or read-only memory are unsupported.

Signed-off-by: Tharit Tangkijwanichakul <tharitt97@gmail.com>
---
 tools/testing/selftests/kvm/Makefile.kvm      |  1 +
 .../selftests/kvm/reserved_slot_test.c        | 61 +++++++++++++++++++
 2 files changed, 62 insertions(+)
 create mode 100644 tools/testing/selftests/kvm/reserved_slot_test.c

diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
index 1f4bc2a1322d..ff4a5e9733e9 100644
--- a/tools/testing/selftests/kvm/Makefile.kvm
+++ b/tools/testing/selftests/kvm/Makefile.kvm
@@ -68,6 +68,7 @@ TEST_GEN_PROGS_COMMON += set_memory_region_test
 TEST_GEN_PROGS_COMMON += memslot_modification_stress_test
 TEST_GEN_PROGS_COMMON += memslot_perf_test
 TEST_GEN_PROGS_COMMON += vm_types_test
+TEST_GEN_PROGS_COMMON += reserved_slot_test
 
 # Compiled test targets
 TEST_GEN_PROGS_x86 = $(TEST_GEN_PROGS_COMMON)
diff --git a/tools/testing/selftests/kvm/reserved_slot_test.c b/tools/testing/selftests/kvm/reserved_slot_test.c
new file mode 100644
index 000000000000..4a908017ca73
--- /dev/null
+++ b/tools/testing/selftests/kvm/reserved_slot_test.c
@@ -0,0 +1,61 @@
+// SPDX-License-Identifier: GPL-2.0
+#include "kvm_util.h"
+#include "processor.h"
+#include "test_util.h"
+
+#define CLOBBERED_SLOT		TEST_MEM_SLOT_BASE
+
+static void guest_code(void)
+{
+	GUEST_SYNC(1);
+	GUEST_SYNC(2);
+}
+
+static void test_slot1_protected(void)
+{
+	struct kvm_vcpu *vcpu;
+	struct kvm_run *run;
+	struct kvm_vm *vm;
+	struct ucall uc;
+	u32 nr_pages;
+	size_t slot_size;
+	void *slot_mem;
+	int ret;
+
+	vm = vm_create_with_one_vcpu(&vcpu, guest_code);
+	nr_pages = vm_adjust_num_guest_pages(vm->mode, 1);
+	slot_size = (size_t)nr_pages * vm->page_size;
+
+	run = vcpu->run;
+	vcpu_run(vcpu);
+	TEST_ASSERT(run->exit_reason == KVM_EXIT_MMIO,
+		    "Unexpected exit reason = %u", run->exit_reason);
+	TEST_ASSERT(get_ucall(vcpu, &uc) == UCALL_SYNC && uc.args[1] == 1,
+		    "Expected the first sync before clobbering the ucall GPA");
+
+	slot_mem = kvm_mmap(slot_size, PROT_READ | PROT_WRITE,
+			    MAP_PRIVATE | MAP_ANONYMOUS, -1);
+	ret = __vm_set_user_memory_region2(vm, CLOBBERED_SLOT, 0,
+					   vm->ucall_mmio_addr, slot_size, slot_mem, 0, 0);
+	TEST_ASSERT(ret == -1 && errno == EEXIST,
+		    "Expected the ucall GPA overlap to be rejected: ret=%d errno=%d",
+		    ret, errno);
+
+	vcpu_run(vcpu);
+	TEST_ASSERT(run->exit_reason == KVM_EXIT_MMIO,
+		    "Unexpected exit reason = %u", run->exit_reason);
+	TEST_ASSERT(get_ucall(vcpu, &uc) == UCALL_SYNC && uc.args[1] == 2,
+		    "Expected the second sync after attempting to clobber the ucall GPA");
+
+	kvm_vm_free(vm);
+	TEST_ASSERT(!munmap(slot_mem, slot_size), "munmap() failed, errno=%d", errno);
+}
+
+int main(void)
+{
+	TEST_REQUIRE(UCALL_EXIT_REASON == KVM_EXIT_MMIO);
+	TEST_REQUIRE(kvm_has_cap(KVM_CAP_READONLY_MEM));
+
+	test_slot1_protected();
+	return 0;
+}
-- 
2.53.0

