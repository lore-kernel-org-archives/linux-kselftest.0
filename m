Return-Path: <linux-kselftest-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79BFAEB64D8
	for <linux-kselftest@archiver.kernel.org>; Wed, 14 Jun 2023 23:23:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230214AbjFNXXi (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Wed, 14 Jun 2023 19:23:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229605AbjFNXXi (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Wed, 14 Jun 2023 19:23:38 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60747A6;
        Wed, 14 Jun 2023 16:23:37 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E852E633F7;
        Wed, 14 Jun 2023 23:23:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 140E4C433C0;
        Wed, 14 Jun 2023 23:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686785016;
        bh=ETsthk1SYIitJkS/UnshBSeyoFwmRNMf136CHN86y0w=;
        h=From:Date:Subject:To:Cc:From;
        b=Y9PZfh+N7zSIv0p97cyQi7abgjKLocWiSb/NdKgCcOH/YULf1YIpJtuqzl/VXrnWn
         +SQa375p/DHALh3zfd3UWCdPW/fOkeuhj88twsIxgQMipAGna05WBK6HySmr5aYN8y
         EXYrSgDz/LIknavRDb1xiWL4uL/+M82VX1oo3cdj/imgGgUCKYK0qupbWU144UKKp0
         dajg3TootCMDLSUloSqWqP4Q4bIfAliqHpRppXzINbqk0Sr3/AuVvFFwhyvBrjqfSw
         bWeOQ93p7I8yMlTLM/3aztN+xdeh+ynp5T5BQtvwDw2xWhorSK7W/luwlSDbUlwsiP
         AV6IimkhXslGQ==
From:   Mark Brown <broonie@kernel.org>
Date:   Thu, 15 Jun 2023 00:23:30 +0100
Subject: [PATCH] selftests/mm: Add missing gitignore entries
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230614-kselftest-mm-gitignore-v1-1-9c2643a25bbe@kernel.org>
X-B4-Tracking: v=1; b=H4sIAPJLimQC/x2N0QrCMAwAf2Xk2cC6DVF/RXzI1rQLc60kRYWxf
 7fz8Q6O28BYhQ1uzQbKbzHJqYI7NTDNlCKj+MrQtV3fnt2Ai/EzFLaC64pRisSUlXG4Ok+uDxf
 yBDUeyRhHpTTNR/7Juhz6pRzk+//dH/v+A9wSYBh/AAAA
To:     Andrew Morton <akpm@linux-foundation.org>,
        Shuah Khan <shuah@kernel.org>
Cc:     linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
        linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-c6835
X-Developer-Signature: v=1; a=openpgp-sha256; l=944; i=broonie@kernel.org;
 h=from:subject:message-id; bh=ETsthk1SYIitJkS/UnshBSeyoFwmRNMf136CHN86y0w=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkikv1vJHHxgf5haQN48UICM72xRcitObVVDiO2UPE
 jFkiWNKJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZIpL9QAKCRAk1otyXVSH0MPZB/
 4/jKzeo1myuOLUDdAh72nFlwa6SVVGth3NIn0TrtbZS5VHofeQzmHqhlblBw5whGSgOdxQCC41Wtw7
 6oHCrb77aW/QSBeVzYLDUSt8EJ81b+9Y3th89KFl6dSax8X2vVcqZNaBNYt/LtJkGY2Uix6Sqrqvi1
 yrU3yg+OHbyYctwPlKkFhe2qPHsm6f4x3yduLxiBbT62+hum7m+NCFT32iZqygJR7ADaK+nA09dzqQ
 FzZLSYdC8TsarQgB0eIKjsa23wbbcUURmA5wdJ/jAPbvSJDRWNskQh02+CbmG+J9mpyoJJBMmTt7qr
 Dx+qIxQGg64PPp3+cJmli0a1CkLhtC
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

We added the mkdirty and va_high_addr_switch tests but did not add the
resulting binaries to .gitignore, do so.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/mm/.gitignore | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/testing/selftests/mm/.gitignore b/tools/testing/selftests/mm/.gitignore
index 8917455f4f51..a94238e4fbc5 100644
--- a/tools/testing/selftests/mm/.gitignore
+++ b/tools/testing/selftests/mm/.gitignore
@@ -10,6 +10,7 @@ map_hugetlb
 map_populate
 thuge-gen
 compaction_test
+mkdirty
 migration
 mlock2-tests
 mrelease_test
@@ -28,6 +29,7 @@ mlock-random-test
 virtual_address_range
 gup_test
 va_128TBswitch
+va_high_addr_switch
 map_fixed_noreplace
 write_to_hugetlbfs
 hmm-tests

---
base-commit: 858fd168a95c5b9669aac8db6c14a9aeab446375
change-id: 20230614-kselftest-mm-gitignore-491da13f8ada

Best regards,
-- 
Mark Brown <broonie@kernel.org>

