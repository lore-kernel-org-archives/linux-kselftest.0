Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 264A5308F15
	for <linux-kselftest@vger.kernel.org>; Mon, 11 May 2026 14:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778510210; cv=none; b=O1Xbd3zmGVbPmBZaFy2++HqvKXj0L2NLYCmbrb1HWGjHt1Erc7pG56F8k1qw8bCkRWzUE7fjVZusTr14uAOEQiHJhW0GInDOlM0DmwKVyl+jLJ8isi9i9hH1B3qwELAgdd6sEOz6vvjz23MKcdhdUQETN3+vF4Amu1baoNkaJFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778510210; c=relaxed/simple;
	bh=OCWkO9kiaVtlkjvw4jaBUr/0GwYS4dSFaaNA889cWuI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ac+qoUYTg2Qd/IdHKCd9hg9gNT3F9LjxDvmtjOaeRf/vdnZllUmnrDp9o7yeYAJAVH9nffxqIxXeN/FWwXYgBZRrgbQ2s3gqoVA4JQUSRBTqApVmSbCGGDTYuo62aWTaJZIrIt2nxklcWdDgGO/H43bRzKYwmNniOgwnmFuyTLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qVwyXVXD; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qVwyXVXD"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6804e24803bso1361648a12.1
        for <linux-kselftest@vger.kernel.org>; Mon, 11 May 2026 07:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778510207; x=1779115007; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OvCAfW/ab6cqkSL7XlF/lvlNJfGaNVLCaQnRtMsWK2M=;
        b=qVwyXVXDXjOa+6c6PwSXZJxOkTjw/lPS7mWwagdfLA2KQrGISLN2rec/57KMU/o2I5
         ifAlrcfsU59+Qg03Xp7nYuZzPm6dWn9Mg++MhRM/6kADpxa/K4mYTEY+icnLoaIKo+7x
         cIO+chUzyLebYOxwmbNFm0RDZ6eq5ZweDWcsROX+PlFbboxI2vJS2va8tleDO1+r2Rq6
         7LZYDFAKAAjP6bEX1BvsJl058ZCog3KAvZdSSdAvi/JXY23hQ9ywYjeZFOfVLeJEAkX2
         T+w7PlT/Bc8oCLZdJntfBKLC8odkmQz4xyeonwcvvFJV56kDKM5BPR+DQcbKbn6mZLLu
         rTMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778510207; x=1779115007;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OvCAfW/ab6cqkSL7XlF/lvlNJfGaNVLCaQnRtMsWK2M=;
        b=KMHDJU936JGogmDp6it9Ei52BGMhNGHCZQqGc7oDl6J66siP35Q0mQchP4GP7fWR1N
         v6uO89JG8n7QZ7Zg8jAclV3YBUAReUPQiLpyH7hMjV0nStiO38arZl0jwgHUmScrwlEU
         ikInp0vi9ammz7zSfdFibQBoXilyuz9kGtglogi7h0c1vMZZV7Np53nk/FJabqgN1Kta
         DB/WgufGVYzYTaJ1QdYYMFzWuRtGMPYGSRk7QF0foBu2bzrr5ysqm5T5CeO+rRIUXK5F
         ntu+OXklDJp5KjJIrm+n/1iscT3s4DG06DUgJLKhkt6sOdiqlnVeQ/Gn+rTq+35CVN5y
         0eUQ==
X-Forwarded-Encrypted: i=1; AFNElJ/Wy4LMTyo4mr0wIozqOO99oe9iH7oFJol8k2I78pDNReURTE0wuRn8A86LtPC3iyaOHHSluWTxqFrwgt67QUc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+Dtk83E7Ud5OaoFCBsHlBHF2QwrX+u9D0v4euz651SCVeQMmu
	+G85W9H20d1qqkl3Hxmp20LQY4+Dx32b6Ehc/MPxqrgU5qIvneena8DC
X-Gm-Gg: Acq92OH2taKd82ziEIYqIzzA5MVDOuSwnrIrkVK2HWR2O32X+fG6wYqDSaKzakd03j8
	DHk6j8NzMSF5f2D/KPVZ3QsZaslpmdJPYMzUk2LBrc4TP7PXyv45zEkL/OBR91Njo87ozUV6to8
	z6sCUlizXOARRWiTXWo3Ot1t/9qQhnMMI9ywP564OhSHxgLEcJApLxJB8c9Azk5lD761MlGDQDs
	pq9g7w7pRHZKdY+eQ7sfz3uE99VJ2iHn8sLo4B2N0kSSPKc40DmvRs/c5i+GTHdOvBl+yX1SOab
	m6MvRtT4ZXB6ORx+CGxroRRy29oVlO/GIZdiTZmZYg1UK0kADmNzp/WQZV97ui3gYmMzH/ajtr+
	ojkTDjIQxaB3+rIybKAigt50xDJ4yqtKVrh9dZatOysBrFUPhi4zqm12K9ThNWAfMpNnAB1Vt9M
	CZokWVXJ8i/pdjI6+n61/vj2WQFg2oX3T4QAv9rKl+n4lYdmhvbZ1zZqRkjDdobQ3+2HSTAjL4t
	aTx0tOopfl1MCfHKc01jwQiGy8=
X-Received: by 2002:a05:6402:3809:b0:670:8add:2b98 with SMTP id 4fb4d7f45d1cf-67ef07ba8f0mr7220503a12.14.1778510207251;
        Mon, 11 May 2026 07:36:47 -0700 (PDT)
Received: from arch-piotr.tailb7ebba.ts.net (226.55.classcom.pl. [195.150.55.226])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67ef0e1c044sm3651347a12.27.2026.05.11.07.36.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 07:36:46 -0700 (PDT)
From: Piotr Zarycki <piotr.zarycki@gmail.com>
To: seanjc@google.com,
	pbonzini@redhat.com
Cc: shuah@kernel.org,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Piotr Zarycki <piotr.zarycki@gmail.com>
Subject: [PATCH] KVM: selftests: sync_regs_test: use KVM_SYNC_X86_VALID_FIELDS
Date: Mon, 11 May 2026 16:34:26 +0200
Message-ID: <20260511143426.1242013-1-piotr.zarycki@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use KVM_SYNC_X86_VALID_FIELDS instead of open-coding the same three
flags, ensuring the test stays in sync with any future additions.

Signed-off-by: Piotr Zarycki <piotr.zarycki@gmail.com>
---
 tools/testing/selftests/kvm/x86/sync_regs_test.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tools/testing/selftests/kvm/x86/sync_regs_test.c b/tools/testing/selftests/kvm/x86/sync_regs_test.c
index e0c52321f87c..8f9239f9d357 100644
--- a/tools/testing/selftests/kvm/x86/sync_regs_test.c
+++ b/tools/testing/selftests/kvm/x86/sync_regs_test.c
@@ -79,7 +79,7 @@ static void compare_vcpu_events(struct kvm_vcpu_events *left,
 {
 }
 
-#define TEST_SYNC_FIELDS   (KVM_SYNC_X86_REGS|KVM_SYNC_X86_SREGS|KVM_SYNC_X86_EVENTS)
+#define TEST_SYNC_FIELDS   KVM_SYNC_X86_VALID_FIELDS
 #define INVALID_SYNC_FIELD 0x80000000
 
 /*
@@ -255,7 +255,6 @@ KVM_ONE_VCPU_TEST(sync_regs_test, req_and_verify_all_valid, guest_code)
 	struct kvm_regs regs;
 
 	/* Request and verify all valid register sets. */
-	/* TODO: BUILD TIME CHECK: TEST_ASSERT(KVM_SYNC_X86_NUM_FIELDS != 3); */
 	run->kvm_valid_regs = TEST_SYNC_FIELDS;
 	vcpu_run(vcpu);
 	TEST_ASSERT_KVM_EXIT_REASON(vcpu, KVM_EXIT_IO);
-- 
2.54.0

