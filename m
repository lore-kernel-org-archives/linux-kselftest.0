Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 432DF336EE1;
	Thu,  9 Apr 2026 23:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775778572; cv=none; b=iDmsYOeUwT+GMoBZRBvzo+TzOvxW5RTmDadpcv8GSuOEDe+cHV40nsF5YLBMvSLfMSZ1sNu+sWZ0dD/wJoV95T/A65VD90VBE1mITGN4kDRsCbD7KewoMqtAwGdZZiMIa2im4g9Wtr4/4TtHW5kl9pg+KcxoPxVNDwwAau2BAUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775778572; c=relaxed/simple;
	bh=AMLyCNq9hGFHG7ml9oJxU0CUq6OOPkitEziYBenr9WE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=R5+T9+2EnLVtx2DP2SRqq1qqSyEa9iIHdmFLQdT7Vy8kI9CJ2WmjBcG2vO42vd3b726PUnhpW8woJhPQZvCaJ7Mt7Wn3XiKz9CjTff6hbXUqCkVt36gspsv1XX4JnBlWJvuKRQlWetE6xJOwuuaEicguUu+yNQ3L1ifJND/lBvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=N5dPViyL; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="N5dPViyL"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639JtVp02413200;
	Thu, 9 Apr 2026 23:49:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2025-04-25; bh=dvJ3TU1MWb94kQWr+8Y7dvIzPSH4o
	tBEbOprU5cP+OY=; b=N5dPViyLNCc/Om5vpWL8pRDmogvqTx99LiGz/SL5akd1F
	k0mTAyLphSYio4Jk32cfGrrTHaQpTnCbJeMiXrm4oaJKmvc48QV0Y/rnrsGDpJfQ
	OBi6XCM2AXZII1g1ktfCwYyC+rPmQGz8qiEIJ56hJDEsZ8tm6DXbzoTVQwyrqIFy
	gVN/N+aWMzK38NfuLRZWO3YWsHuW927CY+qzM7iVNAI1WgSgkZvmUoRFyKJU27HE
	4i/n78KrQXhhj03PlrTIeu15njF6bP/h8nHc3LQb2exz5NzwEl0xv93FgbDqG5Ye
	kSrEQ5IOviuGW6GYOTanI+O4mgSBIbc7gNTcyAB8Q==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4dcmqa8tf1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 09 Apr 2026 23:49:20 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 639LQ44u003643;
	Thu, 9 Apr 2026 23:49:18 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4dcn5ytfy1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 09 Apr 2026 23:49:18 +0000
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 639NnIZM019990;
	Thu, 9 Apr 2026 23:49:18 GMT
Received: from localhost.localdomain (ca-dev60.us.oracle.com [10.129.136.27])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 4dcn5ytfx5-1;
	Thu, 09 Apr 2026 23:49:18 +0000
From: Anthony Yznaga <anthony.yznaga@oracle.com>
To: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org,
        Liam.Howlett@oracle.com, vbabka@kernel.org, rppt@kernel.org,
        surenb@google.com, mhocko@suse.com, jannh@google.com, pfalcato@suse.de,
        Jason@zx2c4.com, shuah@kernel.org
Subject: [PATCH v3 0/2] fix MAP_DROPPABLE not supported errno
Date: Thu,  9 Apr 2026 16:49:13 -0700
Message-ID: <20260409234915.11723-1-anthony.yznaga@oracle.com>
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
 definitions=2026-04-09_05,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0 bulkscore=0
 mlxlogscore=871 phishscore=0 adultscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2604010000
 definitions=main-2604090220
X-Proofpoint-GUID: BO1gdfDQVUaQm9ZjoLs9PU2hrR8A6Inz
X-Proofpoint-ORIG-GUID: BO1gdfDQVUaQm9ZjoLs9PU2hrR8A6Inz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDIyMCBTYWx0ZWRfX/GP63TpharoX
 84G2Ys7Tmbhr6F6EU4LeNN8xW5rb20LICTmWWrmC+Zs+yuXHhEyArNAhZHOEhntB3zrEgVcH3Ql
 ByauAmnKX8XatJoQhGUunl8S5vWzC7VRii5t66UvKiNbtt7HTI6PJk3xDdOMX2xcWC6UcuRmCnF
 LoX6P0ss42QtdB/LI+AfKLVOC77xCU1BK8cZX7EpH3RfJU94zraKA+qJ2qC+iy8VuK8ILlCOfcL
 idSYyt9mqqjn6cV/vTGeigoly92J5bM/okpo4HTk4cINwifm4rKTU4eQLhYhmx9sQiBUddBVUqw
 PczgyhTvj0aC6Jz4ejJHpK0Q7tHEwKLj/ino7/Gh+OC5uzOb11xndKkSgotWkAWINPrgRUGpyQJ
 ntpkxmCnlDYDeTD2HKI1kdK4f+V7nRrrpGsfem+K0kHWknsezh+YjUDTzWloJ5xM99wmHcDX33X
 SLIxPcgBwd0E/7uPOG8FU+EDShvtbuEi9FfFcKU0=
X-Authority-Analysis: v=2.4 cv=DLS/JSNb c=1 sm=1 tr=0 ts=69d83b00 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=7Gl3-_t3PgB9XO-mQDs3:22 a=hZgukN1trT8sADp7EUgA:9 cc=ntf awl=host:12291

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
the tests when MAP_DROPPABLE is not supported.

v3:
- Added acked-by's and reviewed-by's to patch 1
- Addressed sashiko AI reviewbot questions:
  - Call munlockall() if test_mlockall_future_droppable() returns early
  - Skip the tests if they are compiled for an older kernel without
    MAP_DROPPABLE.

v2:
- Remove unnecessary mlock() call from selftest (DavidH)
- Change tests to not exit on failure (DavidH)

Anthony Yznaga (2):
  mm: fix mmap errno value when MAP_DROPPABLE is not supported
  selftests/mm: verify droppable mappings cannot be locked

 mm/mmap.c                                 |   2 +-
 tools/testing/selftests/mm/mlock2-tests.c | 100 ++++++++++++++++++++--
 2 files changed, 92 insertions(+), 10 deletions(-)

-- 
2.47.3

