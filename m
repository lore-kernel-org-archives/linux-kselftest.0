Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 760CE3DA7F8
	for <linux-kselftest@vger.kernel.org>; Wed,  5 Aug 2026 05:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785909518; cv=none; b=Si8MuaVQtCQtzeLrtU4Z8KQ/xmDr/TXL+BXKYg2fUkwRlVhh+4C5joFGW/WTxDVEFGEiztooGYrLctaOumi5gsIIoS+kb/FFzoxT1XG0waqyLHL8G4glgCG+Hqnzd3BWSaz1pSf09T3m4CkV4s/xXVbKJZnDQENnOtG9PQKj9As=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785909518; c=relaxed/simple;
	bh=8X9Pt3b4HhtnYUSt2HOxZHNwbrEh8Z1iKaOic7de9uE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=C/FAbd03IXTFniw3CKOq6dJnGBbwrz33xz6iJXlkWLT1pYY/j/no6jHCZBRSu6xKygdGuCZ0iu5ZdXszPxh/sNX6pVGX8TTK4Vjw98/w7gEJWFQfS4LwmIBqHEDTvDIpIOOW5TOt/QbAIQ1lVrmOkuuhvHqhsVde/gZqZLUKxPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cZeyHE6K; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cZeyHE6K"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6a17211b9ecso465854a12.2
        for <linux-kselftest@vger.kernel.org>; Tue, 04 Aug 2026 22:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785909513; x=1786514313; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YrrMpNZ3EbUZ0vhwBdXXhCA5baZrY7jz1a714Vgbih8=;
        b=cZeyHE6KmkuQKEDUs631bZvRMpJb9rKxngu10OM0iTHyFKgLKJRUDduCeZ5D3u1LFm
         1zOujJbzOtApZrhdzboboByvJ2xpZR0MVEkNebkQktxpX3kZ7Oa9ZpXANsZ2M2z8TJKK
         /ipQ3CNFkA//BHv7LQaLu2M+cSTJR2XnceiHkNEYWD3wuqQzn/xMA7cdpd5rrk4mcNCN
         PjRH1zSqRLGAqu33gULP/a5wYPmJiM7XEpNKaOLTdSLOgU4mYlzKdaJtB/cVxOI1eNqo
         88umjeO5yApbR96x9atJJiXhKGHgCOuehhAEtrHEyO3/IsqPDrff74Y6zY0oSdBAk3Dc
         hTnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785909513; x=1786514313;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YrrMpNZ3EbUZ0vhwBdXXhCA5baZrY7jz1a714Vgbih8=;
        b=HbukMecPsb7OpCD0BiylSbb1K6/9SF7SvFMH1Am8w5zPYiRJKyio7L4fInTPH/9K5J
         mc0AXgiDvJrdMAxJcVvDIFV3v9Ph+857D2t2cGEAjbBJ72rf/2b6yL6F+OI1PAhI84cS
         GR0urDQb3ysTVFGQ2rBXSjb/hyDTzTQtmGs42UcAjCp9l9sRXcfGed/zTgS/cBa5D58g
         YDiKIDWoj6pL7VExZPyZJk+cxKQxbDNKa5PRDL7ZZcHeCqOTUJTaLFz/RzmxekVC5Xsa
         0xOTuS5u2eOllKxFBcPmpqXGW4sbq4EM2oeFab6l/6OA46cDWbWwy1sOVxuAzDEcAj+4
         Ejlg==
X-Forwarded-Encrypted: i=1; AHgh+RrWXRZ6FZJ+dYaAviZY7Zs9tzANVn26K7GqNywPOkp+gHc6IJ80JGnNZ8K0E6rvW/Bk7Axiw61gZghd9uawDI0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxQSs5+kpXzgn9a4gteArnhuZC6IEJ8eonqAKZdmPzdJqhd4bq
	Hm2Wj9D4BfZNyyZqg7DfW/0nhO11RDBIt3tEieLnu4pTcDOplybzF6al
X-Gm-Gg: AR+sD10lxUQ41dXGzPUQO1CJpMREpWzg90NiEFsIDUgBeUJABH5DjgrlcnY1z7EAXBD
	qfEVGcWkdrB9sFik50MbuLHwJUDvq+6xmXVP36XkKvXx5XgH9TV46gRrbaI8+DnA7HaVzwDkQIk
	9OGNHBDjEEpJ0ibl1SxlxIHHaJo62JHPtfQZjacVoRbLDjLHFOBFsM7Xi42ns8wJhfVead3/+t/
	wRtyuqRLr34M2u+PKkX2TvsGHdx9vyvX46Kx4YIe6eEeonHp2rmL94bCc+b/JSH993us2TfLeOZ
	vnMNtV7iQ5raucSHEoRWkOt4u7biJvPb3sZclGO7PArtVRrwLLhNVnbJekSmIIQZuYj8wiKxWCA
	q16OYwuLJfwEnpRtomCzfZQMt5oVsb9boBm+xBVN/UhkNd4SMh7YfbBD0708wlHL4iOzPzNAM/E
	eoxcaLKEIwo4w6sFqt/TULok2gf+ggPextu4PUvc6AzqUoM49T5c4HKsfEFoEvbAAUv2a7vdTyE
	hIkuAqMPr4vPAdqlBw4GMXbwA==
X-Received: by 2002:a05:6402:1cd0:b0:6a0:a644:355e with SMTP id 4fb4d7f45d1cf-6a14f0a1306mr2074623a12.2.1785909512786;
        Tue, 04 Aug 2026 22:58:32 -0700 (PDT)
Received: from va-HP-Pavilion-Desktop-595-p0xxx.mshome.net ([193.0.148.216])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a145de6b07sm1305396a12.16.2026.08.04.22.58.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 22:58:32 -0700 (PDT)
From: Valery Borovsky <vebohr@gmail.com>
To: seanjc@google.com,
	pbonzini@redhat.com
Cc: kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	shuah@kernel.org,
	linux-kernel@vger.kernel.org,
	Valery Borovsky <vebohr@gmail.com>
Subject: [PATCH] KVM: selftests: verify toggling KVM_MEM_GUEST_MEMFD on an existing slot is rejected
Date: Wed,  5 Aug 2026 08:58:30 +0300
Message-ID: <20260805055830.740175-1-vebohr@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

set_memory_region_test covers creating a private memslot and rejecting
overlapping private regions, but nothing exercises a FLAGS_ONLY update
that toggles KVM_MEM_GUEST_MEMFD on a slot that already exists.

Add test_toggle_private_memory_region() to close that gap. It asserts
both directions are rejected with EINVAL:

  1. clearing KVM_MEM_GUEST_MEMFD on a private slot;
  2. setting KVM_MEM_GUEST_MEMFD on a slot created without it.

Both are enforced by the flags mask in kvm_set_memory_region():

  (mem->flags ^ old->flags) & (KVM_MEM_READONLY | KVM_MEM_GUEST_MEMFD)

which gained KVM_MEM_GUEST_MEMFD in commit 9935df5333aa ("KVM: Disallow
toggling KVM_MEM_GUEST_MEMFD on an existing memslot"). Before that
commit, direction 1 freed the old slot without calling kvm_gmem_unbind(),
so closing the guest_memfd afterwards wrote to freed memory; the fix
commit records the resulting KASAN slab-use-after-free in
kvm_gmem_release().

The test runs only when KVM_X86_SW_PROTECTED_VM is available, alongside
the existing private-memslot tests.

Signed-off-by: Valery Borovsky <vebohr@gmail.com>
---
Built and run on x86_64 against a 7.0 kernel; the new subtest passes.

 .../selftests/kvm/set_memory_region_test.c    | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/tools/testing/selftests/kvm/set_memory_region_test.c b/tools/testing/selftests/kvm/set_memory_region_test.c
index a152ab65c657..8fb2e7a96f6c 100644
--- a/tools/testing/selftests/kvm/set_memory_region_test.c
+++ b/tools/testing/selftests/kvm/set_memory_region_test.c
@@ -500,6 +500,50 @@ static void test_add_private_memory_region(void)
 	kvm_vm_free(vm);
 }
 
+static void test_toggle_private_memory_region(void)
+{
+	struct kvm_vm *vm;
+	int memfd, r;
+
+	pr_info("Testing that toggling KVM_MEM_GUEST_MEMFD on existing slot is rejected\n");
+
+	vm = vm_create_barebones_type(KVM_X86_SW_PROTECTED_VM);
+	memfd = vm_create_guest_memfd(vm, MEM_REGION_SIZE, 0);
+
+	/* Create a private slot. */
+	vm_set_user_memory_region2(vm, MEM_REGION_SLOT, KVM_MEM_GUEST_MEMFD,
+				   MEM_REGION_GPA, MEM_REGION_SIZE,
+				   0, memfd, 0);
+
+	/*
+	 * Attempt a FLAGS_ONLY update that clears KVM_MEM_GUEST_MEMFD.
+	 * Must fail with EINVAL. Before commit 9935df5333aa this caused
+	 * a slab-use-after-free in kvm_gmem_release() because the old slot
+	 * was freed without calling kvm_gmem_unbind().
+	 */
+	r = __vm_set_user_memory_region2(vm, MEM_REGION_SLOT, 0,
+					 MEM_REGION_GPA, MEM_REGION_SIZE,
+					 0, memfd, 0);
+	TEST_ASSERT(r == -1 && errno == EINVAL,
+		    "Clearing KVM_MEM_GUEST_MEMFD should have failed with EINVAL, got r=%d errno=%d", r, errno);
+
+	/*
+	 * Symmetrically, attempting to set KVM_MEM_GUEST_MEMFD on a slot
+	 * that was created without it must also be rejected.
+	 */
+	vm_set_user_memory_region(vm, MEM_REGION_SLOT + 1, 0,
+				  MEM_REGION_GPA * 2, MEM_REGION_SIZE, NULL);
+	r = __vm_set_user_memory_region2(vm, MEM_REGION_SLOT + 1,
+					 KVM_MEM_GUEST_MEMFD,
+					 MEM_REGION_GPA * 2, MEM_REGION_SIZE,
+					 0, memfd, 0);
+	TEST_ASSERT(r == -1 && errno == EINVAL,
+		    "Setting KVM_MEM_GUEST_MEMFD should have failed with EINVAL, got r=%d errno=%d", r, errno);
+
+	close(memfd);
+	kvm_vm_free(vm);
+}
+
 static void test_add_overlapping_private_memory_regions(void)
 {
 	struct kvm_vm *vm;
@@ -645,6 +689,7 @@ int main(int argc, char *argv[])
 	    (kvm_check_cap(KVM_CAP_VM_TYPES) & BIT(KVM_X86_SW_PROTECTED_VM))) {
 		test_add_private_memory_region();
 		test_add_overlapping_private_memory_regions();
+		test_toggle_private_memory_region();
 	} else {
 		pr_info("Skipping tests for KVM_MEM_GUEST_MEMFD memory regions\n");
 	}
-- 
2.53.0

