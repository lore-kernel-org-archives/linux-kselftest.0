Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9C5439F79;
	Wed, 12 Aug 2026 12:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786536656; cv=none; b=Ls8aYSD6oAoAs4zx8iYpwl9cGrH5M7dY2T0iYmvyK7kI67F9jofozvVhLOhL7Uprj8wc16ZWN9DEtNcv9lUJfChhUB22X+EvQnqZbUvYIYNINHMaRfS+DxlBYVyV1akF9GAnI43y00CtyojZzMjJa6L2CiC4pcokasdRJ+SGHAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786536656; c=relaxed/simple;
	bh=F2Y3mRCvbqJaGUx1pk5AUjkWyPIcdqJKzPlnu/jue9M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gTlwkC47jnlM0CA2sjDY+ny0ZWHoozlvWL2PNR+am3ZHySyohCHjsibeE7VV0uK/5RVP8EVyuoFRsm5BcGGJ0ooCEv4KKvIKUXSDD/7GR6Gz9H8aKuknrx5n/uEOf1eWn3i8bVFeU6NtMnCwo/uzX34Luwot7sLJ2amXPiD3W9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: d9458464964611f1aa26b74ffac11d73-20260812
X-CTIC-Tags:
	HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NAME, HR_CC_NO_NAME, HR_CTE_8B
	HR_CTT_MISS, HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_NAME
	HR_SJ_DIGIT_LEN, HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM
	HR_SJ_PHRASE, HR_SJ_PHRASE_LEN, HR_SJ_WS, HR_TO_COUNT, HR_TO_DOMAIN_COUNT
	HR_TO_NO_NAME, IP_UNTRUSTED, SRC_UNTRUSTED, IP_UNFAMILIAR, SRC_UNFAMILIAR
	DN_TRUSTED, SRC_TRUSTED, SA_TRUSTED, SA_EXISTED, SN_TRUSTED
	SN_EXISTED, SPF_NOPASS, DKIM_NOPASS, DMARC_NOPASS, CIE_BAD
	CIE_GOOD_SPF, CIE_UNKNOWN, GTI_FG_BS, GTI_RG_INFO, GTI_C_BU
	AMN_GOOD
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:cea930ac-079f-40df-8e01-cb07d4516171,IP:10,
	URL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:35
X-CID-INFO: VERSION:1.3.12,REQID:cea930ac-079f-40df-8e01-cb07d4516171,IP:10,UR
	L:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:35
X-CID-META: VersionHash:e7bac3a,CLOUDID:c1b14ee53eeb8edb92911d479d49e75e,BulkI
	D:260812201050MG02R5FB,BulkQuantity:0,Recheck:0,SF:17|19|38|66|78|81|82|10
	2|127|865|898,TC:nil,Content:0|15|50,EDM:5,IP:-2,URL:0,File:nil,RT:nil,Bul
	k:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0
	,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: d9458464964611f1aa26b74ffac11d73-20260812
X-User: husong@kylinos.cn
Received: from ctao-book.. [(111.162.215.50)] by mailgw.kylinos.cn
	(envelope-from <husong@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1067541705; Wed, 12 Aug 2026 20:10:46 +0800
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
	peterx@redhat.com,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Song Hu <husong@kylinos.cn>
Subject: [PATCH 3/3] selftests/mm: restore enable_soft_offline in hugetlb-soft-offline
Date: Wed, 12 Aug 2026 20:08:21 +0800
Message-ID: <20260812120821.523860-4-husong@kylinos.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260812120821.523860-1-husong@kylinos.cn>
References: <20260812120821.523860-1-husong@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hugetlb-soft-offline toggles /proc/sys/vm/enable_soft_offline between 1 and
0 (test_soft_offline_common(1) then (0)) and leaves it at 0 when it
finishes, silently disabling soft offlining for the whole system after the
run.  Read the original value before the test and restore it before
ksft_finished().

Signed-off-by: Song Hu <husong@kylinos.cn>
---
 .../selftests/mm/hugetlb-soft-offline.c       | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/tools/testing/selftests/mm/hugetlb-soft-offline.c b/tools/testing/selftests/mm/hugetlb-soft-offline.c
index bc202e4ed2bd..35dcf661b091 100644
--- a/tools/testing/selftests/mm/hugetlb-soft-offline.c
+++ b/tools/testing/selftests/mm/hugetlb-soft-offline.c
@@ -99,6 +99,23 @@ static int set_enable_soft_offline(int value)
 	return 0;
 }
 
+static int get_enable_soft_offline(void)
+{
+	FILE *fp = fopen("/proc/sys/vm/enable_soft_offline", "r");
+	int value = -1;
+
+	if (!fp) {
+		ksft_perror(EPREFIX "failed to read enable_soft_offline");
+		return -1;
+	}
+	if (fscanf(fp, "%d", &value) != 1) {
+		ksft_perror(EPREFIX "failed to parse enable_soft_offline");
+		value = -1;
+	}
+	fclose(fp);
+	return value;
+}
+
 static int create_hugetlbfs_file(struct statfs *file_stat)
 {
 	int fd;
@@ -185,6 +202,8 @@ static void test_soft_offline_common(int enable_soft_offline)
 
 int main(int argc, char **argv)
 {
+	int orig;
+
 	ksft_print_header();
 
 	if (!hugetlb_setup_default(8))
@@ -192,8 +211,13 @@ int main(int argc, char **argv)
 
 	ksft_set_plan(2);
 
+	orig = get_enable_soft_offline();
+
 	test_soft_offline_common(1);
 	test_soft_offline_common(0);
 
+	if (orig >= 0)
+		set_enable_soft_offline(orig);
+
 	ksft_finished();
 }
-- 
2.43.0

