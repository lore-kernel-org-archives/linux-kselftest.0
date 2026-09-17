Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 503F04BB295;
	Thu, 17 Sep 2026 09:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789639056; cv=none; b=mm+0j0OHLDWAixnsZHO8+mf45yj4b38F6IH76ExQo9Wm1BNII7hjeXosdpDiU+F6BiRIAuLKMIsIHy2XLxNrzmXZ6EqjnIxknEoEMEcRTO4bVONPJx75W3gX8InYZLr6B8y8pAKos8pAiv4A87g4cLY1hPMelNVmBaX1iyfLOe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789639056; c=relaxed/simple;
	bh=FAsssfLMGkwSNAPbPzbQEG9zdxT0RYlR68aFGyuLz14=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XO1Sckx4n7y3bWVlVTwNS2cGBzm5ISKU5SgkkQnmeENaEVVwsh6NVx5CZK+SOVvLQn8ECenawWvTBSLDZegT3IDauz2QrojQ/lz2Xgpzaz6JhpXIGPB5kjQUyLPpVyF+xBRRFuFJEXhTIiAMgwanduor/5Q4cnhwXUA9EVKk6RM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=pueb4EYl; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="pueb4EYl"
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H621Th1716417;
	Thu, 17 Sep 2026 09:57:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=DiOZEtwxuCpwIExuWBZEe7Ztzh42CDAzkWy0L8wmU
	gg=; b=pueb4EYlvBTWVuIonjR3pCZ38wkdQaLCKwiS/4eeBu05iFDeEEQ92VzVP
	LGue15mGmGXuJA6G+rL+LV51J3inAcpB7P56/SX1fsqLZ8yXgx+LzZhObtHe2V8h
	0FyEH0LdCm8obpHnIpAq4U7COVu+9c393usptdZx8vkqw06AUhblzq6RhInSh5Nw
	E2gBYWbJ4w2D0j1bQYWQHgGo6HWYm9nbI1ycI62llvPZzg2L5sPLhfsUKv05vaem
	ftde1V8BcNw/pVvURFUs0zAGcAhaaS0zTvH1AhUJZ194RqM4gNvNfwx9Hdh5IYIV
	nYhHzHuGapJIjYZbiIlB7Fo5rv7XA==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4gmxf59n2d-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 17 Sep 2026 09:57:21 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9aLWo2879606;
	Thu, 17 Sep 2026 09:57:21 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4gra3f8vcv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Sep 2026 09:57:20 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 68H9vIAF48366074
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 17 Sep 2026 09:57:19 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D9E7B20040;
	Thu, 17 Sep 2026 09:57:18 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 88D0F20043;
	Thu, 17 Sep 2026 09:57:17 +0000 (GMT)
Received: from macbookpro.bl1-in.ibm.com (unknown [9.123.4.160])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 17 Sep 2026 09:57:17 +0000 (GMT)
From: Disha Goel <disgoel@linux.ibm.com>
To: shuah@kernel.org
Cc: aleksa@amutable.com, brauner@kernel.org, linux-kselftest@vger.kernel.org,
        linux-kernel@vger.kernel.org, Disha Goel <disgoel@linux.ibm.com>
Subject: [PATCH 1/2] selftests/filesystems/openat2: fix O_LARGEFILE definitions for non-arm64 architectures
Date: Thu, 17 Sep 2026 15:27:05 +0530
Message-ID: <20260917095707.16986-1-disgoel@linux.ibm.com>
X-Mailer: git-send-email 2.45.1
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: o7fMyLegHouPWTSpCWxsC2uRRq3uak7E
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDEzMCBTYWx0ZWRfX56D5x6CmINzE
 HXI4ZC738bvMyLZ03h1kXDMBediVM7BTxyd47ECXxW1rXQt/YP02JTxQsgpWJ/+Vc8JPG1d6rex
 2Wm96T6VS4h9AlaNnxc9mGF7SZ/vpGY=
X-Authority-Analysis: v=2.4 cv=cvgOAF4i c=1 sm=1 tr=0 ts=6aabb982 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=U7nrCbtTmkRpXpFmAIza:22 a=VnNF1IyMAAAA:8 a=WGwT2ls776tvMD3njmUA:9
X-Proofpoint-ORIG-GUID: o7fMyLegHouPWTSpCWxsC2uRRq3uak7E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDEzMCBTYWx0ZWRfX3LJVPuV1BweS
 WZGy/R7qmcbWOE/w5tZgwGw9zScpbyjKoJDZypsliZ39wctfnkkejEGvt3n7CrGH3CtZGd9BrK5
 kIw935r2xNN2L5hBaifiaOIaNua8mGIXReNH8qoAwVzA2ibr/wgEXFpKWH4MsPnKLSuLA5omV2P
 hxvP/sVjlAoZWW9TOZCdnTeK21YkHVv6p+duR5DUp/1IcikZROjkz1PpN3s1H8UylKbdOeuYAE7
 7AiVVytsn7TJIhRlskfM9k3lVtvWq5dUjSQCodTqJVgf4IHspHYshg554PgZmSZep3MKLykyrTl
 jxYdAgwG/+vbI5r0bILVStBeJhAUYpJ4ShAeXnNXgyrWYB0UoEP4ywzNJHwOdl7ezFGFRzI7lsr
 eJrQyJ87imL3GuX9rvzNjktwVtCpBsnUEx79knCm+SV/H7hGVuJFcowHivjSTPmsWD/mfoNjsvV
 SaaJp3ooAPBk5HqWY/w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_01,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170130

The openat2_test.c code previously hardcoded O_LARGEFILE to 0x8000 on
all architectures other than arm64 (aarch64).

However, on several architectures this value is different. For example,
on PowerPC (including ppc64le), O_LARGEFILE is defined as 0x10000,
whereas 0x8000 is actually O_NOFOLLOW.

This mismatch caused the flag_validation test case to pass
O_PATH | O_NOFOLLOW instead of O_PATH | O_LARGEFILE. Since
O_PATH | O_NOFOLLOW is a valid and compatible flag combination, the
kernel successfully opened the file instead of failing with -EINVAL,
causing a false test failure on PowerPC.

Fix this by introducing proper architecture-specific definitions for
O_LARGEFILE matching their respective UAPI asm/fcntl.h values.

Signed-off-by: Disha Goel <disgoel@linux.ibm.com>
---
 .../selftests/filesystems/openat2/openat2_test.c       | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/filesystems/openat2/openat2_test.c b/tools/testing/selftests/filesystems/openat2/openat2_test.c
index 6f5afbe2d8d3..e08c94ce0530 100644
--- a/tools/testing/selftests/filesystems/openat2/openat2_test.c
+++ b/tools/testing/selftests/filesystems/openat2/openat2_test.c
@@ -23,8 +23,16 @@
  * XXX: This is wrong on {mips, parisc, powerpc, sparc}.
  */
 #undef	O_LARGEFILE
-#ifdef __aarch64__
+#if defined(__aarch64__) || defined(__alpha__)
 #define	O_LARGEFILE 0x20000
+#elif defined(__powerpc__) || defined(__ppc__)
+#define	O_LARGEFILE 0x10000
+#elif defined(__sparc__)
+#define O_LARGEFILE 0x40000
+#elif defined(__mips__)
+#define O_LARGEFILE 0x2000
+#elif defined(__parisc__)
+#define O_LARGEFILE 0x800
 #else
 #define	O_LARGEFILE 0x8000
 #endif
-- 
2.45.1

