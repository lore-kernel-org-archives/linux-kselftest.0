Received: from cmccmta2.chinamobile.com (cmccmta2.chinamobile.com [111.22.67.135])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36B07400DE1;
	Sat,  3 Oct 2026 10:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=111.22.67.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791022219; cv=none; b=bWT/ZVKIk8LRy0sLOnp3sDn3stVklmS6UgE8Mmr9RNQhAbifJ4Uge32y/iSZZ6f8S8+ZXN8fED3+oMGA8k17XNqYfK2JgjNsPMnKL+xpHQl8CqOeGdbYm2dAqggNM9AiBjTwmdWr0/YDgBAA912CvF8snXiDCZxvg4I/AV9x7Wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791022219; c=relaxed/simple;
	bh=31WdfSjCWnB/HGcobwieMsmopL0/q4Qyr3sHHctciOU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cYVuDcqbXWtSooPri8X7sUa5n7shGGn6bJWf1OOk7cQ39he5HOlolTh7qwvMtifJTmSSliGHp2zbMUVAvoRzEJGNUdXiMKA5vxAXHKz+Z1oBmibaHIa47rZOGJF06gQTVwDxJA0ZeSbyKiCBkuQERPhZJtleF/SHpqRdyq/VmIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com; spf=pass smtp.mailfrom=cmss.chinamobile.com; dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.b=xbcJr4tE; arc=none smtp.client-ip=111.22.67.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.b="xbcJr4tE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=xbcJr4tEF3VrGvJDfQwlsuDoUC/n4Ro6Gzckgzg4PJfCsPFmRsoWp605c3zh/z3c+9sv5LG/DRCAA
	 6zHsQuF5fxJYIJeAGM35kE7WLKtOoO4soROv5x8ybzxIuzs+6pvJIt4+uE3ucVpWQNekOePKIUgzS2
	 0dsFm95Y8Ut+jHFw=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app07-12007 (RichMail) with SMTP id 2ee76ac0d47f12a-9bbb1;
	Sat, 03 Oct 2026 18:10:08 +0800 (CST)
X-RM-TRANSID:2ee76ac0d47f12a-9bbb1
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from  (unknown[112.22.250.209])
	by rmsmtp-syy-appsvr04-12004 (RichMail) with SMTP id 2ee46ac0d4698ac-609a1;
	Sat, 03 Oct 2026 18:10:08 +0800 (CST)
X-RM-TRANSID:2ee46ac0d4698ac-609a1
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
Subject: [PATCH net-next v2 1/2] bareudp: Enable BIG TCP packets
Date: Sat,  3 Oct 2026 18:09:38 +0800
Message-ID: <20261003100939.468181-2-yanhaishuang@cmss.chinamobile.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261003100939.468181-1-yanhaishuang@cmss.chinamobile.com>
References: <20261003100939.468181-1-yanhaishuang@cmss.chinamobile.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit f3d0f753f066 ("vxlan: Enable BIG TCP packets") and commit
03ebe91b0f61 ("geneve: Enable BIG TCP packets") allowed BIG TCP on vxlan
and geneve, after the preceding patches of that series made the common
UDP tunnel transmit path handle GSO packets larger than 64KB.

bareudp transmits through the same helpers, udp_tunnel_handle_offloads()
followed by udp_tunnel_xmit_skb() or udp_tunnel6_xmit_skb(), and does
not fill in any length field itself. Bump tso_max_size up to
GSO_MAX_SIZE so that the admin can use BIG TCP with bareudp too.

The default gso_max_size and gso_ipv4_max_size stay at 64KB, so nothing
changes unless they are raised explicitly.

iperf3 TCP over bareudp (ethertype ipv4, IPv4 outer) between two netns
connected by veth, MTU 1600 on veth, 3 runs of 20 seconds each. This
was measured in a QEMU TCG guest, so only the relative numbers are
meaningful:

  gso_max_size/gso_ipv4_max_size 65536:
    4380.6, 4404.2, 4354.5 Mbit/s, average 4379.8 Mbit/s

  gso_max_size/gso_ipv4_max_size 196608:
    5509.4, 5454.7, 5497.4 Mbit/s, average 5487.2 Mbit/s (+25%)

With 196608, about 90k to 100k packets larger than 64KB were
transmitted on the bareudp device per run, none with 65536. Without
this patch, setting gso_max_size to 196608 is rejected.

Assisted-by: LLM
Acked-by: Alice Mikityanska <alice.kernel@fastmail.im>
Signed-off-by: Haishuang Yan <yanhaishuang@cmss.chinamobile.com>
---
 drivers/net/bareudp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/bareudp.c b/drivers/net/bareudp.c
index c3b5ed52d877..fcc33e302b9c 100644
--- a/drivers/net/bareudp.c
+++ b/drivers/net/bareudp.c
@@ -589,6 +589,7 @@ static void bareudp_setup(struct net_device *dev)
 	dev->max_mtu = IP_MAX_MTU - BAREUDP_BASE_HLEN;
 	dev->type = ARPHRD_NONE;
 	netif_keep_dst(dev);
+	netif_set_tso_max_size(dev, GSO_MAX_SIZE);
 	dev->priv_flags |= IFF_NO_QUEUE;
 	dev->lltx = true;
 	dev->flags = IFF_POINTOPOINT | IFF_NOARP | IFF_MULTICAST;
-- 
2.43.0



