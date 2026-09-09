Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D672D24B7
	for <linux-kselftest@vger.kernel.org>; Wed,  9 Sep 2026 05:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788930596; cv=none; b=mqoeXNoQZlaGFWOfK5/udSi19Pxca6muA8a3XPDQeGJCAaM3BVdPUZPVfcOpJMrKBsy3ph1A5pNxYuZW2v7h/3nmLfSgN+XSDkqc1eeA68mYhYU+3h+PHOfNlkjCvSHQ3dRVNRegfQTE3AU+bP+JltPOmsfZ2Yeu566pteqUjMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788930596; c=relaxed/simple;
	bh=hlUvE91ZFR2WALzkmchAgQjKrNo/AzcUBRa3ZaQdio0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U0fx8BEiUYuzzPOrUBR/V5O9yMJ7+QZAHfabwmtpJWg72YhXJfBiQ3JsdNxhJLZYtNCZ70G4xXhuw4xKOGggpUebS1jCCLRmZLybL9ioeei/zOWH6aAe9DzKvgysMWTNPC5TXTrQL6uSeDqKySZSeh1DGVwvf7j8xYzi7+WpEgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=lCIZBBt1; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="lCIZBBt1"
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id AAFEE3F60F
	for <linux-kselftest@vger.kernel.org>; Wed,  9 Sep 2026 05:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1788930590;
	bh=j9TdbRSgBViFUc24m7gofNTrR9YA9kT863lpgmDnSEw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=lCIZBBt19kyVpWL+RKC06s8Sp9xRo4MM8pNH4NVyzcZ874xH/O7lGRgDmbK1r341G
	 Wrt5+AcKQsbJ4Esswnqq/iW7KyVARy1QCnPKtBF8wa86K+nDRcKZQNO9ZxlcoXlxae
	 YOmvXoKxlzS/gyovvtodH0ckAuOJ53h7j0PNq6KT/jaPwtnUKmkyXSaCrQ3x8G40o9
	 lCPLFriOWN4PctaSeZGpnqUtCbqtDhmo+ZaYneRUiteIsVSuWUd53b54EfX1DE5pZE
	 5jW1Hnm4rVRdl1yvCVbLjYLb0ZxtG3ZhjE8EF1TBk+NdLKuMxT1Qe+Dy1ANvoqQ0at
	 pdcdQfjoKM8cXbZ4mmrGsmojlAIzJLhjLUwYAIrbbwMujkiAFwTTTlv00vNcSQxWsB
	 dDkmLz5EB7GLAgTrrxGWZHilfTYB5J3Yye39/WQhfFzwjgQkOwgspRdJMMxmlWaWho
	 DSeYzzEPjbAD04kGy8IZ9WRc88ADJuYDyyo6mekSFxzBXIVhQUtnLkdraK9tok4l6J
	 GFw7wY1TIL3o4Z7lL8be67j6zHfIu1w749b54GnQS0CtAaRu+K9+xpQ4j1+udfagcN
	 JBYGcSaJYo3U0crr556kvBqX9bXYyZGGgz3zSYQDgOZBnlyhQINNVjIBiZFV06uY1/
	 mFuLvkol+GYlRgo0mZ1Q7Amg=
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39af92138f9so8321741a91.0
        for <linux-kselftest@vger.kernel.org>; Tue, 08 Sep 2026 22:09:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788930589; x=1789535389;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j9TdbRSgBViFUc24m7gofNTrR9YA9kT863lpgmDnSEw=;
        b=NlHR19OijwVJhRwN2qlk1PQ3RDlVHOrcSGu8etgG3rYujD/ABmLZHQH0vTKBgyFmDK
         d6McW6w/Q6UgwMnT7JsQs+fRVYBPix0RXtbRNRipNQvMXeUYmmupZPrNlDdqHY2dtvZq
         oGVSzqsZjO469JCgg85xzDSLns2fBFzuRj+0sYaM6t7myyCm+Cwi3T6BjBCx9goCOksk
         dCJGxbpBYy2Q+9bqqZOtLn9oZbf8URNGIdK9V44ctIJWYpsSMixNt5U6/oFspOOJd/0C
         naApfXUSjwYN3CFjcadyQYgmKpYgdGjVZSrFKz4pccqZiplB9MsRywIgINZnDIp4ARwp
         y25w==
X-Forwarded-Encrypted: i=1; AKwUvByhD3OYxlEBm9N9ErXn110tnyUUjNIef7+3zgJzInrNCcbNZOtmprhuALmnMy9ctlI5zH4OndJdm4Ld2xnc3Rc=@vger.kernel.org
X-Gm-Message-State: AFuF++kAxi69/sCA+aNGlrZNFPDhHdXb7JZ5GGvYie/1B2CrmQNyJHwL
	Lf4VeujGxXdagy5fOCrKHOsjhpoyJWmO6irV0yGb0e9dIlfOqFqUw6b2o5qNeFsfJMSVtHZeHM/
	l9pH7+X+hBKvi84CGgwc+xvu6BsnHGi1oUuu/pO58wNrmzPimny7Sn6p53Dzw+uWITUjWneDhiM
	sFpIxUrIG7Fg==
X-Gm-Gg: AYBFou3FngyQ7p6s0WayCu+wNeYPTom5SeMRuxZhL9IGTPrP/eY+11kaPxx/cufHF7r
	xt/Yk1w9Q01AMzyDyhVqbRc7YY7a+HwAYaOi9tmtJVI33sKqMsWAkTqb4g4esFL2/WBcFlfHsOi
	NU7FenGjbxNZRFiGCk4eTEKEFPjUwG8XQY50LqTG6FPWXFkzHqiiK4GpWST31S52hAJMOVySUTv
	Z4CUvGjVUc9HCHfHTi7eUKeQ+DPG/0w5yMFf2Xv1H5T+SejSohVBo5Rk/1eXb4tcJyeEC1iNCx1
	VgO9X6E21EdY7ueE7SxSHnyhljMLaaniWuhlQmaGmCbjEILdOqV2l6MjqXlaIdGCggtspEaNcKY
	/n/lf8B91aQ==
X-Received: by 2002:a17:90b:2709:b0:396:7c01:553f with SMTP id 98e67ed59e1d1-39b086533admr46734624a91.21.1788930589131;
        Tue, 08 Sep 2026 22:09:49 -0700 (PDT)
X-Received: by 2002:a17:90b:2709:b0:396:7c01:553f with SMTP id 98e67ed59e1d1-39b086533admr46734580a91.21.1788930588662;
        Tue, 08 Sep 2026 22:09:48 -0700 (PDT)
Received: from localhost.localdomain ([2001:67c:1560:8007::aac:c1a2])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14340a69666sm19069102c88.9.2026.09.08.22.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 22:09:48 -0700 (PDT)
From: Chris Chiu <chris.chiu@canonical.com>
To: maddy@linux.ibm.com,
	shuah@kernel.org
Cc: sshegde@linux.ibm.com,
	linuxppc-dev@lists.ozlabs.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chris Chiu <chris.chiu@canonical.com>
Subject: [PATCH] selftests/powerpc: Fix exec_prot test failure on Hash MMU
Date: Wed,  9 Sep 2026 13:09:19 +0800
Message-ID: <20260909050919.3344699-1-chris.chiu@canonical.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hash MMU maps execute-only pages as readable at the PTE level, so reading
from a PROT_EXEC-only mapping does not fault there. The exec_prot test
currently treats that as a failure, while the rest of the permission
checks are still valid.

Use the existing using_hash_mmu() helper and skip only the read-on-
execute-only subtest on Hash MMU. Keep the rest of the test unchanged so
the fix stays local to the unsupported execute-only-read expectation.

Signed-off-by: Chris Chiu <chris.chiu@canonical.com>
---
 .../testing/selftests/powerpc/mm/exec_prot.c  | 21 ++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/tools/testing/selftests/powerpc/mm/exec_prot.c b/tools/testing/selftests/powerpc/mm/exec_prot.c
index db75b2225de1..bd44f49d8449 100644
--- a/tools/testing/selftests/powerpc/mm/exec_prot.c
+++ b/tools/testing/selftests/powerpc/mm/exec_prot.c
@@ -108,11 +108,14 @@ static int check_exec_fault(int rights)
 static int test(void)
 {
 	struct sigaction segv_act, trap_act;
+	bool hash_mmu;
 	int i;
 
 	/* Skip the test if the CPU doesn't support Radix */
 	SKIP_IF(!have_hwcap2(PPC_FEATURE2_ARCH_3_00));
 
+	FAIL_IF(using_hash_mmu(&hash_mmu));
+
 	/* Check if pkeys are supported */
 	pkeys_supported = pkeys_unsupported() == 0;
 
@@ -167,13 +170,17 @@ static int test(void)
 	 * Read an instruction word from the address when the page
 	 * is execute only. This should generate an access fault.
 	 */
-	fault_code = -1;
-	remaining_faults = 1;
-	printf("Testing read on --x, should fault...");
-	FAIL_IF(mprotect(insns, pgsize, PROT_EXEC) != 0);
-	i = *fault_addr;
-	FAIL_IF(remaining_faults != 0 || !is_fault_expected(fault_code));
-	printf("ok!\n");
+	if (!hash_mmu) {
+		fault_code = -1;
+		remaining_faults = 1;
+		printf("Testing read on --x, should fault...");
+		FAIL_IF(mprotect(insns, pgsize, PROT_EXEC) != 0);
+		i = *fault_addr;
+		FAIL_IF(remaining_faults != 0 || !is_fault_expected(fault_code));
+		printf("ok!\n");
+	} else {
+		printf("Testing read on --x, skipped on Hash MMU\n");
+	}
 
 	/*
 	 * Write an instruction word to the address when the page
-- 
2.43.0

