Return-Path: <SRS0=3G8P=ZT=vger.kernel.org=linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT,USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3DB6C432C0
	for <linux-kselftest@archiver.kernel.org>; Wed, 27 Nov 2019 23:19:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AA489215F1
	for <linux-kselftest@archiver.kernel.org>; Wed, 27 Nov 2019 23:19:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="G08yPCm7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727127AbfK0XTd (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Wed, 27 Nov 2019 18:19:33 -0500
Received: from mail-pg1-f202.google.com ([209.85.215.202]:42691 "EHLO
        mail-pg1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726947AbfK0XTd (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Wed, 27 Nov 2019 18:19:33 -0500
Received: by mail-pg1-f202.google.com with SMTP id x189so155556pgd.9
        for <linux-kselftest@vger.kernel.org>; Wed, 27 Nov 2019 15:19:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=3DvG1Qi/9kLi2+lMfxuoRgIDiLfz9oW0Dvr00Re3MJI=;
        b=G08yPCm7fV3eNIe0YnB6BkhBTG7Tpw/+wTOYlOFUt7oWMaoUlKrEP1phO2WI9m+MG7
         5LSEO7HQ1GdibWwnc9GggdXa2Jgy3g0ESsAzVVjyRG7fvm3c602985pTOTAE/RWW5zZs
         74Np5nhm9WcJltyOS2ROsj4A1/JnF7U3FXuj7yPLwAtajRwV8s0Cp/GEeCdbJWSYDueH
         YK9OC4gr/M5Ug5o6CxK7zAVD+Rk5BPFcfKmr07k0F2ZhWc2OejnKhADzy/Hr7hY6hKq4
         ouCddGLaKbRM0lvWY9W5Qq3WjqFdAgKwwzVWTyzLhYpxXVpSeuPC1auGokoZKKCwgydY
         43dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=3DvG1Qi/9kLi2+lMfxuoRgIDiLfz9oW0Dvr00Re3MJI=;
        b=pzSdtyqVK/xI9thXioV+YIvnPcatTGJesKK4QNn53LzSBq/5391biXWH1LsT3Fgf4f
         M22mpfKj2hrcx3100xsagZhjK+Z/g6aos82qePGdv3laV3XBZdihtg5K3m4KQyPsY7o7
         FRUlk38r1mcjh4DS50qs5PxFWqR2MmKjss8tc3+Wfh9vrF/bcnFG/cFk/2W+XacuwHmx
         iRh0YNz6p5qt/OQEwWqBjxOu6Ylf8usdZz7+BlJwlRzzs+13zWPxXsXiWj2aQpSjPTM9
         fmg+TJCNPybx8UDQTzzRs/VaaAC/yfhTEGp3aejrlnk0kwQdViQqK2ZrGYySFXJB/2JA
         4YhQ==
X-Gm-Message-State: APjAAAWKJ0QQwPMUOj5RRu3/HlTi7R0lvPx9y/bRVP9dRbTcWMqnt+m8
        i9u8Ac/vIPI5pkQla1AJ1gfDtHiS/TbI9tiO
X-Google-Smtp-Source: APXvYqxawEYKLTsvj/e5/gqkRVZd4KqUw9qL6XftCyPY3DlpzNdVvSr4jDZF9Q+axqeQkstpIozJd31umW9KD3xD
X-Received: by 2002:a63:565c:: with SMTP id g28mr7657844pgm.409.1574896770856;
 Wed, 27 Nov 2019 15:19:30 -0800 (PST)
Date:   Wed, 27 Nov 2019 15:19:26 -0800
Message-Id: <20191127231926.162437-1-heidifahim@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.24.0.432.g9d3f5f5b63-goog
Subject: [PATCH] kunit: testing kunit: Bug fix in test_run_timeout function
From:   Heidi Fahim <heidifahim@google.com>
To:     brendanhiggins@google.com, davidgow@google.com, shuah@kernel.org
Cc:     sj38.park@gmail.com, linux-kselftest@vger.kernel.org,
        kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org,
        Heidi Fahim <heidifahim@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kselftest-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

Assert in test_run_timeout was not updated with the build_dir argument
and caused the following error:
AssertionError: Expected call: run_kernel(timeout=3453)
Actual call: run_kernel(build_dir=None, timeout=3453)

Needed to update kunit_tool_test to reflect this fix
https://lkml.org/lkml/2019/9/6/3

Signed-off-by: Heidi Fahim <heidifahim@google.com>
Change-Id: I6f161c72c6a5f071a4dc31582ba08b91974502ce
---
 tools/testing/kunit/kunit_tool_test.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/kunit/kunit_tool_test.py b/tools/testing/kunit/kunit_tool_test.py
index 4a12baa0cd4e..a2a8ea6beae3 100755
--- a/tools/testing/kunit/kunit_tool_test.py
+++ b/tools/testing/kunit/kunit_tool_test.py
@@ -199,7 +199,7 @@ class KUnitMainTest(unittest.TestCase):
 		timeout = 3453
 		kunit.main(['run', '--timeout', str(timeout)], self.linux_source_mock)
 		assert self.linux_source_mock.build_reconfig.call_count == 1
-		self.linux_source_mock.run_kernel.assert_called_once_with(timeout=timeout)
+		self.linux_source_mock.run_kernel.assert_called_once_with(build_dir=None, timeout=timeout)
 		self.print_mock.assert_any_call(StrContains('Testing complete.'))
 
 if __name__ == '__main__':
-- 
2.24.0.432.g9d3f5f5b63-goog

