Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41FD231AF2D
	for <linux-kselftest@vger.kernel.org>; Tue, 21 Apr 2026 17:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776792621; cv=none; b=fTkwGmtRhKVTbgkwcsLTKJ0eHRRxM0+cBA2uhjP44LnD9wjRnP5GOomEEkpeMHjHKZF82Nzpr7e8Vm3Kso2YzF1UqZNRwYArK0UBNbcglDmOpe2KlHiEnC52kX1MUMctLguVs+PZClLFAAiAmVz2ouhdfFUFYou7eCIZhT7zYAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776792621; c=relaxed/simple;
	bh=dspuxqTe419FD+lEMwkgisODXMHd/wKMI0WUc//Nifk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KQ9K+i2F9Ih+sj7PbAw40YyemoIHeBmuZqopAyYI9cL1wee8lyujSXtiDO+VV0olJJwDsjRs/anLCPBfhmEaOuD9t71NicHyJo3Yv9uScLc7bItosRvt1IOZGYJIbhRp70YEUnRqsmJ7CDIe8zx2AAl8i65OMJS0KtYZLWzfHYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gBT2W46A; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gBT2W46A"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6715594a4c2so5232591a12.1
        for <linux-kselftest@vger.kernel.org>; Tue, 21 Apr 2026 10:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776792619; x=1777397419; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tWn0gXFXwrRfN5iJsoKTIypDbNwmF/nvBWNaZZ5XE+I=;
        b=gBT2W46AV1I1wRnab/Rqz9IFNLyUeVAKx58wXTbQR/Tb2/PEjVkQK61TqEb6Rtgka9
         SkAfwEiPFT96cRQWE9wLVRTH+3p29cMLaw9PhwwyTlby2yMNn8sbm3UrTsHjI4r22DZe
         7SeaINNJfSuOnGwtrYreR+84s7proueTFk1qvgPVUG21khYd0FWPns+poUWroJbYJ0uh
         dXsPoqir3uMzWFdITMWysl1g4YeZWXjc8QqyJiF83vYhRdIfgvC36cIftBmHiOR+ajZT
         yjixrZmh1nKXpzEpjXG2ALOJV2+h+jQI/BU20RjTdarfKuU6OEFTFJ9lytbqa/i+pnnP
         kUVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776792619; x=1777397419;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tWn0gXFXwrRfN5iJsoKTIypDbNwmF/nvBWNaZZ5XE+I=;
        b=LFcARWbvQX11vIg02/c6l+cgzOrdlKGGcyK/Q7CZLXNm6qvPJAa4t8GQdNXsm2virC
         0YfmWFJkQATzAFRW7skxrtP5D+W9664zAXebdo3F3VUYyEjWQvgQ3ZtW49pVgar7SIzd
         d4V6staAU95q/auLw9azlXWHXuC8bVa8gqk3FmtWys5sH+m1dPTVHnxjRchve3HpKE8E
         ffxs9pAhkPBX4qdzws9vYoW1hcD1Gk+JZsqmYNrEfPjwjMgzixd50ITZ+EAPsMqOcRQf
         KDxTEe2K97VPgKyE/BQ+7WSEU9sgzM7X4CHb8EZiIes7NtKnL8dZpfTZCA0WAbOLMNP8
         6wSw==
X-Forwarded-Encrypted: i=1; AFNElJ/s8+RNERqwkaBj1R1y/g0HH/oNtE7X7vaWXvdDLApxIAH3OFpfBPpmSxSwYWdJ23IbMVpuSmiql5SKsmTGKUk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxI4TGRYRi1z0ofDxn/u78r6/+2vNX8yir6zmC51hdEzjPQB3r
	w3QlKpUgeEMAvxdtvwJjp3CQg0xj66HIZjwu8RWoqpmyWZdliFsNarnwRgDW9LvUVvU=
X-Gm-Gg: AeBDiesacTx8pkRX+PwmJreeojI3+iFECdaEvf9/dC6BPtb78Z67X0TJuX/3WorKu3U
	0ilic9QIveTwgiWo+JXuAcHMxC0aVOrEzNkUHJ2j+dF9AIoGLRcSv0+RQWIyZj9EKOJmeo+1v7Y
	kdLH+0gpMr9v4hGwERmZon3v9wU8JYXDH+xxBavptpN4dH4QtwH10TdNszhd4ZkSB3yFP1/6lT/
	G7CKjHH/lyREyPsS6nXi4VngZnEwO5o3OBAu8UPX51ztGPDmnC61czVaRPjn76ggMErcd3eAhG5
	lxrFyY3oHRvTzEIzgYRuZv3J8lnQUg5JwPyJA9s5GRyeA7KJ7thZySs/Mza9bn/Cp2SlZ0Du+nx
	voGvi5RMs3dd9QgvpVihlZXyzx63XmEiZ0qmoZncD+xOl9lEgqdqZbwUCCcHVbwSNpNPV8Rna2S
	V3l5UT3CYRK6XNQE/UEFR1WHHqOhsWWWCGff9kc9XgN9sZHN8bkoxPB5oMbw8cUw/7BazcbRh/J
	JeXk+HHsHEa/hGeqS6whrDZIaeforaugpWn9Q==
X-Received: by 2002:a17:907:9629:b0:ba4:94f8:4df with SMTP id a640c23a62f3a-ba494f82009mr829389966b.17.1776792618257;
        Tue, 21 Apr 2026 10:30:18 -0700 (PDT)
Received: from arch-piotr.tailb7ebba.ts.net (226.55.classcom.pl. [195.150.55.226])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba4517ec776sm475683266b.16.2026.04.21.10.30.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 10:30:17 -0700 (PDT)
From: Piotr Zarycki <piotr.zarycki@gmail.com>
To: kvm@vger.kernel.org
Cc: seanjc@google.com,
	pbonzini@redhat.com,
	shuah@kernel.org,
	vkuznets@redhat.com,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Piotr Zarycki <piotr.zarycki@gmail.com>
Subject: [PATCH] KVM: selftests: hyperv_tlb_flush: replace NOP loop with udelay()
Date: Tue, 21 Apr 2026 19:29:53 +0200
Message-ID: <20260421172953.191345-1-piotr.zarycki@gmail.com>
X-Mailer: git-send-email 2.53.0
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
 tools/testing/selftests/kvm/x86/hyperv_tlb_flush.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/tools/testing/selftests/kvm/x86/hyperv_tlb_flush.c b/tools/testing/selftests/kvm/x86/hyperv_tlb_flush.c
index c542cc4762b1..68ebd790ff41 100644
--- a/tools/testing/selftests/kvm/x86/hyperv_tlb_flush.c
+++ b/tools/testing/selftests/kvm/x86/hyperv_tlb_flush.c
@@ -141,15 +141,9 @@ static void swap_two_test_pages(vm_paddr_t pte_gva1, vm_paddr_t pte_gva2)
 	*(uint64_t *)pte_gva2 = tmp;
 }
 
-/*
- * TODO: replace the silly NOP loop with a proper udelay() implementation.
- */
 static inline void do_delay(void)
 {
-	int i;
-
-	for (i = 0; i < 1000000; i++)
-		asm volatile("nop");
+	udelay(100);
 }
 
 /*
-- 
2.53.0

