Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A5E732C94A;
	Thu, 16 Jul 2026 08:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784192111; cv=none; b=PKfY5+4bE7WFBhlGLjytrLIIEpF3wbzl5o2W0fdMb9cgcrrt3FncxnTTiqdAEeBIfL/K4wOigBC30DFfV7L9S5XUXnu8pNe/S5+BHW0hYL87e4VdCpB1WLybleIKS0A04M0yf2AUmzLaK7p2E3JXBW/4TerVb2egFg2beyJmJV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784192111; c=relaxed/simple;
	bh=gVjaclPmaRJRv2LynWYIFlM3IrKif5u+0vsDflKkl2s=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=I8W6r9lSPbxRjpdVDBLBw1AfL+3RLoZOzRShA7fCesbuii3UH7TgOIzb/MsqHm99BYWGcEFdWVZS3O8fhVxniWMHfEahgW/0jqwTC6FPjWpoQhsnjBbl2OwjudM3kvQ9Ckcijw2WjQOiAJt5Xtdn+pdtuF5ASy5ZjFafPgpS81A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=qK2zfUuH; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="qK2zfUuH"
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G7CNKZ2452923;
	Thu, 16 Jul 2026 08:55:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=sXZDNWPdoyPYb9fvxqm6JPjR5uFQ8FXQOsRdFIcpE
	5o=; b=qK2zfUuHmBfIzIv6gSiVgrvXG5pUIr4hD81oUsafwD5xXhEt3zB+I8t7e
	mNHCxfUj07p2YJz2bExuqoWQz8KddUcJaUecR7phJC6nNCqzgPwoMCb/cbHe/QSz
	ULbqEfxpX4VWkbsDX0EbKTP1TA6OBNjP+69P2UuE9Hg6IqdVDXQqyF0eRkblcXXW
	PiDJyncBkcsmDGCGTL5MSvxdp7pAJWrIxeBTWm+BO/pLMj8eFAf8cicG50MuV8T+
	4KMW3KC2pWoEzCkhm07+oQPeKiO1Rr6zR5uLD3HNNi9aFOL/NY4z5OERP3oiObaO
	RdeAZF41X60XdTrFX7Y4aM67NTNlg==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4fbf2af7bh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Jul 2026 08:55:06 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 66G8nmOr030242;
	Thu, 16 Jul 2026 08:55:05 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4fc2cgkyxv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Jul 2026 08:55:05 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 66G8t3a139190924
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 16 Jul 2026 08:55:03 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 80A8020040;
	Thu, 16 Jul 2026 08:55:03 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1E1D020043;
	Thu, 16 Jul 2026 08:55:02 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.47.86])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 16 Jul 2026 08:55:01 +0000 (GMT)
From: Sachin Sant <sachinp@linux.ibm.com>
To: linux-kselftest@vger.kernel.org
Cc: shuah@kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] selftests/zram: add configurable compression algorithm support
Date: Thu, 16 Jul 2026 14:25:01 +0530
Message-Id: <20260716085501.75522-1-sachinp@linux.ibm.com>
X-Mailer: git-send-email 2.39.1
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDA4OSBTYWx0ZWRfX1Dd7f5odCW9q
 eZMrm1I9Xsg0ZpDU+Tk1RnUfYteUTDnYAbtqSsXTgYqhlqR0OTyZTOUQcL0r56Fx4uWaq97bucu
 5LxHrSiDGoMtcIc6/J3YB5qopl7Cw0g=
X-Proofpoint-GUID: qJ-BKNP5kNI3LxJ_3znRFIXPsA16ncID
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDA4OSBTYWx0ZWRfX745TgQgIznDU
 PYXvXONV5mI7/GrF6D8WC8jUwU4rxcptAevfniwZGlKdWB6rNa9INMbYFnygnFmmAq6tE+DtHbQ
 VA4BUIZp+MJBsHuJ17aNCEJEKRXV2vPXP5al5BsfWkCOn6XeZDAZpV0tzBHZ3Dqn62ouYTA9jLt
 x7aFjDYMf6ok8A6Fy5ULTqDaIIEYTKqNTz/DKXkmlE9RNAnDXprGUMFQoUjbPJyGuZZQxQdJAXe
 Y0DzaaukXPgTYRxlo84+ryXUmvnyq6fNNppc0Gxvcv5hwY4IQXyRdoTXVn21OUk/C9pT8g/PuTd
 3IpRgw95lKrSMYZK0LRL14dZnDi9+S+fD4zuV9ycv48iw1Ne6jrCdopUv50h2uASdGsQCmY3KNb
 SVK83ytVIFufrZGvhvvZ+pPDPhG5Q1MOa1eWL2VP82TAO7gH9Ezy998uFNH9eBXS62d1W9+pBxT
 e+Gu5y6qRpNIy6JxO+Q==
X-Proofpoint-ORIG-GUID: qJ-BKNP5kNI3LxJ_3znRFIXPsA16ncID
X-Authority-Analysis: v=2.4 cv=PvajqQM3 c=1 sm=1 tr=0 ts=6a589c6a cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=VnNF1IyMAAAA:8 a=w33o_yTv940ESBUw3ZsA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_03,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0
 clxscore=1011 lowpriorityscore=0 spamscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160089

Allow the compression algorithm used by zram01.sh to be specified at
runtime rather than being hardcoded to 'lzo'.

- zram.sh: add -a <algorithm> option (default: lzo) and forward the
  chosen algorithm to zram01.sh
- zram01.sh: accept the algorithm as a positional argument, falling
  back to lzo when not provided
- zram_lib.sh: add zram_check_alg_support() helper that inspects
  /sys/block/zramN/comp_algorithm and exits with ksft_skip when the
  requested algorithm is not supported by the running kernel

This makes it straightforward to test non-default compressors (e.g.
zstd, 842) without modifying the test scripts.

Signed-off-by: Sachin Sant <sachinp@linux.ibm.com>
---
 tools/testing/selftests/zram/README      | 18 +++++++++++++++---
 tools/testing/selftests/zram/zram.sh     | 21 ++++++++++++++++++++-
 tools/testing/selftests/zram/zram01.sh   |  5 ++++-
 tools/testing/selftests/zram/zram_lib.sh | 20 ++++++++++++++++++++
 4 files changed, 59 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/zram/README b/tools/testing/selftests/zram/README
index 82921c75681c..e3a230afb8c7 100644
--- a/tools/testing/selftests/zram/README
+++ b/tools/testing/selftests/zram/README
@@ -18,11 +18,23 @@ CONFIG_ZSMALLOC=y
 
 ZRAM Testcases
 --------------
-zram_lib.sh: create library with initialization/cleanup functions
-zram.sh: For sanity check of CONFIG_ZRAM and to run zram01 and zram02
+zram_lib.sh: library with initialization/cleanup functions and helpers;
+             includes zram_check_alg_support() which verifies a requested
+             compression algorithm is available and exits with ksft_skip
+             when it is not.
+zram.sh: sanity check of CONFIG_ZRAM; runs zram01 and zram02.
+         Accepts an optional -a <algorithm> flag (default: lzo) to select
+         the compression algorithm forwarded to zram01.sh.
+         Usage: zram.sh [-a <algorithm>]
+           -a <algorithm>  compression algorithm to test (default: lzo)
+                           must be listed in /sys/block/zramN/comp_algorithm
+           -h              show help message
 
 Two functional tests: zram01 and zram02:
-zram01.sh: creates general purpose ram disks with ext4 filesystems
+zram01.sh: creates general purpose ram disks with ext4 filesystems.
+           Accepts the compression algorithm as an optional first positional
+           argument (default: lzo).  Verifies kernel support for the
+           requested algorithm before running.
 zram02.sh: creates block device for swap
 
 Commands required for testing:
diff --git a/tools/testing/selftests/zram/zram.sh b/tools/testing/selftests/zram/zram.sh
index b0b91d9b0dc2..a8a32a184adb 100755
--- a/tools/testing/selftests/zram/zram.sh
+++ b/tools/testing/selftests/zram/zram.sh
@@ -4,11 +4,30 @@ TCID="zram.sh"
 
 . ./zram_lib.sh
 
+usage()
+{
+	echo "Usage: $0 [-a <algorithm>]"
+	echo "  -a <algorithm>  compression algorithm to test (default: lzo)"
+	echo "                  must be listed in /sys/block/zramN/comp_algorithm"
+	echo "  -h              show this help message"
+}
+
+ZRAM_ALG="lzo"
+
+while getopts "a:h" opt; do
+	case "$opt" in
+	a) ZRAM_ALG="$OPTARG" ;;
+	h) usage; exit 0 ;;
+	*) echo "Unknown option: $opt" >&2; usage; exit 1 ;;
+	esac
+done
+shift $((OPTIND - 1))
+
 run_zram () {
 echo "--------------------"
 echo "running zram tests"
 echo "--------------------"
-./zram01.sh
+./zram01.sh "$ZRAM_ALG"
 echo ""
 ./zram02.sh
 }
diff --git a/tools/testing/selftests/zram/zram01.sh b/tools/testing/selftests/zram/zram01.sh
index 8f4affe34f3e..070cc4162384 100755
--- a/tools/testing/selftests/zram/zram01.sh
+++ b/tools/testing/selftests/zram/zram01.sh
@@ -29,7 +29,9 @@ zram_max_streams="2"
 zram_sizes="2097152" # 2MB
 zram_mem_limits="2M"
 zram_filesystems="ext4"
-zram_algs="lzo"
+# Accept the compression algorithm as the first positional argument;
+# fall back to lzo when not provided.
+zram_algs="${1:-lzo}"
 
 zram_fill_fs()
 {
@@ -58,6 +60,7 @@ zram_fill_fs()
 
 check_prereqs
 zram_load
+zram_check_alg_support "$zram_algs" "$dev_start"
 zram_max_streams
 zram_compress_alg
 zram_set_disksizes
diff --git a/tools/testing/selftests/zram/zram_lib.sh b/tools/testing/selftests/zram/zram_lib.sh
index 21ec1966de76..d3762b497f91 100755
--- a/tools/testing/selftests/zram/zram_lib.sh
+++ b/tools/testing/selftests/zram/zram_lib.sh
@@ -30,6 +30,26 @@ check_prereqs()
 	fi
 }
 
+# zram_check_alg_support <alg> <dev_idx>
+# Verify <alg> appears in comp_algorithm of zram device <dev_idx>.
+# Must be called after zram_load so the device already exists.
+# Exits with ksft_skip if the algorithm is not supported by this kernel build.
+zram_check_alg_support()
+{
+	local alg=$1
+	local idx=$2
+
+	[ -z "$alg" ] && { echo "skip: no compression algorithm specified" >&2; \
+		zram_cleanup; exit $ksft_skip; }
+
+	if ! tr -d '[]' < /sys/block/zram${idx}/comp_algorithm 2>/dev/null \
+			| grep -qw "${alg}"; then
+		echo "skip: compression algorithm '$alg' is not available" >&2
+		zram_cleanup
+		exit $ksft_skip
+	fi
+}
+
 kernel_gte()
 {
 	major=${1%.*}
-- 
2.39.1

