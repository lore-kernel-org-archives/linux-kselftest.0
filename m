Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 792C633AD8B;
	Mon,  1 Jun 2026 06:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780294436; cv=none; b=IpB5zy7P6hQCv6dXAAt1Z14RogyvLvAnItprXj/hI5eVEGX2QALbVHqteT8CD3n+0uTauBXfvHte8WtzcLKDgLepfRLXZSBDk00iedsWFVKdqKb2aC5KNFXCMooeDdosng44H/IU69ecXjaE6J+7f17OrPChGr0+sMqxwLts3FU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780294436; c=relaxed/simple;
	bh=fd6B8sCD+3sNAl5Sq4HJx95VGGp4u0nfYAEMqd9qNOA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XYKLGdTwQKp9kHNKYGIVABbkHbXNqcNFKEJF9ulOoHH7LbKdfoY7LzzyTCK1u1KGRORaAUX1KjVGbHnxOpfY58r8Dm0qnyqZuT0lC02YWVUVQCuP0RMJ2YiqGvL45hK+G+dRN+2s6e5g1p13zoImeSAu45blpdoPrN1U4POhGvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=sOVjxsXZ; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="sOVjxsXZ"
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64VBj1LM3166613;
	Mon, 1 Jun 2026 06:13:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=LEuzo96EvcBe1L0RHV2X4G4DgTPw2E1t0irsEQ+uW
	os=; b=sOVjxsXZuocv+p4kc4pW6WMbIZHxFdwQJR2UfAD1dg87iyOoF/fB7V/8e
	VnC1DshEeAb+bzbxSWexG4dr980AbpoB+PV2x+jR8t8q6EILEw9kng9g6gybOCUe
	p3HIpxTKfC1V478FwqF48TyNGsC5Fo2/roBk24iuI6NpnJO7c3Xp9UKeo8vHHOlu
	xEotAfc2Vu4hDflK7BQMXfWK+nGnK398ibanwxDU28F0IW/u8STcIAaOUK5NEuPU
	AivwG1Jg+DfNRTGGvoQJ4jtAl3YJH6PCAd5HoHI35hh0mRW2/sk4GGa9Jcbv0udv
	7xTcmlWc1U6IpyGsWVGnzf792veAA==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4efpady01u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 01 Jun 2026 06:13:27 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 651698ov029749;
	Mon, 1 Jun 2026 06:13:26 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4egcwy4cnr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 01 Jun 2026 06:13:26 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6516DOGW55574824
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 1 Jun 2026 06:13:24 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7040720043;
	Mon,  1 Jun 2026 06:13:24 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9AE1D20040;
	Mon,  1 Jun 2026 06:13:18 +0000 (GMT)
Received: from li-49acbccc-2994-11b2-a85c-d51b89e344f1.ibm.com.com (unknown [9.39.21.19])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  1 Jun 2026 06:13:18 +0000 (GMT)
From: Pavithra <pavrampu@linux.ibm.com>
To: shuah@kernel.org, akpm@linux-foundation.org
Cc: linux-kselftest@vger.kernel.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        pavrampu@linux.ibm.com, ritesh.list@gmail.com, david@kernel.org,
        ziy@nvidia.com, mhocko@kernel.org, osalvador@suse.de,
        lorenzo.stoakes@oracle.com, dev.jain@arm.com, Liam.Howlett@oracle.com,
        linmiaohe@huawei.com
Subject: [PATCH] selftests/mm/run_vmtests.sh: Fix protection_keys binary name in run_vmtests.sh
Date: Mon,  1 Jun 2026 11:43:14 +0530
Message-ID: <20260601061314.898388-1-pavrampu@linux.ibm.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=Zt3d7d7G c=1 sm=1 tr=0 ts=6a1d2307 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=V8glGbnc2Ofi9Qvn3v5h:22 a=VnNF1IyMAAAA:8 a=lXLsEBLhcoI0ZpkwZQYA:9
X-Proofpoint-GUID: OJlNuBd6hlFxsohbUEUIL_9AtncMoPCx
X-Proofpoint-ORIG-GUID: IXp5ZTHGnG6UIm2hLhoaz_lg1eQqAP9u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDA1OSBTYWx0ZWRfX9Ds9qcgBDGWA
 hRTe60PVQV517Xv9rEEGUrpEdQjlgJZyoQ4qW6i14EDul8DyLuOxpvtbzW1OtFun+aI8cFA1/eh
 7Y/Ffovc1/qRRqByhvnOsQos503Qspo19qYBf+ifvsoCBi/M0aRzL2VLpJQi1hZt3u0v2pGFgrY
 wIdnKyLwtFUMf+eyfgxeuuMohWTLJmRkShjUQeF8vK/sXW29pkxBUcz2htTCWPY9Ke7gaLDnusX
 k2vQFF/u+4YrLHXRrIoKQRiEIkxk867bR80aat6+tE+nNz5sbb8/F9qKbVFjxQ59toYBaEYOl2s
 WWTJtQ/O0J3JMBum6PlOwBtARNeSSyGJo03Tkwe+bsRZ7lPjxjHHtZP/VWc7nVwqLqbWZqn7k9y
 yxHB67e+23uZeFcdeuZW+49C4GCzNFJB9oylsaajw+NlVId3X59It011j0geiiDm2aR0XLqFHEg
 P5yxlEhbw7/u2FlSebg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 bulkscore=0 clxscore=1011
 phishscore=0 spamscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010059

we have protection_keys_32 and protection_keys_64 tests mentioned in
run_vmtests.sh but the binary name is protection_keys with current
kernel, adding the correct binary name.

Signed-off-by: Pavithra <pavrampu@linux.ibm.com>
---
 tools/testing/selftests/mm/run_vmtests.sh | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/tools/testing/selftests/mm/run_vmtests.sh b/tools/testing/selftests/mm/run_vmtests.sh
index 043aa3ed2596..a6b6f397d942 100755
--- a/tools/testing/selftests/mm/run_vmtests.sh
+++ b/tools/testing/selftests/mm/run_vmtests.sh
@@ -344,14 +344,9 @@ CATEGORY="ksm_numa" run_test ./ksm_tests -N -m 0
 CATEGORY="ksm" run_test ./ksm_functional_tests
 
 # protection_keys tests
-if [ -x ./protection_keys_32 ]
+if [ -x ./protection_keys ]
 then
-	CATEGORY="pkey" run_test ./protection_keys_32
-fi
-
-if [ -x ./protection_keys_64 ]
-then
-	CATEGORY="pkey" run_test ./protection_keys_64
+	CATEGORY="pkey" run_test ./protection_keys
 fi
 
 if [ -x ./soft-dirty ]
-- 
2.54.0

