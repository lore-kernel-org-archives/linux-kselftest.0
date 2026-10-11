Received: from cmccmta8.chinamobile.com (cmccmta8.chinamobile.com [111.22.67.151])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5C9D28D8D0;
	Sun, 11 Oct 2026 10:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=111.22.67.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791714054; cv=none; b=loyBHPhbsv0tpTxm0DgLwYy+plzGuGM1IKe8JpGJHfZ9X05aVERmygz+gjdzmYSCRL+jsCd3eDQ2O/pH7k486iKcYsLNPaybLvP7T4IYsboBkpef9A1lRZqSoyz+0w18aOUEMRSdNxMpHoF/sK/fNiy/IJBPVi0CyoYrZw5bFj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791714054; c=relaxed/simple;
	bh=FH5y1hy0oNwMcFJ+HvNMk7szKANpbFP3149PWr0f/jE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sXR+fe8gfZcZFOvEuGU8MzexYS1aMAVGID7/OBb+DT24XYoy9C9Wpft5Od6kcCQkNV5H7338rxTruGSlbxfatUSpVs1O84o5Nlf0XY8GLVPurIUfVadJqGcUL++XEkIn+fcJrRQ5hooUADoV7gNyiFKH9tp6CW6gaaPeuEW/UyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com; spf=pass smtp.mailfrom=cmss.chinamobile.com; dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.b=io7TVOOT; arc=none smtp.client-ip=111.22.67.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.b="io7TVOOT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=io7TVOOTjCO7DsWc4JaEoZ4SVISbBQWpiquXPAPypjHiBUfqx646N9Zbm8wLOIh/HYuNfWAakg9rz
	 jAckB2tDDgxDiD76yW91WihgZ9KxKjCFpLuqDMeoC0CxE7SpExKNrbewbs75tOn0oqnZj9QBr34hoi
	 t98BE6hHR5Vz4lyg=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app06-12006 (RichMail) with SMTP id 2ee66acb62f46cd-9bb19;
	Sun, 11 Oct 2026 18:20:41 +0800 (CST)
X-RM-TRANSID:2ee66acb62f46cd-9bb19
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from openEuler-24.03 (unknown[112.22.251.201])
	by rmsmtp-syy-appsvr05-12005 (RichMail) with SMTP id 2ee56acb62eb578-a2778;
	Sun, 11 Oct 2026 18:20:41 +0800 (CST)
X-RM-TRANSID:2ee56acb62eb578-a2778
From: Haishuang Yan <yanhaishuang@cmss.chinamobile.com>
To: netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Alice Mikityanska <alice.kernel@fastmail.im>,
	Daniel Borkmann <daniel@iogearbox.net>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Haishuang Yan <yanhaishuang@cmss.chinamobile.com>
Subject: [PATCH net-next v4 0/2] bareudp: Enable BIG TCP packets
Date: Sun, 11 Oct 2026 18:20:21 +0800
Message-ID: <20261011102023.1603595-1-yanhaishuang@cmss.chinamobile.com>
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

Patch 2 depends on commit c57b2e60d4bf ("bareudp: set the inner protocol
to the protocol of the packet"), now in net-next.

v4:
- Patch 2: do not use "A && B || C" in setup_bareudp(), which shellcheck
  flags (SC2015), and Cc Simon.
v3: https://lore.kernel.org/netdev/20261008055513.1560739-1-yanhaishuang@cmss.chinamobile.com/
- Patch 2: create the bareudp device in setup_bareudp() and return an
  error if any step fails, update the comments that only mentioned VXLAN
  and GENEVE (Sashiko).
- Repost now that the bareudp fix is in net-next.
v2: https://lore.kernel.org/netdev/20261003100939.468181-1-yanhaishuang@cmss.chinamobile.com/
- Add Acked-by from Alice to patch 1.
- New patch 2, as Alice asked for selftest coverage.

v1: https://lore.kernel.org/netdev/20261001042336.224343-1-yanhaishuang@cmss.chinamobile.com/

Haishuang Yan (2):
  bareudp: Enable BIG TCP packets
  selftests: net: big_tcp_tunnels: Cover bareudp

 drivers/net/bareudp.c                         |  1 +
 .../testing/selftests/net/big_tcp_tunnels.sh  | 55 ++++++++++++++++---
 2 files changed, 47 insertions(+), 9 deletions(-)

-- 
2.43.0



