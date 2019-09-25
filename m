Return-Path: <SRS0=p6T0=XU=vger.kernel.org=linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 074CAC432C2
	for <linux-kselftest@archiver.kernel.org>; Wed, 25 Sep 2019 13:24:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D8DA721D7F
	for <linux-kselftest@archiver.kernel.org>; Wed, 25 Sep 2019 13:24:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406136AbfIYNYu (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Wed, 25 Sep 2019 09:24:50 -0400
Received: from foss.arm.com ([217.140.110.172]:49384 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2406133AbfIYNYu (ORCPT <rfc822;linux-kselftest@vger.kernel.org>);
        Wed, 25 Sep 2019 09:24:50 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9616F142F;
        Wed, 25 Sep 2019 06:24:49 -0700 (PDT)
Received: from e120937-lin.cambridge.arm.com (e120937-lin.cambridge.arm.com [10.1.197.50])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E33703F59C;
        Wed, 25 Sep 2019 06:24:48 -0700 (PDT)
From:   Cristian Marussi <cristian.marussi@arm.com>
To:     linux-kselftest@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, shuah@kernel.org
Cc:     dave.martin@arm.com
Subject: [PATCH 1/2] kselftest: add capability to skip chosen TARGETS
Date:   Wed, 25 Sep 2019 14:24:20 +0100
Message-Id: <20190925132421.23572-1-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-kselftest-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

Let the user specify an optional TARGETS skiplist through the new optional
SKIP_TARGETS Makefile variable.

It is easier to skip at will a reduced and well defined list of possibly
problematic targets with SKIP_TARGETS then to provide a partially stripped
down list of good targets using the usual TARGETS variable.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
 tools/testing/selftests/Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/testing/selftests/Makefile b/tools/testing/selftests/Makefile
index 25b43a8c2b15..103936faa46d 100644
--- a/tools/testing/selftests/Makefile
+++ b/tools/testing/selftests/Makefile
@@ -132,6 +132,10 @@ else
 		ARCH=$(ARCH) -C $(top_srcdir) headers_install
 endif
 
+# User can optionally provide a TARGETS skiplist.
+SKIP_TARGETS ?=
+TARGETS := $(filter-out $(SKIP_TARGETS), $(TARGETS))
+
 all: khdr
 	@for TARGET in $(TARGETS); do		\
 		BUILD_TARGET=$$BUILD/$$TARGET;	\
-- 
2.17.1

