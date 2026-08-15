Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E193B47CA;
	Sat, 15 Aug 2026 08:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786783380; cv=none; b=tvsBpeheApwMLiNDlVp6wJxtHy5IyKW3CoP7AKhAHk+FivHKiih2nod9qWjdsdcIOLIrHsB22WaDchnUNbDrpDbIvvPR6nx1UWwMFHSj9GQAKX2+5PdTglt7zqFO9PMehqhifZWjoGyQ8TR8PjkURIXObcSlWI7muViPVt723ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786783380; c=relaxed/simple;
	bh=CR4ZCmIH8mWbCdNeug2Z6JezrN7luvPXBEiGhEFuMEo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=q7MaXC3IMj1u0RTIvhgLfD1uNQ/jv2lWcZylGNOPwE8ikryTAPXMGmbCraKRgtGloC6YtmHyNCHpouxZztfiCqc1EltZSRI09vwd8mUQH1rnTs9mrtT1lJZ4e1znIVPOiXY4ubcxmRtwMLFo8fOVeCYfc5nEFp+h4c0scW8laNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 48f52586988511f19a56ed5b684f684d-20260815
X-CTIC-Tags:
	HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NAME, HR_CC_NO_NAME, HR_CTE_8B
	HR_CTT_MISS, HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_NAME
	HR_SJ_DIGIT_LEN, HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM
	HR_SJ_PHRASE, HR_SJ_PHRASE_LEN, HR_SJ_WS, HR_TO_COUNT, HR_TO_DOMAIN_COUNT
	HR_TO_NO_NAME, IP_UNTRUSTED, SRC_UNTRUSTED, IP_LOWREP, SRC_LOWREP
	DN_TRUSTED, SRC_TRUSTED, SA_TRUSTED, SA_EXISTED, SN_TRUSTED
	SN_EXISTED, SPF_NOPASS, DKIM_NOPASS, DMARC_NOPASS, CIE_GOOD
	CIE_GOOD_SPF, GTI_FG_BS, GTI_RG_INFO, GTI_C_BU, AMN_GOOD
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:04fcedad-7f20-4ed9-8ac9-20bac91f470a,IP:10,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:10
X-CID-INFO: VERSION:1.3.19,REQID:04fcedad-7f20-4ed9-8ac9-20bac91f470a,IP:10,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:10
X-CID-META: VersionHash:7db8b62,CLOUDID:9018be5d7f14e2b336be6e5a91adc8ff,BulkI
	D:260815164248ESVFLCWA,BulkQuantity:0,SF:17|19|38|66|78|102|127|865|898,TC
	:nil,Content:0|15|50,EDM:-3,IP:-2,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil
	,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_FSD,TF_CID_SPAM_ULS,TF_CID_SPAM_SNR,TF_CID_SPAM_FAS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 48f52586988511f19a56ed5b684f684d-20260815
X-User: husong@kylinos.cn
Received: from ctao-book.. [(111.162.215.50)] by mailgw.kylinos.cn
	(envelope-from <husong@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1608222130; Sat, 15 Aug 2026 16:42:44 +0800
From: Song Hu <husong@kylinos.cn>
To: akpm@linux-foundation.org,
	rppt@kernel.org,
	usama.anjum@arm.com,
	leitao@debian.org
Cc: linux-mm@kvack.org,
	shuah@kernel.org,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	peterx@redhat.com,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Song Hu <husong@kylinos.cn>
Subject: [PATCH v2] selftests/mm: emit KTAP output from ksft_kmemleak_dedup
Date: Sat, 15 Aug 2026 16:42:31 +0800
Message-ID: <20260815084231.3630742-1-husong@kylinos.cn>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ksft_kmemleak_dedup.sh reports its result with raw "SKIP:"/"FAIL:"/"PASS:"
echoes and bare exit codes instead of KTAP, so parse_kselftest.py cannot
read it.  Convert it to the ktap_helpers.sh API, like its sibling
ksft_kmemleak_confirm.sh.

skip() and fail() emit ktap_test_skip()/ktap_test_fail() instead of
ktap_skip_all()/ktap_exit_fail_msg(), and a single ktap_set_plan() at the
top covers every path; ktap_finished() then prints the totals line and
provides the exit code for skip/fail/pass alike.

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Reviewed-by: Breno Leitao <leitao@debian.org>
Signed-off-by: Song Hu <husong@kylinos.cn>
---

Changes in v2, per review feedback from Usama Anjum:
- use ktap_test_skip() instead of ktap_skip_all(), and ktap_test_fail()
  instead of ktap_exit_fail_msg()
- move ktap_set_plan() to the very start so it covers all paths
- call ktap_finished() on the skip and fail paths as well

v1: https://lore.kernel.org/all/20260812132142.582390-1-husong@kylinos.cn/
 .../selftests/mm/ksft_kmemleak_dedup.sh       | 21 ++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/tools/testing/selftests/mm/ksft_kmemleak_dedup.sh b/tools/testing/selftests/mm/ksft_kmemleak_dedup.sh
index d01950244490..fda6a9340e0e 100755
--- a/tools/testing/selftests/mm/ksft_kmemleak_dedup.sh
+++ b/tools/testing/selftests/mm/ksft_kmemleak_dedup.sh
@@ -19,24 +19,31 @@
 #
 # Author: Breno Leitao <leitao@debian.org>
 
-ksft_skip=4
+# KTAP output helpers (ktap_test_pass, ktap_test_skip, ktap_test_fail, ...).
+DIR="$(dirname "$(readlink -f "$0")")"
+# shellcheck source=../kselftest/ktap_helpers.sh
+source "${DIR}"/../kselftest/ktap_helpers.sh
+
 KMEMLEAK=/sys/kernel/debug/kmemleak
 VERBOSE_PARAM=/sys/module/kmemleak/parameters/verbose
 MODULE=kmemleak-test
 
+ktap_print_header
+ktap_set_plan 1
+
 skip() {
-	echo "SKIP: $*"
-	exit $ksft_skip
+	ktap_test_skip "$*"
+	ktap_finished
 }
 
 fail() {
-	echo "FAIL: $*"
-	exit 1
+	ktap_test_fail "$*"
+	ktap_finished
 }
 
 pass() {
-	echo "PASS: $*"
-	exit 0
+	ktap_test_pass "$*"
+	ktap_finished
 }
 
 [ "$(id -u)" -eq 0 ] || skip "must run as root"
-- 
2.43.0

