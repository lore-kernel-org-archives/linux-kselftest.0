Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ADA12FB97B;
	Thu, 16 Apr 2026 03:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776310799; cv=none; b=kngUpI0ERKq1wA5FzcoXwMle/Resr4+YbOu+p1uC8OIBaEM+Es68oaed5sXfeKFDVWAQ9MHbY0lRrRsID93HkCZERdmWfkqfiMnDjd9ZVFU5J/cjJe+MDAHoYO1QU0kKvOFbSkO7sV1TZw42EAavSdwOx81M9iHk6zOql7kacBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776310799; c=relaxed/simple;
	bh=v48mFBp5sCP5Rh21oaLfCX1McMaDeGmS6gU5dQ2b+y0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dN0PsmWt2zlNsMQQEhpA851DXQP1kTnP7PSnRrVvpU4e09E6WApBR96tXXVToIWJWKcMx0yroAZgj9v+3/O9bPtkM11Dc9MiKpjdelxaLRYv1d+xNnsVvsyBh5SZuLdvDKVWxEK7yP/coeWBANbxfB4lxM4R1+ZO7jKWMnFH4oA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=nYWXXbzy; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="nYWXXbzy"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63FJMTNh2471195;
	Thu, 16 Apr 2026 03:39:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2025-04-25; bh=jvfGwj9gk3exsHlit2tgP9PwiszVa
	oknxW+bdXzbjYg=; b=nYWXXbzyOARYWAUrPvnxqFEfkqc3qNXp5f0LZohpOvvOA
	ckYzZwewp+NtqTwPmDN8A2D8yOaOq8XxLE22SgeHfrYyjtEffV1ouzUKyUBtQAor
	18qdGJr1cTi0q2H6zzom4H9rgJ1GLcIznFJPvdiJjWMpe7/Gje8aB/UZmI5zUFhx
	TFb53DXjC5NKfOj1D5PlBCs90Nq/jZ3uRHKqDCbEE8/9H1KzzFvibSKHEHzHkQvM
	JRXhrHDAL6HTs7K+x9C4bPdj7vgfE+FqKpJp/c1fIR8S58zv83/S0zk0McZ/G+4h
	fAj98sd+u9VDxB6vokCYvaOpknZh3CEeeA5msMt6Q==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4dh85qetk1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 16 Apr 2026 03:39:43 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 63G3dXqU022531;
	Thu, 16 Apr 2026 03:39:42 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4dh7npq7kp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 16 Apr 2026 03:39:42 +0000 (GMT)
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 63G3dgir023193;
	Thu, 16 Apr 2026 03:39:42 GMT
Received: from localhost.localdomain (ca-dev60.us.oracle.com [10.129.136.27])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 4dh7npq7k1-1;
	Thu, 16 Apr 2026 03:39:41 +0000 (GMT)
From: Anthony Yznaga <anthony.yznaga@oracle.com>
To: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org,
        Liam.Howlett@oracle.com, vbabka@kernel.org, rppt@kernel.org,
        surenb@google.com, mhocko@suse.com, jannh@google.com, pfalcato@suse.de,
        Jason@zx2c4.com, shuah@kernel.org
Subject: [PATCH v4 0/3] fix MAP_DROPPABLE not supported errno
Date: Wed, 15 Apr 2026 20:39:36 -0700
Message-ID: <20260416033939.49981-1-anthony.yznaga@oracle.com>
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
 definitions=2026-04-16_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 mlxlogscore=795 bulkscore=0
 mlxscore=0 adultscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2604070000 definitions=main-2604160031
X-Authority-Analysis: v=2.4 cv=d77FDxjE c=1 sm=1 tr=0 ts=69e059ff b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=o5oIOnhZENCTenyL_yNV:22 a=hZgukN1trT8sADp7EUgA:9 cc=ntf awl=host:12291
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDAzMSBTYWx0ZWRfX6kxMqrmdnCvS
 5ohLfPNa2qzdQv2rTtT0jJ9UXVSd+Ag7VAaVTm0NCXE2mOipm3CdqS99GPHwr7P9gJwWgLK/DmH
 0uc9Q88fH/Pj7bEKyjcwzEoChtwBMTVSO9+Ms+pvp4Euuh+Ac4vZChSdQv5kRjfakv1X0nn9XhK
 LsNtuZruMKtdTrvQVTEzdlHkSINOI4boSXgNUwms9waoadE1F3+ObQfDuN9gpCAgDw+K4IwYXpg
 MnYd2BGcA668TU2lFVLcYn5TvjNCmXQgHOl2ZfJLuevVbvR7zXfYcaYJ7mxw7Th+9XAYcRej70e
 H/69dfSbYlq8GBt0/npRwCRTAYRDj8xMBxKdBKwaboL0NjZfAH1rzdDD9PmcOS9rq8gp9FUMVUe
 KSd9P3bEr4se4LcX0ZtFXbBjxYpp4p5vLwHjKp6HzRtBq7G7wzQYc4ZxCDUvKMJ45cof0kpS4Np
 o0lMe5lazMPIun9s9AqBUa9WqtEtilXmU3KJKSGE=
X-Proofpoint-ORIG-GUID: OrpsW_e-qVrLPYUohSQ6-2NVMWT80gHv
X-Proofpoint-GUID: OrpsW_e-qVrLPYUohSQ6-2NVMWT80gHv

Mark Brown reported seeing a regression in -next on 32 bit arm with the
mlock selftests. Before exiting and marking the tests failed, the following
message was logged after an attempt to create a MAP_DROPPABLE mapping:

Bail out! mmap error: Unknown error 524

It turns out error 524 is ENOTSUPP which is an error that userspace is not
supposed to see, but it indicates in this instance that MAP_DROPPABLE is
not supported.

The first patch changes the errno returned to EOPNOTSUPP. The second patch
is a second version of a prior patch to introduce selftests to verify
locking behavior with droppable mappings with the additional change to skip
the tests when MAP_DROPPABLE is not supported. The third patch fixes the
MAP_DROPPABLE selftest so that it is run by the framework and skips if
MAP_DROPPABLE is not supported.

v4:
- Removed unnecessary #ifdef MAP_DROPPABLE from patch 2 (DavidH)
- Changed the tests to also skip if mmap() returns EINVAL
- Added a third patch to fix the MAP_DROPPABLE selftest

v3:
- Added acked-by's and reviewed-by's to patch 1
- Addressed sashiko AI reviewbot questions:
  - Call munlockall() if test_mlockall_future_droppable() returns early
  - Skip the tests if they are compiled for an older kernel without
    MAP_DROPPABLE.

v2:
- Remove unnecessary mlock() call from selftest (DavidH)
- Change tests to not exit on failure (DavidH)

Anthony Yznaga (3):
  mm: fix mmap errno value when MAP_DROPPABLE is not supported
  selftests/mm: verify droppable mappings cannot be locked
  selftests/mm: run the MAP_DROPPABLE selftest

 mm/mmap.c                                 |  2 +-
 tools/testing/selftests/mm/droppable.c    |  9 ++-
 tools/testing/selftests/mm/mlock2-tests.c | 84 ++++++++++++++++++++---
 tools/testing/selftests/mm/run_vmtests.sh |  1 +
 4 files changed, 85 insertions(+), 11 deletions(-)

-- 
2.47.3

