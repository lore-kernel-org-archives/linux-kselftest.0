Return-Path: <SRS0=C+tc=UH=vger.kernel.org=linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08E76C28CC5
	for <linux-kselftest@archiver.kernel.org>; Sat,  8 Jun 2019 11:46:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CCC58214AF
	for <linux-kselftest@archiver.kernel.org>; Sat,  8 Jun 2019 11:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1559994366;
	bh=C+6URup4x6WWyXK1GXWSoHnLonUHCD8kJjjmj9A+3h4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=SNGoCJwMXFMB47IrSBVt9x4+VjoDN5XHfMOHqRKnFBVHEcR6ehsuHHy8RcrecyBqZ
	 sUVVP487cRC8Zndqbyv9H2xQdI5EbuNuemllEQMMSlwLnHA7gdV4uxCPZPLkuryv9R
	 8nphf/4S8fKOdJAbrDGTGdmF2xGi80W6Dsqt/dCo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728093AbfFHLnE (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Sat, 8 Jun 2019 07:43:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:60290 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727947AbfFHLnD (ORCPT <rfc822;linux-kselftest@vger.kernel.org>);
        Sat, 8 Jun 2019 07:43:03 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id ED4E3214AF;
        Sat,  8 Jun 2019 11:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559994182;
        bh=C+6URup4x6WWyXK1GXWSoHnLonUHCD8kJjjmj9A+3h4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=leZLAEMBteJyAmFJBPS/tDSvlBmSmIzgsVQD2Ih/nFRbVtK340uVatx2yrPGAzUUl
         Th65OF3LOFaoYhzvG1wK3KNUotiqs5/+h1EZXgDY7/lV1w4u17Us77Aqr1n4lBdDDg
         3sPUlai2XK9faZjc4mjHqy7MGNeY11IgAS+c+UNw=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Jeffrin Jose T <jeffrin@rajagiritech.edu.in>,
        Florian Westphal <fw@strlen.de>,
        Pablo Neira Ayuso <pablo@netfilter.org>,
        Sasha Levin <sashal@kernel.org>,
        linux-kselftest@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 07/49] selftests: netfilter: missing error check when setting up veth interface
Date:   Sat,  8 Jun 2019 07:41:48 -0400
Message-Id: <20190608114232.8731-7-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190608114232.8731-1-sashal@kernel.org>
References: <20190608114232.8731-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-kselftest-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190608114148.aSj5hSchoYaUXOM8cC8143gaF3Nq-3bzvwdLiBquqhA@z>

From: Jeffrin Jose T <jeffrin@rajagiritech.edu.in>

[ Upstream commit 82ce6eb1dd13fd12e449b2ee2c2ec051e6f52c43 ]

A test for the basic NAT functionality uses ip command which needs veth
device. There is a condition where the kernel support for veth is not
compiled into the kernel and the test script breaks. This patch contains
code for reasonable error display and correct code exit.

Signed-off-by: Jeffrin Jose T <jeffrin@rajagiritech.edu.in>
Acked-by: Florian Westphal <fw@strlen.de>
Signed-off-by: Pablo Neira Ayuso <pablo@netfilter.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 tools/testing/selftests/netfilter/nft_nat.sh | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/netfilter/nft_nat.sh b/tools/testing/selftests/netfilter/nft_nat.sh
index 8ec76681605c..f25f72a75cf3 100755
--- a/tools/testing/selftests/netfilter/nft_nat.sh
+++ b/tools/testing/selftests/netfilter/nft_nat.sh
@@ -23,7 +23,11 @@ ip netns add ns0
 ip netns add ns1
 ip netns add ns2
 
-ip link add veth0 netns ns0 type veth peer name eth0 netns ns1
+ip link add veth0 netns ns0 type veth peer name eth0 netns ns1 > /dev/null 2>&1
+if [ $? -ne 0 ];then
+    echo "SKIP: No virtual ethernet pair device support in kernel"
+    exit $ksft_skip
+fi
 ip link add veth1 netns ns0 type veth peer name eth0 netns ns2
 
 ip -net ns0 link set lo up
-- 
2.20.1

