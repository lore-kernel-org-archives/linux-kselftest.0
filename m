Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB6B93B6C1D;
	Thu,  2 Apr 2026 23:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775174391; cv=none; b=PI+aqEuuEBT4SjhyTQ6NEkN6sO9p9rF5UxhyOda5ilhHBwl6Wni5+Iuqczfp9oeyOMPQ4fcUzffPVE55+ChCekMLl7XZygXN283XFoicg6UvGW/tnE/q+7MyapDl1T2MwkX4dlCyQrJ14oboKZlj+3s4+VD1m9OKu72ULo8tFBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775174391; c=relaxed/simple;
	bh=Z0epq685YK9aw011fJkTOzjs7AOX+98uISA4LTq2gds=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=halyS/D2rlVwaGz//YGqArm7Jyi4wU32izLv+9Pp6L6ol7cg4A7BZ7G+HrvPhFJZvC+sdHRSbl2zhlTachiotMsxbKF0X0Wh0nsUmXtPg+QblkO/pg/uCEMemd2+j9MlyOtT/YWYThCFhVBwtBnto1SBzKKnrbUjeh3uekeWkXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=d7iVicLi; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="d7iVicLi"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 632FBp0I2879374;
	Thu, 2 Apr 2026 23:59:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2025-04-25; bh=KgAgI6QiIGv+4vwAVEjIV77rTVYiL
	2wkbzExgyHD95U=; b=d7iVicLiRl6O85ptCNGJYVRkUrzi34eMKS6EcHxOp9z1g
	Vq8WmWwDqRsciZ9xn4/TzAUYm40jvtYACN+8KCe4s7ODg01TfBK0GH2j2g+pxVup
	kfL/+r6mynVjxv6rCBwws/vH895XZBemZM8BtmweDV3c9Ib6zE14MHpavvXL0V2j
	A6y7cquNt6Qt9qyY75WOKma9qaD7pD3sAS1pf4K6nzbKnBVH3Ve/xpr/mRC/jQyQ
	cJOWKL5tMbfaxN9XKDXMoFK2j9APa5SyGTbBg7z/bfIBYfyI4m04376xstGYX1Ia
	x8F7RwNMKcQhGjQW8M7fd4HmpNZcEE3HBlz+LxKZg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4d65s11dxv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 02 Apr 2026 23:59:38 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 632KoxLO008476;
	Thu, 2 Apr 2026 23:59:38 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4d65ekna7s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 02 Apr 2026 23:59:37 +0000
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 632Nxb6N011992;
	Thu, 2 Apr 2026 23:59:37 GMT
Received: from localhost.localdomain (ca-dev60.us.oracle.com [10.129.136.27])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 4d65ekna7a-1;
	Thu, 02 Apr 2026 23:59:37 +0000
From: Anthony Yznaga <anthony.yznaga@oracle.com>
To: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org,
        Liam.Howlett@oracle.com, vbabka@kernel.org, rppt@kernel.org,
        surenb@google.com, mhocko@suse.com, jannh@google.com, pfalcato@suse.de,
        Jason@zx2c4.com, shuah@kernel.org
Subject: [PATCH v2 0/2] fix MAP_DROPPABLE not supported errno
Date: Thu,  2 Apr 2026 16:59:31 -0700
Message-ID: <20260402235933.10588-1-anthony.yznaga@oracle.com>
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
 definitions=2026-04-02_04,2026-04-02_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxlogscore=896 mlxscore=0
 phishscore=0 adultscore=0 malwarescore=0 suspectscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2603050001
 definitions=main-2604020214
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDIxNCBTYWx0ZWRfX8YZMLSTNr/lS
 jy4LXzezIKxk0PHM0M50iSwy02pVt0pphOez1gepZoeQVrghTS0L1/PCe7nNDRms/sbET7YhKHQ
 8zhkmC2RTgBsGzLxmRdSRMkObjwJUTiaXMTY/cF8Xm1sPJby1I0po0rfNZ3fgX/N3xTFZ8r8DiU
 hIAd65G7mf8DCoSXJhb+BUl+ZbHtIhRB5YJpNwW/F5N3/d7gwNkwAO8jeImvYI5pbuH+986t6O0
 P1hgRJrPKh0OA7muKD9flYei9Zv/h8ueFqqK+nYMqXSkTse+99B1EdqQZl2eEmqQQCzF8xtF64L
 Ceju3OC0CyepgB2vf9417GjTUO3qjhvNYwaAJ6OprmAraor4ry0Ywjc1W2/FdAha3l06WeJvWZm
 AX680frjPD7Rn+EplRo8wSxn/Lb9zEP3CqIIEUgxueBRv6+yC4fjHXRnSPZ8qX5nj7LhYiHlcZO
 7ZIlcl9SSz7J1fujHCeSLvEpF8DfYixvne6sqmSc=
X-Proofpoint-ORIG-GUID: 857CPNq1TVNNUZDOJnyMECOquKgSaTXY
X-Authority-Analysis: v=2.4 cv=BvOQAIX5 c=1 sm=1 tr=0 ts=69cf02ea b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=o5oIOnhZENCTenyL_yNV:22 a=hZgukN1trT8sADp7EUgA:9 cc=ntf awl=host:12291
X-Proofpoint-GUID: 857CPNq1TVNNUZDOJnyMECOquKgSaTXY

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

v2:
- Remove unnecessary mlock() call from selftest (DavidH)
- Change tests to not exit on failure (DavidH)

Anthony Yznaga (2):
  mm: fix mmap errno value when MAP_DROPPABLE is not supported
  selftests/mm: verify droppable mappings cannot be locked

 mm/mmap.c                                 |  2 +-
 tools/testing/selftests/mm/mlock2-tests.c | 87 ++++++++++++++++++++---
 2 files changed, 79 insertions(+), 10 deletions(-)

-- 
2.47.3

