Return-Path: <SRS0=yK7M=76=vger.kernel.org=linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23032C433DF
	for <linux-kselftest@archiver.kernel.org>; Wed, 17 Jun 2020 12:14:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 016712082F
	for <linux-kselftest@archiver.kernel.org>; Wed, 17 Jun 2020 12:14:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725941AbgFQMOI (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Wed, 17 Jun 2020 08:14:08 -0400
Received: from u164.east.ru ([195.170.63.164]:12048 "EHLO u164.east.ru"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725901AbgFQMOI (ORCPT <rfc822;linux-kselftest@vger.kernel.org>);
        Wed, 17 Jun 2020 08:14:08 -0400
Received: by u164.east.ru (Postfix, from userid 1001)
        id 80E78512B95; Wed, 17 Jun 2020 15:14:06 +0300 (MSK)
Date:   Wed, 17 Jun 2020 15:14:06 +0300
From:   Anatoly Pugachev <matorola@gmail.com>
To:     linux-kselftest@vger.kernel.org
Cc:     Jiri Kosina <trivial@kernel.org>, sparclinux@vger.kernel.org
Subject: [PATCH] selftests: kvm: don't try to build kvm tests on sparc64
 architecture
Message-ID: <20200617121406.GA29692@yogzotot>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kselftest-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

There's no support for KVM on sparc64, so don't try to build kvm tests.

gcc -Wall -Wstrict-prototypes -Wuninitialized -O2 -g -std=gnu99
-fno-stack-protector -fno-PIE -I../../../../tools/include
-I../../../../tools/arch/sparc64/include -I../../../../usr/include/
-Iinclude -Ilib -Iinclude/sparc64 -I..   -c lib/elf.c -o
/1/mator/linux-2.6/tools/testing/selftests/kvm/lib/elf.o
In file included from lib/elf.c:13:
include/kvm_util.h:12:10: fatal error: asm/kvm.h: No such file or
directory
   12 | #include "asm/kvm.h"
      |          ^~~~~~~~~~~
compilation terminated.

Signed-off-by: Anatoly Pugachev <matorola@gmail.com>
CC: Jiri Kosina <trivial@kernel.org>
CC: sparclinux@vger.kernel.org
---
 tools/testing/selftests/kvm/Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/testing/selftests/kvm/Makefile b/tools/testing/selftests/kvm/Makefile
index 4a166588d99f..00be52199cb9 100644
--- a/tools/testing/selftests/kvm/Makefile
+++ b/tools/testing/selftests/kvm/Makefile
@@ -32,6 +32,9 @@ endif
 ifeq ($(ARCH),s390)
 	UNAME_M := s390x
 endif
+ifeq ($(UNAME_M),sparc64)
+$(error kvm selftests is not supported on sparc64)
+endif
 
 LIBKVM = lib/assert.c lib/elf.c lib/io.c lib/kvm_util.c lib/sparsebit.c lib/test_util.c
 LIBKVM_x86_64 = lib/x86_64/processor.c lib/x86_64/vmx.c lib/x86_64/svm.c lib/x86_64/ucall.c
-- 
2.27.0

