Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C48136729F;
	Thu, 21 May 2026 06:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779346116; cv=none; b=uNpuom9sZb89meK+aX3TUM1wZPpEAH/7YiRPXZRmC5vNBssVt4TBzi+wM9psiMHaAOlnBfIBv0nIuRmyXFvF9YuQXv94wvb50hU4VB+DOZOS+ekA81SARGVxvnB/LG0j+YN+q3Q1T8DjHF48FwVW2F1eTPiVbpmLBlOjCgNkZ+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779346116; c=relaxed/simple;
	bh=6k0dfBPedoZ5m3zDYQfNpVT7vuiVKssNtYmRQNfyMxo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gvg3jLq87ZdrtjIATCXYie632iwUNIbpyJmkLJJsjeI3LNmzX+ef8aX5xLPtATzjpJmPvFIKDCWcdn/MwpA9i+ibP1IixrMhmVWCCSzZWV2CFKHqn+SQsP3BVascOho97bXLqtRzv7OzoF6F92GlufOnoPo8WfhSn5COPCtg8Bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=eMB8yAFv; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="eMB8yAFv"
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L2v5It3972669;
	Thu, 21 May 2026 06:48:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=9bpngp4LuWeNJI7hh
	OZ15/SZJ6KlaN1MsO0YmwThcC0=; b=eMB8yAFvqWJ8icmRD3+8j++Y5KumPwpXN
	dE4ST32ynNHWqTQBaiA4BArpZaUBQm2yoQWDDj0Jcs6DaVByMx7W7F5VwNrb283T
	Da4uwu9T5/CcVtXaXtCGC3IbxLmSfqwVowlIrXO6UBPrSyl/YdCDZJ7lx73nXZN2
	W5V3W8oD+GcP7IRRPaFNKLLR7vQCru14y3xdo/auLrkcBCFWTHhm4EG6EU+vW6rx
	wJxIeBS77kRJOEghNsE6UOsnMqTSOaCwtuie7aT5etSMgqNwYmneKhkJJCcYXCtI
	6K6UKSmw/n6CEYsgmVsx0jcn44fMeZogrwnAZG57aPttaer6gdipQ==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4e6h9y5k68-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 May 2026 06:48:09 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 64L6d40A003561;
	Thu, 21 May 2026 06:48:08 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4e754gjksw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 May 2026 06:48:08 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 64L6m4Om48824598
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 21 May 2026 06:48:04 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B5C012004D;
	Thu, 21 May 2026 06:48:04 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E015620040;
	Thu, 21 May 2026 06:48:01 +0000 (GMT)
Received: from li-3f69264c-2ce6-11b2-a85c-c3f414d24014.bl1-in.ibm.com (unknown [9.123.3.209])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 21 May 2026 06:48:01 +0000 (GMT)
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
Subject: [PATCH v7 04/13] selftests/mm: fix hugetlb pathname construction in hugetlb_reparenting_test.sh
Date: Thu, 21 May 2026 12:17:44 +0530
Message-ID: <837ce751965c93f74c95d89587debf1e93281364.1779296493.git.sayalip@linux.ibm.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1779296493.git.sayalip@linux.ibm.com>
References: <cover.1779296493.git.sayalip@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA2MiBTYWx0ZWRfX8tCfmpVxwOYZ
 fNCRcgg19UxXoHi3+n4Wk4wqYjkM4vVVHlB84htGCdm2YQqRngrIfI/EZxflS9TcY17B9zUNyNZ
 DX8AH21HzYFsoFeZ1hyfPHiU62oTjq9wi88K88sckV3IZk9VijWyefuLX39fYbkMQZDYh+EvEJy
 GmkLk3LIqtWkYBnIHpMrJeoaeGh1jtcqFTJHrMgeekHnWIAImH5K7ssc4e7C/EWkyto1IQPTgOS
 4ZmlDqs4AZ/otw06NW/OOwKsXhWZC8vg5K6Eh6NQAQi58wP9bhnQNj6FpN/ozqvmzb3Bz32aYKr
 ylLkPOSYdwVJxZtrRwZlQDTCyIFBjOKzwsREtEa0bfo8LTnOJDj1DRL8ebfi6s2xwq7Z6SJHEcG
 76gq0lbspWEy13PMkBKKxQqk6Ue5HjA4mTb4jTmc7OK57gaoL/SOKn9PSb+QmxuTBxWJgYc2x8h
 1YTPeg8E8lZpySM12wg==
X-Authority-Analysis: v=2.4 cv=BNuDalQG c=1 sm=1 tr=0 ts=6a0eaaa9 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=iQ6ETzBq9ecOQQE5vZCe:22 a=Ikd4Dj_1AAAA:8 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8
 a=7yu59zDboRqKFyXxuvEA:9
X-Proofpoint-ORIG-GUID: pICns9u6T883Qo12vo5EruQsdOhLvWbs
X-Proofpoint-GUID: CYXlI0-YC_WZTxCdHj1tzX9j09-hsPxm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210062

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

