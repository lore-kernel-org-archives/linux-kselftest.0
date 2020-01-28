Return-Path: <SRS0=hN0S=3R=vger.kernel.org=linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6A80C33CB3
	for <linux-kselftest@archiver.kernel.org>; Tue, 28 Jan 2020 07:20:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AC3AC24684
	for <linux-kselftest@archiver.kernel.org>; Tue, 28 Jan 2020 07:20:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QbvcI+et"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726402AbgA1HUf (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Tue, 28 Jan 2020 02:20:35 -0500
Received: from mail-pl1-f201.google.com ([209.85.214.201]:55858 "EHLO
        mail-pl1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726383AbgA1HUe (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Tue, 28 Jan 2020 02:20:34 -0500
Received: by mail-pl1-f201.google.com with SMTP id w11so896614plp.22
        for <linux-kselftest@vger.kernel.org>; Mon, 27 Jan 2020 23:20:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=klZSQn7VqC7h7im1FGCSgAsyHBEPANhNSwWbBSFGQEg=;
        b=QbvcI+etsqAlCV8e08VCXPOpU8eZ3t5R/0WlbHTJvxoQjpGyprnI2S+3VA6TTU6VcK
         QX1fWLkdGx43woSE9wxtOr/nIAR3GDaX0+tn1XlmHZ/gDfsUEus8JCgUXj/7t81YSGwq
         A1+5KuQ/mfdwKuU6SJEJcnV3OamCXXd43jahBhlSObRoHRxmuhcNwcQLh/PNROz4WbAm
         cTrDAdcVVc6LRnp5yWQAHaMmosEmCohM+vE8NJDyUtTlY82smbWOEof+WuehV/08VE1/
         7PHZ1+O99hDXEO3U5zm/NWDW0yicvPq5SOraPW0/CVRO6+C//tnAYf5QyggRVE/D9Iqx
         WDkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=klZSQn7VqC7h7im1FGCSgAsyHBEPANhNSwWbBSFGQEg=;
        b=U0O7nss0DWLqbGAM13VoeTIHnSHwsbBil1lH6gJdfjBtaaC0YerZBWwru4F6BHZQNQ
         Ps65GH6hdw/oQALXOEfojfjAJfAF2qH3XaH/qOqcxUzZ3t+Lcd3Io2ZXgZOajD+0XZJc
         neDecvxOwzI/3CymmHvgd+HRBSxeFhjVywNek22E4zDhAFZBycqZ2v9Y5dhAqYfHkZD9
         pukwFGOZJyHc8fvrzcmksgnwFB+wrvYrRTSQIX8J5xsusio+QEMB4sB7SNZcGeM3dEPT
         UXSFQnPd4ZBJe0OLA0cx439TvTsvwioLsF9tnrQNBNS4pg6j6yadCRYQrKGDG+eGXP9G
         5iPw==
X-Gm-Message-State: APjAAAV9dznANeAUgvGj8u3UkFlOiVJ2CS+OHOR2W83xMjYILJaSxsZP
        YPHMv1RfysrJCqo+Ze7vjWWqXl3QGirKvU+oj+Opug==
X-Google-Smtp-Source: APXvYqwA5T0XsCGucJCgnj8mr7+umXSlJ/p82m0DTcBQ5anFOlb+KkNonTYUXWa6suDswZ7MNnrzg6/s9XBTLENdrlmgtA==
X-Received: by 2002:a63:c747:: with SMTP id v7mr14107372pgg.291.1580196033243;
 Mon, 27 Jan 2020 23:20:33 -0800 (PST)
Date:   Mon, 27 Jan 2020 23:20:02 -0800
In-Reply-To: <20200128072002.79250-1-brendanhiggins@google.com>
Message-Id: <20200128072002.79250-8-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20200128072002.79250-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
Subject: [PATCH v1 7/7] Documentation: Add kunit_shutdown to kernel-parameters.txt
From:   Brendan Higgins <brendanhiggins@google.com>
To:     jdike@addtoit.com, richard@nod.at, anton.ivanov@cambridgegreys.com,
        arnd@arndb.de, keescook@chromium.org, skhan@linuxfoundation.org,
        alan.maguire@oracle.com, yzaikin@google.com, davidgow@google.com,
        akpm@linux-foundation.org, rppt@linux.ibm.com,
        frowand.list@gmail.com
Cc:     gregkh@linuxfoundation.org, sboyd@kernel.org, logang@deltatee.com,
        mcgrof@kernel.org, knut.omang@oracle.com,
        linux-um@lists.infradead.org, linux-arch@vger.kernel.org,
        linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        Brendan Higgins <brendanhiggins@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kselftest-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

Add kunit_shutdown, an option to specify that the kernel shutsdown after
running KUnit tests, to the kernel-parameters.txt documentation.

Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index ade4e6ec23e03..0472b02ce16bb 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -2054,6 +2054,13 @@
 			0: force disabled
 			1: force enabled
 
+	kunit_shutdown	[KERNEL UNIT TESTING FRAMEWORK] Shutdown kernel after
+			running tests.
+			Default:	(flag not present) don't shutdown
+			poweroff:	poweroff the kernel after running tests.
+			halt:		halt the kernel after running tests.
+			reboot:		reboot the kernel after running tests.
+
 	kvm.ignore_msrs=[KVM] Ignore guest accesses to unhandled MSRs.
 			Default is 0 (don't ignore, but inject #GP)
 
-- 
2.25.0.341.g760bfbb309-goog

