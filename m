Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795063335;
	b=LIAGhITCHJdSIjJLVoZFvfH+C4Y1XlPSKj+18TU/4vYGOLiRUqpFCUALALpL2vKCDtQy
	 T0Lqsz6kuXZlFj+IrMnNs5Yx1R1D0QAcipNrWWkepdqehyuyTJxzfNfmUgdoqB4+0wZuo
	 buKsr2y4UPxqfEeXremVPwIZvWiAmXxDyAOS6sS17o8D+FRDLmsdenPItQju7DydsH4sU
	 nPemaSJ3SbFiVuE+87pWSGXC7psF2VKP4qMBdh8QJ5BViEF8PC1TAYLLC2MmHMvSJVbEu
	 areDGeWmv5lKshd91Xyussew8VSVdz+niYscNRD+/539fC646C9ThFoZ6XobmIR33/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795063335;
	h=DMARC-Filter:X-UUID:X-CTIC-Tags:X-CID-P-RULE:X-CID-O-INFO:X-CID-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:X-User:
	 Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1N6ORFJkL8OHQDRhFuDm5MyFcBsRjOJlTytLujErTJ8=;
	b=Zq4/xnR+ATl4mD0vxlQD3aVCXSusayyi9VuIVuTw3cU7G7zKys08vJgA6ZhcxjGuQgz2
	 Yu5AVSejoHGFJq9dh1LJIMqMFt2QAQVOWIeGBnxl1Z/6hv2D2PkYARGY12tDszpmXuYXq
	 6/3+gi+HHOwdW43DoHzzeGuxfARm29ryHCXv9+GdKdXkcN0iBdIQZzA00k4x8zzHDrX/2
	 cgbYTDrngc02GzxN1W7Xxfl/fw96Lx4/SwgAYvckKmdov1h3FolEOpkavr5bBTQP/AeZo
	 LvQPJmGn9/Qe0QpUGXPAoDHOZEjAlNLhDgXl9aThZ9VUF2B3xsQzzqfvSX2eeo9k3Dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=kylinos.cn;
	arc=none smtp.remote-ip=124.126.103.232
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73C72606A320;
	Thu, 19 Nov 2026 04:42:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73C72606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 9010fab4e3d311f19a56ed5b684f684d-20261119
X-CTIC-Tags:
	HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NAME, HR_CC_NO_NAME, HR_CTE_8B
	HR_CTT_MISS, HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_NAME
	HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM, HR_SJ_PHRASE
	HR_SJ_PHRASE_LEN, HR_SJ_WS, HR_TO_COUNT, HR_TO_DOMAIN_COUNT, HR_TO_NO_NAME
	IP_TRUSTED, SRC_TRUSTED, SA_TRUSTED, SA_EXISTED, SN_TRUSTED
	SN_EXISTED, SPF_NOPASS, DKIM_NOPASS, DMARC_NOPASS, CIE_BAD
	CIE_GOOD, CIE_GOOD_SPF, GTI_FG_BS, GTI_RG_INFO, GTI_C_BU
	AMN_GOOD, ABX_MISS_RDNS
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:7f829265-45ec-46fb-9d7b-b2ab952949f4,IP:15,
	URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:10
X-CID-INFO: VERSION:1.3.19,REQID:7f829265-45ec-46fb-9d7b-b2ab952949f4,IP:15,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:10
X-CID-META: VersionHash:7db8b62,CLOUDID:5d009eda91ff5590d01ee8f1e154d214,BulkI
	D:26111912420581S1QX7F,BulkQuantity:0,SF:10|38|66|78|102|127|153|850|865|8
	98,TC:nil,Content:0|15|50|99|100|101|102|113|153,EDM:-3,IP:-2,URL:0,File:n
	il,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:
	0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 9010fab4e3d311f19a56ed5b684f684d-20261119
X-User: yijiangshan@kylinos.cn
Received: from localhost.localdomain [(116.128.244.171)] by mailgw.kylinos.cn
	(envelope-from <yijiangshan@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 581581377; Thu, 19 Nov 2026 12:42:01 +0800
From: Jiangshan Yi <yijiangshan@kylinos.cn>
To: brendan.higgins@linux.dev,
	david@davidgow.net,
	corbet@lwn.net
Cc: raemoar63@gmail.com,
	brgl@kernel.org,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	13667453960@163.com,
	Jiangshan Yi <yijiangshan@kylinos.cn>
Subject: [PATCH] kunit: fix debugfs run file usage message path
Date: Thu, 19 Nov 2026 12:41:35 +0800
Message-Id: <20261119044135.158943-1-yijiangshan@kylinos.cn>
X-Mailer: git-send-email 2.25.1
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The usage message for the debugfs run file points to
/sys/kernel/debugfs/kunit/<suite>/run, but debugfs is mounted at
/sys/kernel/debug, so the printed path does not exist. Use
/sys/kernel/debug/kunit/<suite>/run, matching the comments
elsewhere in the file.

Also fix the same wrong path in the documentation.

Fixes: c72a870926c2 ("kunit: add ability to run tests after boot using debugfs")
Fixes: e9f0e21ceb65 ("Documentation: Add debugfs docs with run after boot")
Signed-off-by: Jiangshan Yi <yijiangshan@kylinos.cn>
---
 Documentation/dev-tools/kunit/run_manual.rst | 2 +-
 lib/kunit/debugfs.c                          | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/dev-tools/kunit/run_manual.rst b/Documentation/dev-tools/kunit/run_manual.rst
index 98e8d5b28808..59c3313a6d15 100644
--- a/Documentation/dev-tools/kunit/run_manual.rst
+++ b/Documentation/dev-tools/kunit/run_manual.rst
@@ -87,7 +87,7 @@ the ``/sys/kernel/debug/kunit/<test_suite>/run`` file:
 
 .. code-block :: bash
 
-	echo "any string" > /sys/kernel/debugfs/kunit/<test_suite>/run
+	echo "any string" > /sys/kernel/debug/kunit/<test_suite>/run
 
 As a result, the test suite runs and the results are printed to the kernel
 log.
diff --git a/lib/kunit/debugfs.c b/lib/kunit/debugfs.c
index 442b2ceb955b..fd39395e2a95 100644
--- a/lib/kunit/debugfs.c
+++ b/lib/kunit/debugfs.c
@@ -126,7 +126,7 @@ static int debugfs_print_run(struct seq_file *seq, void *v)
 	struct kunit_suite *suite = (struct kunit_suite *)seq->private;
 
 	seq_puts(seq, "Write to this file to trigger the test suite to run.\n");
-	seq_printf(seq, "usage: echo \"any string\" > /sys/kernel/debugfs/kunit/%s/run\n",
+	seq_printf(seq, "usage: echo \"any string\" > /sys/kernel/debug/kunit/%s/run\n",
 			suite->name);
 	return 0;
 }
-- 
2.25.1

