Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38FBC37DE8D;
	Thu,  2 Apr 2026 23:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775174391; cv=none; b=Xmm61XIjaugdV8Y6pFAfbga1+Vq/pu8XmpKoBGKta1mMoYC8XUsZ2Jc/fI2Pjq6DdiphjxR42wNjdnAr/AmAPJQYL7Xa8x3AaZbh/80jsUeu6Rz0gR4FIHtiw8jh956LvP22y7HD4RTs0ze8/yChW6ijMAi+ITosB4gqxuYpAT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775174391; c=relaxed/simple;
	bh=EkvjZohKYDPagbFIRvb4XzQ0yTb1IwYWOILb/TZnjLw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bFkawVVGaLJVkvLialF5Yn3YxXZkeiqBFHeKq++Oizs9dJT7PWCbGa+nPFGMD/oTUGZy6vKR92DSp8sPNmLg5wq6FGPB9FssYtRZwlLCnTdRcsISg79vfSfLPCv4Ff7TA/uoJAwGdzqY1r+CflwKQg6kdMP5QFiu7p1sN0NTpCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=VGx/hmjN; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="VGx/hmjN"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 632Nt1Kx3408690;
	Thu, 2 Apr 2026 23:59:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=xA8W7
	NxanxiabjHJTYARfF4A16zee7Z1/qp/qvyps04=; b=VGx/hmjNvfUBEB5pHm7f8
	DjQYIEjdZRkly9Ur3xM1DrIrEanNLdKZ6zlDWoVRSYevRMIdAOoyfCTw/6JbilSI
	4B/pmHZUUy0YXISSOfLGVVeMT9CMdGufcksbmxmoB3ov7N26fRtMYy9GWGTl/h86
	BSPeQe+fEZtU6lQX1EqJ0NVGm2PmdnBRTH3UwxmlzHLQ2ZwV3Hkt/PtdcGuA5gBw
	/kMPqYtp1ctswmhfg+3QI3UrDY0jtMUU+jHAX3sSNapYNYOcMnjEgU/PlFZRTFvg
	UkZnPMnW9yo3SjGwL5LJUvAkxryh2XfUflzlxOwCmS3CDVmhx/JrcXwysA0iY9wO
	g==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4d66kr1c4c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 02 Apr 2026 23:59:40 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 632KoxLP008476;
	Thu, 2 Apr 2026 23:59:39 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4d65ekna81-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 02 Apr 2026 23:59:39 +0000
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 632Nxb6P011992;
	Thu, 2 Apr 2026 23:59:39 GMT
Received: from localhost.localdomain (ca-dev60.us.oracle.com [10.129.136.27])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 4d65ekna7a-2;
	Thu, 02 Apr 2026 23:59:39 +0000
From: Anthony Yznaga <anthony.yznaga@oracle.com>
To: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org,
        Liam.Howlett@oracle.com, vbabka@kernel.org, rppt@kernel.org,
        surenb@google.com, mhocko@suse.com, jannh@google.com, pfalcato@suse.de,
        Jason@zx2c4.com, shuah@kernel.org
Subject: [PATCH v2 1/2] mm: fix mmap errno value when MAP_DROPPABLE is not supported
Date: Thu,  2 Apr 2026 16:59:32 -0700
Message-ID: <20260402235933.10588-2-anthony.yznaga@oracle.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260402235933.10588-1-anthony.yznaga@oracle.com>
References: <20260402235933.10588-1-anthony.yznaga@oracle.com>
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
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 phishscore=0 adultscore=0 malwarescore=0 suspectscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2603050001
 definitions=main-2604020214
X-Authority-Analysis: v=2.4 cv=PqaergM3 c=1 sm=1 tr=0 ts=69cf02ec b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=3I1J8UUJPc9JN9BFgKH3:22 a=VwQbUJbxAAAA:8 a=yPCof4ZbAAAA:8
 a=8mUEbX9rbSpP1ZQJX6cA:9 a=ZXulRonScM0A:10 cc=ntf awl=host:12291
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDIxNCBTYWx0ZWRfX1kv9f3Z8G2om
 XCRJV0DHZNDXtZnG6Jr5JZNsATUwgraezaCLHdeZEZ6VH4SnY6iKtKGpMr8wDuk2fCWS25MikwV
 lkkEDmLqvtrpM7RzVXctZZav5MsPkuT9jr0f9H+JkxKsQlJRVoRVg8ZUDyhHQIuXw0Iw6RnxbFR
 BzVj0IYhwSkDTnMvDdCHzHX990m/bvgrB1avC4R5gBqfsOwuQce/ROe0i/r6KarWIuG1vkrOv4E
 M/UTcNbKe4ZxcwPy1Ry6fm4vwT1rs9hq/x2k3g6EddJBLV2OqXGP5eVEM1ASdpJLqlCkPOmkE3E
 IGrcqkLTUDTJjmLF7epk/tI7kfmH4xVWlSgpV6TbzNLTcFNJcRtHLWbw9kPyFmK5XBoJ9ogw/HE
 fjXhSgksnVoS/ZYPsGuzaaCQtGA/D6mInPF5QLjYVH7nGOuR3wtqafWQwnJZFW6XuFnZsNPLPjJ
 1WW9ucwyFZxhY4GxholNjm4ds1mbgbp8o0j1nGIM=
X-Proofpoint-ORIG-GUID: 3JUIj9xm-8FVoRtXmzIk0pKWijSksMh8
X-Proofpoint-GUID: 3JUIj9xm-8FVoRtXmzIk0pKWijSksMh8

On configs where MAP_DROPPABLE is not supported (currently any 32-bit
config except for PPC32), mmap fails with errno set to ENOTSUPP.
However, ENOTSUPP is not a standard error value that userspace knows
about. The acceptable userspace-visible errno to use is EOPNOTSUPP.
checkpatch.pl has a warning to this effect.

Fixes: 9651fcedf7b9 ("mm: add MAP_DROPPABLE for designating always lazily freeable mappings")
Cc: <stable@vger.kernel.org>
Signed-off-by: Anthony Yznaga <anthony.yznaga@oracle.com>
---
 mm/mmap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/mmap.c b/mm/mmap.c
index 5754d1c36462..2311ae7c2ff4 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -504,7 +504,7 @@ unsigned long do_mmap(struct file *file, unsigned long addr,
 			break;
 		case MAP_DROPPABLE:
 			if (VM_DROPPABLE == VM_NONE)
-				return -ENOTSUPP;
+				return -EOPNOTSUPP;
 			/*
 			 * A locked or stack area makes no sense to be droppable.
 			 *
-- 
2.47.3

