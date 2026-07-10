Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16EF8350A05;
	Fri, 10 Jul 2026 08:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783672513; cv=none; b=bxD6N8dCq/D62lWnob5qyOx987WKTi/zEpDLPVkoAFyKHiwKTOJimEGiAIGxwqegel82jHDPYYDTu4jXhFZp1x64w/8QKvqmsUDRTohVeHhYQ2U+D+JfdW7otbH7vfHxf50NaZQBVHJp8L8BG1smQ8gbh04IVsyP1kN3AJtcw1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783672513; c=relaxed/simple;
	bh=C3jLoWoDpxJvhWJj7BZrLEPqM5nerIKFOCG7gY0n3hI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bqPUtoojt1jirNcIhCdkw36OQUYAp16MkUM2DFNbzCVJCaA4LGODl75Yr3HKeHK9SoWX4vIfv1Sfbjfe/G9CJ79KeaycgkgWjQh2yNcf8GTbE9y8l/98a/Ww16X8X3w7VobCec3sW1hsCMbBYEVw/MNMJZ7jBh+ia2E6S8qD/uM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 3e0eb9f07c3a11f1aa26b74ffac11d73-20260710
X-CTIC-Tags:
	HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NO_NAME, HR_CTE_8B, HR_CTT_MISS
	HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_DIGIT_LEN, HR_FROM_NAME
	HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM, HR_SJ_PHRASE
	HR_SJ_PHRASE_LEN, HR_SJ_WS, HR_TO_COUNT, HR_TO_DOMAIN_COUNT, HR_TO_NO_NAME
	IP_TRUSTED, SRC_TRUSTED, DN_TRUSTED, SA_EXISTED, SN_EXISTED
	SPF_NOPASS, DKIM_NOPASS, DMARC_NOPASS, CIE_GOOD, CIE_GOOD_SPF
	GTI_FG_BS, GTI_RG_INFO, GTI_C_BU, AMN_GOOD, ABX_MISS_RDNS
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:f0233f9b-95a1-482a-90f9-063bcf7ed8d3,IP:15,
	URL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:40
X-CID-INFO: VERSION:1.3.12,REQID:f0233f9b-95a1-482a-90f9-063bcf7ed8d3,IP:15,UR
	L:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:40
X-CID-META: VersionHash:e7bac3a,CLOUDID:5de69ee60ec680715c7c2eb1ed7a0def,BulkI
	D:2607101628011KXKZEOR,BulkQuantity:1,Recheck:0,SF:17|19|38|66|78|102|127|
	850|865|898,TC:nil,Content:0|15|50,EDM:5,IP:-2,URL:0,File:nil,RT:nil,Bulk:
	40,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BR
	E:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 3e0eb9f07c3a11f1aa26b74ffac11d73-20260710
X-User: wangyan01@kylinos.cn
Received: from localhost.localdomain [(116.128.244.171)] by mailgw.kylinos.cn
	(envelope-from <wangyan01@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 75572566; Fri, 10 Jul 2026 16:35:01 +0800
From: Wang Yan <wangyan01@kylinos.cn>
To: shuah@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr
Cc: geomatsi@gmail.com,
	andybnac@gmail.com,
	andrew.jones@oss.qualcomm.com,
	wangyan01@kylinos.cn,
	thecharlesjenkins@gmail.com,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] selftests/riscv: ptrace: Fix memory leak of regset_data in vector tests
Date: Fri, 10 Jul 2026 16:34:37 +0800
Message-Id: <20260710083437.489648-1-wangyan01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The regset_data buffer allocated with calloc() in the parent process
of several vector ptrace tests is never freed before returning,
causing memory leaks in:

- ptrace_v_not_enabled
- ptrace_v_early_debug
- ptrace_v_syscall_clobbering
- v_csr_invalid/ptrace_v_invalid_values
- v_csr_valid/ptrace_v_valid_values

Add free(regset_data) before kill(pid, SIGKILL) to release the
allocated buffer.

Signed-off-by: Wang Yan <wangyan01@kylinos.cn>
---
 .../testing/selftests/riscv/vector/validate_v_ptrace.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/riscv/vector/validate_v_ptrace.c b/tools/testing/selftests/riscv/vector/validate_v_ptrace.c
index b038e2175c80..a388b7963d47 100644
--- a/tools/testing/selftests/riscv/vector/validate_v_ptrace.c
+++ b/tools/testing/selftests/riscv/vector/validate_v_ptrace.c
@@ -75,7 +75,7 @@ TEST(ptrace_v_not_enabled)
 		ASSERT_EQ(-1, ret);
 
 		/* cleanup */
-
+		free(regset_data);
 		ASSERT_EQ(0, kill(pid, SIGKILL));
 	}
 }
@@ -207,7 +207,7 @@ TEST(ptrace_v_early_debug)
 		EXPECT_EQ(vl_csr, regset_data->vl);
 
 		/* cleanup */
-
+		free(regset_data);
 		ASSERT_EQ(0, kill(pid, SIGKILL));
 	}
 }
@@ -331,7 +331,7 @@ TEST(ptrace_v_syscall_clobbering)
 		EXPECT_EQ(0UL, regset_data->vl);
 
 		/* cleanup */
-
+		free(regset_data);
 		ASSERT_EQ(0, kill(pid, SIGKILL));
 	}
 }
@@ -649,7 +649,7 @@ TEST_F(v_csr_invalid, ptrace_v_invalid_values)
 		ASSERT_EQ(ret, -1);
 
 		/* cleanup */
-
+		free(regset_data);
 		ASSERT_EQ(0, kill(pid, SIGKILL));
 	}
 }
@@ -911,7 +911,7 @@ TEST_F(v_csr_valid, ptrace_v_valid_values)
 		EXPECT_EQ(regset_data->vlenb, vlenb);
 
 		/* cleanup */
-
+		free(regset_data);
 		ASSERT_EQ(0, kill(pid, SIGKILL));
 	}
 }
-- 
2.25.1

