Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=94.136.29.106
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792754101;
	b=0QwrBK91gwaT9fsBVdYE1hBp79F5hU8QC8IZhElplDP9Jx3DxidY5FxwGTJjz0+hBWRQ
	 E4H2x6BvgKTVbGf2jPto7kSxh6Ixerx3BiWlIWHULaKDtVGn+X9ZNHCXu9Td9T6EG2Mgk
	 d4tQt5xthX36Zg2IqvXUVUAPirnTXtCQTOJ8K1lpcEZEdlY0ZJxNeK9c8geA/6pbBcK6v
	 ea0CHZL0Yd/HcS2nJnjrlhLNqyAEnq4JnTTkzIEFvkbOAh58IjC7+0kvWCuePKjqO1cIb
	 dPLs33s1Oke1u7T7vi9IoCrGINtwoeraZ1Hg57POXlLqN6O4GVE1aifw7qYlp/1kW0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792754101;
	h=DMARC-Filter:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Bm-Milter-Handled:
	 X-Bm-Transport-Timestamp;
	bh=xzDAvNfXO0K6NHw8u1pJHkawMAVJO8WvhdrPI3a1KX8=;
	b=dF1eOlVp31RF2Xl6ir4oCHARQj/+7WJPuqBzpt/pLa3rLjqwY0L42JvcDNTgHxbYAscA
	 Yz7zbwn0SVmW2n8lI/SGJdID+58Q+aTwd6TG7FcZ5lHWpCA6tI7uxvhHFVtuHn6rkfmV1
	 6lblsVyHg06nneq2Ht9NGfs81MbyUv19FTPyd53ujj9u8RkZtGEhTeBkTeUqj27VOsqry
	 N6U/i7eGoZgRCzNBy9cB5dork99lch79KLj8Tga/+c/9CrEKWaNSsRj8ehCmrW4uontbE
	 96RtzW6GaNZZPMZA3kVudE5xQqMgv5YP6nocEbeHg2wbkqcruKmeIfgRplXUsiFrASw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=proxmox.com;
	spf=pass smtp.mailfrom=proxmox.com;
	arc=none smtp.remote-ip=94.136.29.106
Received: from proxmox-new.maurer-it.com (proxmox-new.maurer-it.com [94.136.29.106])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0DF8606A31F;
	Fri, 23 Oct 2026 11:14:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0DF8606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=proxmox.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proxmox.com
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
	by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 353F145C21;
	Fri, 23 Oct 2026 13:14:58 +0200 (CEST)
From: Hannes Laimer <h.laimer@proxmox.com>
Date: Fri, 23 Oct 2026 13:14:27 +0200
Subject: [PATCH net 1/2] vxlan: keep reserved_bits across changelink
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-b4-vxlan-changelink-gbp-v1-1-f0d13951c09b@proxmox.com>
References: <20261023-b4-vxlan-changelink-gbp-v1-0-f0d13951c09b@proxmox.com>
In-Reply-To: <20261023-b4-vxlan-changelink-gbp-v1-0-f0d13951c09b@proxmox.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Nikolay Aleksandrov <razor@blackwall.org>, Ido Schimmel <idosch@nvidia.com>, 
 Petr Machata <petrm@nvidia.com>, David Ahern <dsahern@kernel.org>, 
 Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Hannes Laimer <h.laimer@proxmox.com>
X-Mailer: b4 0.16-dev-4217c
X-Developer-Signature: v=1; a=openpgp-sha256; l=2582; i=h.laimer@proxmox.com;
 h=from:subject:message-id; bh=S0b29qRbMV/PMcJXx1uaqSBqF1GE9jdMhzBUbis8hFc=;
 b=owGbwMvMwCU2e2Iv83RDTSPG02pJDFm3HTeo1FtdLRDqcLkyLeHMpyrzKBPTabPuJDtYbzL8u
 Ox+U5tZRykLgxgXg6yYIstl+/1fZ/VOjTM6vZkLZg4rE8gQBi5OAZiIixgjw/rHfyaJrdkgetvr
 8EENialOVyfKCUfU77n2uHxhwpmKzeoMf7imvdk18ccU55qSsJMbAg72vTJ9pj5VejJ/bUR85w/
 NUCYA
X-Developer-Key: i=h.laimer@proxmox.com; a=openpgp;
 fpr=64D04F905C35D23EBE24D079FA418E647F2175D1
X-Bm-Milter-Handled: 55990f41-d878-4baa-be0a-ee34c49e34d2
X-Bm-Transport-Timestamp: 1792754097391

vxlan_nl2conf() derives reserved_bits from the extension attributes
set in the netlink message if IFLA_VXLAN_RESERVED_BITS is absent. A
changelink having it set is rejected, so this means that every
changelink will reset all extension bits and reserve them again.
vxlan_nl2flag() rejects setting a flag on an attribute that is
create-only on changelink. So also setting an extension attribute will
fail before it can un-reserve its fields.

The extension's header bits being reserved again then makes
vxlan_rcv() drop frames that have them set in their header as invalid.
The device still reports the extension as enabled, because only the
reserved_bits are rebuilt and the flags are just copied.

A simple reproducer is

    ip link add vxgbp type vxlan id 1 dstport 4789 local 10.0.0.1 gbp
    ip link set dev vxgbp type vxlan ageing 300

After setting the unrelated ageing, incoming packets with the GBP bit
set in the header start getting dropped.

Keeping the reserved_bits on changelink is safe because anything a
changelink accepts leaves the header bits enabled extensions use
unchanged.

Ran into this when adding support for the GBP flag in ifupdown2, see
link below. The device kept dropping packets after some time, it
turned out it always started after a changelink.

Tested this by changing ageing by hand on a vxlan device that was
created by ifupdown2 with the gbp flag, and checking the reserved bits
using

    ip -d link show vxgbp | grep -o 'reserved_bits 0x[0-9a-f]*'

Without the fix I got 0xf7ffffff000000ff after the changelink, and
with the fix it stayed 0x77000000000000ff. The following patch
contains a selftest that fails without the fix and passes with it.

Fixes: e4f8647767cf ("vxlan: Track reserved bits explicitly as part of the configuration")
Link: https://lore.proxmox.com/pve-devel/20260828134708.692354-1-h.laimer@proxmox.com/
Signed-off-by: Hannes Laimer <h.laimer@proxmox.com>
---
 drivers/net/vxlan/vxlan_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/vxlan/vxlan_core.c b/drivers/net/vxlan/vxlan_core.c
index 278d41f58d89..223539099778 100644
--- a/drivers/net/vxlan/vxlan_core.c
+++ b/drivers/net/vxlan/vxlan_core.c
@@ -4488,7 +4488,7 @@ static int vxlan_nl2conf(struct nlattr *tb[], struct nlattr *data[],
 		}
 
 		conf->reserved_bits = reserved_bits;
-	} else {
+	} else if (!changelink) {
 		/* For backwards compatibility, only allow reserved fields to be
 		 * used by VXLAN extensions if explicitly requested.
 		 */

-- 
2.47.3


