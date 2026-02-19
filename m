Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEA6B15539A;
	Thu, 19 Feb 2026 23:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771545364; cv=none; b=gA6Iv1XRfkVE576gJlbQnwzK+ZpnOaToS+0IREDXKBZL4PNldHH5T8g/tw96sfKfC709ghJnJVusBog0pqNLUQqFudeoOrWMaSF4+axJx6Oossq3nNq0fHmPuqqWZfZc55ZE1VNcAEN0Aud+ZDGZ6Mm8xy+tg4Orey1V3xYCbsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771545364; c=relaxed/simple;
	bh=W4+lTtQg9XK2AMyVTLl5/C3YX/X14q1QnU9K2rdiGfM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rOTcum6COGlwSyy7ktpcWBYzgHv7t/orYLdVrWxtX4fjJXRen6YCJFD9cy2DBrc8UqESJSwTPBG1r6r/vg8gzdf4DDuPIRmJu9TW2O5nrgj07hSf5wsv/l72HDc8NsNnFuwOqm7u76u4mSPCU/bqzzOK5N3AXSXLrUbBt3Q7Qko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZqZ9+qsJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZqZ9+qsJ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A151DC2BC87;
	Thu, 19 Feb 2026 23:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771545364;
	bh=W4+lTtQg9XK2AMyVTLl5/C3YX/X14q1QnU9K2rdiGfM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ZqZ9+qsJ7zOUH1OAdo3wIjwSIygpVGra27qCSgAIacM/KVMYYDVxzHQDiAgFrN2E9
	 XZF2p8e4yUp6VBnTbX2w6RzDVBwBtVS7QDvzoyu2WH5Leajt0/vbW1l415x/2tknQr
	 iXviLEV4ON/sG5OL1J71wgnDXN94ihihmMO6QYy8ItDsEPooQZ50u/4PWDikVia5m+
	 r+wsPlSAR1ehtgaSmQMy8ErIVB2K6bsp/xt1mdCimXWOWwFZVA0SfqIbpiAk7GHQT5
	 XAL+h86iw1fiLdZTuCPp6Q1+Eg/5YMp5zKzFB1+Rvl7jNLX9XQFKOwOt7UbvrPBS8C
	 XA2LoSXj+EioA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96478C531F3;
	Thu, 19 Feb 2026 23:56:04 +0000 (UTC)
From: Simon Baatz via B4 Relay <devnull+gmbnomis.gmail.com@kernel.org>
Date: Fri, 20 Feb 2026 00:55:17 +0100
Subject: [PATCH RFC net-next 4/4] selftests/net: packetdrill: add
 tcp_rcv_toobig_back_to_back.pkt
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260220-tcp_rfc7323_retract_wnd_rfc-v1-4-904942561479@gmail.com>
References: <20260220-tcp_rfc7323_retract_wnd_rfc-v1-0-904942561479@gmail.com>
In-Reply-To: <20260220-tcp_rfc7323_retract_wnd_rfc-v1-0-904942561479@gmail.com>
To: Eric Dumazet <edumazet@google.com>, 
 Neal Cardwell <ncardwell@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 David Ahern <dsahern@kernel.org>, Stefano Brivio <sbrivio@redhat.com>, 
 Jon Maloy <jmaloy@redhat.com>, Jason Xing <kerneljasonxing@gmail.com>, 
 mfreemon@cloudflare.com, Shuah Khan <shuah@kernel.org>
Cc: Christian Ebner <c.ebner@proxmox.com>, netdev@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Simon Baatz <gmbnomis@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771545363; l=1646;
 i=gmbnomis@gmail.com; s=20260220; h=from:subject:message-id;
 bh=c1eQDsHINo/iLpDzO11WhQUeLWxzIkGGeSmjjLGkjpQ=;
 b=tGiZqmdvVs1iMDN93UHdsZnv90evQhVamdSvCoez+vPECABVnnhvp0nW717BsblYUJtRlcHaH
 oPH4k/Yj/LuCnEItmj3gZHey/IHNif1Hx88V/lBkZm2UFDkSKgvE2qo
X-Developer-Key: i=gmbnomis@gmail.com; a=ed25519;
 pk=T/JIz/6F5bf1uQJr69lmyi7czVG+F9TVZ/8x5z9Wtqw=
X-Endpoint-Received: by B4 Relay for gmbnomis@gmail.com/20260220 with
 auth_id=641
X-Original-From: Simon Baatz <gmbnomis@gmail.com>
Reply-To: gmbnomis@gmail.com

From: Simon Baatz <gmbnomis@gmail.com>

This test verifies the sequence number checks using the maximum
advertised window sequence number when we accept a packet going beyond
any window that was ever advertised (i.e. rcv_nxt advances beyond
rcv_mwnd_seq).

Signed-off-by: Simon Baatz <gmbnomis@gmail.com>
---
 .../packetdrill/tcp_rcv_toobig_back_to_back.pkt    | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/tools/testing/selftests/net/packetdrill/tcp_rcv_toobig_back_to_back.pkt b/tools/testing/selftests/net/packetdrill/tcp_rcv_toobig_back_to_back.pkt
new file mode 100644
index 0000000000000000000000000000000000000000..4d4c33d248948d3dfaf9b0c5b243ed27321e9b10
--- /dev/null
+++ b/tools/testing/selftests/net/packetdrill/tcp_rcv_toobig_back_to_back.pkt
@@ -0,0 +1,27 @@
+// SPDX-License-Identifier: GPL-2.0
+
+--mss=1000
+
+`./defaults.sh`
+
+// Establish a connection.
+   +0 socket(..., SOCK_STREAM, IPPROTO_TCP) = 3
+   +0 setsockopt(3, SOL_SOCKET, SO_REUSEADDR, [1], 4) = 0
+   +0 setsockopt(3, SOL_SOCKET, SO_RCVBUF, [20000], 4) = 0
+   +0 bind(3, ..., ...) = 0
+   +0 listen(3, 1) = 0
+
+   +0 < S 0:0(0) win 32792 <mss 1000,nop,wscale 7>
+   +0 > S. 0:0(0) ack 1 win 18980 <mss 1460,nop,wscale 0>
+  +.1 < . 1:1(0) ack 1 win 257
+
+   +0 accept(3, ..., ...) = 4
+
+// A too big packet is accepted if the receive queue is empty
+   +0 < P. 1:20001(20000) ack 1 win 257
+// Send a RST immediately so that there is no rcv_wup/rcv_mwnd_seq update yet
+   +0 < R. 20001:20001(0) ack 1 win 257
+//    * > .  1:1(0) ack 20001 win 18000
+
+  +.1 %{ assert tcpi_state == TCP_CLOSE, tcpi_state }%
+

-- 
2.52.0


