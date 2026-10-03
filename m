Received: from cmccmta8.chinamobile.com (cmccmta8.chinamobile.com [111.22.67.151])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEC8A34D382;
	Sat,  3 Oct 2026 10:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=111.22.67.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791022217; cv=none; b=Jrw+svB/9VrEY58O/5sPebGj3bopGBkIzjXTQinU7A+wRAZAIW35mI++zHrJlSpa9K60OnKlSCtyzQgi9p/73/A6cAVl3wp+6ZNCTn6ynQ+HQ6sdYM5s9lIykST9ndEYIMCo2d2mP7Q5Lxn3lAWmPL5CA4aYmehAaEJZsRhHTFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791022217; c=relaxed/simple;
	bh=kvxIUZftEtUBFFpv+cIaXNq6AXY53meKB1Oq89Ddw5I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Nd+2EU8pT+07RyiTjq0pVkjI0vo3muSsnPjUjuNSPc/7CCWLGMWKYN3peffU0wpbVNy9wHv6bw4uvV5Gu8R5JgPHrnyk7upitNJm1JMrb5/nFxZvoyPutf2dV5C3JxD3AWTEQzlAYr0j2WYcic97ulaE//lNmvlUWki5L5gbixA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com; spf=pass smtp.mailfrom=cmss.chinamobile.com; dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.b=hqPNJdZT; arc=none smtp.client-ip=111.22.67.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.b="hqPNJdZT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=hqPNJdZTNR+kt40RB7nWH37b1m7Wx0gvRmN08iJprhACt+MQJ/GlsSc91n4rzxA4aPVuJJ1zJNQW6
	 qSjde0wFzBrYhsiL2lyxWgvpbVdLLZQiWURVcWVdXVEM7S2uRWNd6Z63vI8Jbvaa4lyon2QIoiGNTQ
	 nkVd8QluIe+0sKOE=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app06-12006 (RichMail) with SMTP id 2ee66ac0d47cf0e-67c7c;
	Sat, 03 Oct 2026 18:10:05 +0800 (CST)
X-RM-TRANSID:2ee66ac0d47cf0e-67c7c
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from localhost.localdomain (unknown[112.22.250.209])
	by rmsmtp-syy-appsvr04-12004 (RichMail) with SMTP id 2ee46ac0d4698ac-60979;
	Sat, 03 Oct 2026 18:10:05 +0800 (CST)
X-RM-TRANSID:2ee46ac0d4698ac-60979
From: Haishuang Yan <yanhaishuang@cmss.chinamobile.com>
To: netdev@vger.kernel.org
Cc: Alice Mikityanska <alice.kernel@fastmail.im>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Haishuang Yan <yanhaishuang@cmss.chinamobile.com>
Subject: [PATCH net-next v2 0/2] bareudp: Enable BIG TCP packets
Date: Sat,  3 Oct 2026 18:09:37 +0800
Message-ID: <20261003100939.468181-1-yanhaishuang@cmss.chinamobile.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series allows BIG TCP on bareudp, the same way as on vxlan and
geneve, and extends the big_tcp_tunnels.sh selftest to cover it.

Patch 1 bumps tso_max_size of bareudp devices to GSO_MAX_SIZE.

Patch 2 adds bareudp to big_tcp_tunnels.sh. bareudp only works in
external mode, so the test attaches the tunnel metadata with a tc
tunnel_key action on egress.

Patch 2 depends on "bareudp: set the inner protocol to the protocol of
the packet", posted to net:

https://lore.kernel.org/netdev/20261002153039.462663-1-yanhaishuang@cmss.chinamobile.com/

Until that fix reaches net-next, the bareudp cases of the selftest with
veth tx checksum offload disabled fail for IPv6 over IPv4 and for both
families over IPv6, because software GSO drops the packets. Everything
else passes without the fix.

v2:
- New patch 2, as Alice asked for selftest coverage.

v1: https://lore.kernel.org/netdev/20261001042336.224343-1-yanhaishuang@cmss.chinamobile.com/

Haishuang Yan (2):
  bareudp: Enable BIG TCP packets
  selftests: net: big_tcp_tunnels: Cover bareudp

 drivers/net/bareudp.c                         |  1 +
 .../testing/selftests/net/big_tcp_tunnels.sh  | 45 ++++++++++++++++---
 2 files changed, 39 insertions(+), 7 deletions(-)

-- 
2.43.0



