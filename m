Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42D3F2C1595
	for <linux-kselftest@vger.kernel.org>; Thu, 25 Jun 2026 07:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782371434; cv=none; b=HL+Sto6yZe/MmavohSzOF3fO6Ag7eY+POE2qCwMvhv7fqpg6KJ5N+o8F+n5f6tlSeXUOlTKj2+CZ2YLMqtDMKOlNQJJoecdS7jsU7/+JaIsF8DyPIvEmIwNt9TxM7sdNc01BR0fDYnK8OY22Unu35u5j3y+m7OkSVVY91oE1ycI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782371434; c=relaxed/simple;
	bh=yZTX7VJC/WD2OA/W8YgsMHmmxA3TUk1+6Pebdr0tiEw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lm+KCzAWCgWqk1kF0SZ1nGqsGNw8tDaJ4mR75myWcXiwzuzc/UpuCEn2kiyYCA3cXg9sOtPIBbVV7A3WIK7J9NsX76GuwALTXz+Wa9k141Bba5noMPWSm1HBUU+1Gp+r7CAsud7pF6+M4gQO5FaqTrS51IMA6cm5PiNAU9BmWvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JQEPuKIC; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JQEPuKIC"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c0c964d6470so293487166b.3
        for <linux-kselftest@vger.kernel.org>; Thu, 25 Jun 2026 00:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782371432; x=1782976232; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d4T0v1+5jWi6SLHmOxRLSB1SGzzI7YTPcb0uLSBXV2Y=;
        b=JQEPuKICiqx9xYfTog0UlKQbBY+k/oNtfd7cPR1/HSzGUxoI5Br7yFYPUVzhiBPtqZ
         ScPO+fYAc+Lk16PPxenU9xzyxR7b3aDw2GKZ37uGYVkstRMRYq3kaQBzYGl27aAq4wuL
         M3fudC+DFBrCCm1hswGdDuxS5B4vLU67BGEIIT+Wo3anGtNFNRnVlNa7POxUtpDg59ZK
         6r1XqK6tcDoMnSlYkVLg5cGSeDM/SijyuY15iJKAu9YKvrSrUrA7hokVimh85a2/uO58
         T4gNQOyN95WrmCnZHTum5KloCAc5Np4PcAaMqCMPKuWDATPryIdOiegogJFCMj/O8Tw0
         a3Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782371432; x=1782976232;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=d4T0v1+5jWi6SLHmOxRLSB1SGzzI7YTPcb0uLSBXV2Y=;
        b=Tmdtf7Ip12wvnsaBmrik96NGxOgMtLvCHRaNqBu8VfwLQ72DIEFteQ0YeInZUf7pjF
         Jf8bHOYPSdO+eqRP7JstX708c/MKtHN7lWq5j3buxXlaFEGtKEAXxbB610YntM2StLaC
         dBAs32HTaW9By6y+6UywKp8Z47KAXu0JNHfkD+NK9NYtHBLtoxwxbvV9ScHHmEfAC91n
         XUb+q/72wL/e6jEDjjHQHtwNVVOtqK0reeLzt0guSF/ALf9vD6TIZzb0D7cNEPPv+KkX
         UAygAKbietyBmonTh85Qe6H1TnL/5Jx0HMkXjWXZPRFOWOYSKlgwhHXZErA8LxC920xI
         akHw==
X-Forwarded-Encrypted: i=1; AHgh+RrdmsHRFDRuyRc1fnht81e1cT2Jf7jpN7s7+Vf6n8ofqpvtw5HjIA/Vp4z4uGgyPWJTvpPIhBbjO6VA4RCy26Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBBpS0I8XlFtlGR7ONgDA24PPQ3KQNXqhFj+nx3RtW+iJyx5kt
	E9joZpYRMDJKlCT91XTmDmJF5bjFpBCpvJta8odjN3XZKEEhyxUG1Acm
X-Gm-Gg: AfdE7cmqQ8MheJJCRUGwGS8fZSm+yHJ8w8lem64eUNV3Bn8loJ//+ybYZ4gAZeDxPZ5
	4QINRk59/8/fpdKCcG/l6xdoRFCc3Z0fy9IAayUBKAdvqQV3z9ZUN/Rs5g97UDqikHkYig8Qzuz
	LVDV49Wb17Q+oi2RBf7WoKADLqMTnSQbAzLfc6j9LHSUCXB/pAuRnoVcv73iMqbeMWqx1VYlJdf
	uAUb7vtqKyA6NsFSBpLsnJpeoWsQBLN8EvMVP/4+gaKuilVXS79bLwDiV08XWVMjX0j6P8XkTQ0
	/oMSKJEu/fcLYT1ghCYQxth7vG8P+63e5Cfgig+J3KZwL7jlBHW3lgM8oSmCtAPX11hRRY/qTs7
	S2GMzquag1fyzbx4+4UH8h9Y0Q1uBArZ4E8HnhAbY2tymGgbP8AoaAeII4nVCGv0afy+FgAFjN1
	Ne94ZUmZjZv33wsCcDkEX0pF1tcjqFWksKv6m3w9XZnD2c2yjV/SQ0DVStMz2RXxik1oZTeseSl
	jYCHPZxBFe7ERcyaotRbvvWvNw=
X-Received: by 2002:a17:907:c08c:b0:c12:3f6:f624 with SMTP id a640c23a62f3a-c1205ec5923mr64446866b.35.1782371431337;
        Thu, 25 Jun 2026 00:10:31 -0700 (PDT)
Received: from arch-piotr.tailb7ebba.ts.net (226.55.classcom.pl. [195.150.55.226])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c11fbe05f9csm114464966b.31.2026.06.25.00.10.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 00:10:30 -0700 (PDT)
From: Piotr Zarycki <piotr.zarycki@gmail.com>
To: kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Cc: seanjc@google.com,
	vkuznets@redhat.com,
	shuah@kernel.org,
	linux-kernel@vger.kernel.org,
	Piotr Zarycki <piotr.zarycki@gmail.com>
Subject: [PATCH v3] selftests: add swap() macro to kselftest.h
Date: Thu, 25 Jun 2026 09:09:14 +0200
Message-ID: <20260625070914.2175124-1-piotr.zarycki@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260528154003.3594107-1-piotr.zarycki@gmail.com>
References: <20260528154003.3594107-1-piotr.zarycki@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add swap() to tools/testing/selftests/kselftest.h with an #ifndef guard.

Guard the local swap() definition in mm/uffd-stress.c with #ifndef to
prevent a redefinition warning.

Use swap() in hyperv_tlb_flush.c to replace the open-coded PTE swap and
remove the TODO comment.

Signed-off-by: Piotr Zarycki <piotr.zarycki@gmail.com>
---
Changes in v3:
- Add #ifndef guard to mm/uffd-stress.c to fix a redefinition warning;
  uffd-stress.c defines its own swap() without a guard, which conflicts
  when kselftest.h is included first via uffd-common.h.

Changes in v2:
- Move swap() from tools/include/linux/kernel.h to kselftest.h; kernel.h
  breaks perf (swap is used there as a function pointer call).

 tools/testing/selftests/kselftest.h                | 4 ++++
 tools/testing/selftests/kvm/x86/hyperv_tlb_flush.c | 6 +-----
 tools/testing/selftests/mm/uffd-stress.c           | 2 ++
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/kselftest.h b/tools/testing/selftests/kselftest.h
index 60838b61a2da..7f53751523d8 100644
--- a/tools/testing/selftests/kselftest.h
+++ b/tools/testing/selftests/kselftest.h
@@ -64,6 +64,10 @@
 #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]))
 #endif
 
+#ifndef swap
+#define swap(a, b)  do { typeof(a) __tmp = (a); (a) = (b); (b) = __tmp; } while (0)
+#endif
+
 #if defined(__i386__) || defined(__x86_64__) /* arch */
 /*
  * gcc cpuid.h provides __cpuid_count() since v4.4.
diff --git a/tools/testing/selftests/kvm/x86/hyperv_tlb_flush.c b/tools/testing/selftests/kvm/x86/hyperv_tlb_flush.c
index 15ee8b7bfc11..514d41f00714 100644
--- a/tools/testing/selftests/kvm/x86/hyperv_tlb_flush.c
+++ b/tools/testing/selftests/kvm/x86/hyperv_tlb_flush.c
@@ -131,14 +131,10 @@ static void set_expected_val(void *addr, u64 val, int vcpu_id)
 
 /*
  * Update PTEs swapping two test pages.
- * TODO: use swap()/xchg() when these are provided.
  */
 static void swap_two_test_pages(gpa_t pte_gva1, gpa_t pte_gva2)
 {
-	u64 tmp = *(u64 *)pte_gva1;
-
-	*(u64 *)pte_gva1 = *(u64 *)pte_gva2;
-	*(u64 *)pte_gva2 = tmp;
+	swap(*(u64 *)pte_gva1, *(u64 *)pte_gva2);
 }
 
 /*
diff --git a/tools/testing/selftests/mm/uffd-stress.c b/tools/testing/selftests/mm/uffd-stress.c
index 700fbaa18d44..802046e905dd 100644
--- a/tools/testing/selftests/mm/uffd-stress.c
+++ b/tools/testing/selftests/mm/uffd-stress.c
@@ -56,8 +56,10 @@ static uffd_global_test_opts_t *gopts;
 static char *zeropage;
 pthread_attr_t attr;
 
+#ifndef swap
 #define swap(a, b) \
 	do { __auto_type __tmp = (a); (a) = (b); (b) = __tmp; } while (0)
+#endif
 
 const char *examples =
 	"# Run anonymous memory test on 100MiB region with 99999 bounces:\n"
-- 
2.54.0

