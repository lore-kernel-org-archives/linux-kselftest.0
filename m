Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6CF64B04BA
	for <linux-kselftest@vger.kernel.org>; Thu, 17 Sep 2026 11:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789643738; cv=none; b=ULQ6ozgml+iugc1gCJWKNJVTBYAYDCoQSXGTVl39i3Hahm9MJgGZUmphRoPYWdqvRX8KdCNiH3bYZ9cN6IhF50kiM+wZNW2TcnG7A2BtplzwdWAoJKGnqn2744U03z6NCckjDI7tzqTuK5eRZAIU4ZXEfSSC6+3tBCzpkPL1fZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789643738; c=relaxed/simple;
	bh=AJ5mMe8CMyMMvu5opXwqf0CvLKRMqW+UoSHD9baNOoM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hJ+hM0Fgs13fkhdfZFiq52haoJ0pdsWNnQb4W8+XqJMijWzkS6tptHqgnjtG6Dsd6nCmbR/YIrAu1elF7iSlu6w+hfRqfRELAtnZa51RF6KPxyftLpRvN3eS4aJKKcYwitVZwvM1+Rwnx5B4busnwdKXB1yDIpedKWw2SjFGtGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=mP4TE9si; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="mP4TE9si"
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id B25CA3F8D8
	for <linux-kselftest@vger.kernel.org>; Thu, 17 Sep 2026 11:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1789643722;
	bh=bd10M+bix5UlEXeH9BMOYOfhizghQyBfU2z5WWgogyc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=mP4TE9si7YEmNK+Kl+nZ4R54ZZD2gK6BBN/03rTJrQFEgbFBBL9lrGRZhIxNZENxC
	 O1InBbRC1hsjymkQXhfvQOGAu8sbF6Bubm1by/lniFWc92fvYssnDMtESSw/N9/HnS
	 J0fakDtN3te9x4sMOaohdAcUBaKScv2FeicK+PIT/O8p3VU47oMBMdHtqJ0UWw+D01
	 9dpFWoK+3mmyImUwOIyMXrFtZB0+LuuXxAjfmcxCMWJa1XjZrqdYYN9Lc2932bnJKa
	 rYGJccglK3lnh6szL08RVppb81eYbIivGZJBmawBkKX43hx1x/Kb8BVTLzi9ynVw4V
	 hNM7hQ5zl3pO66CKuKqAJVlchINSnsViifYKEeos8+9jdsF8exY0CHxDuFs44MXGpZ
	 xVkf5NzQIbgvln/CBkX/FrIlA+KIjSBABcQcQHyLUwMdrQjkSb5aDOOPtakLLVHEdB
	 LfgQhDRpVHMxQI0EeUn2fimAeGTC1dxa0/Z57ash+llyMAEcxu3ToOKmz4CtDalJzK
	 qD6jQwogeYhOeKxI0aWonygLCpRwwLvg9JslnroapqBpav/09ZYANwOrp2YG+EuNXf
	 prNERExivtQdrd8T6mYaHeFwcGJ9daPUZWIUhmLmDyKzhC/M3wBgUWLZ0JkVWjahEV
	 eYCA221HehuWQabmbmznPDOs=
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-499db0932f7so129985e9.0
        for <linux-kselftest@vger.kernel.org>; Thu, 17 Sep 2026 04:15:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789643722; x=1790248522;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bd10M+bix5UlEXeH9BMOYOfhizghQyBfU2z5WWgogyc=;
        b=pl/uzrkJOnLwY28nuXFUWZZoo4XEkn0m2dOH1aI1MrarIZfJIto1D9cviMW4pxg8lA
         ncZHVUbdLbJADQ9QnJU2cNZ+gvs+ygudOstAXkLJ5HEGOij850KE10xFHhEWFAo0IaGd
         XSBB8dpOWEkd4d0mJ4opLS8+o5dEX4yTocl2m6OMd9eUGSE2FamBlogho9qmDvMXkJa8
         3cpzSUgQNbJoQF96/wAkYbUT9kISP3umCPBTTkaX8geG8rLBQH0bP/6MyAvWNubFpjHY
         9kRBNqt8FtHckdddXVbcn+8rkYSRxtg/ulS7kggvlcX40wlFeXYlOXyM2/fIiyLfDjlu
         3Tag==
X-Forwarded-Encrypted: i=1; AKwUvBwmUa+/nqHstge53HwuATt/luT0m01lDj6bJwNOgkfvEIOr6ciLiVpSQAsd6QU8SKAQxHQNbkj+C44k8eFkLS4=@vger.kernel.org
X-Gm-Message-State: AFuF++nu7sBOfrpE7H0NKgW8nKEMyvUJ1brbq+dXCkI5tMcJ4gUss30C
	HnLRA/J/zo1Y2P9bMc9bm/b0ayyywPKPDe+1WO86eg6hqzjb+H99Kgu1Yeo7s4AQhFgtgKaw3nB
	pDkyKlBtY7IpwVMHP48ta22hrbdasH/qe/MX1fKqHOW9iSmDYZCcAYIunmkQf8Yiibe+TFLB6PV
	ENc3p8jeUATw==
X-Gm-Gg: AYBFou2DtCJYJglzMfcy2ubMsX5fXj615dWZ3kqxHpHzaknAUVsJffwAgUNWIAU1zFc
	5VNufeyd1ek0d4YClJp76CYeTQfn6041OICeu9Tvc++uUcsN4uTqgsodU/UPcj0Tz3sq6e2wvN9
	h9Oxbxt+6//mWtayrVN0nKUN4qABGAX/fX0gQAXOALmGzGJAHxDdT09Qhrwc9zkZs7XU62kWoTa
	VjtUpZm7BkE9qPJeeZYDhimTRvl87B4sGE3ogZMxCQ2niq6N97WXVbKyByWUl5FaY2SX5NbaBub
	Ln2CCOwzfASP5gz6SewEY6E6ZqLdvEwaaHsqRzzhxQWhrPnMuSEmkiwYCeIb73kLP7uTyv37VcJ
	WK/TVrly5yPCWIFu4jqEt159lyPBfFXYqQKID1tLwaYSy2dfdMNib
X-Received: by 2002:a05:600c:4e48:b0:49e:7186:f36e with SMTP id 5b1f17b1804b1-49eb731c39emr77445325e9.1.1789643722178;
        Thu, 17 Sep 2026 04:15:22 -0700 (PDT)
X-Received: by 2002:a05:600c:4e48:b0:49e:7186:f36e with SMTP id 5b1f17b1804b1-49eb731c39emr77444985e9.1.1789643721803;
        Thu, 17 Sep 2026 04:15:21 -0700 (PDT)
Received: from localhost (host-79-46-33-118.retail.telecomitalia.it. [79.46.33.118])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbf415058sm42111315e9.0.2026.09.17.04.15.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 04:15:20 -0700 (PDT)
From: Edoardo Canepa <edoardo.canepa@canonical.com>
To: netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Xu Du <xudu@redhat.com>,
	Po-Hsu Lin <po-hsu.lin@canonical.com>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v3] selftests/net: run tun tests in a dedicated network namespace
Date: Thu, 17 Sep 2026 13:15:20 +0200
Message-ID: <20260917111520.2614448-1-edoardo.canepa@canonical.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The tun_vnet_udptnl fixture creates a fresh tap device, assigns it a
fixed MAC address and installs the outer neighbor entry as
NUD_PERMANENT.  On systems where systemd-udevd is running and a systemd
.link file sets

    MACAddressPolicy=persistent

(the default shipped by systemd in 99-default.link, so this is what
most systemd-based hosts inherit), systemd-udevd's net_setup_link
builtin asynchronously sends an RTM_SETLINK to reassign the freshly
created tap device's MAC to a machine-persistent value.  When that
lands after the fixture has configured the device, both directions
break:

- recv_gso_packet transmits through the tap, and the address change
  flushes the neighbor entry the fixture installed:

    do_setlink
    -> netif_set_mac_address
       -> call_netdevice_notifiers(NETDEV_CHANGEADDR)
          -> ndisc_netdev_event (arp_netdev_event for an IPv4 outer)
             -> neigh_changeaddr
                -> neigh_flush_dev(tbl, dev, /* skip_perm = */ false)

  so the packet hits __neigh_create() and waits on neighbor resolution
  that never completes.

- send_gso_packet writes frames addressed to the MAC the fixture
  assigned.  Once the tap has a different address, eth_type_trans()
  marks them PACKET_OTHERHOST and the IP receive path drops them.

Either way nothing arrives before the receive timeout, and the test
fails with, for example:

  tun.c:947:send_gso_packet:Expected ret (0) == variant->data_size (1)
  tun.c:948:send_gso_packet:Expected r_num_mss (0) == variant->r_num_mss (1)
  tun.c:962:recv_gso_packet:Expected ret (0) == variant->data_size (1)

The failure is non-deterministic and reproduces on a plain
systemd-based VM with no containers.

Fix by calling unshare(CLONE_NEWNET) from both fixture setups.  The
harness runs each test in its own forked process, so every test gets a
private network namespace that is torn down with it, and all tap and
geneve devices are created in a namespace that systemd-udevd (running
in the init netns) does not watch, so its RTM_SETLINK never fires
against them.

Creating a network namespace needs CAP_SYS_ADMIN in the current user
namespace and CONFIG_NET_NS=y, neither of which the tests required
before.  Where they are unavailable the unshare() is reported with
SKIP() rather than aborting, so the binary still emits a full TAP
stream and a runner can tell "network namespaces unavailable" apart
from a real tun/tap regression.

Verified on a plain systemd-based VM running the affected kernel.
Without the fix, 1000 sequential invocations of

  tun -r tun_vnet_udptnl.4in6_nogsosz_1byte.recv_gso_packet

fail 10 times, and 2 out of 20 full runs of the test binary fail.  With
the fix there are no failures in either case.

Reported-by: Po-Hsu Lin <po-hsu.lin@canonical.com>
Closes: https://bugs.launchpad.net/bugs/2158217
Fixes: 24e59f26eef2 ("selftest: tun: Add helpers for GSO over UDP tunnel")
Assisted-by: LLM
Signed-off-by: Edoardo Canepa <edoardo.canepa@canonical.com>
---
v3:
  - Drop the claim that a failure leaves the tap and geneve devices
    behind.  The failing checks are EXPECT_EQ()s in the test body, so
    FIXTURE_TEARDOWN still runs (Sashiko).
  - Explain the send_gso_packet failure correctly: its frames are
    dropped as PACKET_OTHERHOST once the tap's MAC changes.  The
    neighbor flush only affects recv_gso_packet.
  - Redo the measurements on a freshly booted host.  The v2 numbers
    were taken in an unclean environment.  The v1 numbers were fine,
    and the v2 entry saying otherwise was wrong.
  - Go back to "Assisted-by: LLM", the current format in
    Documentation/process/coding-assistants.rst.  v2 followed an older
    copy of that document (Sashiko).
v2: https://lore.kernel.org/netdev/20260914211921.3786609-1-edoardo.canepa@canonical.com/
  - Add the unshare(CLONE_NEWNET) to FIXTURE_SETUP(tun) and
    FIXTURE_SETUP(tun_vnet_udptnl) instead of replacing
    TEST_HARNESS_MAIN with a hand-written main() (Jakub).
  - Report an unshare() failure with SKIP() instead of aborting the
    binary before the harness starts (Sashiko).
  - Mention the new CAP_SYS_ADMIN / CONFIG_NET_NS prerequisite in the
    commit message (Sashiko).
  - Change the Assisted-by: format (reverted in v3).
  - Redo the measurements (redone again in v3).
v1: https://lore.kernel.org/netdev/20260905085318.3416670-1-edoardo.canepa@canonical.com/
 tools/testing/selftests/net/tun.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/tools/testing/selftests/net/tun.c b/tools/testing/selftests/net/tun.c
index abe488bac50b..6db21dad0efe 100644
--- a/tools/testing/selftests/net/tun.c
+++ b/tools/testing/selftests/net/tun.c
@@ -4,6 +4,7 @@
 
 #include <errno.h>
 #include <fcntl.h>
+#include <sched.h>
 #include <stdio.h>
 #include <stdlib.h>
 #include <string.h>
@@ -488,6 +489,10 @@ FIXTURE(tun)
 
 FIXTURE_SETUP(tun)
 {
+	if (unshare(CLONE_NEWNET))
+		SKIP(return, "Cannot create network namespace: %s",
+		     strerror(errno));
+
 	memset(self->ifname, 0, sizeof(self->ifname));
 
 	self->fd = tun_alloc(self->ifname);
@@ -732,6 +737,10 @@ FIXTURE_SETUP(tun_vnet_udptnl)
 	struct sockaddr_storage ssa, dsa;
 	void *sip, *dip, *smac, *dmac;
 
+	if (unshare(CLONE_NEWNET))
+		SKIP(return, "Cannot create network namespace: %s",
+		     strerror(errno));
+
 	flags = (variant->is_tap ? IFF_TAP : IFF_TUN) | IFF_VNET_HDR |
 		IFF_MULTI_QUEUE | IFF_NO_PI;
 	features = TUN_F_CSUM | TUN_F_UDP_TUNNEL_GSO |
-- 
2.53.0

