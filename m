Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 599FC330651;
	Mon,  4 May 2026 08:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777883151; cv=none; b=Qx/1xlF0WDcVAe1fk4Yi4iDxuhRfa/exjFRWE+ykFGiLDticduMEM1F/MNm8QhmAwK9iFiwZO96MlhPh6f8ifgdkMMvkfyMl9RA14Z+AYMyZTkmxZwbrqK36XaNMP7YarFyCsHJmYimD+NaAfUZWNpPBZIYXxsVrJf0laFwsjWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777883151; c=relaxed/simple;
	bh=6k0dfBPedoZ5m3zDYQfNpVT7vuiVKssNtYmRQNfyMxo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q2jrySLE3y302FjdCpHZm1DV8VoD4LNf307BZuAVUfUFPUJQXTjGXUqcEWrXNeM/Q6v5i2PgmEiY3jJ1O32oH2deqdcixlvM+HhVVXn2wF7NJ/WIlD+RJ1+oJXa3tsaRrgO3INRZj7SrV3gchJ2MwwSlq9WOwNwobxDnZmfFTEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=oZ4fuRzI; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="oZ4fuRzI"
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 643MxN1j2752196;
	Mon, 4 May 2026 08:25:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=9bpngp4LuWeNJI7hh
	OZ15/SZJ6KlaN1MsO0YmwThcC0=; b=oZ4fuRzITjJH9yzaPPZC1eU8nPJ05ty6b
	jWtq8og1I6QHUxiqsy/aPXDwPWcfoho1TlTo8uJfAbMBAX7R55VgSbSsy5X2G2ki
	CgZ5KRKozEK8hzzGRjUW7sQe6nZoadqF+UOwImO6unWu0VEvPthBlBF0oxLEJY0j
	R4ZbnUwBlcVAfZfk2O4R7OKI0W3OduyW0cFMxWtvF9+DAdMuyC2c8i0LQ33V9INf
	Q6ByXi+dIMbfhuJ2bQR7ww4ZGuWhT8CdMyZcXg9tfjQTb1DH+RfrNXp+MZOLvvFw
	obzdIHB0J3FThvfRTFykG6IYDE7zjMIf0H4710Cw4g3QkmjwdBLfQ==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4dw9x4e3r7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 May 2026 08:25:23 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 6448OQh3012985;
	Mon, 4 May 2026 08:25:22 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4dwx9y42j9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 May 2026 08:25:22 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6448PJj350987460
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 4 May 2026 08:25:19 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2C72E20043;
	Mon,  4 May 2026 08:25:19 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3100D2004E;
	Mon,  4 May 2026 08:25:16 +0000 (GMT)
Received: from li-3f69264c-2ce6-11b2-a85c-c3f414d24014.bl1-in.ibm.com (unknown [9.123.3.209])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  4 May 2026 08:25:15 +0000 (GMT)
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
Subject: [PATCH v6 04/14] selftests/mm: fix hugetlb pathname construction in hugetlb_reparenting_test.sh
Date: Mon,  4 May 2026 13:54:41 +0530
Message-ID: <5479a9ce82c07899b95101e20984e10b2f3f853a.1777877814.git.sayalip@linux.ibm.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1777877814.git.sayalip@linux.ibm.com>
References: <cover.1777877814.git.sayalip@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDA4NyBTYWx0ZWRfXywl9X1qEtJHc
 Oczw2pCL4lBdIqeH1SHgl9hcBI87egrg131kbstLMqTMHX5Bo3L5JXaFMdv+EyZEpTjV5tbDjE7
 P8wE2I+fTaMnNzwh7A6+dCk9upi1osg59K+EFHsVvoKXKVjTXVIvIlkwIUYNrPs1ulN+L7D13X+
 frL5WzutqKjtLlEWKHK1Scu4PGeQga9f5LAFq39N+8uV3974Vo+OcRcv09kX3MR3VHZ2Xeb4/yN
 vtcQX/Loq0gb432/ezKA7PovazlCKzGjtkV3FAgX8VBkibFIqaHaJ0dFLUEy53HtHHW+3ghpSlc
 wwJneFcGPUUQadBRs0hhlXnMXlxFUVYTPX4ZRgeeAsQ8EvVZy1b7p46ATLS3vlA1S5nxP8wThtl
 t4mZTt9ODpcoZfg3rCCZfxTD1f1AeX1oSbpyODTbZvcZPy/7PArUlKIa8CWZT5pLz2IlNnZUtx3
 FCkXZhskgrBs5L99FSw==
X-Proofpoint-ORIG-GUID: _2-e7eOnbPa6i_3hbfvQf-8BMk2rYVbP
X-Proofpoint-GUID: 4OiJ5OPHpstloc0H0cI0s2lbxDnPBXL7
X-Authority-Analysis: v=2.4 cv=W7UIkxWk c=1 sm=1 tr=0 ts=69f857f4 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=uAbxVGIbfxUO_5tXvNgY:22 a=Ikd4Dj_1AAAA:8 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8
 a=7yu59zDboRqKFyXxuvEA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 spamscore=0 clxscore=1015 phishscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605040087

The hugetlb_reparenting_test.sh script constructs hugetlb cgroup
memory interface file names based on the configured huge page size. The
script formats the size only in MB units, which causes mismatches on
systems using larger huge pages where the kernel exposes normalized
units (e.g. "1GB" instead of "1024MB").

As a result, the test fails to locate the corresponding cgroup files
when 1GB huge pages are configured.

Update the script to detect the huge page size and select the
appropriate unit (MB or GB) so that the constructed paths match the
kernel's hugetlb controller naming.

Also print an explicit "Fail" message when a test failure occurs to
improve result visibility.

Fixes: e487a5d513cb ("selftest/mm: make hugetlb_reparenting_test tolerant to async reparenting")
Reviewed-by: Zi Yan <ziy@nvidia.com>
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Signed-off-by: Sayali Patil <sayalip@linux.ibm.com>
---
 .../selftests/mm/hugetlb_reparenting_test.sh       | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/mm/hugetlb_reparenting_test.sh b/tools/testing/selftests/mm/hugetlb_reparenting_test.sh
index 11f914831146..d724b6e45432 100755
--- a/tools/testing/selftests/mm/hugetlb_reparenting_test.sh
+++ b/tools/testing/selftests/mm/hugetlb_reparenting_test.sh
@@ -48,6 +48,13 @@ function get_machine_hugepage_size() {
 }
 
 MB=$(get_machine_hugepage_size)
+if (( MB >= 1024 )); then
+  UNIT="GB"
+  MB_DISPLAY=$((MB / 1024))
+else
+  UNIT="MB"
+  MB_DISPLAY=$MB
+fi
 
 function cleanup() {
   echo cleanup
@@ -88,6 +95,7 @@ function assert_with_retry() {
     if [[ $elapsed -ge $timeout ]]; then
       echo "actual = $((${actual%% *} / 1024 / 1024)) MB"
       echo "expected = $((${expected%% *} / 1024 / 1024)) MB"
+      echo FAIL
       cleanup
       exit 1
     fi
@@ -108,11 +116,13 @@ function assert_state() {
   fi
 
   assert_with_retry "$CGROUP_ROOT/a/memory.$usage_file" "$expected_a"
-  assert_with_retry "$CGROUP_ROOT/a/hugetlb.${MB}MB.$usage_file" "$expected_a_hugetlb"
+  assert_with_retry \
+	  "$CGROUP_ROOT/a/hugetlb.${MB_DISPLAY}${UNIT}.$usage_file" "$expected_a_hugetlb"
 
   if [[ -n "$expected_b" && -n "$expected_b_hugetlb" ]]; then
     assert_with_retry "$CGROUP_ROOT/a/b/memory.$usage_file" "$expected_b"
-    assert_with_retry "$CGROUP_ROOT/a/b/hugetlb.${MB}MB.$usage_file" "$expected_b_hugetlb"
+    assert_with_retry \
+	  "$CGROUP_ROOT/a/b/hugetlb.${MB_DISPLAY}${UNIT}.$usage_file" "$expected_b_hugetlb"
   fi
 }
 
-- 
2.52.0

