Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2326B369D6F;
	Sat, 15 Aug 2026 08:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786781288; cv=none; b=QztBsgVaOhko9mZP3gqPg+0O9zbkhn0VYxRuoTnn+Wk7zRXYOEJqIsRm7LvfJzPw2ory4YgabVqi+3dAn/CP6EOaDWutA8G050PHe9WuCd58XcUf1gaex5EwjeIdmPubWRYLz8I4H9/olFF8CMjNBotaN9nKgUmGusZM/CrnugI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786781288; c=relaxed/simple;
	bh=zEKHtU6vY9HS3L1VRLqbHsnv5X+mE3x7h7J8bKESRhk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YfLncJMt018ueogJXtzeUPEc0tHJYgVF8F6inY0UU3eTdL9sQGiUlZ+xIG9d7kG7bhtNxIKBj9Beh7lhfXEBbkvXwrd9enOBVhszNx39QskY1vtDwHr5O/zqrEIsnLxkHdDVwY8sdkR9lIMsuN0TD1UzxjCaXCah6qRL2jmRGYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 6b9018d0988011f19a56ed5b684f684d-20260815
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
X-CID-O-INFO: VERSION:1.3.19,REQID:ddb5f0d2-0a7d-4394-bcbd-49de45807dca,IP:10,
	URL:0,TC:0,Content:0,EDM:-20,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:-10
X-CID-INFO: VERSION:1.3.19,REQID:ddb5f0d2-0a7d-4394-bcbd-49de45807dca,IP:10,UR
	L:0,TC:0,Content:0,EDM:-20,RT:0,SF:0,FILE:0,BULK:0,RULE:EDM_GE969F26,ACTIO
	N:release,TS:-10
X-CID-META: VersionHash:7db8b62,CLOUDID:10c0d73c66badb71245b2174fba588c3,BulkI
	D:260815160800X5W5ZYME,BulkQuantity:0,SF:17|19|38|66|78|81|82|102|127|865|
	898,TC:nil,Content:0|15|50,EDM:1|-100,IP:-2,URL:0,File:nil,RT:nil,Bulk:nil
	,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:
	0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_AEC,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 6b9018d0988011f19a56ed5b684f684d-20260815
X-User: husong@kylinos.cn
Received: from ctao-book.. [(111.162.215.50)] by mailgw.kylinos.cn
	(envelope-from <husong@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 2070273122; Sat, 15 Aug 2026 16:07:55 +0800
From: Song Hu <husong@kylinos.cn>
To: akpm@linux-foundation.org,
	rppt@kernel.org,
	sarthak.sharma@arm.com
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
Subject: [PATCH v2 3/3] selftests/mm: restore enable_soft_offline in hugetlb-soft-offline
Date: Sat, 15 Aug 2026 16:07:16 +0800
Message-ID: <20260815080716.3596514-4-husong@kylinos.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260815080716.3596514-1-husong@kylinos.cn>
References: <20260815080716.3596514-1-husong@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hugetlb-soft-offline toggles /proc/sys/vm/enable_soft_offline between 1
and 0 (test_soft_offline_common(1) then (0)) and leaves it at 0 when it
finishes, silently disabling soft offlining for the whole system after
the run.

Save the original value before the test and restore it from an atexit()
handler, so the sysctl is also restored when the test exits early via
ksft_exit_fail_msg(), as hugepage_restore_settings_atexit() in
hugepage_settings.c already does.  Use read_num()/write_num() from
vm_util instead of the hand-rolled popen()/fopen() helpers.

Signed-off-by: Song Hu <husong@kylinos.cn>
---
 .../selftests/mm/hugetlb-soft-offline.c       | 35 +++++++------------
 1 file changed, 12 insertions(+), 23 deletions(-)

diff --git a/tools/testing/selftests/mm/hugetlb-soft-offline.c b/tools/testing/selftests/mm/hugetlb-soft-offline.c
index bc202e4ed2bd..86259921d54c 100644
--- a/tools/testing/selftests/mm/hugetlb-soft-offline.c
+++ b/tools/testing/selftests/mm/hugetlb-soft-offline.c
@@ -23,6 +23,7 @@
 #include <sys/types.h>
 
 #include "kselftest.h"
+#include "vm_util.h"
 #include "hugepage_settings.h"
 
 #ifndef MADV_SOFT_OFFLINE
@@ -31,6 +32,8 @@
 
 #define EPREFIX " !!! "
 
+#define ENABLE_SOFT_OFFLINE_PATH "/proc/sys/vm/enable_soft_offline"
+
 static int do_soft_offline(int fd, size_t len, int expect_errno)
 {
 	char *filemap = NULL;
@@ -77,26 +80,12 @@ static int do_soft_offline(int fd, size_t len, int expect_errno)
 	return ret;
 }
 
-static int set_enable_soft_offline(int value)
-{
-	char cmd[256] = {0};
-	FILE *cmdfile = NULL;
-
-	if (value != 0 && value != 1)
-		return -EINVAL;
-
-	sprintf(cmd, "echo %d > /proc/sys/vm/enable_soft_offline", value);
-	cmdfile = popen(cmd, "r");
-
-	if (cmdfile)
-		ksft_print_msg("enable_soft_offline => %d\n", value);
-	else {
-		ksft_perror(EPREFIX "failed to set enable_soft_offline");
-		return errno;
-	}
+static unsigned long orig_enable_soft_offline = -1UL;
 
-	pclose(cmdfile);
-	return 0;
+static void restore_enable_soft_offline(void)
+{
+	if (orig_enable_soft_offline != -1UL)
+		write_num(ENABLE_SOFT_OFFLINE_PATH, orig_enable_soft_offline);
 }
 
 static int create_hugetlbfs_file(struct statfs *file_stat)
@@ -145,10 +134,7 @@ static void test_soft_offline_common(int enable_soft_offline)
 	hugepagesize_kb = file_stat.f_bsize / 1024;
 	ksft_print_msg("Hugepagesize is %ldkB\n", hugepagesize_kb);
 
-	if (set_enable_soft_offline(enable_soft_offline) != 0) {
-		close(fd);
-		ksft_exit_fail_msg("Failed to set enable_soft_offline\n");
-	}
+	write_num(ENABLE_SOFT_OFFLINE_PATH, enable_soft_offline);
 
 	nr_hugepages_before = hugetlb_nr_default_pages();
 
@@ -192,6 +178,9 @@ int main(int argc, char **argv)
 
 	ksft_set_plan(2);
 
+	orig_enable_soft_offline = read_num(ENABLE_SOFT_OFFLINE_PATH);
+	atexit(restore_enable_soft_offline);
+
 	test_soft_offline_common(1);
 	test_soft_offline_common(0);
 
-- 
2.43.0

