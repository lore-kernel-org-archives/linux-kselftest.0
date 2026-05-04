Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0726635C193;
	Mon,  4 May 2026 09:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777885885; cv=none; b=Nk0GmNbQepMkOfYdOhY+fFKwYLqCPAuXGV3rCoPL7iKILj5S+AVNzS0bvntH+q1q3r3jlDkEwkLO7W+q7amQk4oHkV6wPtXGSFpkr5A4pl4pZ+MMfDUPjapOh7u1U0m//Y+SKVT9TOm6Eu1KsFnW5rz/CBb5fjLJ/O6LE62L2N0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777885885; c=relaxed/simple;
	bh=6HinYdwc0G5BYqDhm+RGvNLMsG/4tC5p2U7NJfJQ4Xo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ShRzfcO1FMbc02e8kXqJbIKddieufz3KTp/RYy/Xas91UcFQz1kh9b48b9v4nbVdgF3swrVrXWEuDhhjTPORx/PiXQT8b55ZvWrYUuTPKYT8bVWkppVtuPBhg1NBZ0xrZHMuafKGMry2+cRijRBWm4Pzkr7GNp+WGJJ3zRlPKxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=hKX1mZwB; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="hKX1mZwB"
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6441cdh23828299;
	Mon, 4 May 2026 09:11:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=cIQ8K2HJtwQlSMozF
	shA6AnsK+LYu4W5byOwdQkFz7o=; b=hKX1mZwBKEg5A0ExFkDzhwzoSVYdN2UFU
	664ZtZlz773uh2jNpNdNgXtvVZBQAuj2Ge7o26FLuSTqM302v7fVhRADNyoq3UyR
	tA2StNtcEo+XM8uEtbZA+smrZ2yAf6U8Bnt13mUdSRG9IM+wve9/WnwD3pM4gndi
	N/0/FvUMUlJVmeeNlM909U2xh3pRrFbVws72Sn8h5qjRVLMAWe/8XvKnEZxYcyDk
	1d5pgPvGbvAtEWXcXGT0lHyRWtz2Dhl4ykhbesjUYzQ2Do3lrdXivSASYq2h5kNs
	/oJfzN3c7+kRC6DJnEFL7jNlKf9Vd2RV9PGrhW8BYhuQGd2Pg/dhA==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4dw9xxe20b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 May 2026 09:11:17 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 64499Sxc005944;
	Mon, 4 May 2026 09:11:17 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4dww3gvcqc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 May 2026 09:11:17 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6449BDPE47841598
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 4 May 2026 09:11:13 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3B9EA2004D;
	Mon,  4 May 2026 09:11:13 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AE09420040;
	Mon,  4 May 2026 09:11:11 +0000 (GMT)
Received: from aboo.bl1-in.ibm.com (unknown [9.123.14.187])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  4 May 2026 09:11:11 +0000 (GMT)
From: Aboorva Devarajan <aboorvad@linux.ibm.com>
To: Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>,
        linux-mm@kvack.org, linux-kselftest@vger.kernel.org
Cc: Sayali Patil <sayalip@linux.ibm.com>, linux-kernel@vger.kernel.org,
        Aboorva Devarajan <aboorvad@linux.ibm.com>
Subject: [PATCH 1/3] selftests/mm: allow PUD-level entries in compound testcase of hmm tests
Date: Mon,  4 May 2026 14:41:06 +0530
Message-ID: <b754427130272dfe0e468cef73a9b92d22ec0ab0.1777870179.git.aboorvad@linux.ibm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1777870179.git.aboorvad@linux.ibm.com>
References: <cover.1777870179.git.aboorvad@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDA5NyBTYWx0ZWRfX2OTKEwUdMLi/
 ntGJYwlcp8C1ZyrhHAxE5H89GTwk7NKGtr0nohDG9mGLpvMJgjB2xJaerwrO5DwPT4MHmR2pf5K
 Sg9MkFfuoVvEXQdnc9rklJ7mE0GBO+bMcvKIOB54VIaEbcUOKo3FujSQpdBrGuEIaBdPJufFqwV
 Z/CiWs8s5X7/brmNoeT++Ytc2yn1xvBhKLjK+g4vFutzDlutNL9rMi5txFegCKxUpHkFkWGrxmk
 ZvM5L4Hf5K3WCs/pojwhhYCJohaDIpJq9+DA97XZTl0wmdwNxBfRplaHXJdYWEYAcl1SyoMa9Us
 CzsAbyRl5E2IS6iyY4FkKIVn9dJoI4TKiJ3//GSA+oM92wnyCrxjrdx8fA+Ebvem5rzH2kordjg
 jcN7Mn96Z8qBIFNPthXeIphXMfy61DVfwEX4+5ZI2I8dYLa2NCFQ3mdWt9vArWMbOmCxrDnLq9A
 th+c+SBH98yol+CAKkQ==
X-Proofpoint-ORIG-GUID: wcx_EMfXyr1ZDFrb0a5UjKobkgA1YPmS
X-Proofpoint-GUID: wcx_EMfXyr1ZDFrb0a5UjKobkgA1YPmS
X-Authority-Analysis: v=2.4 cv=ctWrVV4i c=1 sm=1 tr=0 ts=69f862b5 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=V8glGbnc2Ofi9Qvn3v5h:22 a=VnNF1IyMAAAA:8 a=QxgUL920Qp7ezWAymYEA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1011
 suspectscore=0 impostorscore=0 spamscore=0 malwarescore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605040097

From: Sayali Patil <sayalip@linux.ibm.com>

The HMM compound testcase currently assume only PMD-level
mappings and fail on systems when default_hugepagesz=1G is set.
Extend the checks to accept PUD-level protections as well,
avoiding false failures.

Fixes: e478425bec93 ("mm/hmm: add tests for hmm_pfn_to_map_order()")
Signed-off-by: Sayali Patil <sayalip@linux.ibm.com>
Signed-off-by: Aboorva Devarajan <aboorvad@linux.ibm.com>
---
 tools/testing/selftests/mm/hmm-tests.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/mm/hmm-tests.c b/tools/testing/selftests/mm/hmm-tests.c
index 77fb4c5d871b..6dc839866dfe 100644
--- a/tools/testing/selftests/mm/hmm-tests.c
+++ b/tools/testing/selftests/mm/hmm-tests.c
@@ -1599,8 +1599,8 @@ TEST_F(hmm2, snapshot)
 }
 
 /*
- * Test the hmm_range_fault() HMM_PFN_PMD flag for large pages that
- * should be mapped by a large page table entry.
+ * Test the hmm_range_fault() handling of large pages (PMD or PUD)
+ * that should be mapped by a large page table entry.
  */
 TEST_F(hmm, compound)
 {
@@ -1649,8 +1649,8 @@ TEST_F(hmm, compound)
 	/* Check what the device saw. */
 	m = buffer->mirror;
 	for (i = 0; i < npages; ++i)
-		ASSERT_EQ(m[i], HMM_DMIRROR_PROT_WRITE |
-				HMM_DMIRROR_PROT_PMD);
+		ASSERT_TRUE((m[i] == (HMM_DMIRROR_PROT_WRITE | HMM_DMIRROR_PROT_PMD)) ||
+			    (m[i] == (HMM_DMIRROR_PROT_WRITE | HMM_DMIRROR_PROT_PUD)));
 
 	/* Make the region read-only. */
 	ret = mprotect(buffer->ptr, size, PROT_READ);
@@ -1664,8 +1664,8 @@ TEST_F(hmm, compound)
 	/* Check what the device saw. */
 	m = buffer->mirror;
 	for (i = 0; i < npages; ++i)
-		ASSERT_EQ(m[i], HMM_DMIRROR_PROT_READ |
-				HMM_DMIRROR_PROT_PMD);
+		ASSERT_TRUE((m[i] == (HMM_DMIRROR_PROT_READ | HMM_DMIRROR_PROT_PMD)) ||
+			    (m[i] == (HMM_DMIRROR_PROT_READ | HMM_DMIRROR_PROT_PUD)));
 
 	munmap(buffer->ptr, buffer->size);
 	buffer->ptr = NULL;
-- 
2.54.0

