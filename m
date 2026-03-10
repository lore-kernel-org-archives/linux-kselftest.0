Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5899C42EED5;
	Tue, 10 Mar 2026 09:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773136268; cv=none; b=THnAWHFZr9YrUgyiAQ3Xsz/HpUNaLvrihoqEkQx64XlzraJiSWtbUTrYVzWZpdlia9vo0Kyu7EINdcF6BCmMj4rjIfUlnngaSIlsggeudtBxanqdUyKJrsBzcQQwMQofAeWuFyRQpoDUrQSHwtAMZKopeAVr9/hBQ0erWUWRHIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773136268; c=relaxed/simple;
	bh=OryaizYYU5XZOpX7y5406tgCoJZwA8NbT90u5y/Ezco=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=acOGL934/H24S8/25J1y8xw22FwI8QNt4II8+bFsAVFnrEugPPuzYhi/EKyb4XhbO04CNuGueNpEAfuFHrjJ6TOQmbyyuR0RK8PGcw1CaGsXDMhuklC2uN7puO0W8DmG91paXrBodPI33Ax1ea9+26E3b9ILdTYZeNj5EFfZjmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=WLBhDIdz; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="WLBhDIdz"
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A99T6i1605875;
	Tue, 10 Mar 2026 09:50:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=AD4YswwSBlyZM8CT/
	6+uVVUNsQJ3n0kUdUVDGfHBlNM=; b=WLBhDIdzdO80EQ3iVn1fjB/93mdBttJfV
	SDVL4Ten8f+Z50lCzcgP9SI9HYr7bSIth396Ps9y4UGVbWbr20GAs+Vmmj47HNHY
	FNv4vrB5fSWXGVhftVFHY5IPAZYUDNxcUNJxCMbbrxFKpKyLxE2mGaYmMjm4qFCZ
	sG9p+MpOcrsxOainaB+k3XzQG26vufNcLZELMeyPe71Jb+ZOGBZWYcbTQQD6ijvC
	idWGz6K9bVImUewFilB66R47i3HKOZObRTdWh7qGvUUy07O9iq0iYLDvwlKZEs7U
	M08VuIxFyv+ZWuVsSBWIoMZbZaRKCP5nnpXa90Jnei+9RkTL8MLPw==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4crcuya9cw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Mar 2026 09:50:47 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 62A6FAn8023022;
	Tue, 10 Mar 2026 09:50:46 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4ct8ng1gh6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Mar 2026 09:50:46 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 62A9oiHU17301884
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 10 Mar 2026 09:50:44 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0FAE12004B;
	Tue, 10 Mar 2026 09:50:44 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 401652004F;
	Tue, 10 Mar 2026 09:50:41 +0000 (GMT)
Received: from li-3f69264c-2ce6-11b2-a85c-c3f414d24014.in.ibm.com (unknown [9.109.243.201])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 10 Mar 2026 09:50:41 +0000 (GMT)
From: Sayali Patil <sayalip@linux.ibm.com>
To: Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org,
        Ritesh Harjani <ritesh.list@gmail.com>
Cc: David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>,
        Michal Hocko <mhocko@kernel.org>, Oscar Salvador <osalvador@suse.de>,
        Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
        Dev Jain <dev.jain@arm.com>,
        Muhammad Usama Anjum <usama.anjum@collabora.com>,
        Liam.Howlett@oracle.com, Sayali Patil <sayalip@linux.ibm.com>
Subject: [PATCH 04/13] selftest/mm: fix cgroup task placement and tolerance in hugetlb_reparenting_test.sh
Date: Tue, 10 Mar 2026 15:19:22 +0530
Message-ID: <f3e1599ae0235e0c41bc1033a3d90fb71d2e3cab.1773134177.git.sayalip@linux.ibm.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1773134177.git.sayalip@linux.ibm.com>
References: <cover.1773134177.git.sayalip@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=EK4LElZC c=1 sm=1 tr=0 ts=69afe977 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=uAbxVGIbfxUO_5tXvNgY:22 a=VnNF1IyMAAAA:8 a=xMJXvFkxX-leA7mnJxkA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA4MSBTYWx0ZWRfX4RbQ4n/m2AHh
 HzRxWYVayAdcXxfI3vN4RYgrxw0I4HRsvuSj4hxoA7twlDxWG7ATuNSUCmH7O3HNLQMNfoSqAVZ
 Cpy6/upFfuYWyRjdEderNODDOg0efCCO7wy4rgeukjEL7bSjSrHCrvXzWGU0YfGTColE6huRKhr
 tNTN38RDcdf5V9hVmfVvGcBD13D0kCdbybcUal2qrMnnyZkdkeV2GcantLHYJHAuDRXT4Zu3uEl
 FQPP3+Y6hdp5ZJ5sduBI6QrfnXJKE3QUuk91JfSVHJ2n0YvFPYxVUhBYrpGSd/1hMcGNQlKIStZ
 +tiOTZKqsQ6mBHCJUiHnAB15LOESNi5M8WBZ8GUJnFHmK2av/QsMR9DPJTXLSxdz9MVRAbIH8AA
 zmIsK1E/WZEiaxXanM5T/st9QjrHhcudCmIow8q5kCa2seqN+rf0V2Hvw8cjwRcCvE+5larET02
 61I7NBnmhvXvJ6aPT6A==
X-Proofpoint-GUID: mCP2mb1eWo_shJd4iEsgXWCesxVYrpo2
X-Proofpoint-ORIG-GUID: 5_wfKN4kDDtWIMfGK8yytkqVhKAP8RKh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1015
 bulkscore=0 impostorscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100081

Launch write_to_hugetlbfs as a separate process and move only its PID
into the target cgroup before waiting for completion. This avoids moving
the test shell itself, prevents unintended charging to the shell, and
ensures hugetlb and memcg accounting is attributed only to the intended
workload.

Add a short delay before the hugetlb allocation to avoid a race where
memory may be charged before the task migration takes effect, which
can lead to incorrect accounting and intermittent test failures.

Also increase the assert_with_retry() tolerance from 7MB to 8MB. With
MEMCG_CHARGE_BATCH=64U and a 64K base page size, per-CPU batching can
result in up to 8MB of temporary charge being attributed to the parent.
The previous 7MB threshold could be exceeded, causing false failures;
raise the limit to cover the maximum expected batched charge.

Fixes: 29750f71a9b4 ("hugetlb_cgroup: add hugetlb_cgroup reservation tests")
Signed-off-by: Sayali Patil <sayalip@linux.ibm.com>
---
 .../selftests/mm/hugetlb_reparenting_test.sh    | 17 ++++++++---------
 tools/testing/selftests/mm/write_to_hugetlbfs.c |  5 ++++-
 2 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/tools/testing/selftests/mm/hugetlb_reparenting_test.sh b/tools/testing/selftests/mm/hugetlb_reparenting_test.sh
index 073a71fa36b4..9c79ad69e4c6 100755
--- a/tools/testing/selftests/mm/hugetlb_reparenting_test.sh
+++ b/tools/testing/selftests/mm/hugetlb_reparenting_test.sh
@@ -70,7 +70,7 @@ function cleanup() {
 function assert_with_retry() {
   local actual_path="$1"
   local expected="$2"
-  local tolerance=$((7 * 1024 * 1024))
+  local tolerance=$((8 * 1024 * 1024))
   local timeout=20
   local interval=1
   local start_time
@@ -153,18 +153,17 @@ write_hugetlbfs() {
   local size="$3"
 
   if [[ $cgroup2 ]]; then
-    echo $$ >$CGROUP_ROOT/$cgroup/cgroup.procs
+    cg_file="$CGROUP_ROOT/$cgroup/cgroup.procs"
   else
     echo 0 >$CGROUP_ROOT/$cgroup/cpuset.mems
     echo 0 >$CGROUP_ROOT/$cgroup/cpuset.cpus
-    echo $$ >"$CGROUP_ROOT/$cgroup/tasks"
-  fi
-  ./write_to_hugetlbfs -p "$path" -s "$size" -m 0 -o
-  if [[ $cgroup2 ]]; then
-    echo $$ >$CGROUP_ROOT/cgroup.procs
-  else
-    echo $$ >"$CGROUP_ROOT/tasks"
+    cg_file="$CGROUP_ROOT/$cgroup/tasks"
   fi
+
+  # Spawn write_to_hugetlbfs in a separate task to ensure correct cgroup accounting
+  ./write_to_hugetlbfs -p "$path" -s "$size" -m 0 -o -d & pid=$!
+  echo "$pid" > "$cg_file"
+  wait "$pid"
   echo
 }
 
diff --git a/tools/testing/selftests/mm/write_to_hugetlbfs.c b/tools/testing/selftests/mm/write_to_hugetlbfs.c
index ecb5f7619960..6b01b0485bd0 100644
--- a/tools/testing/selftests/mm/write_to_hugetlbfs.c
+++ b/tools/testing/selftests/mm/write_to_hugetlbfs.c
@@ -83,7 +83,7 @@ int main(int argc, char **argv)
 	setvbuf(stdout, NULL, _IONBF, 0);
 	self = argv[0];
 
-	while ((c = getopt(argc, argv, "s:p:m:owlrn")) != -1) {
+	while ((c = getopt(argc, argv, "s:p:m:owlrnd")) != -1) {
 		switch (c) {
 		case 's':
 			if (sscanf(optarg, "%zu", &size) != 1) {
@@ -118,6 +118,9 @@ int main(int argc, char **argv)
 		case 'n':
 			reserve = 0;
 			break;
+		case 'd':
+			sleep(1);
+			break;
 		default:
 			errno = EINVAL;
 			perror("Invalid arg");
-- 
2.52.0

