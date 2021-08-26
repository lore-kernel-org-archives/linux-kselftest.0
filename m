Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03970C432BE
	for <linux-kselftest@archiver.kernel.org>; Thu, 26 Aug 2021 12:07:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D84A86108E
	for <linux-kselftest@archiver.kernel.org>; Thu, 26 Aug 2021 12:07:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236119AbhHZMIl (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Thu, 26 Aug 2021 08:08:41 -0400
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121]:53650
        "EHLO smtp-relay-canonical-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234332AbhHZMIl (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Thu, 26 Aug 2021 08:08:41 -0400
Received: from localhost (1.general.cking.uk.vpn [10.172.193.212])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 655FE3F22F;
        Thu, 26 Aug 2021 12:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1629979672;
        bh=S51rAoNZKfK+WagLu2/FTE29Nr9SZz4Lb2ce9b3A0BY=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type;
        b=GRkJ2SPvBmxpWURYPgPYpB11DUXYlrun9MS3lopcCtqCl3KePL05zWCu1S5fjYZOi
         TBF9XJc8AOQqDFi2Nxjgmblc+7rrombbp4PW+NHeoyWgrolOrA3fXcgn2NkwbF0dpL
         o/I2ctqJC393H5O1rxF15PGe1r6VBGtILFMS36iFucForug5gUfOr7O+IwWW2sNbCc
         wpTq99y2ZuyKVWtkey2Lnin/TunNjcG/VRMFctrjMB76+wz35rea8Z/12rnjuga3f4
         F5lIwfJlT3asYEItndigzprk4BZr+c0TqBpqs6kLK8n3a2jQBptBsCQAkJ6FadhFfw
         V4JTL88LK35YA==
From:   Colin King <colin.king@canonical.com>
To:     Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>,
        kvm@vger.kernel.org, linux-kselftest@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] kvm: selftests: Fix spelling mistake "missmatch" -> "mismatch"
Date:   Thu, 26 Aug 2021 13:07:52 +0100
Message-Id: <20210826120752.12633-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in an error message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 tools/testing/selftests/kvm/lib/sparsebit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/lib/sparsebit.c b/tools/testing/selftests/kvm/lib/sparsebit.c
index a0d0c83d83de..50e0cf41a7dd 100644
--- a/tools/testing/selftests/kvm/lib/sparsebit.c
+++ b/tools/testing/selftests/kvm/lib/sparsebit.c
@@ -1866,7 +1866,7 @@ void sparsebit_validate_internal(struct sparsebit *s)
 		 * of total bits set.
 		 */
 		if (s->num_set != total_bits_set) {
-			fprintf(stderr, "Number of bits set missmatch,\n"
+			fprintf(stderr, "Number of bits set mismatch,\n"
 				"  s->num_set: 0x%lx total_bits_set: 0x%lx",
 				s->num_set, total_bits_set);
 
-- 
2.32.0

