Return-Path: <SRS0=iG10=EL=vger.kernel.org=linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.4 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT,USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77602C388F7
	for <linux-kselftest@archiver.kernel.org>; Thu,  5 Nov 2020 23:24:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0E91F20728
	for <linux-kselftest@archiver.kernel.org>; Thu,  5 Nov 2020 23:24:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UsR3m19D"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731060AbgKEXYp (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Thu, 5 Nov 2020 18:24:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726801AbgKEXYp (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Thu, 5 Nov 2020 18:24:45 -0500
Received: from mail-qt1-x849.google.com (mail-qt1-x849.google.com [IPv6:2607:f8b0:4864:20::849])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 677D2C0613D2
        for <linux-kselftest@vger.kernel.org>; Thu,  5 Nov 2020 15:24:45 -0800 (PST)
Received: by mail-qt1-x849.google.com with SMTP id i14so1933522qtq.18
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Nov 2020 15:24:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:message-id:mime-version:subject:from:to:cc;
        bh=AAeRP8KDuwhhbA84EVB6YgYC1HzIpzZ/9Y+Nd8qzbQE=;
        b=UsR3m19DmC3T42tFi5Q5tDa0aQw7MuRG7UgVzQ+yssoGB7I250bHEnZaaGsA7Eu1fg
         h6wsSdo50DgevBMJEyC7lunITjgWacw/II72KQJprap7ueBmdoNz2774O4ULOoE6otZi
         Nxg6WITa1A+0LezgnDGxnQk1RBkDdb9ORWEgkIQylkpvRZ1IsVLF1NIkE11vqLlMRw63
         nd7NciOK9dmcER+bZ3zu+xVtsA5waHN4c0pDYYRx1gm6i9r8TkkUD/HWMfesDZPR19+e
         dyDZGrubiPU4s1LEzkPtWQBhgHCIb/mykAbExPuPwogiOTjls5+TX4crGQJi1B+M/rqV
         uD4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
         :to:cc;
        bh=AAeRP8KDuwhhbA84EVB6YgYC1HzIpzZ/9Y+Nd8qzbQE=;
        b=E6ZmbNElFCIRWQp1bQzWe3q5WE+RLEmZDSc2l/CRaKB7rMHa8Pzw/L6XrcdWeMj7U6
         Lh+1d/oVPsM80dDQnVaHJcremKdhnRdhj8ptx5GFIcxwtBkuiSaY86fWLv9HftKH36HM
         wdzLioFknZnWNX/qDp66W0295AdZAULkey4rMvr8UTHZyH4tJIKT2rZdaXgQUBxe6UEt
         S0sHo9dOUsvXN++d08EqFqlLTHk8t4aG7yDX6/cCHJIcCXnkKiEL0de0ImWEoLZR+xrE
         lXMw4RsCvRIUj1hBKH6f8Av+xlLJPg9b2ucO9q8qlBFHY8arJzBEGSF57/l+/VFGHBm3
         tU0g==
X-Gm-Message-State: AOAM533ZugheAsiB0Y4BcdJA3gGpUvQUplC2VvOFjKBvTjHIzWRnjyg1
        dzgZDJqoFjjqVzIch8oTBFFZw3bpNvddd3AxV71JWg==
X-Google-Smtp-Source: ABdhPJxfKMbHL6oNDZfMKBMswdyDwjBhbY0a2mgSIe9wMM5pQM7TN7VrdzAvbPb8Cxy5WMJ3wz3zVIOe9uvp2i93vKOLew==
Sender: "brendanhiggins via sendgmr" 
        <brendanhiggins@mactruck.svl.corp.google.com>
X-Received: from mactruck.svl.corp.google.com ([2620:15c:2cb:201:c634:6bff:fe71:d8d1])
 (user=brendanhiggins job=sendgmr) by 2002:a05:6214:12c4:: with SMTP id
 s4mr4712027qvv.33.1604618684577; Thu, 05 Nov 2020 15:24:44 -0800 (PST)
Date:   Thu,  5 Nov 2020 15:24:40 -0800
Message-Id: <20201105232440.1049635-1-brendanhiggins@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.29.1.341.ge80a0c044ae-goog
Subject: [PATCH v1] kunit: tool: unmark test_data as binary blobs
From:   Brendan Higgins <brendanhiggins@google.com>
To:     shuah@kernel.org, davidgow@google.com
Cc:     linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
        linux-kernel@vger.kernel.org,
        Brendan Higgins <brendanhiggins@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

The tools/testing/kunit/test_data/ directory was marked as binary
because some of the test_data files cause checkpatch warnings. Fix this
by dropping the .gitattributes file.

Fixes: afc63da64f1e ("kunit: kunit_parser: make parser more robust")
Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
---
 tools/testing/kunit/.gitattributes | 1 -
 1 file changed, 1 deletion(-)
 delete mode 100644 tools/testing/kunit/.gitattributes

diff --git a/tools/testing/kunit/.gitattributes b/tools/testing/kunit/.gitattributes
deleted file mode 100644
index 5b7da1fc3b8f1..0000000000000
--- a/tools/testing/kunit/.gitattributes
+++ /dev/null
@@ -1 +0,0 @@
-test_data/* binary

base-commit: 4ef8451b332662d004df269d4cdeb7d9f31419b5
-- 
2.29.1.341.ge80a0c044ae-goog

