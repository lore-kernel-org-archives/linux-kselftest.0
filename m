Received: from smtp.uniroma2.it (smtp.uniroma2.it [160.80.4.37])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F993225417;
	Sat, 11 Jul 2026 16:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=160.80.4.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783787636; cv=none; b=EO6OKZPtqsAa8gS+9THaKZqNVkm5ytcVMMgug+bvMHDXTb0WAN9GiPGIhgSjqbp28uM6Cu07M0mF+unXn7vol2iLEP8pcW2GnFCHLJFTA5JtiXzByT0PE4x5WbMAeSOQ4b9/SB3XEPr8syHwGPwctvsLM32SaJBQ9efFyeSecco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783787636; c=relaxed/simple;
	bh=eO1SoIkbBLJC/mP+lxkjuyQJcLbIhH0T263tBr3GS5g=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=QDs0bbup18ocmaHPA2Yhu6XGY+SA0fKuz6NpJEhuSaiqKWHce2H7vjbd6uFsPf7FZv3tPYQ0M7VPaClU9rMHafi0IYWKfMUQqWj17r7Dv90u8MjYmIDYkb1SkUJJV73lKjiFIIAGp1HZ7VuzdUASYqsqZw+7rtuFD88KPVIstJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniroma2.it; spf=pass smtp.mailfrom=uniroma2.it; arc=none smtp.client-ip=160.80.4.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniroma2.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniroma2.it
Received: from localhost.localdomain ([160.80.103.126])
	by smtp-2015.uniroma2.it (8.14.4/8.14.4/Debian-8) with ESMTP id 66BGTX4W007834;
	Sat, 11 Jul 2026 18:29:39 +0200
From: Andrea Mayer <andrea.mayer@uniroma2.it>
To: "David S . Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>
Cc: David Ahern <dsahern@kernel.org>, Simon Horman <horms@kernel.org>,
        Shuah Khan <shuah@kernel.org>,
        Nicolas Dichtel <nicolas.dichtel@6wind.com>,
        Justin Iurman <justin.iurman@6wind.com>,
        Anthony Doeraene <anthony.doeraene@uclouvain.be>,
        Stefano Salsano <stefano.salsano@uniroma2.it>,
        Ahmed Abdelsalam <ahabdels@cisco.com>,
        Paolo Lungaroni <paolo.lungaroni@uniroma2.it>, netdev@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andrea Mayer <andrea.mayer@uniroma2.it>
Subject: [PATCH net-next 0/2] seg6: add FIB table attribute for post-encap SID route lookup
Date: Sat, 11 Jul 2026 18:29:05 +0200
Message-Id: <20260711162907.6521-1-andrea.mayer@uniroma2.it>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.100.0 at smtp-2015
X-Virus-Status: Clean

After SRv6 encapsulation the kernel looks up the route for the first SID,
the outer IPv6 destination of the encapsulated packet. This post-encap SID
route lookup uses the FIB table of the current routing context. When the
encap route is installed in a VRF, the VRF's table may not have a route for
the SID, which should be handled by another table, e.g. one used for
underlay connectivity.

A new optional SEG6_IPTUNNEL_TABLE attribute selects the FIB table used for
this lookup. When set by the user, the attribute is honored on both the
input path (traffic that is received, encapsulated and forwarded) and the
output path (traffic that is locally originated and then encapsulated).
SRv6 encap routes that do not set the attribute use the current routing
context, as before.

A companion iproute2 series follows on the mailing list. The examples below
show how to use the "lookup" attribute:

  # SID route installed in the underlay table 500
  ip -6 route add fc00::100/128 via fd00::1 dev veth0 table 500

  # encap route in vrf-100; the first SID is looked up in table 500
  ip -6 route add cafe::1/128 vrf vrf-100 \
      encap seg6 mode encap segs fc00::100 lookup 500 dev veth0

  # or if the SID is already handled by the main table
  ip -6 route add cafe::1/128 vrf vrf-100 \
      encap seg6 mode encap segs fc00::100 lookup main dev veth0

This work started from a use case raised by Nicolas Dichtel and took shape
in the discussion with him [1]. Thanks Nicolas.

The series is made of two patches. The first implements the attribute. The
second adds an L3 VPN selftest that exercises both the input and the output
path, with the attribute (traffic reaches its destination) and without it
(the packet is dropped).

Thanks,
Andrea

[1] https://lore.kernel.org/all/20260327140709.959636-1-nicolas.dichtel@6wind.com/T/

Andrea Mayer (2):
  seg6: add FIB table attribute for post-encap SID route lookup
  selftests: seg6: add test for post-encap SID route lookup

 include/uapi/linux/seg6_iptunnel.h            |    1 +
 net/ipv6/seg6_iptunnel.c                      |  132 ++-
 tools/testing/selftests/net/Makefile          |    1 +
 .../net/srv6_encap_lookup_l3vpn_test.sh       | 1027 +++++++++++++++++
 4 files changed, 1145 insertions(+), 16 deletions(-)
 create mode 100755 tools/testing/selftests/net/srv6_encap_lookup_l3vpn_test.sh

-- 
2.20.1

