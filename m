Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97BB23C1F31
	for <linux-kselftest@vger.kernel.org>; Tue,  2 Jun 2026 21:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780437375; cv=none; b=lon+cxJRO0Bbj5fD9aONWjBg51OwJY2cMpLOt2LTsR4wIBkMfU7kM0Rwj0h2C0o6bGLaaloGDwUoymC7diuVH3xkW5+m4oLVxmXwyX5cg1DwVY8/W8YysRNJUt7NgSc9rQ/7FYthbFMclOyU9UNgXLuUPJ0+1+FMo/cO/tC8OLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780437375; c=relaxed/simple;
	bh=uanUhuG5chBI7iGRiYb/NQJAUXfg811Uv7P0B8yjofM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Dxjs671E4qVtv47I0XlXtZdgiOIKI0IpsME+76Y8HJauaPGSO6u8TQQ/tJEp4dDPyDNHuMXflns6bWbxSoRVtVNc5fGm4dupKovglTDgk4iQ90Y4VPbuqGCLeS99OB0dmJ4JqZCQ6A7bhF2Vl73BL1o7Z5J1vO7GuRI2zHKn2+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XNjBr8J1; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XNjBr8J1"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-36d98b76d12so2252325a91.2
        for <linux-kselftest@vger.kernel.org>; Tue, 02 Jun 2026 14:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780437374; x=1781042174; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZQ6ZTIKmnZDIm2PqykNUkTYiLD4CQXsPT3VeVYf4kfY=;
        b=XNjBr8J1U4s8QjU9Veys5EkOTIKe5T1wGa1/B33FBawxUnztUSLTnJSXDQCUufT0qv
         bll1Bwidz2cxWYAz2P1j2xhy4JSLmNQ/Q/4k3WWKBCRXJxj+WMyLcfMFr6wSCatmU9VB
         ghGMWQuZ5vwgtNPnQQr8xZq4uZlDaQOeAywRAoahBMlK0wk09Pz0VDyNf4Us6cmVLpKV
         jgg9LG6Gjrci8estma8+x87qFxxWBigxHgn03Ve8ln+k4C8uVRxJ27XSCPwavh7ixd3s
         vwPdynMwe2aiVQs9p2wuP6K8R3XrrHqnkcKa2AJhE4NTH7/2VWrSnOt4b4EinI/UEv8F
         p3wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780437374; x=1781042174;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZQ6ZTIKmnZDIm2PqykNUkTYiLD4CQXsPT3VeVYf4kfY=;
        b=ONrqHmK0o4r0sp33WimTKTDaN3vWSBKZFkmyOWZhBcBpCDeK9zgjUqPb/hnlFL7dlk
         KEWozXO/Injn3Fiee6tfsnS4dxMjgtcHqrveyVUenk80+lQd2gUgonXg1GImKol09cMi
         NXGOoxTpzBT7H8GJYPU+ISYih8swu7AHAz4h1tVpjJzfFWUvvgikbuYwLIRQLSygLoyf
         jcaEPMNRwk4nolaV29+gSF2Mo16rHQI83130V8ruDRrWiMkLfPfbqc4LCpkq6lopLepS
         W3ktAQisZlYVy8m2urfBbvFWt8+NI/m5CzaX0yPLZrTdh3oVfeKMT823kjK49Hb6nyvG
         PItA==
X-Forwarded-Encrypted: i=1; AFNElJ8j8QP2wleLrLZ7FWOrdBGeBDu8XyNo4pGQjeFgzmEabjO7B0piydyo4K5akgcj9YBZRDxeTSVrtO/fkTU+OrU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxBvVa7PQCHRc0n6GPjjRvhaEuF+H8iDoS7VYSxzgcdwv7+Sbz
	kWh6OKCG95CZ8+WmGYPobzd6rjE7XxEDdvingVTwDSwvRR4GCmUIxo2HinNs6ZkKtN3bprFZ6dc
	u3xGu1w==
X-Received: from pju15.prod.google.com ([2002:a17:90a:d4f:b0:36b:89e6:3ee5])
 (user=wyihan job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3e4e:b0:35f:b647:d98a
 with SMTP id 98e67ed59e1d1-36e30552788mr686479a91.5.1780437372149; Tue, 02
 Jun 2026 14:56:12 -0700 (PDT)
Date: Tue, 02 Jun 2026 21:55:47 +0000
In-Reply-To: <20260602-memory-failure-mf-delayed-fix-v4-0-a5bc7db5a9b2@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260602-memory-failure-mf-delayed-fix-v4-0-a5bc7db5a9b2@google.com>
X-Developer-Key: i=wyihan@google.com; a=ed25519; pk=cRi0fKzS5BMxlHyHY2pJv3w/1zcgfYKr6EYGYppdMYc=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780437363; l=3092;
 i=wyihan@google.com; s=20260319; h=from:subject:message-id;
 bh=uanUhuG5chBI7iGRiYb/NQJAUXfg811Uv7P0B8yjofM=; b=onjoJh2jwfvgE5J9KsFufxaaM/BBUoZUbER0Iv4yiEZbnHtSt3LZi3VagZRC8gVSTIjS36l5y
 WirOgE+fH18CGioPV6fp/j5ijMuy/gRGi7+ecGc+dvu8oYZZXqd01R3
X-Mailer: b4 0.14.3
Message-ID: <20260602-memory-failure-mf-delayed-fix-v4-7-a5bc7db5a9b2@google.com>
Subject: [PATCH v4 7/7] KVM: selftests: Test guest_memfd behavior with respect
 to stage 2 page tables
From: Lisa Wang <wyihan@google.com>
To: Miaohe Lin <linmiaohe@huawei.com>, Naoya Horiguchi <nao.horiguchi@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Hugh Dickins <hughd@google.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Cc: rientjes@google.com, seanjc@google.com, ackerleytng@google.com, 
	vannapurve@google.com, michael.roth@amd.com, jiaqiyan@google.com, 
	tabba@google.com, dave.hansen@linux.intel.com, Lisa Wang <wyihan@google.com>
Content-Type: text/plain; charset="utf-8"

Test that
+ memory failure handling results in unmapping of bad memory from stage
  2 page tables, hence requiring faulting on next guest access
+ when the guest tries to fault a poisoned page from guest_memfd, the
  userspace VMM informed with EHWPOISON

Co-developed-by: Ackerley Tng <ackerleytng@google.com>
Signed-off-by: Ackerley Tng <ackerleytng@google.com>
Signed-off-by: Lisa Wang <wyihan@google.com>
---
 .../kvm/guest_memfd_memory_failure_test.c          | 66 ++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/tools/testing/selftests/kvm/guest_memfd_memory_failure_test.c b/tools/testing/selftests/kvm/guest_memfd_memory_failure_test.c
index 6c8032d390ae..e6f4c327bd5a 100644
--- a/tools/testing/selftests/kvm/guest_memfd_memory_failure_test.c
+++ b/tools/testing/selftests/kvm/guest_memfd_memory_failure_test.c
@@ -24,6 +24,7 @@
 #include "kvm_util.h"
 #include "test_util.h"
 #include "kselftest_harness.h"
+#include "ucall_common.h"
 
 static size_t page_size, total_size;
 
@@ -313,6 +314,71 @@ TEST_F(guest_memfd_failure, test_memory_failure)
 	}
 }
 
+static void __guest_code_read(uint64_t gpa)
+{
+	uint8_t *mem = (uint8_t *)gpa;
+
+	READ_ONCE(*mem);
+	GUEST_SYNC(0);
+	READ_ONCE(*mem);
+	GUEST_DONE();
+}
+
+static void guest_read(struct kvm_vcpu *vcpu, int expected_errno)
+{
+	if (expected_errno) {
+		TEST_ASSERT_EQ(_vcpu_run(vcpu), -1);
+		TEST_ASSERT_EQ(errno, expected_errno);
+	} else {
+		vcpu_run(vcpu);
+		TEST_ASSERT_EQ(get_ucall(vcpu, NULL), UCALL_SYNC);
+	}
+}
+
+TEST_F(guest_memfd_failure, test_memory_failure_guest)
+{
+	const uint64_t gpa = SZ_4G;
+	const int slot = 1;
+
+	unsigned long memory_failure_pfn;
+	struct kvm_vcpu *vcpu;
+	uint8_t *mem;
+
+	/* Limit guest test execution to a single variant to avoid redundant runs. */
+	if (variant->method != MF_INJECT_DEBUGFS ||
+	    variant->kill_config != PR_MCE_KILL_EARLY ||
+	    !variant->map_page || !variant->dirty_page)
+		return;
+
+	self->vm = __vm_create_shape_with_one_vcpu(VM_SHAPE_DEFAULT, &vcpu, 1, __guest_code_read);
+	vcpu_args_set(vcpu, 1, gpa);
+
+	self->fd = vm_create_guest_memfd(self->vm, self->vm->page_size,
+					 GUEST_MEMFD_FLAG_MMAP |
+					 GUEST_MEMFD_FLAG_INIT_SHARED);
+	vm_set_user_memory_region2(self->vm, slot, KVM_MEM_GUEST_MEMFD, gpa,
+				   self->vm->page_size, NULL, self->fd, 0);
+
+	mem = mmap(NULL, self->vm->page_size, PROT_READ | PROT_WRITE,
+		   MAP_SHARED, self->fd, 0);
+	TEST_ASSERT(mem != MAP_FAILED, "mmap() for guest_memfd should succeed.");
+	virt_pg_map(self->vm, gpa, gpa);
+
+	/* Fault in page to read pfn, then unmap page for testing. */
+	READ_ONCE(*mem);
+
+	memory_failure_pfn = addr_to_pfn(mem);
+	munmap(mem, self->vm->page_size);
+
+	/* Fault page into stage2 page tables. */
+	guest_read(vcpu, 0);
+
+	self->poisoned_pfn = memory_failure_pfn;
+	mark_memory_failure(memory_failure_pfn, 0);
+
+	guest_read(vcpu, EHWPOISON);
+}
+
 static bool can_inject_memory_failure(void)
 {
 	int fd;

-- 
2.54.0.1013.g208068f2d8-goog

