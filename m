Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70BD14534A7;
	Tue, 10 Mar 2026 09:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773136293; cv=none; b=QhP5gROVg/+BjBYJN1u3aL4Thpr7+Sezif+8/Elm6UiQjswaF+Xg/x6OdXAOGU8dhOX1/XOqBK8AiyvLzilV0F52y94VaPD8xV6JqDu6kQllzOfYxBWOsSpUUcI7ehlS1fDBnMt53pPyfSw96J3XwI/V8ugkn9jHbwuGaZePlZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773136293; c=relaxed/simple;
	bh=ChJ+72TBHq1/rdTNacsmENOeRAyjpI3goZWRGjYET9Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h8zNnC9UddC1crDGpPmFOM75loYPY4xoA8QUw7t/eeCjp7awB0uZwLoiT2Hi8VR9Uk7LQjOBl/FF1rJ23jCkFxZFRqx+HtFrqprpGUZFV55KihBLiEQxVm8kdSkZrmUQCo5w4p5m3wBgz4q2KCzqsLdnZRymKrU/ARO8hcRVYOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=UiOFILfC; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="UiOFILfC"
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A8l1K71614605;
	Tue, 10 Mar 2026 09:51:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=mFZ5GFeFVXZ38R8tw
	OevOvM1H9fWi9PYppF6Ptlmi5E=; b=UiOFILfC5J3Ab17X3gGxflsmQcBDijtMm
	r44NfBJjw2SLt4W2HbZsIpAKUdsFCn8I/0xxFv9ZfD3uWw5vx+J+bcJNzuYWHXmW
	pfTas1CJ3UP+gyjz1m/ybEgbREH8Rgu1Xezab+W/yaypC1e6BHoBpj/G0FewjshF
	DuCw1FiKpkpTwc+yR8uQ+IWIKA9hkZawXOu2ofOBBlvuPmi/5sOyogDKczuJVBpI
	20VoSTrhCvG9/WS1vFzYGBewjOkI3uCJFpK/yZ3JtlqAyGWj+/Uxt6WUKG5f7fWr
	0hp5DOHIAMsvf7w2OvUZrxFw5yn5SyznRvL7NujOkI3GY10jhDG7Q==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4crcvra0ep-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Mar 2026 09:51:13 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 62A6293T021150;
	Tue, 10 Mar 2026 09:51:12 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4crxbsrphf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Mar 2026 09:51:12 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 62A9pANE45678902
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 10 Mar 2026 09:51:10 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C8C5F2004E;
	Tue, 10 Mar 2026 09:51:10 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 100DE20043;
	Tue, 10 Mar 2026 09:51:08 +0000 (GMT)
Received: from li-3f69264c-2ce6-11b2-a85c-c3f414d24014.in.ibm.com (unknown [9.109.243.201])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 10 Mar 2026 09:51:07 +0000 (GMT)
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
Subject: [PATCH 12/13] selftests/mm: move hwpoison setup into run_test() and silence modprobe output for memory-failure category
Date: Tue, 10 Mar 2026 15:19:30 +0530
Message-ID: <832afc6c34a784ca433b506622cdc98fe9540f79.1773134177.git.sayalip@linux.ibm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA4MSBTYWx0ZWRfX2CrdpGMRQims
 RElM+X/zRjmzCOo7XKlYXylZy9a8VZNg5q2KepbArMXRW6xAv+D6mYxYpqhiSbygkSetCWnNMr9
 5dBreRxvOqtUCWgZ2JqpvxjibbZiMW6snkaxEvluIZpreXbpS7nA9o5BJyi40wzpIx7EacupNum
 YwXh+WRxVMVvyLFLEIRrOu2BK5lHQyYr85oOsUxwNhbZR0U2dBAf6UfPy238yJDVl5Res+gU2Rd
 xTmTBY5lvC2aRhkvbiI7h6qqu5bEUN8f7LWn4utZWOo+tFh1PJ4V/Uk7D6dYh0T11m6Cmb6yy4I
 K2TnOdmWrf7svYaF6QuxA4gwndcqv9/SBvwjAIXclo53szESLusB4mOE5yiIlDxGaKJOH60qYSH
 i/IB+ggXCe5witT3mDBw/NVUIQYPdhSfJ9hbA4zgM9mDzUXGOcuWRrLEUotsLfwWuEXOZnDVZJQ
 dORMxeCYQrOxJ95FDXg==
X-Proofpoint-GUID: L4RR84Cg68OZjg6O2hsxkmISFRLM4WbV
X-Proofpoint-ORIG-GUID: 2GJK7lkJexS3_-jhQzeHAovAC4WSrcIv
X-Authority-Analysis: v=2.4 cv=QoFTHFyd c=1 sm=1 tr=0 ts=69afe991 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=RzCfie-kr_QcCd8fBx8p:22 a=VnNF1IyMAAAA:8 a=DyNJ62oFE8-pT6vY3_0A:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603100081

run_vmtests.sh contains special handling to ensure the hwpoison_inject
module is available for the memory-failure tests. This logic was
implemented outside of run_test(), making the setup category-specific
but managed globally.

Move the hwpoison_inject handling into run_test() and restrict it
to the memory-failure category so that:
1. the module is checked and loaded only when memory-failure tests run,
2. the test is skipped if the module or the debugfs interface
(/sys/kernel/debug/hwpoison/) is not available.
3. the module is unloaded after the test if it was loaded by the script.

This localizes category-specific setup and makes the test flow
consistent with other per-category preparations.

While updating this logic, fix the module availability check.
The script previously used:

	modprobe -R hwpoison_inject

The -R option prints the resolved module name to stdout, causing every
run to print:

	hwpoison_inject

in the test output, even when no action is required, introducing
unnecessary noise.

Replace this with:

	modprobe -n hwpoison_inject

which verifies that the module is loadable without producing output,
keeping the selftest logs clean and consistent.

Fixes: ff4ef2fbd101 ("selftests/mm: add memory failure anonymous page test")
Signed-off-by: Sayali Patil <sayalip@linux.ibm.com>
---
 tools/testing/selftests/mm/run_vmtests.sh | 46 ++++++++++++++---------
 1 file changed, 28 insertions(+), 18 deletions(-)

diff --git a/tools/testing/selftests/mm/run_vmtests.sh b/tools/testing/selftests/mm/run_vmtests.sh
index 7273c3e18227..7f3a3027cd9a 100755
--- a/tools/testing/selftests/mm/run_vmtests.sh
+++ b/tools/testing/selftests/mm/run_vmtests.sh
@@ -250,6 +250,27 @@ run_test() {
 			fi
 		fi
 
+		# Ensure hwpoison_inject is available for memory-failure tests
+		if [ "${CATEGORY}" = "memory-failure" ]; then
+			# Try to load hwpoison_inject if not present.
+			HWPOISON_DIR=/sys/kernel/debug/hwpoison/
+			if [ ! -d "$HWPOISON_DIR" ]; then
+				if ! modprobe -n hwpoison_inject > /dev/null 2>&1; then
+					echo "Module hwpoison_inject not found, skipping..." \
+						| tap_prefix
+					skip=1
+				else
+					modprobe hwpoison_inject > /dev/null 2>&1
+					LOADED_MOD=1
+				fi
+			fi
+
+			if [ ! -d "$HWPOISON_DIR" ]; then
+				echo "hwpoison debugfs interface not present" | tap_prefix
+				skip=1
+			fi
+		fi
+
 		local test=$(pretty_name "$*")
 		local title="running $*"
 		local sep=$(echo -n "$title" | tr "[:graph:][:space:]" -)
@@ -261,6 +282,12 @@ run_test() {
 		else
 			local ret=$ksft_skip
 		fi
+
+		# Unload hwpoison_inject if we loaded it
+		if [ -n "${LOADED_MOD}" ]; then
+			modprobe -r hwpoison_inject > /dev/null 2>&1
+		fi
+
 		count_total=$(( count_total + 1 ))
 		if [ $ret -eq 0 ]; then
 			count_pass=$(( count_pass + 1 ))
@@ -540,24 +567,7 @@ CATEGORY="page_frag" run_test ./test_page_frag.sh nonaligned
 
 CATEGORY="rmap" run_test ./rmap
 
-# Try to load hwpoison_inject if not present.
-HWPOISON_DIR=/sys/kernel/debug/hwpoison/
-if [ ! -d "$HWPOISON_DIR" ]; then
-	if ! modprobe -q -R hwpoison_inject; then
-		echo "Module hwpoison_inject not found, skipping..."
-	else
-		modprobe hwpoison_inject > /dev/null 2>&1
-		LOADED_MOD=1
-	fi
-fi
-
-if [ -d "$HWPOISON_DIR" ]; then
-	CATEGORY="memory-failure" run_test ./memory-failure
-fi
-
-if [ -n "${LOADED_MOD}" ]; then
-	modprobe -r hwpoison_inject > /dev/null 2>&1
-fi
+CATEGORY="memory-failure" run_test ./memory-failure
 
 if [ "${HAVE_HUGEPAGES}" = 1 ]; then
 	echo "$orig_nr_hugepgs" > /proc/sys/vm/nr_hugepages
-- 
2.52.0

