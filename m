Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95B2617BB21;
	Sun, 11 Oct 2026 01:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791682889; cv=none; b=uDCIrqfmU3ZrS845aQkcoJKYA7EfazsUFEhGCOjMu1F944LxLKnPkk5O8Dn0vkNlsBO0+6HYHU/v+KU9yU7QidsaWmxAkJAHA7v1/zOc5tKUhvH3gGa+h2xBAXvMRuay+kujKNuEWj9Cba8HRDBAsHTD4u+Jm9yaR1hFz2l8Gvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791682889; c=relaxed/simple;
	bh=2PUzwPXzyAstanNK+ARgl7jOmn9o8N4IJ69YnGaGzVs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=rrSG5Q/mcotR7qPfTXP5QpaEzHrsRYlYHZoSBJFDA5ltaOMoq3k8lQP4rt7bDGxCi6j3nh8dhKH6t54X/d1Viq56cd+Ac+FI4eh88RU7cJJED7yGcmE6O/6LtPnRWvMZfQOcP//QGXs9vPrFo78n7TzNYt3P1lOWm71aR19ZPl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L959KC2z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L959KC2z"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5C0B0C2BCB9;
	Sun, 11 Oct 2026 01:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791682889;
	bh=2PUzwPXzyAstanNK+ARgl7jOmn9o8N4IJ69YnGaGzVs=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=L959KC2zT4H6IE+gY67AzWGGG7ShkU80ngS/MGag2yx2wDiw5vDC+ZGL25omaQYmT
	 BPzNryKa/9SmbQVYfPST5ELBCnBIXucIUKnW/JMqD56WPIDWkF+I7OaPKgB3eDN6+6
	 WJkhekjiVlj3ctbwV9jpcDlfE4Z+U1EUbht5Ve+GlzgRCogY9VzvZ6g5rWqZOTrB5a
	 ORyN2m5Gmyn8DGYk13aMfOY3Ert1lOztWnSMrj6aTqbM/VKN6Z5TVIaMZUOX+mF1XD
	 207os0/I6smGitqAk3jIBCMKOHoqDua+dwBpiXroJzKNmwJwVxL/k5B0jLfAoRlPtH
	 MC/9Is6wbavdQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 469D0CA9ECA;
	Sun, 11 Oct 2026 01:41:29 +0000 (UTC)
From: Brad Fitzpatrick via B4 Relay <devnull+bradfitz.tailscale.com@kernel.org>
Subject: [PATCH net 0/2] gre: merged GRE-over-FOU/GUE packets are dropped
 (bug report, possible fix)
Date: Sun, 11 Oct 2026 01:41:26 +0000
Message-Id: <20261011-bradfitz-gre-fou-gro-b4-v1-0-df713aad1531@tailscale.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEbpymoC/yWMQQ6CMBBFr0Jm7SQtEDFexbho4Q+Oi9a0xRgId
 6fq6uf95L2NMpIi07XZKOGtWWOoYE8NjQ8XZrBOlak17dkaa9knN4mWlecElrjUjex7HgYjXYc
 eFydU7VeC6OdXvlFAofv/zIt/YizfJu37Ac2j2MqAAAAA
X-Change-ID: 20261011-bradfitz-gre-fou-gro-b4-770f33e4e8af
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Shuah Khan <shuah@kernel.org>
Cc: Antoine Tenart <atenart@kernel.org>, 
 Willem de Bruijn <willemb@google.com>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Brad Fitzpatrick <bradfitz@tailscale.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791682889; l=3509;
 i=bradfitz@tailscale.com; s=20261011; h=from:subject:message-id;
 bh=2PUzwPXzyAstanNK+ARgl7jOmn9o8N4IJ69YnGaGzVs=;
 b=Gww/NnC9IMn3Ti0+Oce2s6ChbJfLdinBNs7sj15tT5BMp2WkLd2fBAgCIdQkFDuNNPgoih+Ox
 0sA7tuhvHmiCOHOyu6xVRq0GvaZQk3qFCIcnKypUn2FkbTOdWErJTJq
X-Developer-Key: i=bradfitz@tailscale.com; a=ed25519;
 pk=RL25YdOUenVJzQaiZDrw/Aqu9ZEwUQBon30yMHGsIKY=
X-Endpoint-Received: by B4 Relay for bradfitz@tailscale.com/20261011 with
 auth_id=1152
X-Original-From: Brad Fitzpatrick <bradfitz@tailscale.com>
Reply-To: bradfitz@tailscale.com

I hit this by accident while working on something else: bulk TCP through
GRE-over-FOU tunnels between some EC2 VMs crawled at about one segment per
round trip, and turning GRO off on the receiving NIC made it go away. I'm
not a kernel networking person, so I went to debug it with an LLM coding
agent, and it found what's below.

Please consider this series a bug report at best. Feel free to ignore it,
or to fix it some other way if this isn't the right fix; I may well have
this wrong. Empirically, though, patch 1 fixes the packet loss we were
seeing, both on our VMs and in the reproducer in patch 2.

What seems to be going on: when GRO merges GRE packets carried over UDP by
FOU or GUE, udp_gro_complete() sets SKB_GSO_UDP_TUNNEL, then
gre_gro_complete() assigns gso_type = SKB_GSO_GRE, which clears that bit.
The merged packet then can't be segmented where it needs to be:

  - at the encapsulation socket, since commit 3d010c8031e3 ("udp: do not
    accept non-tunnel GSO skbs landing in a tunnel") in v6.9, where
    udp_unexpected_gso() catches it and it's dropped and counted in
    UdpInErrors;
  - when forwarded out a device that can't segment it itself, since FOU
    gained GRO in commit afe93325bc02 ("fou: Add GRO support"), where
    udp4_ufo_fragment() fails on it.

Either way, only packets GRO didn't merge get through. Patch 1 ORs in
SKB_GSO_GRE instead, as ipip_gro_complete() and sit_gro_complete() do for
their GSO bit.

Patch 2 adds a selftest, fou_gre_gro.sh, that sends bulk TCP through GRE
over FOU and over GUE, each over IPv4 and IPv6, with GRO on at the
receiving veth, and checks that the receiver counts no UDP errors and that
GRO really merged packets. Without patch 1 all four cases fail; with it
they pass.

Tested under virtme-ng (QEMU/KVM, Ubuntu userspace), before and after, on
net's main (af32da41b032) and on v7.3-rc6, plus v6.8 for the forwarding
case. gre_gso.sh and fou_mcast_encap.sh give the same results before and
after. net/ipv4/ builds with no warnings under W=1 with both allmodconfig
and allyesconfig, before and after; I didn't build the rest of those
configs.

Disclosure, per Documentation/process/generated-content.rst: the agent was
Claude Code (Anthropic). Over a long session, I described the slow
traffic; it captured packets, traced the drops to udp_queue_rcv_skb() and
then to gre_gro_complete(), wrote the one-line change, the reproducer and
selftest, and original versions of the commit messages, and ran the tests.
I've reviewed the code: the new selftest entirely and confidently, and the
one-line operator fix seems at least plausible, given that the old code
doesn't match similar GRO-completing code in the net directory. But I'm no
expert in the net code or the life of GRO handling, so review cautiously.
Both patches carry Assisted-by: LLM.

Signed-off-by: Brad Fitzpatrick <bradfitz@tailscale.com>
---
Brad Fitzpatrick (2):
      gre: keep the UDP tunnel GSO type when completing GRO
      selftests: net: add a test for GRO of GRE over FOU and GUE

 net/ipv4/gre_offload.c                     |   2 +-
 tools/testing/selftests/net/Makefile       |   1 +
 tools/testing/selftests/net/fou_gre_gro.sh | 164 +++++++++++++++++++++++++++++
 3 files changed, 166 insertions(+), 1 deletion(-)
---
base-commit: af32da41b0327b9c6a37856ba82b6760d6c8d10e
change-id: 20261011-bradfitz-gre-fou-gro-b4-770f33e4e8af

Best regards,
--  
Brad Fitzpatrick <bradfitz@tailscale.com>


