Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1D5A29DB9A;
	Fri,  6 Mar 2026 18:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772821066; cv=none; b=I7jZJ7y2LQXYqQGVRtlDciVPov/zyeQSntok2g3ZiYKeJc6BNdHXVSMLhLkshOn0DvR5foPw6dfZk4tnUu0acMukmkePcLbXadyOihrhZO4NMqeQWrUhMTqQNtIj13caDtIkuXT2iCZyeHoCLF4bZmqz9fUbGUNIgDYJWD/4GK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772821066; c=relaxed/simple;
	bh=CjBVHyzR9fHsdnb581zQ4Fu5bvkO7Ru56ezXawB6POk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UspH6z8oCv3dx/t2XTgeUJEzPqoeMap2H2Uesw+lmQy53w09g9aO+9+4WlDuSbpmnCI36kg37uKd6R6zmgIM92Niu6pLD6+EgMxjMNIEeFMn+LzAGLx8ABE/GqyflFsFq4hT0cSqJqRfno2uKGg09s26vZgGY8773zW9jnfz21c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Jb+P+e5Q; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Jb+P+e5Q"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626I3TuN1521799;
	Fri, 6 Mar 2026 18:17:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2025-04-25; bh=a/oRUYWcSJtAJGGmBk2fDl7ql51Mp
	tzuHCKbavwl+2E=; b=Jb+P+e5QPsUUn+PcFcsAakPNMYTgZY83+HdH96HeE8cXJ
	ndjIx/2wtP7E8RRStyIh04CP/SD/c7cWLyfo9j07U/bfDuLQnqi7la5uDFU+/oje
	F2UWWW7N2L0QZtjSLXfbBxNAfDf1duWef0EfRdZ3/QhlLFwQVtmybLIsarz+eeCi
	Yqi9H0wzRCzm1ht8kwvKVx/jCPMP16lpZaIHJu/eh2meEkLUetfoJk92q73xH2q0
	y3Qdni7q9MRRkVAUQr4dB8kIbossI/mG+/Qf2fKNOakhJVHyY7Dtrf3v5cxSdFWx
	BbDcaIET/2rFldgohl4bICJMhvCJ+vbwFykbaa81g==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4cr3vbr0r6-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 06 Mar 2026 18:17:36 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 626Gt41q021359;
	Fri, 6 Mar 2026 18:09:01 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4ckptess22-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 06 Mar 2026 18:09:01 +0000
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 626I1lOn031624;
	Fri, 6 Mar 2026 18:09:00 GMT
Received: from ca-dev110.us.oracle.com (ca-dev110.us.oracle.com [10.129.136.45])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 4ckptess15-1;
	Fri, 06 Mar 2026 18:09:00 +0000
From: Alok Tiwari <alok.a.tiwari@oracle.com>
To: kuba@kernel.org, davem@davemloft.net, edumazet@google.com,
        pabeni@redhat.com, horms@kernel.org, shuah@kernel.org,
        netdev@vger.kernel.org, linux-kselftest@vger.kernel.org
Cc: alok.a.tiwarilinux@gmail.com, alok.a.tiwari@oracle.com
Subject: [PATCH net-next] selftests: fib_tests: fix link-local retrieval in fib6_nexthop()
Date: Fri,  6 Mar 2026 10:08:19 -0800
Message-ID: <20260306180830.2329477-1-alok.a.tiwari@oracle.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=854 bulkscore=0 mlxscore=0
 malwarescore=0 spamscore=0 suspectscore=0 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2602130000
 definitions=main-2603060171
X-Authority-Analysis: v=2.4 cv=Jpn8bc4C c=1 sm=1 tr=0 ts=69ab1a40 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=BqU2WV_vvsyTyxaotp0D:22 a=yPCof4ZbAAAA:8 a=u9kQJRMvwuPXqKQrNZ8A:9
X-Proofpoint-GUID: ozr22xpL5gDfEabSdlN-njjdFhJ10SQe
X-Proofpoint-ORIG-GUID: ozr22xpL5gDfEabSdlN-njjdFhJ10SQe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE3MiBTYWx0ZWRfX5JyeFdJI75xO
 LX21cwEMZyWGNbWBxZA2Wqe0a9XfrbEJOeLFf4zu+j5jWk55AJK2QxM6ZUdw/jM9+FfLYO6QwX6
 cBmzT7MmzbVnF5B9RzkxGENhwtWpEjuvrmvZbo6quGaBQWA2i/SSZbf/GAeR0vxuLsXHRRqBn9X
 dRA92lOcYkJTuPgyD70fYnI3EmSjcF1p3gN6Rr8zCGYXS11nB8LvEhO9zwrKymFkRxSOxmk9G9Y
 0kEvJplHnk9vBOCnYbNsTazVdDa8lFGx6SyiEahNWGvJB9uV2wpix+PXAPJXdYpak4KU7PxwSGs
 WkCzpkBO/586mBSuqTXDflQO3g90/gd7wRUIjVUPT2CYVV2IsvFSdpM+x2ouFZOrNKq3jt+fKVo
 /fscc7bnvtftS9h74qvxGJNLovQYGtiGFFcvZLVGtYE6v+Q9sZi9VpYEv1o4zVWRx/7q/07BzCp
 H88NizSiyuoVe18GKGA==

fib6_nexthop() retrieves the link-local address for two interfaces used
in the test. However, both lldummy and llv1 are obtained from dummy0.

llv1 is expected to be retrieved from veth1, which is the interface used
later in the test. The subsequent check and error message also expect
the address to be retrieved from veth1.

Fix this by retrieving llv1 from veth1.

Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>
---
Targeting net-next since this is a selftest-only fix/correctness
cleanup and not a fix for a user-visible regression.
---
 tools/testing/selftests/net/fib_tests.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/net/fib_tests.sh b/tools/testing/selftests/net/fib_tests.sh
index c5694cc4ddd2..439461080c60 100755
--- a/tools/testing/selftests/net/fib_tests.sh
+++ b/tools/testing/selftests/net/fib_tests.sh
@@ -545,7 +545,7 @@ fib4_nexthop()
 fib6_nexthop()
 {
 	local lldummy=$(get_linklocal dummy0)
-	local llv1=$(get_linklocal dummy0)
+	local llv1=$(get_linklocal veth1)
 
 	if [ -z "$lldummy" ]; then
 		echo "Failed to get linklocal address for dummy0"
-- 
2.50.1

