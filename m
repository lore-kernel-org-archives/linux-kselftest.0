Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AD182F8BF0;
	Thu, 16 Apr 2026 03:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776310799; cv=none; b=go9nCPVUYGltXtu0Xlii66oVU6KSpU+2RAtVrTPIz1NJEwsCzZQ8rhTnQNPkIvil4Abj5AsJjQEb2wLZF0WSkjLPeFDvKU2BYwky4VN2OqhivkaCgwFBgqOwvydJjqMBdAfXSX5HqZ08cxzrWeisvKMjBnKWvec1Lc/z/2UVt8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776310799; c=relaxed/simple;
	bh=ttaCAk7cHzU4QAkNweOEJSAGTKE1BrGDk+Z9oS0A714=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RIwf845DCxX1hCiTo6Xa+9zAk7BqLZd+HXQqKuRNM22r4SZ7OVU/UnLyecjT32H4IQEfp8PnEiC2d+Q8X7VglXrrnJi+Xjg11it+4yfhtumIs2V4VYX6uaTm9VJZaWdIwSFxBFXswDF7OwpQ+Zm4Le1DsSPNRUoHJi+GPN+1IJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=WZAzhYZB; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="WZAzhYZB"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63FJMNkf4004959;
	Thu, 16 Apr 2026 03:39:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=pkK/g
	px2ErjKx3G2Uq6ljwesXsbQnQRoVjdIPtDsVIE=; b=WZAzhYZBfpYwKkbsIUCkg
	whxSOEUnkW5X7Srp4Dh2IbEyYW6RWS8CBllJnWPrQqYtnPQECdApZPCZ7PPNAODZ
	evIOr124PGjil4nZIz8ZBnG5RoG2fFsWx3gn43edq+14NueIU8ItJdJ8XvpcID/c
	JNPpFq8RnQhOp7Zz1akjX8ockP+4MrC0g5H2II8n6yT23+buqYFD5jcwivyxe1Gy
	5/lfRWnPq5ZUQJ0KapiCwhD42NZjTdkWnlQbcM4B+aQWmpSrEwQCSg5DrcfijAx7
	dQpBlswnAhSAeiIt8WLA6IVW9h38xnqQM+deo9jgsUH/YlsC+rVB0z+3S5adpNUS
	A==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4dh867excv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 16 Apr 2026 03:39:45 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 63G3dXDm022548;
	Thu, 16 Apr 2026 03:39:44 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4dh7npq7mb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 16 Apr 2026 03:39:44 +0000 (GMT)
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 63G3dgit023193;
	Thu, 16 Apr 2026 03:39:43 GMT
Received: from localhost.localdomain (ca-dev60.us.oracle.com [10.129.136.27])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 4dh7npq7k1-2;
	Thu, 16 Apr 2026 03:39:43 +0000 (GMT)
From: Anthony Yznaga <anthony.yznaga@oracle.com>
To: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org,
        Liam.Howlett@oracle.com, vbabka@kernel.org, rppt@kernel.org,
        surenb@google.com, mhocko@suse.com, jannh@google.com, pfalcato@suse.de,
        Jason@zx2c4.com, shuah@kernel.org
Subject: [PATCH v4 1/3] mm: fix mmap errno value when MAP_DROPPABLE is not supported
Date: Wed, 15 Apr 2026 20:39:37 -0700
Message-ID: <20260416033939.49981-2-anthony.yznaga@oracle.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260416033939.49981-1-anthony.yznaga@oracle.com>
References: <20260416033939.49981-1-anthony.yznaga@oracle.com>
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
 phishscore=0 lowpriorityscore=0 suspectscore=0 mlxlogscore=991 bulkscore=0
 mlxscore=0 adultscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2604070000 definitions=main-2604160031
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDAzMSBTYWx0ZWRfXweU741C/7Ah1
 DOj0Fk5yXEwNdLh7itYMd2mOGH8YuqklOnzqdmtYx4bTXjZzsmc+QeLBOVHfUdGpEbXuyXd5D0e
 HmoLx8qZmI8b+FOVTP2fyV1CzYJhzr7bqEsqfcecf9tfOvwv4UsGChhKgVKy6dEE4648NK9Jg2f
 8WPRZpQuM51Gz9OefmRiF2Z2o0MK9QtxBbtzBP8IcWfha8WnjoBPCpaPtiNCZIfdDrFNxKBmIEW
 Y/q5MHwVq/ZSFr8fWBA3lm/HqUcwC8cMGyY1YU2IcVsPbhc2JNNFV/eYYeYFtWDTZkf5wueLdla
 04ZE7A4DAHpNl289b25rWzyGHfKt90OoMVmq1cKCcKesWPTXR7hWmxkdf1Vup0NogGF08OCNkzH
 ZUsYl+ySjy/zodfwh+6at6+XAEySdrvceThnSVoElPrmho4xbtZCzVSoEZG1WWdhn28FLtLD7BB
 GvXLx0XCJ8ymUYadzDeAF1s/P5qBYUBjRfXKaKUQ=
X-Authority-Analysis: v=2.4 cv=cbjiaHDM c=1 sm=1 tr=0 ts=69e05a01 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=BqU2WV_vvsyTyxaotp0D:22 a=VwQbUJbxAAAA:8 a=yPCof4ZbAAAA:8
 a=Dv_WXUeMNy8hEQbTb70A:9 cc=ntf awl=host:12291
X-Proofpoint-GUID: CsDO3YR0k8f9eD17oFOBMn50UdVXwONW
X-Proofpoint-ORIG-GUID: CsDO3YR0k8f9eD17oFOBMn50UdVXwONW

On configs where MAP_DROPPABLE is not supported (currently any 32-bit
config except for PPC32), mmap fails with errno set to ENOTSUPP.
However, ENOTSUPP is not a standard error value that userspace knows
about. The acceptable userspace-visible errno to use is EOPNOTSUPP.
checkpatch.pl has a warning to this effect.

Fixes: 9651fcedf7b9 ("mm: add MAP_DROPPABLE for designating always lazily freeable mappings")
Cc: <stable@vger.kernel.org>
Signed-off-by: Anthony Yznaga <anthony.yznaga@oracle.com>
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
Acked-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>
Reported-by: Mark Brown <broonie@kernel.org>
Reviewed-by: Pedro Falcato <pfalcato@suse.de>
Reviewed-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>
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

