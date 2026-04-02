Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D72841A275;
	Thu,  2 Apr 2026 00:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775090075; cv=none; b=moKKEUobCknSNtD1Sp7ibeo8AuIHE4jAk/+eAec4qKRsziLd+pv49zH1icpjNWE/IBrFsZrOuFnt1ArpgiUOzVAEtcHnGenS3niRGZL1UrIahS/WO6qa2Sdf4pPlz8abT+ZvfGr8WM4fBbmH2mEr1h/k7hNQnwsWEksr/fBXA2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775090075; c=relaxed/simple;
	bh=zwjMt9fc/YEI5eQpuM/nbLt999tiwy+apdZ7cEZ95n0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B1eOS3NMPfPgSdAbcZKSNsEQ2wEIs3Md3C3vRZhf0t/5Ync8zSpzHKy4822X8G93XXbwfiwhbQ9V0b6ZUzQuTgog2njtbJercRMJlkUqi95Xvg3THSfumD7VaxMmfRIgPCgaj9bEBzmtNLvGor6WoX+X7lklatVskE/BwFZxDfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=quK8IuPj; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="quK8IuPj"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6320BoMn337829;
	Thu, 2 Apr 2026 00:34:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=2dOBY
	yv3A6fc59MBInXOI0qr/cp1C0Rbd5GSjFSiR/8=; b=quK8IuPj8pMGJ2T4vc4MN
	pnmoOWyz6blbF7KX9KRp1Gvwxqwh2nSS7jq7d5exuIM2kckY5ZLKXh3S/831nebe
	tyxfuuEgitUaDT8PaXXEA9+v/MK5Fxp2YiWv7vQ/MRjPHkQtPUXGZjC8qBj0HlaX
	XBla1rvIHB9YWYo6TxMAMvAiZ4PowpzhpO3wN2IkH66FgtHZETYV4nZakDu9ylpr
	3VNOxa/Kk9TXRXGM+23W1tFO+ppkHETKbWZ3q6J92PJmg2gmjz6QU8P1FatIGORY
	TAK1KhBWFFX4oIyojWqRJNJsfbLqNxoZ5LOB4uhrDKzcP6Xl2SvJJLgcm+CdEpmi
	w==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4d66v5qjtf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 02 Apr 2026 00:34:22 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 631NwbJJ025980;
	Thu, 2 Apr 2026 00:34:21 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4d65ec222p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 02 Apr 2026 00:34:21 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 6320YJ7e001596;
	Thu, 2 Apr 2026 00:34:20 GMT
Received: from localhost.localdomain (ca-dev60.us.oracle.com [10.129.136.27])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 4d65ec221n-2;
	Thu, 02 Apr 2026 00:34:20 +0000
From: Anthony Yznaga <anthony.yznaga@oracle.com>
To: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org,
        Liam.Howlett@oracle.com, vbabka@kernel.org, rppt@kernel.org,
        surenb@google.com, mhocko@suse.com, jannh@google.com, pfalcato@suse.de,
        Jason@zx2c4.com, shuah@kernel.org
Subject: [PATCH 1/2] mm: fix mmap errno value when MAP_DROPPABLE is not supported
Date: Wed,  1 Apr 2026 17:34:16 -0700
Message-ID: <20260402003417.438037-2-anthony.yznaga@oracle.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260402003417.438037-1-anthony.yznaga@oracle.com>
References: <20260402003417.438037-1-anthony.yznaga@oracle.com>
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
 malwarescore=0 mlxlogscore=999 phishscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2603050001
 definitions=main-2604020003
X-Proofpoint-GUID: 6Z-8Pd5rBCVrAJq5qnKIDBNWX2gY9RRO
X-Authority-Analysis: v=2.4 cv=G7cR0tk5 c=1 sm=1 tr=0 ts=69cdb98e b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=EIcjfB9IiI4px24ztqRk:22 a=VwQbUJbxAAAA:8 a=yPCof4ZbAAAA:8
 a=8mUEbX9rbSpP1ZQJX6cA:9 a=ZXulRonScM0A:10
X-Proofpoint-ORIG-GUID: 6Z-8Pd5rBCVrAJq5qnKIDBNWX2gY9RRO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDAwMyBTYWx0ZWRfXweGrWjXFhoe0
 ak8nteaYbA7rH44XhsjFSL3Vnm3ocduDOalfdsxapBJpsRioIrjg4wwkgS3ohRc0ulV393oajvf
 1HR96MjGTyrDxBVCqGRRuhCddYCrlX7Pav1Z3Y/f4G1MOuMLGmQOEbN5jAz3pnvyF3+6bErJ+ZD
 dAlGb7nacHB1sNJRq8fm44Cr0WutxsklpF7d1q9hB2Ch2j9kjTPhE1U6WAiSYMbk2fSKvHMMPe1
 315ekbd6rQNuhoHyXL1ztSlbI+9DMHlpOH1lOM0XNxlbNSy5gB82Q/Jns3KG9qivsmnX6XiQojb
 Npm3yPaQI8zwQxPFyGk/NXFS5V60knYVOTHILi8Gfo2n9VjSGE8fLEJTfLCZroUSFAeqhm+kuGh
 WBBZFfcuKzFEggR2yrLH3DmUp1IJHnJBzhdbSxkKp8zhJerK3nIRBGaExTYuLWT0lt+UTMBskdt
 a8wzKU3642+VqeUcjgA==

On configs where MAP_DROPPABLE is not supported (currently any 32-bit
config except for PPC32), mmap fails with errno set to ENOTSUPP.
However, ENOTSUPP is not a standard error value that userspace knows
about. The acceptable userspace-visible errno to use is EOPNOTSUPP.
checkpatch.pl has a warning to this affect.

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

