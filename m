Return-Path: <linux-kselftest-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2566C61DA4
	for <linux-kselftest@archiver.kernel.org>; Fri,  3 Feb 2023 10:14:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232772AbjBCKOr (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Fri, 3 Feb 2023 05:14:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231430AbjBCKOq (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Fri, 3 Feb 2023 05:14:46 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9308D8E68D;
        Fri,  3 Feb 2023 02:14:45 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 420C3B82A61;
        Fri,  3 Feb 2023 10:14:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EC8CC4339B;
        Fri,  3 Feb 2023 10:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675419283;
        bh=vZ/rYih25oqku/POs78MXevzm4PkkNatFdf6w+fBPBk=;
        h=From:To:Cc:Subject:Date:From;
        b=CUnz2ksi7YBASBAbOUYKRR6lFhwPwMszS4bJS5QBLyLuRNL8Ki9THh7e+Ox7LAhA0
         xEXrZIUcJHxcLpFc8oiZLAO0ur7u8IITfvZBvf8Lmkwbv+sdKV8jNGYSz4/+pGDr4H
         TGwFqruc7RmovJftPC8+sAKxO3/mkvQSUBNDTqe2sHUVnjyYCTxyuTfu6nzjaCocix
         VgwWNJc0DWc0TwQWTPi3g0vksBJYkG3ew76FBWDztJTFmmxnb46rjxPT25R/3R91uY
         iqga8wN3XkNqA8qb/rO/9aK4eueLyE+oHoGuQzFxLRJgltDKAOlG5bzcoJo24uhjmS
         aFV6rUAYZjRug==
From:   Tzung-Bi Shih <tzungbi@kernel.org>
To:     shuah@kernel.org
Cc:     linux-kselftest@vger.kernel.org, jarkko@kernel.org,
        linux-kernel@vger.kernel.org, tzungbi@kernel.org
Subject: [PATCH] selftests: tpm2: remove redundant ord()
Date:   Fri,  3 Feb 2023 18:14:30 +0800
Message-Id: <20230203101430.901476-1-tzungbi@kernel.org>
X-Mailer: git-send-email 2.39.1.519.gcb327c4b5f-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

When testing with FLAG_DEBUG enabled client, it emits the following
error messages:

File "/root/tpm2/tpm2.py", line 347, in hex_dump
    d = [format(ord(x), '02x') for x in d]
File "/root/tpm2/tpm2.py", line 347, in <listcomp>
    d = [format(ord(x), '02x') for x in d]
TypeError: ord() expected string of length 1, but int found

The input of hex_dump() should be packed binary data.  Remove the
ord().

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
 tools/testing/selftests/tpm2/tpm2.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/tpm2/tpm2.py b/tools/testing/selftests/tpm2/tpm2.py
index c7363c6764fc..bba8cb54548e 100644
--- a/tools/testing/selftests/tpm2/tpm2.py
+++ b/tools/testing/selftests/tpm2/tpm2.py
@@ -344,7 +344,7 @@ def get_algorithm(name):
 
 
 def hex_dump(d):
-    d = [format(ord(x), '02x') for x in d]
+    d = [format(x, '02x') for x in d]
     d = [d[i: i + 16] for i in range(0, len(d), 16)]
     d = [' '.join(x) for x in d]
     d = os.linesep.join(d)
-- 
2.39.1.519.gcb327c4b5f-goog

