Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE643955D6;
	Thu, 25 Jun 2026 12:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782391292; cv=none; b=bqgSTffo/hHsB8RaY3K3DMZHyvQdd1RIMKCg6S38wUM1jxVJ3ASE7vdp22fxOkzEED48KxH4SdoPWgbXKmJCzYdew06DvO0Xm3tNypOSMqFx31KJ9jhOEdMFEESRJ3LzEky9Tq6OJYQTcyXiAfzgk7dK0/N3nd0l6cHLHC0/+NU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782391292; c=relaxed/simple;
	bh=HBtLhR/sYBlDpcJ/DK9L7DoU4uCqT3HDSCmjp8GVG74=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HfHraBp2AFspuXQdfaD1EkImqYTUP0ck6AP0WUy9cLE1Zqt/22xn5BI11XPKvQOjSk4zWaO+Y8zErUrdSg6a3Ue3kMxsBbhzNroLf/S4eMBurj6jw4+gz9Gs+HmqOOFaAz7zXK/QJtCN5e+4HwIHNH60bdEyOQaZoRuQltrR+mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=btca+J6h; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="btca+J6h"
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P3mkht3186638;
	Thu, 25 Jun 2026 12:41:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=7LYq0ie//aif0rvPo
	S+W7UvKKsXyfzfR+W5IvevACR4=; b=btca+J6h87EV0dixFml2rg/B0a3z7buMX
	vOghJH8Z2D6ekNIx74mLVh9yDaI22eyVO0VobVvQtZsNwy1X3DB53BDzddGlBU74
	n1pzozRWII/ORK92qqA7IaSQn2Wfq9/YF/p+6uZr0dhwB46hpbZyQHclEhLUP9k1
	waKgnci20pxJ4dhWS6m/cocWS+n8vm3xFnOeyuW07BN7SclLBByMVHaCqEZPFIAK
	8bU4ywlVCVABa32wyT5vGTH82fzm/H2+pQjg8D1uf146LNBeTf1ZP0YnnFSHVfTs
	3siNufzARjFd8m7hxlut5RSX37GGjCD7Ae+dlS+ix6T3m1yA/BzLA==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ewjhr1n0t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jun 2026 12:41:04 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 65PCYbJu002246;
	Thu, 25 Jun 2026 12:41:03 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4ex7vywtr2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jun 2026 12:41:03 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 65PCexk216187824
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 25 Jun 2026 12:40:59 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8F25B20043;
	Thu, 25 Jun 2026 12:40:59 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8B98920040;
	Thu, 25 Jun 2026 12:40:55 +0000 (GMT)
Received: from li-3f69264c-2ce6-11b2-a85c-c3f414d24014.ibm.com.com (unknown [9.39.21.143])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 25 Jun 2026 12:40:55 +0000 (GMT)
From: Sayali Patil <sayalip@linux.ibm.com>
To: Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org,
        Ritesh Harjani <ritesh.list@gmail.com>
Cc: David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>,
        Michal Hocko <mhocko@kernel.org>, Oscar Salvador <osalvador@suse.de>,
        Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
        Dev Jain <dev.jain@arm.com>, Liam.Howlett@oracle.com,
        linuxppc-dev@lists.ozlabs.org, Miaohe Lin <linmiaohe@huawei.com>,
        Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
        Sayali Patil <sayalip@linux.ibm.com>
Subject: [PATCH 1/2] selftests/mm: handle EINVAL when configuring gigantic hugepages
Date: Thu, 25 Jun 2026 18:10:16 +0530
Message-ID: <8bfa921e30eb94072685103f6496784aa23bb166.1782365671.git.sayalip@linux.ibm.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1782365671.git.sayalip@linux.ibm.com>
References: <cover.1782365671.git.sayalip@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=I4VVgtgg c=1 sm=1 tr=0 ts=6a3d21e0 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=uAbxVGIbfxUO_5tXvNgY:22 a=VnNF1IyMAAAA:8 a=BH8Sa3jHzDjv_dfq7kQA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDEwNiBTYWx0ZWRfX1nVmDDdRv9Ya
 aKQMIG6CeqWls2DhWDooBvBnH9rf1Tvj3U86aJk8eju75M9GgeZekbqYMZ5MbcCz5E/heJbF2fQ
 gJcXtvqLFitVg2zpw5hh2Oogn8kBdDTZ0j9EmGcLk3Ec3jLhHNeUS+u97vQ4fLkRaTqWjDAmA8n
 eG8YOJ4M/5ehobMDozG90QP0l9ThIrr+53qOK0mxwcyBXJDoBqGH33+dF08lfhWiRLOUMKA6tlw
 WGvmIYai1U73+xnCtAOM9pe8YUEDHsO7lnq3RHm+U6zq6cH/mQcDh+GA2cIlw9Xd4cD7mPqzqDq
 yo99ppHH9GKdZo9BoJ+aD+1UHJwQZRCp1EqMdzkDhr9qQVxlyBYp/QujlL/gu/KcmmvlV05CHNy
 shn/ua4Ku74rnduw84CvVEjG8MT8pHljLLvs4xwJr+yy247p9A0PY9QKDd8A4ui70RLIx+5lRKb
 LQYEwNozRFx1aCQqO0A==
X-Proofpoint-GUID: 0ck7acKIWgQNDdBNXuyFfJ7Rh2vv9q4y
X-Proofpoint-ORIG-GUID: Fk3ArSV7aga3Sj3uoTWpxyn9NwBwXYQV
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDEwNiBTYWx0ZWRfX6tq/9m+kgMW5
 Y4d/2sIhk9ymXDuFyDBk352ypuPhe1WUdWyMiz6jX7VSgwkVeuuc7a07rmg8tLDg0OZ9wt5Ktoy
 7mRPusNlvHgXHeXMs/EopsrCVo7Kl+I=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606250106

Some MM selftests attempt to configure the amount of
HugeTLB pages of different sizes by writing to nr_hugepages.

PowerPC hash MMU pSeries systems advertise gigantic hugepage sizes 
but do not support runtime allocation of such pages, writes
to the corresponding nr_hugepages file fail with -EINVAL.
This causes the test to bail out even though the failure is due
to a platform limitation rather than the
functionality being tested.

Treat -EINVAL from the sysfs write as a skipped configuration request
and continue running the test instead of failing.

Before patch:
   -------------------------
   running ./hugetlb-madvise
   -------------------------
   TAP version 13
   1..1
     [INFO] detected hugetlb page size: 16777216 KiB
     [INFO] detected hugetlb page size: 16384 KiB
    ok 1 MADV_DONTNEED and MADV_REMOVE on hugetlb
    Totals: pass:1 fail:0 xfail:0 xpass:0 skip:0 error:0
    Bail out! /sys/kernel/mm/hugepages/hugepages-16777216kB/nr_hugepages
    write(0) failed: Invalid argument
    Totals: pass:0 fail:0 xfail:0 xpass:0 skip:0 error:0
    [FAIL]

After patch:
   -------------------------
   running ./hugetlb-madvise
   -------------------------
   TAP version 13
   1..1
    [INFO] detected hugetlb page size: 16777216 KiB
    [INFO] detected hugetlb page size: 16384 KiB
   ok 1 MADV_DONTNEED and MADV_REMOVE on hugetlb
   Totals: pass:1 fail:0 xfail:0 xpass:0 skip:0 error:0
   /sys/kernel/mm/hugepages/hugepages-16777216kB/nr_hugepages
   write(0) failed: Invalid argument
   [PASS]

Fixes: 9d07250ea1eb ("selftests/mm: hugepage_settings: add APIs to get and set nr_hugepages")
Signed-off-by: Sayali Patil <sayalip@linux.ibm.com>
---
 tools/testing/selftests/mm/vm_util.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tools/testing/selftests/mm/vm_util.c b/tools/testing/selftests/mm/vm_util.c
index 311fc5b4513e..a8f16eef5c7c 100644
--- a/tools/testing/selftests/mm/vm_util.c
+++ b/tools/testing/selftests/mm/vm_util.c
@@ -735,6 +735,13 @@ void write_file(const char *path, const char *buf, size_t buflen)
 	saved_errno = errno;
 	close(fd);
 	errno = saved_errno;
+
+	if (numwritten < 0 && errno == EINVAL) {
+		ksft_print_msg("%s write(%.*s) failed: %s\n", path,
+			       (int)(buflen - 1), buf, strerror(errno));
+		return;
+	}
+
 	if (numwritten < 0)
 		ksft_exit_fail_msg("%s write(%.*s) failed: %s\n", path, (int)(buflen - 1),
 				buf, strerror(errno));
-- 
2.52.0

