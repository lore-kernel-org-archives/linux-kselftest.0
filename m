Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EFC9343D66
	for <linux-kselftest@vger.kernel.org>; Fri, 10 Jul 2026 22:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783720830; cv=none; b=OTxTzn7dUjsHGjQNWUBzRZPW+51rgy5qEYZBaWMTLIhFq9kiOWaT0J3y1sN2k3bPCXiDyIlLcE6YwR7maS2OrnI2dU02jpkSt9IE/z2WqZYCnKZAXSdof7QaCwg/J8Bp82pkeiJ4egU8oxdHWLRniwEV/yYy7EM58Nh1eJc8FGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783720830; c=relaxed/simple;
	bh=5WOvC4H9afAoUd5DGqnX5rK76DxmtuZA7BOIKcTO27Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=G3H2ubZGaTgiwmuGcCgtlmthd8fiJd5coqqdoGwonVUzO8HtKfsFmY2AK8r5vf0i0i1s6s5SVm8Zc70PB3WJOwmq27z1G8X9Jpxd6R2mpwKMv3DqtwUJAdFcb9ZVOgnGzb38KMjv2KTVM0BUuhjGrIcQuyYJJyAtOdJ5Fx+QhS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iJSJ1Z5t; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=LJm99t6t; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iJSJ1Z5t";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="LJm99t6t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783720827;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=rqZJPkrdLYhNi9RVztXsXiCAhUfQzBe3lcC9pyvgpk8=;
	b=iJSJ1Z5tvQTxhPrIoBDRE/aUTwUTs8sXC/ymTsVD/K6luuAv73yvjC4RS1WAB0A7slseVx
	oCU6FlWoJxZVpxhpY6TNoRHgkD5QSi9AcpjmgcHpYJ+Yh9eOJ+C3/igCbkVI0O0cKK2zl2
	mmrW6Y1bsE5lSG1evnXciqjoaJOhADU=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-79-G8-pQ1P-OQ6fW2mvmkPu5g-1; Fri, 10 Jul 2026 18:00:26 -0400
X-MC-Unique: G8-pQ1P-OQ6fW2mvmkPu5g-1
X-Mimecast-MFC-AGG-ID: G8-pQ1P-OQ6fW2mvmkPu5g_1783720825
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c0e702df8so14122951cf.2
        for <linux-kselftest@vger.kernel.org>; Fri, 10 Jul 2026 15:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1783720825; x=1784325625; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rqZJPkrdLYhNi9RVztXsXiCAhUfQzBe3lcC9pyvgpk8=;
        b=LJm99t6t+wF5KHxEmJ/Dah+RLXj1h4r1mmKX7rqtGUqgJd57li61rjWfJqLtZkMOJU
         hiZwAsdQCP9UcsuVhkiFkcacbpXdZAmClguV8l3dN7D+WdzD6a/30lr/7TsA9crlykxa
         lhd89bSwrtzFAlPHIxdvCvD+xsfeBuvzpUTvXoAZYRhWwHJ0TndycVnfu1BX6GXfvNPd
         bzmFdrpBoHjgAA0PALoz0it1UuvH2y7bNcOfmFdDuoCB/7zM4XUk9jcihinxfQq+LIKW
         FJKnaOQAN4q7im/AI/NIQtAoP4KkBexbwNuaBT4A1RpKaatTZSW79Pr3YWqDg2tfE1nn
         Mw3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783720825; x=1784325625;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rqZJPkrdLYhNi9RVztXsXiCAhUfQzBe3lcC9pyvgpk8=;
        b=buRQAMrR5ig+dHXZx50EDh0Wnwfq9CebPciH+LODOnLz2h2joENlHS2qcPcuo+Yhg8
         m5iVOuTY8nhRpiVJwcsEM8fu/TrBmbGizH4fS6QbxWRMWHvx90nz7BnN/wyVgtm8P+ms
         T4ZC1BkbYB1i93P1s2wyrfNrKp0Wq495DI0mNAJgPx5vp0QucalCat5knrTYKEOEqxdV
         mjYCr+2yElDV1tJ0n2SYI8qbMSej2JAa6S6Z0qSee7eQ2zejZk1TUhx30qei0tq2dOsk
         SGnH5PAiP2e/rRNc+uujSWA3QZvdAfTOQ7LbRLjOHKgv6GevhOkZOpxdN6Neg6nSTkYG
         xB4A==
X-Forwarded-Encrypted: i=1; AHgh+Rp6cakAhl7vJwVq+JvWcQrdrsDqXwscPouorUMHsEMPwj6HNB7toM3cHH/ZooiOaLpoyrIjaMjwJFx2H0ZbG2o=@vger.kernel.org
X-Gm-Message-State: AOJu0YxV4dM/jwLA3kiI7e851CwHFJ3uFJb2M8uLf/FhwrcG96ASdDyc
	PZ38iRTsVq00gJ0K5/8PnUsQEbswiTgYC57porN67JC5DyFDgN2q1hBsH30AgUwiL8ACEI60Sm/
	h6Cl1Z94T9Y1G2v2qXGKTIGLvYAnsjM++o4ZvpayJpQMHqD5HeJugGdB1vPThizLGVo0XTEbRuU
	SvMg==
X-Gm-Gg: AfdE7cluBVs4XAC089JYnKQsEpPW5FfTDMqL3vpMDF77nnfanB25j0wx/tObXaQivkz
	T+ozZRzuV+7cSVy3xMTxGg5kNKHZSIG4kYG6JYrTUJGBUqeSJKydtA6noUm+dR7PAKvKfV0F94w
	HAZYMIm1B9aXPmXa4PZfj/MvG3Ic2kFj7gBi2OomDha9Mlpnq+I2FqdRI4mo/ZyPqZ8uMlAzHPu
	bgQJVpImsKTazlXGpTa8/cPxcjVCHAQgHXsy5exDjUiCKv1uU0MpGEPHFuF4z8AQeLhNTLqu3Yx
	iL8pvxx9PV4zrGxEJHpuiFTTvvfDHijy4xdwDla9gkvrdLjyOoNluuLZFp6yOpIwgkFhIQlkTZN
	VBeKe9hzfmazal+bGSF5DSvCA4xDdxY9N74XA
X-Received: by 2002:a05:622a:34a:b0:51c:7bd:2c6f with SMTP id d75a77b69052e-51cbf046dbcmr8384571cf.8.1783720825312;
        Fri, 10 Jul 2026 15:00:25 -0700 (PDT)
X-Received: by 2002:a05:622a:34a:b0:51c:7bd:2c6f with SMTP id d75a77b69052e-51cbf046dbcmr8384051cf.8.1783720824805;
        Fri, 10 Jul 2026 15:00:24 -0700 (PDT)
Received: from sbertram-thinkpadp1gen5.bos.com ([67.189.222.97])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ffd5bbac2asm51922246d6.21.2026.07.10.15.00.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 15:00:24 -0700 (PDT)
From: Stephen Bertram <sbertram@redhat.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Stephen Bertram <sbertram@redhat.com>,
	linux-kselftest@vger.kernel.org
Subject: [PATCH] kselftest/arm64/pauth: Scale exec_changed_keys on KSFT_MACHINE_SLOW
Date: Fri, 10 Jul 2026 17:59:59 -0400
Message-ID: <20260710220018.719573-1-sbertram@redhat.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

exec_changed_keys performs a fork+exec per PAC_COLLISION_ATTEMPTS
iteration. After raising the default to 1000, the test exceeds the
30s kselftest harness timeout on debug kernels. Use a reduced
iteration count when KSFT_MACHINE_SLOW=yes, consistent with other
kselftests slow-machine handling.

Signed-off-by: Stephen Bertram <sbertram@redhat.com>
---
 tools/testing/selftests/arm64/pauth/pac.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/arm64/pauth/pac.c b/tools/testing/selftests/arm64/pauth/pac.c
index f4b859c75a5a..fb9a1e9f8491 100644
--- a/tools/testing/selftests/arm64/pauth/pac.c
+++ b/tools/testing/selftests/arm64/pauth/pac.c
@@ -14,6 +14,8 @@
 #include "helper.h"
 
 #define PAC_COLLISION_ATTEMPTS 1000
+/* exec_changed_keys is fork+exec heavy; scale down on slow machines. */
+#define PAC_SLOW_MACHINE_COLLISION_ATTEMPTS 250
 /*
  * The kernel sets TBID by default. So bits 55 and above should remain
  * untouched no matter what.
@@ -36,6 +38,16 @@ do { \
 		SKIP(return, "Generic PAUTH not enabled");	\
 } while (0)
 
+static inline int pac_collision_attempts(void)
+{
+	const char *slow = getenv("KSFT_MACHINE_SLOW");
+
+	if (slow && !strcmp(slow, "yes"))
+		return PAC_SLOW_MACHINE_COLLISION_ATTEMPTS;
+
+	return PAC_COLLISION_ATTEMPTS;
+}
+
 void sign_specific(struct signatures *sign, size_t val)
 {
 	sign->keyia = keyia_sign(val);
@@ -301,6 +313,7 @@ TEST(exec_changed_keys)
 	int ret;
 	int same = 10;
 	int nkeys = NKEYS;
+	int attempts = pac_collision_attempts();
 	unsigned long hwcaps = getauxval(AT_HWCAP);
 
 	/* generic and data key instructions are not in NOP space. This prevents a SIGILL */
@@ -309,8 +322,7 @@ TEST(exec_changed_keys)
 		TH_LOG("WARNING: Generic PAUTH not enabled. Skipping generic key checks");
 		nkeys = NKEYS - 1;
 	}
-
-	for (int i = 0; i < PAC_COLLISION_ATTEMPTS; i++) {
+	for (int i = 0; i < attempts; i++) {
 		ret = exec_sign_all(&new_keys, i);
 		ASSERT_EQ(0, ret) TH_LOG("failed to run worker");
 
-- 
2.54.0

