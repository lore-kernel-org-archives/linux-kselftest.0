Return-Path: <SRS0=sstp=BS=vger.kernel.org=linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.6 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT,USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5631DC433DF
	for <linux-kselftest@archiver.kernel.org>; Sat,  8 Aug 2020 01:17:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2447E2177B
	for <linux-kselftest@archiver.kernel.org>; Sat,  8 Aug 2020 01:17:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fjeWWPzv"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726166AbgHHBRR (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Fri, 7 Aug 2020 21:17:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726066AbgHHBRR (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Fri, 7 Aug 2020 21:17:17 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3CA7C061756
        for <linux-kselftest@vger.kernel.org>; Fri,  7 Aug 2020 18:17:16 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id 83so5067461ybf.2
        for <linux-kselftest@vger.kernel.org>; Fri, 07 Aug 2020 18:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=qDtgVx5yXEzQ++OacfHgx9dKEkbfCyUB5rxuAZU49e8=;
        b=fjeWWPzv3ENtmT1A5ELAglDHmhrNm2w8zH41/GIdI0PkRkqGvjZlzZXH8IBXXBh+uq
         qKLfdMnIoB8Z4Rd9jMog3//UBJF8IkTSmfoBvcjWijMcDYhquUsxI7xbEdMSQpYv2Fpd
         oN37Vy7OsQe3BL32UCedj2LRnH3OElFD3Fd6tW/WPn9bx0C4MIv0BuCZDy52nQUMHT6x
         ZjJ4Z47lFRWOv2h+nxXer+Ffc2mah8yhxxGYKzFOF3IzyVbr5sADj/DhdbpZaowV8NG4
         mvY/1bM48GAzG24++yyx3LIFuCLh9PEs5JNuHRMPTiCPlDbFpHe9B9MRgsR+urql5V9/
         71WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=qDtgVx5yXEzQ++OacfHgx9dKEkbfCyUB5rxuAZU49e8=;
        b=fRwOyiwd1j5wh5inKYxequ8aV1/LqjetfFZp2d2MZUNROVLB1iRIybhooSY8eh13H+
         Tb0v5sGkc/VcU1g3iM1t0fhCcdEbhr3wNlIcQJmhoap82NYRFA+LOy49Q8mAvV/iiK25
         zdTv7oCNcEEmmd6hB0tZtw3y/I2yWfKYo1vJmDLCViSv/WiKf9u12GzESqr6/h32kouY
         iUoJccedlWcGW24GF8R10C/xpb2mKr5d1neGAYGzI+TL6DgtMJ/ls1plIobsP30wJV2o
         +MSrBKZ7XWEwAKA9tHhu0yhpqtFYiX90Sjxufc1SeNfQ1wbc200Mn3WV0+qPt673eu9C
         C1fQ==
X-Gm-Message-State: AOAM532TZm+mgc+ET3tJ0xGL18Js2u8AJRyGnW9Cz7ZiSSJqajOrWFzW
        eFfJCT5nTfDn+egyrNodKr2Rr+xXWELhtgfRVoIr3Q==
X-Google-Smtp-Source: ABdhPJzCGS/d0450sHolXKm5LfyKAM0CNPtSWf1OCtlSdIckuPs7Hywjaff7wvkUsImsX50dti5npceBSJjkrypq+F0rSQ==
X-Received: by 2002:a25:5808:: with SMTP id m8mr25093531ybb.246.1596849436001;
 Fri, 07 Aug 2020 18:17:16 -0700 (PDT)
Date:   Fri,  7 Aug 2020 18:16:50 -0700
Message-Id: <20200808011651.2113930-1-brendanhiggins@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.28.0.236.gb10cc79966-goog
Subject: [PATCH v1 1/2] kunit: tool: fix running kunit_tool from outside
 kernel tree
From:   Brendan Higgins <brendanhiggins@google.com>
To:     shuah@kernel.org, davidgow@google.com
Cc:     linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
        linux-kernel@vger.kernel.org,
        Brendan Higgins <brendanhiggins@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kselftest-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

Currently kunit_tool does not work correctly when executed from a path
outside of the kernel tree, so make sure that the current working
directory is correct and the kunit_dir is properly initialized before
running.

Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
---
 tools/testing/kunit/kunit.py | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tools/testing/kunit/kunit.py b/tools/testing/kunit/kunit.py
index 425ef40067e7..96344a11ff1f 100755
--- a/tools/testing/kunit/kunit.py
+++ b/tools/testing/kunit/kunit.py
@@ -237,9 +237,14 @@ def main(argv, linux=None):
 
 	cli_args = parser.parse_args(argv)
 
+	if get_kernel_root_path():
+		print('cd ' + get_kernel_root_path())
+		os.chdir(get_kernel_root_path())
+
 	if cli_args.subcommand == 'run':
 		if not os.path.exists(cli_args.build_dir):
 			os.mkdir(cli_args.build_dir)
+			create_default_kunitconfig()
 
 		if not linux:
 			linux = kunit_kernel.LinuxSourceTree()
@@ -257,6 +262,7 @@ def main(argv, linux=None):
 		if cli_args.build_dir:
 			if not os.path.exists(cli_args.build_dir):
 				os.mkdir(cli_args.build_dir)
+				create_default_kunitconfig()
 
 		if not linux:
 			linux = kunit_kernel.LinuxSourceTree()
@@ -273,6 +279,7 @@ def main(argv, linux=None):
 		if cli_args.build_dir:
 			if not os.path.exists(cli_args.build_dir):
 				os.mkdir(cli_args.build_dir)
+				create_default_kunitconfig()
 
 		if not linux:
 			linux = kunit_kernel.LinuxSourceTree()
@@ -291,6 +298,7 @@ def main(argv, linux=None):
 		if cli_args.build_dir:
 			if not os.path.exists(cli_args.build_dir):
 				os.mkdir(cli_args.build_dir)
+				create_default_kunitconfig()
 
 		if not linux:
 			linux = kunit_kernel.LinuxSourceTree()

base-commit: 30185b69a2d533c4ba6ca926b8390ce7de495e29
-- 
2.28.0.236.gb10cc79966-goog

