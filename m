Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D455F42BE90
	for <linux-kselftest@vger.kernel.org>; Thu, 16 Jul 2026 15:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784214734; cv=none; b=unMeF5DMAhAffiS1H7FJdFDyAUMEM0Cqh6KV1zbEr8DNUFvf/stixomWgstfiHx0i3puUA4R1LXwFoSZeq1jgg0zQD+d5PbDr3LDmTyg/fqylLbKckVx6Z8i80KRjJFTZTlghw7wlpsjod3zsSEc1MgWC+n7mpG4+YX65qmK/Yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784214734; c=relaxed/simple;
	bh=GLp+juEsDrHE2elzXTCgtE3pWsJmhXsNM8FsKwMAwIg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kWHW62N+IfWUqAYrGiVUs6jS7PpTGisqYbObKSg3UqxRZNveE7em0wAmfQpwekfErzgeTTEyiH9KSxeIHqGQ14KusuwzivV84MkvBF3Zy0EUmBaamrRCzpkvlZrnwhxQsTIU8rF/nCX6rFa1wYULyqzwVVsMJvEERaFRGhxmckM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dHpSh/pZ; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dHpSh/pZ"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c160420289bso941390566b.0
        for <linux-kselftest@vger.kernel.org>; Thu, 16 Jul 2026 08:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784214731; x=1784819531; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gG+g7cvO60t9OK2852iCKFbaTdC0A88G603w2VBtTG4=;
        b=dHpSh/pZNB8atMItYiZo+fDpuf1ZirdSMwAg403dTdmvn+AnqNlPZ8H/w4ekneM8xY
         c/sTs4xyR9BgvXdhyLcPk0h4GlnEK5AOkmIhI52684XFeHTZsjRag8LhvL9/LGsueKPg
         ntKjoPaaIZ3kpUfBu3xNLHmp7GD82m+DixW59YRqDdnQlW9FkWyY/yxvcZEU3wH0Aeiq
         q4c55i+IpS6EL1kEz7XoksEn2WYfsJRnri0xhAipJpfDXKpcrdsFtBu5iHxER0t0ahHV
         QZgfcwGoH/KK8FXUH8d2HWTguZqqQkJXeYwvEO7/UgllCjb5Fd0Yucjtc/jh1D0EBTTC
         a2dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784214731; x=1784819531;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gG+g7cvO60t9OK2852iCKFbaTdC0A88G603w2VBtTG4=;
        b=N5+bQmYX4jlpu7cIxZmJZWlMJMJ7XAfEEjAJMCqvo5P4+UFv+bNQK26qzHKt9Jkl+w
         nnWcmPHobF09YNN6kg0dXI4FYc7Biey/1upLO+EVBfln8IcpeatEqMeHbvUAapMxuJcl
         IO0/qQeXJtyDvulwfaaP6brEOm32F9a8uuBCJOnNjYw3QQ9kiSj/IqVcBh9bhkx3rhBu
         TjgZTbDnKmfz6pBpZ78r96t82bM3b/hug8rJ5WSsX8g6BL3I25Fnbu4djI56dLg6STTU
         vouRuC+HS1fQ3TqkXlDW/nr4KO/8uKnSBvnXHFhUEcXCoy+jlXm4x6iEJ4/7wYRVR8OM
         y0dA==
X-Forwarded-Encrypted: i=1; AHgh+RoW09ObOicV/ROR0CYtTTBBjcT18u1yYIOvX3B2TFvCphZ33YWW4pLILPZAdeeGp0m5i3/5wwECp3l7tHtEuR8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5QX/Sj1cR0rw6T/LFXebZzylWR18bjNe7diJ31oAYHXBo6NFP
	4U1KynTug2r0AC6RCgjuAZOlTLBSFd8gQsKVXFUwQWIL1Xzz2+CXtRzwV5e9dMvuFTQ=
X-Gm-Gg: AfdE7cmI/AG6hQqPhbG6LbwgnDOaT7MJmtN60fddONXoo1MEcGEXx1vT1g9luf2owt3
	F5XN5oNmmILRYAPZZK/hH6GJ1Lxwu6+aS9GtC50hAgsq6oqV/j7q05CGf2dYEMIBTxsLKMgp2fe
	H91WioKjq9jMlA7APR1+pektOLtbc9h0FSLcSnfceV5tNVcN1k0YmPExPP2HlP8TkgAMnVZxCxi
	gWbkCSIbjHq2oBQGtwUPt1lYleeme4vbmpo/a3bAzOplLkbOqcGnFAthI7DjPGwK6IE5qCmPbVu
	MOAhbqa+h1yhcfhV7jZuxiPH9SNj9NJnepnG6KshDCNkYbvg+vwE5EM7BwV7HqpGNNDss6eW/0T
	AjUUFUUyUJy+AEGUS0BM+MGzEA6ZkEPBFk/yRT/KJn8bvunHhWm+2ZckYNiV4ar/hp5E4iFH4rL
	BMtcbrv8w30mNpEOK4Nu0PqgV7xjXY9pbsl25Toqtv3GZK8ByKaJTgj9ov8m6cT7siMF29Dn7mz
	ZkEGQ==
X-Received: by 2002:a17:907:3f12:b0:c16:13c3:b1ef with SMTP id a640c23a62f3a-c1667a0cd22mr638712366b.24.1784214730734;
        Thu, 16 Jul 2026 08:12:10 -0700 (PDT)
Received: from arch-piotr.tailb7ebba.ts.net (226.55.classcom.pl. [195.150.55.226])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c16871262casm236607466b.6.2026.07.16.08.12.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 08:12:10 -0700 (PDT)
From: Piotr Zarycki <piotr.zarycki@gmail.com>
To: kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Cc: seanjc@google.com,
	vkuznets@redhat.com,
	shuah@kernel.org,
	linux-kernel@vger.kernel.org,
	Piotr Zarycki <piotr.zarycki@gmail.com>
Subject: [PATCH v4] selftests: add swap() macro to kselftest.h
Date: Thu, 16 Jul 2026 17:11:51 +0200
Message-ID: <20260716151151.697403-1-piotr.zarycki@gmail.com>
X-Mailer: git-send-email 2.55.0
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

Remove the local swap() definition from mm/uffd-stress.c; kselftest.h is
already included via uffd-common.h, so the local definition is redundant.

Use swap() in hyperv_tlb_flush.c to replace the open-coded PTE swap and
remove the TODO comment.

Signed-off-by: Piotr Zarycki <piotr.zarycki@gmail.com>
---
Changes in v4:
- Drop uffd-stress.c's local swap() entirely instead of guarding it;
  kselftest.h is already included via uffd-common.h.

Changes in v3:
- Add #ifndef guard to mm/uffd-stress.c to fix a redefinition warning;
  uffd-stress.c defines its own swap() without a guard, which conflicts
  when kselftest.h is included first via uffd-common.h.

Changes in v2:
- Move swap() from tools/include/linux/kernel.h to kselftest.h; kernel.h
  breaks perf (swap is used there as a function pointer call).

 tools/testing/selftests/kselftest.h                | 4 ++++
 tools/testing/selftests/kvm/x86/hyperv_tlb_flush.c | 6 +-----
 tools/testing/selftests/mm/uffd-stress.c           | 2 --
 3 files changed, 5 insertions(+), 7 deletions(-)

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
index 700fbaa18d44..3a85a29203f4 100644
--- a/tools/testing/selftests/mm/uffd-stress.c
+++ b/tools/testing/selftests/mm/uffd-stress.c
@@ -56,8 +56,6 @@ static uffd_global_test_opts_t *gopts;
 static char *zeropage;
 pthread_attr_t attr;
 
-#define swap(a, b) \
-	do { __auto_type __tmp = (a); (a) = (b); (b) = __tmp; } while (0)
 
 const char *examples =
 	"# Run anonymous memory test on 100MiB region with 99999 bounces:\n"
-- 
2.55.0

