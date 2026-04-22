Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B1AD3D16ED
	for <linux-kselftest@vger.kernel.org>; Wed, 22 Apr 2026 13:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776863027; cv=none; b=beT0z1QPh78XV65vhztY445obpQN0d9ZtGMbFGul2NyCCGClpDR3ioDU85vXN70yrfeboMXpeXmG1N0JzArqICTylwioWfblBJMSBWUXAtT8I2bWlv7czqrRFDluOpTVU+tvnXMc49Wii9FE9wK2CPxSDxB3E/0Ntb52UaZYkLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776863027; c=relaxed/simple;
	bh=NVp5rKRYc5QSU6T0BrJ5kTBob2N0jngaeZMRgSzkKTI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F1TKNVQdpxLKHkmEiiWEJ/xBDsNBznlcsxSJ5IyqID5UVOHI7WgDPfwel9/5Oj0CCm2v6dL9sDXdtCpGkMwb+D4E2RThjZAqo4DC/6HmtTjl1TUrwrmywX9sieIOfcX4r1WsVVoOc04nrez22Wp4shB5xCJFO97JFIshjyxttn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g022hXn7; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g022hXn7"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-676a89de629so3077969a12.1
        for <linux-kselftest@vger.kernel.org>; Wed, 22 Apr 2026 06:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776863024; x=1777467824; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6DxlUcAzvEB7U+i5O0kj+4iBEHjE40skBjf9E+7IN5g=;
        b=g022hXn7mJYo98CrQVe0weyAw1cvWrg04DNbWu2Kjw5JpG5u/i9GIMxP0YTb0abKum
         xSZzILS83d8iA0tunQR++NxgmGUEKVlc5pau6zhf2euIIM9DELwsjiDQcB4f4+2BMAaL
         xDnQPf9fAZdOwyuq/onFNqGDNJ/erwjUE4Aflia+1ZpdEieFVgFbdDEUoEL+ujxpJ7cA
         wcd7AJwZTpY0Mv9/Stz4eSnS1FUXFXLtzqCKdWIorSgl2IPTRT/x7JcGtqZ+Ceez7yCM
         GXSvKV5IAJUI3AwAOa3bMKaqcAAbHXiipPQo++uel7dpwJ4gow4uvwJO4Ph73P4kw8ek
         bKdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776863024; x=1777467824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6DxlUcAzvEB7U+i5O0kj+4iBEHjE40skBjf9E+7IN5g=;
        b=rBfmJUbYKgdg6ks7WOZKAsPwp3PLFWM7Wg68a32kQQYMXI3cr2hmpPIPoqHkGBio51
         s46WRXM1GN5+aqVmucB0BMLhZMBfN4xoy2xu8CMf7wNXqhihkMcp0gj2VTez9w4AXJuU
         IONxiYV+R/fxu/CtSHkgZ2OtjhwL8FyowXm3/KXfRvOx9ZC6/Q8tmFijRQ6yAP6y6BNC
         Ut2tno37TxMuy1j3T6YiaGLWbBnTGpzqhN1+U89mdfuMTRNKsfzvJf2wY+j3sDzet9uX
         WrYkS2N/K2Zy2c6oo0cpZgilwop5M+dDAbAutbGgMZ/rbL7I/qNghwHH0YJMNM33zQYb
         BWPw==
X-Forwarded-Encrypted: i=1; AFNElJ8AlBjvPgovtp0e74nbFwmoLKIYsZZqJbgbaO4+/gMKJA9Pbm05sPX0ituEnSdu+i/2AwchYpS17hyURKieHLY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZpF24t6QrFihxLpUpyNAbeWjQKJf/tGOWCSsHGhd4oPyeBtV4
	KaMbQKz0OieUzb1wh9aric6Xs7NqFoesQFenRMLS0/kj+mimpMM/VTnEUGoVz7TiFSQ=
X-Gm-Gg: AeBDiesXQCkGtYFbMNMkhEwI2YoVtYVpTG6yoPzz95R1AkuEaBkOpDkoZzqfRgUWGHz
	qKHHHvQ4OAwgQD7vbeJURfwk/wy+EEZj7Nv8371jLnKK+hzv1WZrO4hpfyTuSnYzzXR/JKYJsiC
	6YxsmSMhcw3Duyg39uNjin30z5nh03yu8OzhUBmZcT3fllYyreJjwFba3pxhjbE6sDCcgNB6iJK
	oM81X2DrI/T1Sp4Iq40j/+57/N3i2pCg/caBE/x+TjcJYOozi7vXzO+gi3cue147rz8DUJ8s/9N
	uLAk3ji/qZuK4WU8n5tbC1qBy0rilIDhBjt8b2nzmyFL/Eojk5sTimhv1aXYP8GsnVddf3VwGN5
	rbLkUbLb1anUeDUr9Hkt5o6TzlF/cnWycaxC+R4W2hBuikLuacg0WSB/B34pAU2lUDZfVLghHhZ
	Hy55kXShSkn+G8ikvuSgwBulOFvrwUW6odGwxQQ7SdpfK7fpZxj7thupnAi1sz4YtR9zOiMvGnZ
	m9nS0iQtq3waUojNRnYBZGFIoRBS464YDgsaA==
X-Received: by 2002:a17:907:847:b0:b9c:a70c:d30b with SMTP id a640c23a62f3a-ba418e85407mr1112598566b.19.1776863023946;
        Wed, 22 Apr 2026 06:03:43 -0700 (PDT)
Received: from arch-piotr.tailb7ebba.ts.net (226.55.classcom.pl. [195.150.55.226])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba4520c93c7sm531722966b.27.2026.04.22.06.03.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 06:03:42 -0700 (PDT)
From: Piotr Zarycki <piotr.zarycki@gmail.com>
To: vkuznets@redhat.com
Cc: kvm@vger.kernel.org,
	seanjc@google.com,
	pbonzini@redhat.com,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Piotr Zarycki <piotr.zarycki@gmail.com>
Subject: [PATCH v2] KVM: selftests: hyperv_tlb_flush: replace NOP loop with udelay()
Date: Wed, 22 Apr 2026 15:03:07 +0200
Message-ID: <20260422130307.1171808-1-piotr.zarycki@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <87v7djgoji.fsf@redhat.com>
References: <87v7djgoji.fsf@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the open-coded NOP loop with udelay() which was added to KVM
selftests in commit 6b878cbb87bf ("KVM: selftests: Add guest udelay()
utility for x86"). The NOP loop is CPU speed dependent while udelay()
provides a deterministic delay regardless of host CPU frequency.

Signed-off-by: Piotr Zarycki <piotr.zarycki@gmail.com>
---
 .../testing/selftests/kvm/x86/hyperv_tlb_flush.c  | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/tools/testing/selftests/kvm/x86/hyperv_tlb_flush.c b/tools/testing/selftests/kvm/x86/hyperv_tlb_flush.c
index c542cc4762b1..4b7f089542c1 100644
--- a/tools/testing/selftests/kvm/x86/hyperv_tlb_flush.c
+++ b/tools/testing/selftests/kvm/x86/hyperv_tlb_flush.c
@@ -141,17 +141,6 @@ static void swap_two_test_pages(vm_paddr_t pte_gva1, vm_paddr_t pte_gva2)
 	*(uint64_t *)pte_gva2 = tmp;
 }
 
-/*
- * TODO: replace the silly NOP loop with a proper udelay() implementation.
- */
-static inline void do_delay(void)
-{
-	int i;
-
-	for (i = 0; i < 1000000; i++)
-		asm volatile("nop");
-}
-
 /*
  * Prepare to test: 'disable' workers by setting the expectation to '0',
  * clear hypercall input page and then swap two test pages.
@@ -169,7 +158,7 @@ static inline void prepare_to_test(struct test_data *data)
 	wmb();
 
 	/* Make sure workers have enough time to notice */
-	do_delay();
+	udelay(100);
 
 	/* Swap test page mappings */
 	swap_two_test_pages(data->test_pages_pte[0], data->test_pages_pte[1]);
@@ -189,7 +178,7 @@ static inline void post_test(struct test_data *data, u64 exp1, u64 exp2)
 	set_expected_val((void *)data->test_pages, exp2, WORKER_VCPU_ID_2);
 
 	/* Make sure workers have enough time to test */
-	do_delay();
+	udelay(100);
 }
 
 #define TESTVAL1 0x0101010101010101
-- 
2.53.0

