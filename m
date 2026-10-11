Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E586629DB6E;
	Sun, 11 Oct 2026 01:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791682890; cv=none; b=KAltF5AFzI2iDrqM0cLQLqG6uhhwWu/kZIuz60/y4wwQvqmoZRSwyrtUpGoAj2ih1Tgb5O4KPtGHv+e2O8URQfL+0dTxuhsfV9H/02XwkcIwkIswZhpZFdDWmjsX/NjJ9/BB+LYk4a0tg4E80bLCoBu/ujo84U2qAvRCpL28HoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791682890; c=relaxed/simple;
	bh=dzGpvfsVi78EdFWRt1QdV6BlQ5fIWBnq7tMkwIXAivM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nLkrwBl9AetpdePAG6KB5A41DiCOs5r0tdcXDRqv4hDVm6X9LzTtPjCt5q0T+vxjaQGdPjsqftZSIQaFr6Y9z/o7wGpMjeRdETx5oPMWFF6omW6FGEk08LVK7iGRM7P5ytOV1q1mDPk9vEsHOyk/ASMbOU/TcHbNms7fphySAj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mn2B4Qkd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mn2B4Qkd"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 68277C2BCC7;
	Sun, 11 Oct 2026 01:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791682889;
	bh=dzGpvfsVi78EdFWRt1QdV6BlQ5fIWBnq7tMkwIXAivM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Mn2B4QkdxIqTBSOhPJAWSO0+meRz6xIROT0wpr6wQZaAtb1N1kVhV9om6HFWIBXjX
	 Fbjc8265jd1xsOcvgJXyb5rXTQDIyQA7pOjDp1c/Orc9sfI/hcge8l4YpCcyuVHt5w
	 mNZNmehsEisWzrZd1XO6wzKAdyB90t9/4yIcYkZH11ICewn/B8IE9fQmEeXsb3y7xJ
	 psnSd5ca8a+AxSVlRTpETNe3V/frrgvE8AspWCn0+fgxZX01n/PntOz91Gwo4QxdCx
	 IELsqMJGfxUBMPMN8WsZGyZwkcLr3I/vrU240Ho5rzDnvl2siZXdJwpEQqdqa0QFlj
	 sO5WFWlKpz/Fw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 566A6CA9EC5;
	Sun, 11 Oct 2026 01:41:29 +0000 (UTC)
From: Brad Fitzpatrick via B4 Relay <devnull+bradfitz.tailscale.com@kernel.org>
Date: Sun, 11 Oct 2026 01:41:27 +0000
Subject: [PATCH net 1/2] gre: keep the UDP tunnel GSO type when completing
 GRO
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261011-bradfitz-gre-fou-gro-b4-v1-1-df713aad1531@tailscale.com>
References: <20261011-bradfitz-gre-fou-gro-b4-v1-0-df713aad1531@tailscale.com>
In-Reply-To: <20261011-bradfitz-gre-fou-gro-b4-v1-0-df713aad1531@tailscale.com>
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Shuah Khan <shuah@kernel.org>
Cc: Antoine Tenart <atenart@kernel.org>, 
 Willem de Bruijn <willemb@google.com>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Brad Fitzpatrick <bradfitz@tailscale.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791682889; l=3220;
 i=bradfitz@tailscale.com; s=20261011; h=from:subject:message-id;
 bh=LMtMCZJAUS6/CHK6QCH6lvIi0fwcvb3yuApVoQ5Fcck=;
 b=9Ik4i6YWBmatP4bnDfwmDoaC2yI31jaqkSWzesYdo6I37CW5eCVqIZ6hvYvbJ4ZRJnPYewfko
 qu30AmrvLkhAF4KijoGL7bP4TfpXYnkTA3I9dJ9omGF6zG5gnlGFBf7
X-Developer-Key: i=bradfitz@tailscale.com; a=ed25519;
 pk=RL25YdOUenVJzQaiZDrw/Aqu9ZEwUQBon30yMHGsIKY=
X-Endpoint-Received: by B4 Relay for bradfitz@tailscale.com/20261011 with
 auth_id=1152
X-Original-From: Brad Fitzpatrick <bradfitz@tailscale.com>
Reply-To: bradfitz@tailscale.com

From: Brad Fitzpatrick <bradfitz@tailscale.com>

gre_gro_complete() assigns SKB_GSO_GRE to gso_type rather than OR-ing
it in. When GRE is carried over UDP by FOU or GUE, udp_gro_complete()
has already set SKB_GSO_UDP_TUNNEL{,_CSUM} before calling into the FOU
or GUE gro_complete handler and then gre_gro_complete(), so that bit is
lost.

That has broken forwarding of such packets since FOU gained GRO: if a
host with a FOU or GUE socket on the tunnel's port merges transit
packets and then forwards them out a device that can't segment them
itself, udp4_ufo_fragment() finds neither tunnel bit and fails, and
the packets are dropped. Since commit 3d010c8031e3 ("udp: do not accept
non-tunnel GSO skbs landing in a tunnel"), local receive is broken too:
udp_unexpected_gso() considers the merged skb, which reaches the
encapsulation socket without either UDP tunnel bit, unexpected and
hands it to udp_rcv_segment(). Segmenting fails, so the packet is
freed and counted in UdpInErrors. Either way, only packets GRO didn't
merge get through, so TCP over FOU or GUE GRE tunnels slows to about
one segment per round trip whenever the receiving device has GRO
enabled.

OR in SKB_GSO_GRE instead, as ipip_gro_complete() and
sit_gro_complete() do for SKB_GSO_IPXIP4. For plain GRE, gso_type is
still zero at this point unless the driver set it, so nothing changes
there in the usual case.

The assignment dates to commit bf5a755f5e91 ("net-gre-gro: Add GRE
support to the GRO stack"), but nothing set gso_type before it until
FOU GRO came along, so the Fixes tag points there.

Tested under virtme-ng with bulk TCP over a GRE tunnel between two
network namespaces joined by a veth, with GRO on the receiving veth and
segmentation off on the sending one, so GRO sees wire-sized packets.
32 MiB took:

                  before                  after
  FOU over IPv4   26.0s, 9658 UDP errors  0.28s, 0 errors
  GUE over IPv4   26.1s, 9686 UDP errors  0.39s, 0 errors
  FOU over IPv6   26.4s, 9860 UDP errors  0.16s, 0 errors
  plain GRE       0.17s                   0.15s

Forwarding the same FOU traffic through a third namespace with its own
FOU socket on the port, GRO on its ingress and segmentation off on its
egress, took 26.0s with 4826 egress drops before and 0.31s with none
after. On v6.8, before 3d010c8031e3, local receive was fine but
forwarding failed the same way (25.7s, 4764 drops).

With GRO off on the receiver, all took under 0.2s both before and
after. The gre_gso.sh and fou_mcast_encap.sh selftests give the same
results before and after.

Fixes: afe93325bc02 ("fou: Add GRO support")
Assisted-by: LLM
Signed-off-by: Brad Fitzpatrick <bradfitz@tailscale.com>
---
 net/ipv4/gre_offload.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/ipv4/gre_offload.c b/net/ipv4/gre_offload.c
index 5028c72d494a..c8129782d39d 100644
--- a/net/ipv4/gre_offload.c
+++ b/net/ipv4/gre_offload.c
@@ -242,7 +242,7 @@ static int gre_gro_complete(struct sk_buff *skb, int nhoff)
 	__be16 type;
 
 	skb->encapsulation = 1;
-	skb_shinfo(skb)->gso_type = SKB_GSO_GRE;
+	skb_shinfo(skb)->gso_type |= SKB_GSO_GRE;
 
 	type = greh->protocol;
 	if (greh->flags & GRE_KEY)

-- 
2.43.0


