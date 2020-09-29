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
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0506C47423
	for <linux-kselftest@archiver.kernel.org>; Tue, 29 Sep 2020 21:27:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5A057207F7
	for <linux-kselftest@archiver.kernel.org>; Tue, 29 Sep 2020 21:27:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="Frjd1b8E"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729546AbgI2V1v (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Tue, 29 Sep 2020 17:27:51 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:10951 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729426AbgI2V1u (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Tue, 29 Sep 2020 17:27:50 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f73a6710001>; Tue, 29 Sep 2020 14:26:09 -0700
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 29 Sep
 2020 21:27:49 +0000
Received: from sandstorm.nvidia.com (10.124.1.5) by mail.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Tue, 29 Sep 2020 21:27:49 +0000
From:   John Hubbard <jhubbard@nvidia.com>
To:     Andrew Morton <akpm@linux-foundation.org>
CC:     Jonathan Corbet <corbet@lwn.net>,
        =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
        Ralph Campbell <rcampbell@nvidia.com>,
        Shuah Khan <shuah@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>,
        <linux-kselftest@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-s390@vger.kernel.org>, John Hubbard <jhubbard@nvidia.com>
Subject: [PATCH v2 3/8] selftests/vm: rename run_vmtests --> run_vmtests.sh
Date:   Tue, 29 Sep 2020 14:27:42 -0700
Message-ID: <20200929212747.251804-4-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200929212747.251804-1-jhubbard@nvidia.com>
References: <20200929212747.251804-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1601414769; bh=RPMHprCLVySs3ilSK8+KniQUmbIDzQ1D7RK7jQ1DOdw=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
         References:MIME-Version:X-NVConfidentiality:
         Content-Transfer-Encoding:Content-Type;
        b=Frjd1b8Er6UZZsNDcLdNSuiPa/qu4Oz5tAWIefebTEjDIpjCQNgbqgIJsczu2z4Sy
         sYWq+4seF6ChTe7HV0lhD9BNN+RSG0anUAhPg/Q4gs2Eh+Sye0Hw4F+6vEWC9wrK55
         DXkfmQQQcIZmrMONehl66Unav/omGM3/w+UgZ8QD6G+ULGhUAK4DoFVYrdTd/RA1gq
         E8pi8qfRwQw3+3ozXw9Y2qq4fkMjdELHcJr5uiCIO0lA7LP9bw4/eUghmsfFo3wIdo
         bpsL0t69nts+4qbZn4kjcqnw+JoGbOFMqobEKSmfC4+6aFxpUp5k+dIJoo9qy1ex3c
         Xuj/vFBmN3GmA==
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

Rename to *.sh, in order to match the conventions of all of the other
items in selftest/vm.

The only reason not to use a .sh suffix a shell script like this, might
be to make it look more like a normal program, but that's not an issue
here.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 tools/testing/selftests/vm/Makefile                       | 2 +-
 tools/testing/selftests/vm/{run_vmtests =3D> run_vmtest.sh} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename tools/testing/selftests/vm/{run_vmtests =3D> run_vmtest.sh} (100%)

diff --git a/tools/testing/selftests/vm/Makefile b/tools/testing/selftests/=
vm/Makefile
index 9cc6bc087461..5a3bd0c497b6 100644
--- a/tools/testing/selftests/vm/Makefile
+++ b/tools/testing/selftests/vm/Makefile
@@ -69,7 +69,7 @@ TEST_GEN_FILES +=3D virtual_address_range
 TEST_GEN_FILES +=3D write_to_hugetlbfs
 endif
=20
-TEST_PROGS :=3D run_vmtests
+TEST_PROGS :=3D run_vmtests.sh
=20
 TEST_FILES :=3D test_vmalloc.sh
=20
diff --git a/tools/testing/selftests/vm/run_vmtests b/tools/testing/selftes=
ts/vm/run_vmtest.sh
similarity index 100%
rename from tools/testing/selftests/vm/run_vmtests
rename to tools/testing/selftests/vm/run_vmtest.sh
--=20
2.28.0

