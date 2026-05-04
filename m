Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C23332906;
	Mon,  4 May 2026 08:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777883181; cv=none; b=h8M0j53bdj0ekPWw4pHC9fs2jSr82Md+g/zt/HX5D+eLNs9kgpD3bbrkMOSF3bx/KGPBcharZfq8eH78GNKAzMtyAhWETxCWPjewRd3UHu3C0AuHE/LxK86fKtSfKHjKX26rIifHYLfVPhdfqu8LsOXzxaD7ievtxpYoaJVE9S4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777883181; c=relaxed/simple;
	bh=X+XeD8wv8lVEB9pfRm5RIAKNvChulS1SzbTA7AucSK0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IADX+7an8KY7mKFfVbgxoKBZFILpBuXQIZNaKWP0VCM23A+GQrsvVPRUZpI5fsLhbkPyvBMyshvP15d9d3dSVf4HTvaWYgIivI5M0HcpDl3pD0qROzJxlQs2hjrd2A3c+QonAAUUMoULtKQXqsWtQbc1NQW2qNXj+XFmxZSP4LM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=PKaUTGgX; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="PKaUTGgX"
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 643IFOgd2217751;
	Mon, 4 May 2026 08:25:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=7sMOd/dG1NiaDLjS+
	cqKrM96sk8qxd8owleS1MDG/Qs=; b=PKaUTGgX6CWCQyo8Rxaz4Ld8GDSoq3ajK
	Wc3D9GCh+wwRAoUqc7VDHVGwZuTzmLnoaKXpHCj+hsvRF1m696I1mT0KXWks/K9z
	kwN2ne+LkUggyxJDwDVEW9eBgomgpNwqSEn2kLx7t3gO30QXfKckCKE31WWq5LhE
	vFUQbmh+Lw6ODGism2L3lJ3dzWUWN/c/SSYlgVzAsWi1vbjHdgDJKDNIYGey7ggH
	HyN8TBqiMZKOKemVbHx5MGy89I81Ld7JJVzLzokxR7ma+CNGa+F8o/68MRH2Jnkw
	4Z8I3ErmWmnafdrlMRZG3AB50lZAhqJFB37hOmC6k2Y76guNK0WAA==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4dw9x4e3ss-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 May 2026 08:25:55 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 6448OOK6023544;
	Mon, 4 May 2026 08:25:54 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4dwuyvveav-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 May 2026 08:25:54 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6448PoQq26018430
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 4 May 2026 08:25:50 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6306220040;
	Mon,  4 May 2026 08:25:50 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 429922004F;
	Mon,  4 May 2026 08:25:47 +0000 (GMT)
Received: from li-3f69264c-2ce6-11b2-a85c-c3f414d24014.bl1-in.ibm.com (unknown [9.123.3.209])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  4 May 2026 08:25:47 +0000 (GMT)
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
Subject: [PATCH v6 13/14] selftests/mm: move hwpoison setup into run_test() and silence modprobe output for memory-failure category
Date: Mon,  4 May 2026 13:54:50 +0530
Message-ID: <9e9311d38fea425c2dcd2e470b2fd3fd8cfa9ab8.1777877814.git.sayalip@linux.ibm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDA4NyBTYWx0ZWRfX3AHtey9TXtYI
 QS+mn2VE8RMbVTjsVqKaHXOtdG5apUIG2eIkQRYj6AAj7u29ec+ClUNe1LaJZuPEvXdQToYBc/s
 dx9NhYmizj1oVmfV6dkOCTLKC5u9EStpJdIAxepD9VZ71jJiVpGeMhzojH3XWhjFJ3BfnDQnCm8
 jx7hjwvkZAccEy4oanpsKFrPiqCyCwZ7UytFkH8+HktIFwMi1GFeT+Cu8yXmOocIDYdwOvUoGH6
 FcO5SJ8zbJrA2HMsspd8/db7wYxnB7m+UYb1GY161wCl+cHf6whEDvRo2N0bfj27M/AkcJZKq/W
 Wd9kdm75vvzqKqxdapbFMiNbCFDwSoGf2gpiA8BAQUVipyIxEHZUxMYF50Dqtiaw+6b3IBMoz5x
 AXA17pHGt9EFMwQwWnwXfKsXqrHwxNambAfvUZwE9AwHYveIeLCTVC5oVjqrB1u+qRLnZ5p53zm
 T4u6AmnWqgAC2mpa4Fw==
X-Proofpoint-ORIG-GUID: W8O1pE6c-MoXV22amZJYrTuOmP-JEFb_
X-Proofpoint-GUID: Sx1on6rqWfyN_wjo241OLRPuxikZhmjD
X-Authority-Analysis: v=2.4 cv=W7UIkxWk c=1 sm=1 tr=0 ts=69f85813 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=uAbxVGIbfxUO_5tXvNgY:22 a=i0EeH86SAAAA:8 a=VnNF1IyMAAAA:8
 a=w_JUWIshtjp1QPcyv1YA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 spamscore=0 clxscore=1015 phishscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605040087

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

Also, ensure that skipped tests do not override a previously recorded
failure. A skipped test currently sets exitcode to ksft_skip even if a
prior test has failed, which can mask failures in the final exit status.
Update the logic to only set exitcode to ksft_skip when no failure has
been recorded.

Fixes: ff4ef2fbd101 ("selftests/mm: add memory failure anonymous page test")
Reviewed-by: Miaohe Lin <linmiaohe@huawei.com>
Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Signed-off-by: Sayali Patil <sayalip@linux.ibm.com>
---
 tools/testing/selftests/mm/run_vmtests.sh | 52 ++++++++++++++---------
 1 file changed, 33 insertions(+), 19 deletions(-)

diff --git a/tools/testing/selftests/mm/run_vmtests.sh b/tools/testing/selftests/mm/run_vmtests.sh
index d8468451b3a3..eb6f0ae48cc7 100755
--- a/tools/testing/selftests/mm/run_vmtests.sh
+++ b/tools/testing/selftests/mm/run_vmtests.sh
@@ -235,6 +235,7 @@ pretty_name() {
 run_test() {
 	if test_selected ${CATEGORY}; then
 		local skip=0
+		local LOADED_HWPOISON_INJECT_MOD=0
 
 		# On memory constrainted systems some tests can fail to allocate hugepages.
 		# perform some cleanup before the test for a higher success rate.
@@ -250,6 +251,28 @@ run_test() {
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
+					LOADED_HWPOISON_INJECT_MOD=1
+					if [ ! -d "$HWPOISON_DIR" ]; then
+						echo "hwpoison debugfs interface not present" \
+							| tap_prefix
+						skip=1
+					fi
+				fi
+			fi
+
+		fi
+
 		local test=$(pretty_name "$*")
 		local title="running $*"
 		local sep=$(echo -n "$title" | tr "[:graph:][:space:]" -)
@@ -261,6 +284,12 @@ run_test() {
 		else
 			local ret=$ksft_skip
 		fi
+
+		# Unload hwpoison_inject if we loaded it
+		if [ "${LOADED_HWPOISON_INJECT_MOD}" = "1" ]; then
+			modprobe -r hwpoison_inject > /dev/null 2>&1
+		fi
+
 		count_total=$(( count_total + 1 ))
 		if [ $ret -eq 0 ]; then
 			count_pass=$(( count_pass + 1 ))
@@ -270,7 +299,9 @@ run_test() {
 			count_skip=$(( count_skip + 1 ))
 			echo "[SKIP]" | tap_prefix
 			echo "ok ${count_total} ${test} # SKIP" | tap_output
-			exitcode=$ksft_skip
+			if [ $exitcode -eq 0 ]; then
+				exitcode=$ksft_skip
+			fi
 		else
 			count_fail=$(( count_fail + 1 ))
 			echo "[FAIL]" | tap_prefix
@@ -531,24 +562,7 @@ CATEGORY="page_frag" run_test ./test_page_frag.sh nonaligned
 
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

