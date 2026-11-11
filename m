Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=94.136.29.106
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794418728;
	b=4oLyHeNl2GSXKcBkQRkGO3Zn+t0gXU4B9H1tM9U1poCvhwy2s+1TWTLgoZqmdDqJ4xB1
	 xX4Fk3g2D+tgi/Iz8cwdpBa0XwzfIsDWiu4CQNmNnvCILdR96boQdv8CGrTUASasYldeN
	 TxzGg3N4xVF4OXl7Uky6wPoNcjSjNv9gyuqJlnjQYHhE3sUtIHPtWwD263wBgNoYEBOoL
	 moS/aMHDJ6B+y8SS2Qe1pNqfeE5U+a0CDMOGzn/LgPZ1+C/9zxNYcPg2lF+LCKjqyaRyJ
	 Tae42EyA81P+iY4TNgxmtTF2P/IoX1XHe3FJls4z4Qa0S6pLg3931BMs5lMVSZchyKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794418728;
	h=DMARC-Filter:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Bm-Milter-Handled:X-Bm-Transport-Timestamp;
	bh=9LbU2z/Q2aDfTMYbDYnnnTcQA7i/a4L3tX6h70C2NXg=;
	b=OozyvpOeC9KBhiJwqL9g3pzn+6rJJZx3hbBWTG3KwSgnzBKQE5IGVD5fqFp7CTq8XhPs
	 pMyAVGde8ykpdTeF+H0HYoeVE9va6st8M7emly1gVA6ZhzKzSSn2mBffrQRUYEKo+j9vI
	 lfIJlCBJP8Mp5JW31iusYN39sZaoftzjYN3vgfqKmwASE9NTDHyH9eCp2DCl7pql7+cnA
	 eEubJtWZgJnD0RPkx2kni2w85Cmik3wocafHAZHmduIvu+rb8l/5wx9uupzfQ3upTpWob
	 gvwFc3mpkQzGmPwNkPrbB2ZtSL7twgvoAFi/LvLPZpqbIkX+xuFJYB8zn4U7+ebYyfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=proxmox.com;
	spf=pass smtp.mailfrom=proxmox.com;
	arc=none smtp.remote-ip=94.136.29.106
Received: from proxmox-new.maurer-it.com (proxmox-new.maurer-it.com [94.136.29.106])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B335606A321;
	Wed, 11 Nov 2026 17:38:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B335606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=proxmox.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proxmox.com
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
	by proxmox-new.maurer-it.com (Proxmox) with ESMTP id C381D482C6;
	Wed, 11 Nov 2026 18:38:44 +0100 (CET)
From: Gabriel Goller <g.goller@proxmox.com>
Subject: [PATCH RFC net 0/3] net: fix stacked VLAN header corruption in TX
 offloads and OVS
Date: Wed, 11 Nov 2026 18:37:48 +0100
Message-Id: <20261111-net_restore_the-v1-0-6aaeffa601c9@proxmox.com>
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
X-B4-Tracking: v=1; b=H4sIAPin9GoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDINDNSy2JL0otLskvSo0vyUjVNbVMMk1LMjY2TUs1VgLqKihKTcusAJs
 YrRTk5gwSA+pRioXIFZcmZaUml4CMVKqtBQA8bTzGfwAAAA==
X-Change-ID: 20261111-net_restore_the-59b5fb335fe3
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Boris Sukholitko <boris.sukholitko@broadcom.com>, 
 Aaron Conole <aconole@redhat.com>, Eelco Chaudron <echaudro@redhat.com>, 
 Ilya Maximets <i.maximets@ovn.org>, Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dev@openvswitch.org, linux-kselftest@vger.kernel.org, 
 Gabriel Goller <g.goller@proxmox.com>
X-Mailer: b4 0.17-dev
X-Bm-Milter-Handled: 55990f41-d878-4baa-be0a-ee34c49e34d2
X-Bm-Transport-Timestamp: 1794418723479

Since commit 938863727076 ("tc: adjust network header after 2nd vlan
push"), a second VLAN push leaves network_header pointing to the
in-band VLAN header. The igb driver TSO and OVS IP set actions still
expect the L3 header, so they write to the VLAN header and corrupt
the packet. Patch 1 restores the L3 header in validate_xmit_skb() for
CHECKSUM_PARTIAL packets, which covers packets tagged by tc or BPF.
Patch 2 restores it in OVS right after the push, before later actions
run. Patch 3 adds a KUnit test. tc classification after a push keeps
working.

The kernel uses two conventions for skb->network_header when a packet
carries an in-band VLAN tag:

* network_header points at the L3 header
* network_header points at the in-band VLAN header

Since commit 938863727076 ("tc: adjust network header after 2nd vlan
push"), skb_vlan_push() uses the second convention when it pushes a
second tag. The flow dissector, and so tc flower, needs that layout to
classify the packet after the push. Drivers doing TSO or checksum
offload expect the first one. vlan_features_check() clears TSO for
multi-tagged packets, so most drivers fall back to software GSO, which
finds the L3 header itself. igb keeps TSO for these packets and reads
the IP header at skb->network_header, so it builds the TSO context from
the VLAN header and corrupts the packet. OVS set actions after a second
push write to the wrong header in the same way.

Which convention should a packet with in-band VLAN tags follow? This
series keeps the tc layout, converts to L3 in validate_xmit_skb() for
CHECKSUM_PARTIAL packets, and restores L3 right after the push in OVS.
If L3 should hold everywhere instead, the flow dissector would need to
find in-band tags from mac_len, and skb_vlan_push() could go back to
its old behavior.

We hit this in production with VLAN-tagged traffic forwarded by OVS out
of an igb NIC. The bug was actually triggered, not just found by
code inspection.

Link: https://bugzilla.proxmox.com/show_bug.cgi?id=8318

Signed-off-by: Gabriel Goller <g.goller@proxmox.com>
---
Gabriel Goller (3):
      net: restore the L3 header before VLAN TX offload checks
      openvswitch: preserve the L3 header after stacked VLAN pushes
      net: test stacked VLAN headers before TX offloads

 net/core/dev.c                                     |  17 +++
 net/core/net_test.c                                | 145 +++++++++++++++++++++
 net/openvswitch/actions.c                          |   6 +-
 .../selftests/net/openvswitch/openvswitch.sh       |  34 +++++
 4 files changed, 201 insertions(+), 1 deletion(-)
---
base-commit: 8d5ce4751fad9499ea408163af7f410f18a85782
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net.git main
change-id: 20261111-net_restore_the-59b5fb335fe3

Best regards,
--  
Gabriel Goller <g.goller@proxmox.com>


