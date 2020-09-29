Return-Path: <SRS0=Sr09=DG=vger.kernel.org=linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37487C4727C
	for <linux-kselftest@archiver.kernel.org>; Tue, 29 Sep 2020 21:28:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D74E620774
	for <linux-kselftest@archiver.kernel.org>; Tue, 29 Sep 2020 21:28:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="d2x/yEEN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729402AbgI2V2S (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Tue, 29 Sep 2020 17:28:18 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:9206 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729480AbgI2V1v (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Tue, 29 Sep 2020 17:27:51 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f73a6ca0001>; Tue, 29 Sep 2020 14:27:38 -0700
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 29 Sep
 2020 21:27:50 +0000
Received: from sandstorm.nvidia.com (10.124.1.5) by mail.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Tue, 29 Sep 2020 21:27:50 +0000
From:   John Hubbard <jhubbard@nvidia.com>
To:     Andrew Morton <akpm@linux-foundation.org>
CC:     Jonathan Corbet <corbet@lwn.net>,
        =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
        Ralph Campbell <rcampbell@nvidia.com>,
        Shuah Khan <shuah@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>,
        <linux-kselftest@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-s390@vger.kernel.org>, John Hubbard <jhubbard@nvidia.com>
Subject: [PATCH v2 7/8] selftests/vm: run_vmtest.sh: update and clean up gup_test invocation
Date:   Tue, 29 Sep 2020 14:27:46 -0700
Message-ID: <20200929212747.251804-8-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200929212747.251804-1-jhubbard@nvidia.com>
References: <20200929212747.251804-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1601414858; bh=EnpswkC06SgXdnmXzkGSyHyTa8dHGmVHmbkot3R5EyQ=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
         References:MIME-Version:X-NVConfidentiality:
         Content-Transfer-Encoding:Content-Type;
        b=d2x/yEEN6ZWQm1O5jUde/Maw7aOdc0k/XR+E6ocF29cl1saYGwVkmMSfrEOyi97q/
         03qNmVjjSTgdT7zvZ14jPxL1zR2SRyIZcTT8B4lhO3a8+zb2AuYwlGumc5V7N2cLpj
         B6d2zrv+ngdnC1iRGimFC0H8cro1RZQFt8IQUlxF2scZwBgMnjeLhQ5CTAzlHDVyPW
         JL0MkPrwQiCkBcV1d/R6x08a9RhUopKi96FJ0O/50IoRDnbg0ZFIaegRc1IckZg5ux
         1b5OjpSdjfq/gX7PJk5a0zuo9772P/CEPboXoGPiupVJ4sV4NyOmROk9XejjYQd/Lf
         vP3L5k9VUZBEA==
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

Run benchmarks on the _fast variants of gup and pup, as originally
intended.

Run the new gup_test sub-test: dump pages. In addition to exercising the
dump_page() call, it also demonstrates the various options you can use
to specify which pages to dump, and how.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 tools/testing/selftests/vm/run_vmtest.sh | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/vm/run_vmtest.sh b/tools/testing/selft=
ests/vm/run_vmtest.sh
index d1843d5f3c30..e3a8b14d9df6 100755
--- a/tools/testing/selftests/vm/run_vmtest.sh
+++ b/tools/testing/selftests/vm/run_vmtest.sh
@@ -124,9 +124,9 @@ else
 fi
=20
 echo "--------------------------------------------"
-echo "running 'gup_test -U' (normal/slow gup)"
+echo "running 'gup_test -u' (fast gup benchmark)"
 echo "--------------------------------------------"
-./gup_test -U
+./gup_test -u
 if [ $? -ne 0 ]; then
 	echo "[FAIL]"
 	exitcode=3D1
@@ -134,10 +134,22 @@ else
 	echo "[PASS]"
 fi
=20
-echo "------------------------------------------"
-echo "running gup_test -b (pin_user_pages)"
-echo "------------------------------------------"
-./gup_test -b
+echo "---------------------------------------------------"
+echo "running gup_test -a (pin_user_pages_fast benchmark)"
+echo "---------------------------------------------------"
+./gup_test -a
+if [ $? -ne 0 ]; then
+	echo "[FAIL]"
+	exitcode=3D1
+else
+	echo "[PASS]"
+fi
+
+echo "--------------------------------------------------------------"
+echo "running gup_test -ct -F 0x1 0 19 0x1000"
+echo "   Dumps pages 0, 19, and 4096, using pin_user_pages (-F 0x1)"
+echo "--------------------------------------------------------------"
+./gup_test -ct -F 0x1 0 19 0x1000
 if [ $? -ne 0 ]; then
 	echo "[FAIL]"
 	exitcode=3D1
--=20
2.28.0

