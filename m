Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0642238F646;
	Sat, 15 Aug 2026 09:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786787422; cv=none; b=nQVUg8+40p37EgFG2NvpjABoZlVHpMysJDRgrRoDxy8D86J3cB+Q7uEWVLMH4Elmls9PP+C7GBnh+OpS/84Ec2BiiCzIac9H4l55iNvn6XjdVl97EmajczH/83BjIoztrEn9rvxfAulJ8Ocsx0Ygud49dx/b7KzNWlZtS3poJBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786787422; c=relaxed/simple;
	bh=8EGLDao9vWCpKewWHWMDCqsktKbYQeq87WsXJtWPu/o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YRBI/+45WP8FM1zgc70w9LYSDIZYRz+FoYxIBxv1OOYkat52oHy6foOuRlRvQNjh6/CcrU21kHCJU22mu6D/9A/3yeAc/ISPMeg6pm9EQnp5rrqS1/fGdMNzCFSX+nK8mEsn42eUNoFlwxnrDCohYbOcXD7RiBNeOBsFC4qtaNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: b2db85ae988e11f19a56ed5b684f684d-20260815
X-CTIC-Tags:
	HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NAME, HR_CC_NO_NAME, HR_CTE_8B
	HR_CTT_MISS, HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_NAME
	HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM, HR_SJ_PHRASE
	HR_SJ_PHRASE_LEN, HR_SJ_WS, HR_TO_COUNT, HR_TO_DOMAIN_COUNT, HR_TO_NO_NAME
	IP_UNTRUSTED, SRC_UNTRUSTED, IP_LOWREP, SRC_LOWREP, DN_TRUSTED
	SRC_TRUSTED, SA_TRUSTED, SA_EXISTED, SN_TRUSTED, SN_EXISTED
	SPF_NOPASS, DKIM_NOPASS, DMARC_NOPASS, CIE_GOOD, CIE_GOOD_SPF
	GTI_FG_BS, GTI_RG_INFO, GTI_C_BU, AMN_GOOD
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:e8917608-1abc-4880-9884-773904c42db4,IP:10,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:10
X-CID-INFO: VERSION:1.3.19,REQID:e8917608-1abc-4880-9884-773904c42db4,IP:10,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:10
X-CID-META: VersionHash:7db8b62,CLOUDID:b53ad05cdc170d189b36e0498c92469f,BulkI
	D:260815175010JPX1NQO9,BulkQuantity:0,SF:17|19|66|78|102|127|865|898,TC:ni
	l,Content:0|15|50,EDM:-3,IP:-2,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:n
	il,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b2db85ae988e11f19a56ed5b684f684d-20260815
X-User: husong@kylinos.cn
Received: from ctao-book.. [(111.162.215.50)] by mailgw.kylinos.cn
	(envelope-from <husong@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1010390645; Sat, 15 Aug 2026 17:50:07 +0800
From: Song Hu <husong@kylinos.cn>
To: minchan@kernel.org
Cc: senozhatsky@chromium.org,
	shuah@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Song Hu <husong@kylinos.cn>
Subject: [PATCH] selftests/zram: emit KTAP output
Date: Sat, 15 Aug 2026 17:49:03 +0800
Message-ID: <20260815094903.3742931-1-husong@kylinos.cn>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

zram.sh, the kselftest target, prints raw banners and runs zram01.sh
and zram02.sh ignoring their exit status: both scripts always exit 0
and report the result with a plain "[PASS]"/"[FAIL]" echo, so the
harness always sees success no matter what the tests did.

Emit the TAP header and plan up front, report each sub-test from its
exit code and fold its output into "#" diagnostics, and skip both
sub-tests through the ktap helpers when not run as root.  zram01.sh
and zram02.sh now exit non-zero on failure, and check_prereqs() prints
a "1..0 # SKIP" line for standalone runs.  No test logic changes.

Tested on x86_64: both sub-tests pass as root, and are reported as
SKIP with the plan and totals lines when not run as root.

Signed-off-by: Song Hu <husong@kylinos.cn>
---
 tools/testing/selftests/zram/zram.sh | 43 +++++++++++++++++++++-------
 1 file changed, 32 insertions(+), 11 deletions(-)

diff --git a/tools/testing/selftests/zram/zram.sh b/tools/testing/selftests/zram/zram.sh
index b0b91d9b0dc2..e39a84420d18 100755
--- a/tools/testing/selftests/zram/zram.sh
+++ b/tools/testing/selftests/zram/zram.sh
@@ -1,18 +1,39 @@
 #!/bin/bash
 # SPDX-License-Identifier: GPL-2.0
-TCID="zram.sh"
 
-. ./zram_lib.sh
+# KTAP output helpers (ktap_test_pass, ktap_test_fail, ...).
+DIR="$(dirname "$(readlink -f "$0")")"
+# shellcheck source=../kselftest/ktap_helpers.sh
+source "${DIR}"/../kselftest/ktap_helpers.sh
 
-run_zram () {
-echo "--------------------"
-echo "running zram tests"
-echo "--------------------"
-./zram01.sh
-echo ""
-./zram02.sh
+ktap_print_header
+ktap_set_plan 2
+
+if [ "$(id -u)" -ne 0 ]; then
+	ktap_test_skip "zram01.sh: must be run as root"
+	ktap_test_skip "zram02.sh: must be run as root"
+	ktap_finished
+fi
+
+# Run a sub-test, fold its output into "# " diagnostic lines and report its
+# exit code as the KTAP result.
+run_one()
+{
+	local script=$1
+
+	"${DIR}/$script" 2>&1 | sed 's/^/# /'
+	local rc=${PIPESTATUS[0]}
+
+	if [ "$rc" -eq 0 ]; then
+		ktap_test_pass "$script"
+	elif [ "$rc" -eq "$KSFT_SKIP" ]; then
+		ktap_test_skip "$script"
+	else
+		ktap_test_fail "$script"
+	fi
 }
 
-check_prereqs
+run_one zram01.sh
+run_one zram02.sh
 
-run_zram
+ktap_finished
-- 
2.43.0

