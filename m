Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 330694B827C;
	Thu, 17 Sep 2026 09:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789639062; cv=none; b=rxR5KTMtk9Qvt+zYNts0URCtAeaBmXiXgIY9nEfI3GNVgsx/ja6zZIlj826DuqlWHE6HUwFXLPhyhV1W168BjJk5LsbXUJ9oAWoQIP+aR8oyOQUh6lIODrur9cgMstplVIQIurxpQDEl/cxKj0rKtutxv4FXsz3i5I2z571eMns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789639062; c=relaxed/simple;
	bh=W9VInFWfHJ1XGB2yYhn25XeNksxV2OPdhQhdcbbyo/M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JtAkYbsloaH0bhGgNSh0B/o2qUMH1EDHSJvQPg873FdUTCOQusDnm7CWQYc2X9JLM3mEOB7f9bXaiFDVIssHuELPMhuyCBZEG93EJTwPXNBROCwMT22yrfvQUy2v+iFYV/9FLidiGlotzbFQxz3mpPXIowSgkuFFKPR3vbSC+6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=m958vitI; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="m958vitI"
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H61pq01702161;
	Thu, 17 Sep 2026 09:57:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=W2iePlNc6GFUu8t3C
	cBBIvifGp+CqSllLE43DxxDs6w=; b=m958vitIPod2m6COK9lfkG+/aKkzcopiJ
	eNeOPQSugndslQfL3MdwpHlxjS9328RXbds6vZjOAsBiulZwbr+jwcunT4fHDMfb
	jGxa/yfoop2CZM7EfCMrPnevpV9/5n+ePdKoK7LJyZcH7j5x8flWCaI8yfBmuS/1
	tyEvVT5pazorm2ZrXzWVrVyDAQJ+K8xTYGQKW7XFDyjHlgFFjInJzjKQtcYXAphs
	xnkI9p59iNGq2685VHFMxT/+UHgNO/ZZR+BbCE/idSGVPInfDUKu8WHSa90ucf67
	Z6/7Ssv1T7DYkmGjuLJEnkIxlZbLZKYeyQksa7b//HXg2CZs4fTlg==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4gmx841n6k-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 17 Sep 2026 09:57:26 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9aeqT2962580;
	Thu, 17 Sep 2026 09:57:25 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4gra3yrv9w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Sep 2026 09:57:25 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 68H9vNU749414568
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 17 Sep 2026 09:57:23 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6F62E20043;
	Thu, 17 Sep 2026 09:57:23 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 204A220040;
	Thu, 17 Sep 2026 09:57:22 +0000 (GMT)
Received: from macbookpro.bl1-in.ibm.com (unknown [9.123.4.160])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 17 Sep 2026 09:57:21 +0000 (GMT)
From: Disha Goel <disgoel@linux.ibm.com>
To: shuah@kernel.org
Cc: aleksa@amutable.com, brauner@kernel.org, linux-kselftest@vger.kernel.org,
        linux-kernel@vger.kernel.org, Disha Goel <disgoel@linux.ibm.com>
Subject: [PATCH 2/2] selftests/filesystems/openat2: make /tmp a mountpoint inside private namespace
Date: Thu, 17 Sep 2026 15:27:06 +0530
Message-ID: <20260917095707.16986-2-disgoel@linux.ibm.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20260917095707.16986-1-disgoel@linux.ibm.com>
References: <20260917095707.16986-1-disgoel@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDEzMCBTYWx0ZWRfX8egkVOx0bQw2
 cJxP9RD9tb8Vo+fOdscaTx1ARPyXNUgOGxVDEZQiBAkryxpDSZNtNd+0vcd8xGiHYR2Sb/2y5Ku
 yISrBfwT9TwhMgLp7N8fL/ApI1wbZ+l9YbU4pcyCaLLubv4J3v+u/2hM295LnJUv5tXl242UTXg
 Nxo0zSOQl6sgxDj1oC25WKBZkfSJVoFnDjXdWa9iOBreRBah96H+Km3RtnbWrcy4doIJtBZOJCS
 UOSqam6HcODFrLfPVTTbRapqs2Y1f3gJYSC7yVMn2MwwIfC5mZQ+Dya7BIhZiWUATSBkU/6ofIN
 xlyTiyZjVLyHirvZknfcCN+fKWNjfxozddWyPJbRGitnzEgJ1gjGpC19j3CpCFyEw67r850zYvv
 d+/MTXn4a8/GjdikY9lrDHgfUEoNBYSIsDOzvXROi80kLhqfRvbfQMfV9UHzzCRMu16s3U60HP9
 SqPFJCfXeN86npH6QGw==
X-Proofpoint-ORIG-GUID: LnrmSBm4TCbWGYdEq_0G46-pvZzMkjyc
X-Proofpoint-GUID: LnrmSBm4TCbWGYdEq_0G46-pvZzMkjyc
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDEzMCBTYWx0ZWRfX08/PpQiVOPgw
 DRuKgkTIwlX0+08yhIGARzJJwnvJMgeHxo3ADjr5kLh6Qn1/RCbBf7hgXWzX7qYa1deECSqq8m5
 yPGf+lE2Urei8e1uxCtXmcTlaafTqYs=
X-Authority-Analysis: v=2.4 cv=cY9HPXDM c=1 sm=1 tr=0 ts=6aabb986 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=iQ6ETzBq9ecOQQE5vZCe:22 a=VnNF1IyMAAAA:8 a=pu_gu5paME9tjax7SNYA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_01,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 malwarescore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170130

In resolve_test.c, the test unshares the mount namespace and attempts to
make /tmp private via:
    mount("", "/tmp", "", MS_PRIVATE, "")

This fails with EINVAL on environments where /tmp is not already a
separate mount point (e.g. if /tmp is just a standard directory on the
root filesystem /). Furthermore, the resolve_no_xdev test relies on
crossing into /tmp to verify RESOLVE_NO_XDEV and trigger an -EXDEV
error. If /tmp is not a mount point, resolving /tmp never crosses a
mount boundary, leading to a test failure.

Fix this by:
1. Making the entire root directory recursively private (MS_PRIVATE |
   MS_REC) after unsharing the mount namespace.
2. Performing a self-bind-mount of /tmp on /tmp inside the isolated
   private mount namespace, which guarantees that /tmp is a separate
   mount point and that resolving /tmp will cross a mount boundary as
   expected by the test.

Signed-off-by: Disha Goel <disgoel@linux.ibm.com>
---
 tools/testing/selftests/filesystems/openat2/resolve_test.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/filesystems/openat2/resolve_test.c b/tools/testing/selftests/filesystems/openat2/resolve_test.c
index eacde59ce158..6216a8546388 100644
--- a/tools/testing/selftests/filesystems/openat2/resolve_test.c
+++ b/tools/testing/selftests/filesystems/openat2/resolve_test.c
@@ -140,9 +140,12 @@ FIXTURE_SETUP(openat2_resolve)
 	if (!openat2_supported)
 		SKIP(return, "openat2(2) not supported");
 
-	/* Unshare and make /tmp a new directory. */
+	/* Unshare and make the mount tree private. */
 	ASSERT_EQ(unshare(CLONE_NEWNS), 0);
-	ASSERT_EQ(mount("", "/tmp", "", MS_PRIVATE, ""), 0);
+	ASSERT_EQ(mount("", "/", "", MS_PRIVATE | MS_REC, ""), 0);
+
+	/* Ensure /tmp is a mountpoint for RESOLVE_NO_XDEV test crossing into /tmp. */
+	ASSERT_EQ(mount("/tmp", "/tmp", NULL, MS_BIND, NULL), 0);
 
 	/* Make the top-level directory. */
 	ASSERT_NE(mkdtemp(dirname), NULL);
-- 
2.45.1

