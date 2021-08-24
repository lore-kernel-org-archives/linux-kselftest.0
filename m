Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37790C4338F
	for <linux-kselftest@archiver.kernel.org>; Tue, 24 Aug 2021 03:09:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1989F600D3
	for <linux-kselftest@archiver.kernel.org>; Tue, 24 Aug 2021 03:09:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234027AbhHXDKc (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Mon, 23 Aug 2021 23:10:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234677AbhHXDId (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Mon, 23 Aug 2021 23:08:33 -0400
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com [IPv6:2607:f8b0:4864:20::836])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFB8DC06129E;
        Mon, 23 Aug 2021 20:06:03 -0700 (PDT)
Received: by mail-qt1-x836.google.com with SMTP id t32so373270qtc.3;
        Mon, 23 Aug 2021 20:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2kVvHTOkclueciWHjlwAZSqO9FMOmpPlMvewZXfOAmg=;
        b=eP6pqLBNeyCeJM8uVp8bzcC1h6sq8OKzLgRi6al1jCpA7Xle45/8q3gm8f5aEppJgp
         SBEQIJTYVyriOAVaInb/H6yvKkBl5N8QE8d81/EO9AO5ScvgM2jpeRQbV7ELUpYX4kOe
         hvC2P/rYksi8aLHx2kUslkBFBeggLXqCTkVqiTYPLJGK1CZv/GZEAoiKdbla5nHvWjN/
         r3GU0mdF941yFeXorLcXlgTpDEEnDpURPxNwNNF5+7USIGSnKZ6qt91I5fDvq+Fn5piF
         2H2TeFOuX9UZsY1lzyltV1LkTnDzxGx3CuYwMGT0MqEQkmBtrm2RcSabLk++mHVqfLFH
         whAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2kVvHTOkclueciWHjlwAZSqO9FMOmpPlMvewZXfOAmg=;
        b=MKRlhEyIe7V8sMYeA+fskVQs52gEfVTMgCyMfpEepkmirG5w2Tjw7XtzEkghUk6TND
         bKT0FO4gzVlmR7L/QZvORq13wFyKmYthETaIyu0DD7OpL1TdC5BrHrgGPRTqwp4iGLxf
         aVxd3uu1C7GpKaSCmweiT1aDUiWXt4ZQWGk6/uFwKIKc+34ce0ucah6WREtoVnoNbntZ
         tsUog3ccd5ORzFYLYITbd5P0ZRZYMMQliAAyNmNZN6ormiBocxBQCt5nyLQgsE7pCU0u
         Pji+vzTkf/m6/dgnywg3gckwHkfzz7DI1sgYVfIC7Cmxi4PvVL2uRnfcD+a5/UkN5pGS
         CqeA==
X-Gm-Message-State: AOAM530ukwx8TK6ZQU2ZUJKOPHrShS5V77vWpeDHa6MV9EaaW1UwF0uJ
        RmJ+5Kp6gCXlIBq1BetTZro=
X-Google-Smtp-Source: ABdhPJxqWLQTotq77Iz8SEIcYkl6+dtS1OVo4xMkKsL04oeOP/MdyK/wLiaWMivGOU8VktLhIW11WA==
X-Received: by 2002:ac8:4e2b:: with SMTP id d11mr33127629qtw.384.1629774363103;
        Mon, 23 Aug 2021 20:06:03 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
        by smtp.gmail.com with ESMTPSA id m8sm9677653qkk.130.2021.08.23.20.06.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Aug 2021 20:06:02 -0700 (PDT)
From:   CGEL <cgel.zte@gmail.com>
X-Google-Original-From: CGEL <deng.changcheng@zte.com.cn>
To:     Michael Ellerman <mpe@ellerman.id.au>
Cc:     Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Shuah Khan <shuah@kernel.org>, linuxppc-dev@lists.ozlabs.org,
        linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
        Changcheng Deng <deng.changcheng@zte.com.cn>,
        Zeal Robot <zealci@zte.com.cn>
Subject: [PATCH linux-next] selftests/powerpc: remove duplicate include
Date:   Mon, 23 Aug 2021 20:05:50 -0700
Message-Id: <20210824030550.57467-1-deng.changcheng@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

From: Changcheng Deng <deng.changcheng@zte.com.cn>

Clean up the following includecheck warning:

./tools/testing/selftests/powerpc/tm/tm-poison.c: inttypes.h is included
more than once.

No functional change.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Changcheng Deng <deng.changcheng@zte.com.cn>
---
 tools/testing/selftests/powerpc/tm/tm-poison.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/testing/selftests/powerpc/tm/tm-poison.c b/tools/testing/selftests/powerpc/tm/tm-poison.c
index 29e5f26..27c083a 100644
--- a/tools/testing/selftests/powerpc/tm/tm-poison.c
+++ b/tools/testing/selftests/powerpc/tm/tm-poison.c
@@ -20,7 +20,6 @@
 #include <sched.h>
 #include <sys/types.h>
 #include <signal.h>
-#include <inttypes.h>
 
 #include "tm.h"
 
-- 
1.8.3.1


