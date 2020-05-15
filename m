Return-Path: <SRS0=cFhd=65=vger.kernel.org=linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7355C433DF
	for <linux-kselftest@archiver.kernel.org>; Fri, 15 May 2020 15:57:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AD1582070A
	for <linux-kselftest@archiver.kernel.org>; Fri, 15 May 2020 15:57:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=tessares-net.20150623.gappssmtp.com header.i=@tessares-net.20150623.gappssmtp.com header.b="n+0DB1yD"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726288AbgEOP5A (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Fri, 15 May 2020 11:57:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726248AbgEOP5A (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Fri, 15 May 2020 11:57:00 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C38C1C061A0C
        for <linux-kselftest@vger.kernel.org>; Fri, 15 May 2020 08:56:59 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id u188so3224101wmu.1
        for <linux-kselftest@vger.kernel.org>; Fri, 15 May 2020 08:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tessares-net.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=krFaMC2lrT1K+Syr+4jZzZaXrSNEEbWrNktPCbVpWWo=;
        b=n+0DB1yDdrPo3rONQX55pP3UNCh19cfqvwxzJbGBzQBQG4oSwLqaKdYgFVhrJS0ojP
         nK1Ls+rQumWp1kuyW9ghf3tPuMvN5sVKeZryhy5ksdnf6e1DsoUm863fY9yYk7TNZfBm
         tbwwdTsazS4dOvLQQ/oMBOB+6rF3mFkRn7w8m1pD+kuN+QegIsc4J2MsBMFbj09QyAzV
         MZ0jcChuPjMm5+5nKSWN233VzdEY36sl9mgqAEjUeoyjr7EL1nAk88DWwI1gqgDICwNo
         c7yvxiREo4o0ZlZ8dqzzytIkyJqWLpOdQjiSgPVnYbNlzujvbV29TMisrHuENn/Na2uy
         I4Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=krFaMC2lrT1K+Syr+4jZzZaXrSNEEbWrNktPCbVpWWo=;
        b=ntWE1+Pf6/H9GguNAGgYlo9wrSyHIOJjUL4sKRfzMFpv4OVM+Ck0wgCKYVB8Fhn9Xp
         BTRMj2aTM6FatkUHfBgyGqwf3mSjRwkVI6+agE/L5IyL2vfbe+zlN61ewKprhsP+lQj5
         iGSP9qsD/ZtRdIXwZRud75dEWH8DnECENN4+KjRHPWUrCVBqlPMow+IbcXj/QHKV7qlY
         3gMgWbTWbEqybSsb62OY4rmt3rhacuYt5LgoyEFD1oQ6LQZVUlutvzNLYavG3aEgpLLN
         HyqNSzNrrEE4CbLubBqzZMJFFIjQSitAuIEf/+e9mouSs6MhNl5WSVX99RwvpC+Gaqgf
         4boA==
X-Gm-Message-State: AOAM533mNVz7k3LsyC2lPE7J0Kd4/JSLlhu1EhS9CWzHtAQg1QYyBKN4
        XfYwfB+oxL7hWex/PJvMZ7Z+Fw==
X-Google-Smtp-Source: ABdhPJzo3onjocej9ABk9/r+VRRJsPU2Cpyk/e6mUFDGMEYA0ncCB8AXxGth8wlFlL1R3sLC2BicBA==
X-Received: by 2002:a7b:c4cc:: with SMTP id g12mr4610992wmk.168.1589558218375;
        Fri, 15 May 2020 08:56:58 -0700 (PDT)
Received: from tsr-vdi-mbaerts.nix.tessares.net (static.23.216.130.94.clients.your-server.de. [94.130.216.23])
        by smtp.gmail.com with ESMTPSA id w15sm4006033wmi.35.2020.05.15.08.56.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2020 08:56:57 -0700 (PDT)
From:   Matthieu Baerts <matthieu.baerts@tessares.net>
To:     netdev@vger.kernel.org
Cc:     Matthieu Baerts <matthieu.baerts@tessares.net>,
        Mat Martineau <mathew.j.martineau@linux.intel.com>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Shuah Khan <shuah@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        mptcp@lists.01.org, linux-kselftest@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH net] selftests:mptcp:pm: rm the right tmp file
Date:   Fri, 15 May 2020 17:54:41 +0200
Message-Id: <20200515155442.1910397-1-matthieu.baerts@tessares.net>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kselftest-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

"$err" is a variable pointing to a temp file. "$out" is not: only used
as a local variable in "check()" and representing the output of a
command line.

Fixes: eedbc685321b (selftests: add PM netlink functional tests)
Signed-off-by: Matthieu Baerts <matthieu.baerts@tessares.net>
---
 tools/testing/selftests/net/mptcp/pm_netlink.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/net/mptcp/pm_netlink.sh b/tools/testing/selftests/net/mptcp/pm_netlink.sh
index 9172746b6cf0..15f4f46ca3a9 100755
--- a/tools/testing/selftests/net/mptcp/pm_netlink.sh
+++ b/tools/testing/selftests/net/mptcp/pm_netlink.sh
@@ -30,7 +30,7 @@ ret=0
 
 cleanup()
 {
-	rm -f $out
+	rm -f $err
 	ip netns del $ns1
 }
 
-- 
2.25.1

