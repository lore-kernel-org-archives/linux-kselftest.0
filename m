Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D732D1E1A17;
	Thu,  2 Apr 2026 00:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775090075; cv=none; b=bfllDql+ez6iDfwuIZ85Ks25sk9gipOR/Jbtlju2ndoBhJcWQBQqq6hkkPKTI1E19pcJXcDVEv7i0d8qz6Rtoqq3SqC/2J2w4SXPcNSmOXjI5A63D70xdds/+SE4EDedFQhpoTAXfH2uxK4bJ9ahoThXu7T3Qg+5z4SbTpYZDaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775090075; c=relaxed/simple;
	bh=Scfb+Bj7xWQPNe4QSBymDXSg0vODAVDt0vihZcuLVWQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=P7bphE+Htf92YxuRpySfm0y1PkqHqG7p+DI0vpChdb9N+Zn6Wc8y6qyCzDn+SXeVNzsn8oNfcKbJrdzzIU1f1YTCWjx+kkJx00EIr7ntQ0MlZ1mYDYcoF+N/1UdvHuC6Tc2TjaGQj7QrmY91dhva0x/p8Aubk54OUMHPWoKn9kY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=eK0GXqB2; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="eK0GXqB2"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 631LE8ic049616;
	Thu, 2 Apr 2026 00:34:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2025-04-25; bh=Mw8BZbGPDp+o6t2OXcBTx9ulTVd8V
	rHHY7fUKmtfPEc=; b=eK0GXqB2pU7dQ+R55WHh8uW4pkUQbNof1tpHPtWh1NfF0
	1yPmDCpHcyTRtqyEM1dS8AAvpp9CnN5omAC0seTWBMnYOVH+gK4P3ga63XgN8Lya
	MzSFK54qvZiFOe2zk44kRLgc9PTy7URf//7KkWoxQBielGBcUmNOTiwGfJ23dI8Z
	jwc1cZAEpoSgJlpPZ/+7aVh7PuN0UuurqCvm+HaEY8XbV8BDl99/mzVGmc6R5HCC
	0YXMRk50afzeGfBz5WMpgxl1NjtIifhNW2hgW+YPApXJZVXzALe6P7nNr0Mhhjvz
	aqOoqRRLco9Q9wQZuqwpf80ro7yQSuuG3kUnQ7fLA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4d66v5qjte-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 02 Apr 2026 00:34:21 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 6320JaBZ026329;
	Thu, 2 Apr 2026 00:34:20 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4d65ec2223-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 02 Apr 2026 00:34:20 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 6320YJ7c001596;
	Thu, 2 Apr 2026 00:34:19 GMT
Received: from localhost.localdomain (ca-dev60.us.oracle.com [10.129.136.27])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 4d65ec221n-1;
	Thu, 02 Apr 2026 00:34:19 +0000
From: Anthony Yznaga <anthony.yznaga@oracle.com>
To: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org,
        Liam.Howlett@oracle.com, vbabka@kernel.org, rppt@kernel.org,
        surenb@google.com, mhocko@suse.com, jannh@google.com, pfalcato@suse.de,
        Jason@zx2c4.com, shuah@kernel.org
Subject: [PATCH 0/2] fix MAP_DROPPABLE not supported errno
Date: Wed,  1 Apr 2026 17:34:15 -0700
Message-ID: <20260402003417.438037-1-anthony.yznaga@oracle.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_05,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 spamscore=0
 malwarescore=0 mlxlogscore=926 phishscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2603050001
 definitions=main-2604020003
X-Proofpoint-GUID: F2q5Z0BXn0bsY7LaLl0nEIip6PR_OIFh
X-Authority-Analysis: v=2.4 cv=G7cR0tk5 c=1 sm=1 tr=0 ts=69cdb98d b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=EIcjfB9IiI4px24ztqRk:22 a=hZgukN1trT8sADp7EUgA:9
X-Proofpoint-ORIG-GUID: F2q5Z0BXn0bsY7LaLl0nEIip6PR_OIFh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDAwMyBTYWx0ZWRfXwGCW3ggZHWJH
 JnGKm+BjYe9u5HJss9jUyoF/s3O++Jo4cT84Y/KC1aHqMHOJZRehf++noY1iFiEtmWAvTl8pSNs
 XlFIRzxVHpiO71GWejzeJ0Qz8Ci6ganxySMojaGBa2l6JGSlH8zbSxtyOq+63tAAeJKasDm9VMp
 OQDCwU6FOwHkdakJaoCKmHj0MrsGEb5XO6/DWzZ4NUNvXMhS05b2y+KzL/o5GbkYlwAzjxl9h2D
 v6O+Rt/hpIhc+4iQbfxYFnOJpAuLeDl+tFGUZtq1KNEsw59jVlqZWhm1Hlm6NdY5WKO1mErOJlC
 l4oCp7vY7B6ROdeMSJ4eX4cMhnQDr7869EeflQYUGbbhQz24zP2LdHCZAP3JsIYQ5YqQUZjXf3H
 IZzTP1n5xHVoRnKTeaq1uo0o8C1w9UmReViRido00O8ko395ctF5+hPeQsVMTaJoMM9b+hvgrCH
 yDT1me9vDkmMlowgNOw==

Mark Brown reported seeing a regression in -next on 32 bit arm with the
mlock selftests. Before exiting and marking the tests failed, the following
message was logged after an attempt to create a MAP_DROPPABLE mapping:

Bail out! mmap error: Unknown error 524

It turns out error 524 is ENOTSUPP which is an error that userspace is not
supposed to see, but it indicates in this instance that MAP_DROPPABLE is
not supported.

The first patch changes the errno returned to EOPNOTSUPP. The second patch
is a second version of a prior patch to introduce selftests to verify
locking behavior with droppable mappings with the additonal change to skip
the tests when MAP_DROPPABLE is not supported.

Anthony Yznaga (2):
  mm: fix mmap errno value when MAP_DROPPABLE is not supported
  selftests/mm: verify droppable mappings cannot be locked

 mm/mmap.c                                 |  2 +-
 tools/testing/selftests/mm/mlock2-tests.c | 91 ++++++++++++++++++++---
 2 files changed, 83 insertions(+), 10 deletions(-)

-- 
2.47.3

