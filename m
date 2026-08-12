Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC20B30E0F8;
	Wed, 12 Aug 2026 13:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786540933; cv=none; b=OsqFpY2Upa8v8G3wa8k/qJPF0clAVEKh3syPGjCH0NVYs2Ig2Fv6Xd9INlgtsevguy/Cti2m00qgnSJDkCtkdUp2bYSGiB7AoACo6orXtG4CqRLGV1J64bcCqQcJZuhjVEixmg5SojDssZVo93OA/5ihI809w04hjj8PX5gs+QY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786540933; c=relaxed/simple;
	bh=K8TsmcJr3e0nFwUxYakmz0erhlJ3GqhTWcYqhPstwBA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DcEar+LdyA3UaunLQQPpxTv2dCxwoBH/QdDvnNlvwV1rpIGXI6X4OxgopHC8B0zvf0DCVZ01bb9QOpxB9TzMRgAFhfa/j4G/t4hCLxJenaZRQVPWBXVUKw3p5AgMgKVX9ZDh9AZMsj8TadcwwLSrjBKpzCW0jro9+TYS0rs7LyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: cce0d8f4965011f1aa26b74ffac11d73-20260812
X-CTIC-Tags:
	HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NAME, HR_CC_NO_NAME, HR_CTE_8B
	HR_CTT_MISS, HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_NAME
	HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM, HR_SJ_PHRASE
	HR_SJ_PHRASE_LEN, HR_SJ_WS, HR_TO_COUNT, HR_TO_DOMAIN_COUNT, HR_TO_NO_NAME
	IP_UNTRUSTED, SRC_UNTRUSTED, IP_UNFAMILIAR, SRC_UNFAMILIAR, DN_TRUSTED
	SRC_TRUSTED, SA_TRUSTED, SA_EXISTED, SN_TRUSTED, SN_EXISTED
	SPF_NOPASS, DKIM_NOPASS, DMARC_NOPASS, CIE_BAD, CIE_GOOD_SPF
	CIE_UNKNOWN, GTI_FG_BS, GTI_RG_INFO, GTI_C_BU, AMN_GOOD
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:eb037276-518a-4fcc-b759-db01d5c8f2df,IP:10,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:10
X-CID-INFO: VERSION:1.3.12,REQID:eb037276-518a-4fcc-b759-db01d5c8f2df,IP:10,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:10
X-CID-META: VersionHash:e7bac3a,CLOUDID:5fdead9ffa7f0d485e2d6fac3d78819d,BulkI
	D:260812212203Q0F9UBRJ,BulkQuantity:0,Recheck:0,SF:17|19|38|66|78|102|127|
	865|898,TC:nil,Content:0|15|50,EDM:-3,IP:-2,URL:0,File:nil,RT:nil,Bulk:nil
	,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:
	0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: cce0d8f4965011f1aa26b74ffac11d73-20260812
X-User: husong@kylinos.cn
Received: from ctao-book.. [(111.162.215.50)] by mailgw.kylinos.cn
	(envelope-from <husong@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1436825829; Wed, 12 Aug 2026 21:22:00 +0800
From: Song Hu <husong@kylinos.cn>
To: linux-mm@kvack.org,
	akpm@linux-foundation.org
Cc: shuah@kernel.org,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Song Hu <husong@kylinos.cn>
Subject: [PATCH] selftests/mm: emit KTAP output from ksft_kmemleak_dedup
Date: Wed, 12 Aug 2026 21:21:41 +0800
Message-ID: <20260812132142.582390-1-husong@kylinos.cn>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ksft_kmemleak_dedup.sh reports its result with raw "SKIP:"/"FAIL":"PASS:"
echoes and bare exit codes instead of KTAP, so parse_kselftest.py cannot
read it.  Convert it to the ktap_helpers.sh API, like its sibling
ksft_kmemleak_confirm.sh.

Signed-off-by: Song Hu <husong@kylinos.cn>
---
 .../selftests/mm/ksft_kmemleak_dedup.sh       | 20 ++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/tools/testing/selftests/mm/ksft_kmemleak_dedup.sh b/tools/testing/selftests/mm/ksft_kmemleak_dedup.sh
index d01950244490..2db7f006808f 100755
--- a/tools/testing/selftests/mm/ksft_kmemleak_dedup.sh
+++ b/tools/testing/selftests/mm/ksft_kmemleak_dedup.sh
@@ -19,24 +19,30 @@
 #
 # Author: Breno Leitao <leitao@debian.org>
 
-ksft_skip=4
+# KTAP output helpers (ktap_skip_all, ktap_exit_fail_msg, ktap_test_pass, ...).
+DIR="$(dirname "$(readlink -f "$0")")"
+# shellcheck source=../kselftest/ktap_helpers.sh
+source "${DIR}"/../kselftest/ktap_helpers.sh
+
 KMEMLEAK=/sys/kernel/debug/kmemleak
 VERBOSE_PARAM=/sys/module/kmemleak/parameters/verbose
 MODULE=kmemleak-test
 
+ktap_print_header
+
 skip() {
-	echo "SKIP: $*"
-	exit $ksft_skip
+	ktap_skip_all "$*"
+	exit "$KSFT_SKIP"
 }
 
 fail() {
-	echo "FAIL: $*"
-	exit 1
+	ktap_exit_fail_msg "$*"
 }
 
 pass() {
-	echo "PASS: $*"
-	exit 0
+	ktap_set_plan 1
+	ktap_test_pass "$*"
+	ktap_finished
 }
 
 [ "$(id -u)" -eq 0 ] || skip "must run as root"
-- 
2.43.0

