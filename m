Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C3A22472A6;
	Thu,  9 Apr 2026 23:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775778572; cv=none; b=ShrMM6x0+LefEzwam8HXnGsF0OyLFrYLCBSnjmizbJNVVEK6SrwcSL/oP/d2IbsL2DiDlrtS3hJdItmITUHEg3D2vtnO33l1xjYwxvgTDysgF78gQAQUGZi6/eG9ceV8/hlplkwMczVgAzL2JGjfh7lED6YeM/8o1x0ZS4DRkJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775778572; c=relaxed/simple;
	bh=PjkluNeBKLU/DAnrfq5KTecHLoRi7e71XyXWKky1H9U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pGfnBjKFeC8YNyEgK1kuR1t0ysrRr216/SPfhbn2XPI/Nj8sWXY/rAGB7UvyBRlF4hDEU9t8TDAkS5pxfMlAYWB5dPFwx2H60dwjKavJ+y4vdSezn3g0jdQ0Gc4xhmf0uY75ag3UZWogF8QfOarJE5xzZbkfqLW2EKW+lc9/xn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=VIYvcBlj; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="VIYvcBlj"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639JtUKa3739892;
	Thu, 9 Apr 2026 23:49:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=xeTDX
	q96Co1al8+5coiV+ril45NeFzPvEgmMDiXr3gU=; b=VIYvcBlj5RIHKJLVTWFh+
	F6zC18mZZVWnUKmmNKa4N6nXnQ8HgyIl08wTIAB2GYfsLH9W8qgvKwiRKmk1XBaT
	HCoXaajRsY7dHLZHrTrmHo1ZE7Xp6+HYlu0AnanzzmEaOUYxIKcqxA3NT3BLxVMz
	a22o4aIXfuPcMMv7L94Q1MXBMp0DO0b2CCmwb2THxtJs43h9xIvMy7c7HHWKlHAY
	CUnJl+5fN67whh7OnyA1dMj5w/wxX4S5nUV75XhueotMYk/98Cwh8n8+A8ahFQRu
	3Qpd0hnPCk7qRin3sjeMBmplO6LIeV6hpbIze1zgeNQF1CNLbUO+gUx0QQsaAI5f
	w==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4dcmqb8gd9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 09 Apr 2026 23:49:21 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 639LMfqm003466;
	Thu, 9 Apr 2026 23:49:20 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4dcn5ytfys-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 09 Apr 2026 23:49:20 +0000
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 639NnIZO019990;
	Thu, 9 Apr 2026 23:49:19 GMT
Received: from localhost.localdomain (ca-dev60.us.oracle.com [10.129.136.27])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 4dcn5ytfx5-2;
	Thu, 09 Apr 2026 23:49:19 +0000
From: Anthony Yznaga <anthony.yznaga@oracle.com>
To: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org,
        Liam.Howlett@oracle.com, vbabka@kernel.org, rppt@kernel.org,
        surenb@google.com, mhocko@suse.com, jannh@google.com, pfalcato@suse.de,
        Jason@zx2c4.com, shuah@kernel.org
Subject: [PATCH v3 1/2] mm: fix mmap errno value when MAP_DROPPABLE is not supported
Date: Thu,  9 Apr 2026 16:49:14 -0700
Message-ID: <20260409234915.11723-2-anthony.yznaga@oracle.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260409234915.11723-1-anthony.yznaga@oracle.com>
References: <20260409234915.11723-1-anthony.yznaga@oracle.com>
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
 mlxlogscore=999 phishscore=0 adultscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2604010000
 definitions=main-2604090220
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDIyMCBTYWx0ZWRfX5H87J1Gz6dBK
 k8SEey6hvPTvDAALgeUivENePYNF4oyr3jnDd69gpT9J2UZVbsWW+PS8bUTxnC1e+ftxovB1Db2
 2/avwjIAxG+HgvxwjxMs2nrrHEtxXh6D1HhAfks2kSQrHfFsZ5xAJwDaWjg1Gq4GT5xp5BDp+wN
 4pdK2lHqy6tpIJMg42va9UU4JiYbjWBsNPtR19PZBzHG5z694hL1nbH0O9//CrJFwmqLxV4pzYM
 l8Yq4xJCiuypBttbzBHqoILMyO815Cz1FAeLFWh1y1sdFa0Swnkb/nwy+Lfks97fIisu/i9wwus
 EXja5MJ6RWzJoxLgmafvWiVTYcb932kW4xsQ1WGYR4ETfxKzDPDYJYkwnRIgUSCZBk3NoZUbLKf
 7fA9nVzliq393jDQhYlNYEprN65DSTudAWeyP064ZuSsbw22UF5sL11df7MRN1MnA0xNdDPX/FN
 QhFgOVdOyMlYuvo7xlO25xwzXJ6RdBTNbNEmxpD8=
X-Proofpoint-ORIG-GUID: SAu5W7twNTgdfLpt5e8uL8sMpwAaarjQ
X-Proofpoint-GUID: SAu5W7twNTgdfLpt5e8uL8sMpwAaarjQ
X-Authority-Analysis: v=2.4 cv=cK7QdFeN c=1 sm=1 tr=0 ts=69d83b01 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=3I1J8UUJPc9JN9BFgKH3:22 a=VwQbUJbxAAAA:8 a=yPCof4ZbAAAA:8
 a=Dv_WXUeMNy8hEQbTb70A:9 cc=ntf awl=host:12291

On configs where MAP_DROPPABLE is not supported (currently any 32-bit
config except for PPC32), mmap fails with errno set to ENOTSUPP.
However, ENOTSUPP is not a standard error value that userspace knows
about. The acceptable userspace-visible errno to use is EOPNOTSUPP.
checkpatch.pl has a warning to this effect.

Fixes: 9651fcedf7b9 ("mm: add MAP_DROPPABLE for designating always lazily freeable mappings")
Cc: <stable@vger.kernel.org>
Signed-off-by: Anthony Yznaga <anthony.yznaga@oracle.com>
Acked-by: David Hildenbrand <david@kernel.org>
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

