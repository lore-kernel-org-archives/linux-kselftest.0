Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB9F3DFC80;
	Tue,  4 Aug 2026 12:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785848052; cv=none; b=VFsq/nDuzfYfZmdt0zwP/YpbuAOP4b0NRUCS+gl/JHs68wCk9ja/rhoSV+nrdXlunTesjxi0gEWcUKc0R90hHBRVjNwrOyXHYWNeALf1DsvSvYKJhsZcDEUGHuHn/+cOZowM/bjncipATH8sM5bvyMieLmJHuvodITynCzfMRio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785848052; c=relaxed/simple;
	bh=NMuAzkgEgB7KD6BoC5UwdsxM+szQNIkUvxPL14MVmbY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=icaWoagXnwGdqKIi9xOXFOIC00jvbFo9Pt5/cArlrem6C37JFQY1vNYmGnW5NBANc8mli2D4XiDM+Qdokw8x2br8fXy1uXv5KKyL8LJ2iaeF+RwgcbVj+Efy/fuSdNnF8bg+dy2kZtjbwpGfAVMWAZ6ZoBIPuDYjhT08D0CzjmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=TcAiTksA; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="TcAiTksA"
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674Cm3Ls864595;
	Tue, 4 Aug 2026 12:53:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=xlTXk6MwGxjipigz9cBt80RtymoaNf/U04D5Mwryi
	XY=; b=TcAiTksAKZuR0Bs+D+YES/NHVaspYm+r82MbE5+UxDE6yya2Z1ys3cAHK
	njmLIuUig9g4P5U9Xck61e1DiXb89ZRLPi48pXfJ3sSwkIghQrJY+1Uv8/UpQRUt
	yDfmrKsf1xjB9HJQeG7YZoAjKfsSNsu+sA56XW97uCjywxEuEPSbSz2r9KNddp4A
	hnDC1ij+0EBWwEAuWJjrEeKp4QSc8utDKEcGkreGjnB3KEOhacVyPJwy315tNOwj
	SBRfO5lMWh5TlYxjSYjK0ZRrQKZMM+IUjl42gCFaUQlwyARuT6NdPapPsOYSIUUG
	n/9coTPoHOr0yJ4Ay/OUwKezZS3nw==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4fs8a3wve8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Aug 2026 12:53:54 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 674CfjLc009496;
	Tue, 4 Aug 2026 12:53:53 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4fswbg9rs3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Aug 2026 12:53:53 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 674CrpMC36569406
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 4 Aug 2026 12:53:51 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CD1022004D;
	Tue,  4 Aug 2026 12:53:51 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A84B420043;
	Tue,  4 Aug 2026 12:53:51 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.87.85.9])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with SMTP;
	Tue,  4 Aug 2026 12:53:51 +0000 (GMT)
Received: by tuxmaker.boeblingen.de.ibm.com (Postfix, from userid 55669)
	id 8B4F3160DF4; Tue, 04 Aug 2026 14:53:51 +0200 (CEST)
From: Alexander Gordeev <agordeev@linux.ibm.com>
To: Andrew Morton <akpm@linux-foundation.org>,
        David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>
Cc: linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] selftests/mm: khugepaged: skip swap tests when no swap available
Date: Tue,  4 Aug 2026 14:53:51 +0200
Message-ID: <20260804125351.1715708-1-agordeev@linux.ibm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=E6P9Y6dl c=1 sm=1 tr=0 ts=6a71e0e2 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=iQ6ETzBq9ecOQQE5vZCe:22 a=VnNF1IyMAAAA:8 a=20ODRixJnTVtJwgKIyoA:9
X-Proofpoint-ORIG-GUID: I5TXJGCz7qIhxc_gf-V5rSg-4zXJDRLW
X-Proofpoint-GUID: I5TXJGCz7qIhxc_gf-V5rSg-4zXJDRLW
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDEwMiBTYWx0ZWRfX5CiOSaCP8kLg
 up9IvNS9qwGCWBM/JNfoYxOgqTrzCVZTzwMyZH5WtFJmZmnUNLgJD3zG2XQHhaCLN1o23MInjva
 iQf/qatyYehA7QIoUr7zeQ2BAXn1iGY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDEwMiBTYWx0ZWRfX0XeQSf8lH5st
 hkVk81pCEm0zzd5NxLpBO94nl8y3fpf/Cbm27xPyStRELOaf04CnZytApWHrbERYppQY3nc8WUL
 OLiBV2vJTquXzAf0Cub01fJStoIcpx77WH/1f0350aBW/+9iM/EYRx6ZWQRNgdKPOusjnsQfvmc
 UOWLFglyaxHqwIflkTktbNxo6b0RFF752AGyCPvcJ3BTXL/kLryWpAjf47FY6GDMlKZdNc50ntg
 S+y4yhaNYybSLmfc5ldwUNweBl3dalA5TLihHBNh//4EGze0UnLIQn012cY88B4BUwcjDhT+rie
 9ORrX4aFzXRz9T2+zAtm94Nvy2HH4zPqt2jkbUdf2PIY/Zx89hd/K0J4SuMlZHAz4hiEk0XQU1r
 /E/NHooTQ279qN6a0WdFVLJcLOelljIA1SEhEFJeekxUemgB23r2bj6D2MEvCcdddLNk+RSlyD1
 87cRqoi3AqyZ2xrVasw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_03,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1011 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 spamscore=0 malwarescore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608040102

When no swap is configured, swap-related tests fail because
madvise(MADV_PAGEOUT) does not swap out pages. Add a helper
function to detect swap availability and skip these tests.

Signed-off-by: Alexander Gordeev <agordeev@linux.ibm.com>
---
 tools/testing/selftests/mm/khugepaged.c | 33 +++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/self=
tests/mm/khugepaged.c
index 10e8dedcb087..b254baf9e0b7 100644
--- a/tools/testing/selftests/mm/khugepaged.c
+++ b/tools/testing/selftests/mm/khugepaged.c
@@ -216,6 +216,25 @@ static bool check_swap(void *addr, unsigned long siz=
e)
 	return swap;
 }
=20
+static bool is_swap_available(unsigned long size)
+{
+	unsigned long swap_total =3D 0;
+	char buffer[256];
+	FILE *fp;
+
+	fp =3D fopen("/proc/meminfo", "r");
+	if (!fp)
+		return false;
+
+	while (fgets(buffer, sizeof(buffer), fp)) {
+		if (sscanf(buffer, "SwapTotal: %lu kB", &swap_total) =3D=3D 1)
+			break;
+	}
+	fclose(fp);
+
+	return swap_total >=3D (size / 1024);
+}
+
 static void *alloc_mapping(int nr)
 {
 	void *p;
@@ -734,6 +753,13 @@ static void collapse_swapin_single_pte(struct collap=
se_context *c, struct mem_op
 {
 	void *p;
=20
+	if (!is_swap_available(page_size)) {
+		ksft_print_msg("No swap available...");
+		skip("Skip");
+		ksft_test_result_skip("%s\n", __func__);
+		return;
+	}
+
 	p =3D ops->setup_area(1);
 	ops->fault(p, 0, hpage_pmd_size);
=20
@@ -760,6 +786,13 @@ static void collapse_max_ptes_swap(struct collapse_c=
ontext *c, struct mem_ops *o
 	int max_ptes_swap =3D thp_read_num("khugepaged/max_ptes_swap");
 	void *p;
=20
+	if (!is_swap_available((max_ptes_swap + 1) * page_size)) {
+		ksft_print_msg("No swap available...");
+		skip("Skip");
+		ksft_test_result_skip("%s\n", __func__);
+		return;
+	}
+
 	p =3D ops->setup_area(1);
 	ops->fault(p, 0, hpage_pmd_size);
=20
--=20
2.55.0

