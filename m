Return-Path: <SRS0=s2pX=CC=vger.kernel.org=linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21166C433E1
	for <linux-kselftest@archiver.kernel.org>; Mon, 24 Aug 2020 17:02:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E7B752074D
	for <linux-kselftest@archiver.kernel.org>; Mon, 24 Aug 2020 17:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1598288575;
	bh=suhF0qwwSU0yECNHcaKgTLO11nlKyMh0NmEMGkWs6+U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=W0xFDcgDRpVCLzHA9u9fwgTHAREOEWT3VkonFimjevMMuXZ/AkIzDOfLrnphQt9A3
	 eyK3YFcdqAAi9mXuY+EdPhLxqm+qDaK4eHNUEugOilp9edr80tv++KL9ZiVJijg0pX
	 d2GAs/o/xmMR5F0W+Q/UHO1NwKtUpm5/q4fie+xI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726798AbgHXRCy (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Mon, 24 Aug 2020 13:02:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:40658 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728481AbgHXQii (ORCPT <rfc822;linux-kselftest@vger.kernel.org>);
        Mon, 24 Aug 2020 12:38:38 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C5BE022D70;
        Mon, 24 Aug 2020 16:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598287102;
        bh=suhF0qwwSU0yECNHcaKgTLO11nlKyMh0NmEMGkWs6+U=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=dX8jLqaCNJBKjhDYgGwXGWVEG8+ahICXV+iXVorxpb9nm+ifSoO+Aydw6W0QkAdCU
         iE/ro1uJpzGKi0mh8jeCEVEmNfD02N49/77+Qjyd0LcG8rLMvTGBUsTJrQmyjBvBgQ
         RxqY88GyxAfSmRoe8khZzSJuXgpdcVlxrgqiNKFY=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     David Ahern <dsahern@kernel.org>,
        "David S . Miller" <davem@davemloft.net>,
        Sasha Levin <sashal@kernel.org>, netdev@vger.kernel.org,
        linux-kselftest@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 23/38] selftests: disable rp_filter for icmp_redirect.sh
Date:   Mon, 24 Aug 2020 12:37:35 -0400
Message-Id: <20200824163751.606577-23-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200824163751.606577-1-sashal@kernel.org>
References: <20200824163751.606577-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-kselftest-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

From: David Ahern <dsahern@kernel.org>

[ Upstream commit bcf7ddb0186d366f761f86196b480ea6dd2dc18c ]

h1 is initially configured to reach h2 via r1 rather than the
more direct path through r2. If rp_filter is set and inherited
for r2, forwarding fails since the source address of h1 is
reachable from eth0 vs the packet coming to it via r1 and eth1.
Since rp_filter setting affects the test, explicitly reset it.

Signed-off-by: David Ahern <dsahern@kernel.org>
Signed-off-by: David S. Miller <davem@davemloft.net>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 tools/testing/selftests/net/icmp_redirect.sh | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/testing/selftests/net/icmp_redirect.sh b/tools/testing/selftests/net/icmp_redirect.sh
index 18c5de53558af..bf361f30d6ef9 100755
--- a/tools/testing/selftests/net/icmp_redirect.sh
+++ b/tools/testing/selftests/net/icmp_redirect.sh
@@ -180,6 +180,8 @@ setup()
 			;;
 		r[12]) ip netns exec $ns sysctl -q -w net.ipv4.ip_forward=1
 		       ip netns exec $ns sysctl -q -w net.ipv4.conf.all.send_redirects=1
+		       ip netns exec $ns sysctl -q -w net.ipv4.conf.default.rp_filter=0
+		       ip netns exec $ns sysctl -q -w net.ipv4.conf.all.rp_filter=0
 
 		       ip netns exec $ns sysctl -q -w net.ipv6.conf.all.forwarding=1
 		       ip netns exec $ns sysctl -q -w net.ipv6.route.mtu_expires=10
-- 
2.25.1

