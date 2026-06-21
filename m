Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2975019046E
	for <linux-kselftest@vger.kernel.org>; Sun, 21 Jun 2026 19:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782068691; cv=none; b=oaSmYsm1yIFOrv1L12FQVYbZG1eXXvyxWwjYXoHBrwjAqAVODnXWnNNHrzyDaDdKyhuTyhmiF2nsyGPN6/1ijLg40vkQU69d9CyI9Xf0ocaN8qzwYLoWRb7PFOxrAhmE5OtNiRL9HVpDtz3L+3uCYT0FPQ6Yll3dtYeoubCKqpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782068691; c=relaxed/simple;
	bh=ReISC7zQRSyG1CflbXKLubYBm+/t1fKSOjnrfVmVUjo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WxyKWuAPeBDhdSI8rKsrZcT3QKb1aR+FmONT7L3swHjrAQ+1ZsF65HDVDQ2OCbQNgu44aDF7xPRRCg/TA2Fxk+RrJkush4c0xZW4+Eek/kNuVBG12WKXg1iswUQEuCgGcFAGhdmyAF41buUKSsN9QVZeuokXEwfJsKdBuPDqm1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sn3xR1Hz; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sn3xR1Hz"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c029505b389so793740366b.1
        for <linux-kselftest@vger.kernel.org>; Sun, 21 Jun 2026 12:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782068688; x=1782673488; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N7bwW2QsthJJoHQh4gtNxVjqWDflzrySaQFr266/3hU=;
        b=Sn3xR1HzeQNi95yLf8QpA8s8KbpTZhFQ1m1rf4d0pdvkwBMFGmaiEPM82bfQN1mPXe
         kwklr27pmcotfHzMb7LSZpRm2uIsVqDzbQH6pw1gb6Vtgd1+fnoeLgrghyjqVWTtvCrr
         vFHKAgqaWh0vY6IT9Go7b8ukijteap18s+QTuXkXN6y6Ih/2h9+xmSlvzy+fEzxmBaZu
         duMYP98flRiISAYR7gKNLTzy0NcfyKzUCTjog2stQLPdIP80lGreaRL4v1+sYGbBBC/9
         x4ObXB7xvrAeVHoIVFLMaVD+iVXVSkw7/O6l/XduLaA1Db7nGu2pFDFi1Ym6EYnJoazJ
         Iy/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782068688; x=1782673488;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N7bwW2QsthJJoHQh4gtNxVjqWDflzrySaQFr266/3hU=;
        b=rrOGebjCzRrDgB/Eswqis69i1zRa/AvxR7B/jzoAt37q5wExgO5XqwQxSqIMbp5z6s
         ZcAleu20wNPqfzUouqieVzUU4npeQav1WXCCXAJ7rWkn6wMR/ocvL5Pnct7vLvcAhXAP
         VqEeQAyhvqpoxcSBUD7Ohj6k1s/2qvP6WCqsVNYaYqMWzWV2hbJXz3xy8C/T6Fi81hqi
         p5BXdl16oUNDhZk6b2skeN5WVJLHOfpqyHK6mLTeXcZ9Vfaey4tQoW+x4yOOSbnBfz0p
         qssg6IhMpzDVHJz4ZN7ho4GK1NsXYxCT0uiHB3G6gRvGfMVh1IPJ/UcTujwNEEq88W+7
         CKgw==
X-Forwarded-Encrypted: i=1; AFNElJ8xMn5nL1t81HiEI7EvWFxWL6rM7KqUFZZGpQdeE9w9a/B8q6HZNHUBviLhPrBgkb/bzd7cwREM0Bqo+QhVX7w=@vger.kernel.org
X-Gm-Message-State: AOJu0YxuSxSXJGNC9ylKOZ496DUyUBytSTRz3qc0/uAJi3623u8cshhG
	qw1jw5TIUu7pm8VcD38XkYNr4TNfoz0WJ0tMHOBNPtPQsYel8HGUBZvLvlTkpcQR
X-Gm-Gg: AfdE7ck1x1Jgh3rUBB3WE53DAy410BRnwj2ehVzoG/+lrI1Vof9G/pJCtY+V5UAHIUY
	um+H7l2P81knkKHxE1xObE21GJw+WlwwSyxxcKtJkWFUFycNRlUF54SNUk+vfvKRqZBNNvHirZK
	kcNET6DERm0NL1oUISBgSS3di+HixV1BZBNp752V3xGFbcOwy2AehCTvcy5QNZE8hxm42gTIHqk
	2KTENzmLMr2qwuwtKUHB3+v1zVDIJwXtMJ/Rg9TCE6mjDAB5nQ55H0fNgy0n8frlBjpg9wI83F1
	UE4/UiyYuwDeMraF4tGQYFJsisBb7F/fNuF12fVflIBEA7cT1+m9917WWn+61vWZdDXKNQfbTpg
	NSAbDmhhRB0TT89JdK1hoRQQ/A/s6y2zLsUHVpIOBlOlD7ulFwgigUnd2UiAVvnJdEMhv9s/PvJ
	YhO4/wPzL59/x0uKSbB+OWUbqXxfG+nhajfgYKK4kw1POEHg9k2ayjzZu2WbWCwLU/Y6DMdaUB8
	dto8w==
X-Received: by 2002:a17:907:3fa9:b0:bfe:ed35:e854 with SMTP id a640c23a62f3a-c09b9c79152mr523065566b.25.1782068688315;
        Sun, 21 Jun 2026 12:04:48 -0700 (PDT)
Received: from dau-home-pc.megasoftware.org ([95.164.115.35])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c5e99977fsm230558266b.20.2026.06.21.12.04.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 12:04:47 -0700 (PDT)
From: Anton Danilov <littlesmilingcloud@gmail.com>
To: netdev@vger.kernel.org
Cc: Willem de Bruijn <willemb@google.com>,
	davem@davemloft.net,
	David Ahern <dsahern@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net-next RESEND v3 0/2] udp: fix FOU/GUE over multicast
Date: Sun, 21 Jun 2026 22:04:10 +0300
Message-ID: <cover.1782067871.git.littlesmilingcloud@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a resend of the v3 series originally posted on 2026-05-05,
which did not receive review feedback during the previous net-next
window.  No changes since v3; rebased cleanly on current net-next
(after the net-next-7.2 merge).

v3 archive:
  https://lore.kernel.org/netdev/cover.1777934869.git.littlesmilingcloud@gmail.com/

UDP encapsulation (FOU, GUE) has never worked correctly with multicast
destination addresses. When a FOU-encapsulated packet arrives at a
multicast address, it enters __udp4_lib_mcast_deliver() which calls
consume_skb() on packets that need resubmission to the inner protocol
handler, silently dropping them instead.

The unicast delivery path handles this correctly by returning -ret,
but the multicast path was never updated to support UDP encapsulation
resubmit.

This causes silent packet loss for FOU/GRETAP tunnels configured with
multicast remote addresses. The loss ratio depends on the early demux
cache hit rate - packets that hit early demux bypass the multicast path
and work correctly, masking the issue.

Reproducing the issue:

  ip netns add ns_a && ip netns add ns_b
  ip link add veth0 type veth peer name veth1
  ip link set veth0 netns ns_a && ip link set veth1 netns ns_b

  ip -n ns_a addr add 10.0.0.1/24 dev veth0 && ip -n ns_a link set veth0 up
  ip -n ns_b addr add 10.0.0.2/24 dev veth1 && ip -n ns_b link set veth1 up

  # Multicast routes
  ip -n ns_a route add 239.0.0.0/8 dev veth0
  ip -n ns_b route add 239.0.0.0/8 dev veth1

  # Disable early demux to expose the issue (otherwise it's partially masked)
  ip netns exec ns_b sysctl -w net.ipv4.ip_early_demux=0

  # Join multicast group on receiver
  ip -n ns_b addr add 239.0.0.1/32 dev veth1 autojoin

  # Sender: GRETAP with FOU encap
  ip -n ns_a link add eoudp0 type gretap \
      remote 239.0.0.1 local 10.0.0.1 \
      encap fou encap-sport 4797 encap-dport 4797 key 239.0.0.1
  ip -n ns_a link set eoudp0 up
  ip -n ns_a addr add 192.168.99.1/24 dev eoudp0

  # Receiver: FOU listener + GRETAP
  ip netns exec ns_b ip fou add port 4797 ipproto 47
  ip -n ns_b link add eoudp0 type gretap \
      remote 239.0.0.1 local 10.0.0.2 \
      encap fou encap-sport 4797 encap-dport 4797 key 239.0.0.1
  ip -n ns_b link set eoudp0 up
  ip -n ns_b addr add 192.168.99.2/24 dev eoudp0

  # Static neigh: ARP replies can't traverse unidirectional mcast tunnel
  recv_mac=$(ip -n ns_b link show eoudp0 | awk '/ether/{print $2}')
  ip -n ns_a neigh add 192.168.99.2 lladdr $recv_mac dev eoudp0

  # Test: ping through the FOU/GRETAP tunnel
  ip netns exec ns_a ping -c 100 192.168.99.2
  # -> without this patch: 0 packets received on eoudp0
  # -> with this patch: all packets received on eoudp0

AI assistance (Claude, claude-opus-4-6) was used during root cause
analysis of the kernel source code (tracing the call chain from
udp_queue_rcv_skb through encap_rcv to ip_protocol_deliver_rcu,
comparing unicast/GSO/multicast paths) and during patch and selftest
authoring. The fix approach was identified by observing that the
unicast path (udp_unicast_rcv_skb) already handles encap resubmit
correctly via return -ret, while the multicast path did not.

Changes since v2:
  - Use return -ret instead of calling ip_protocol_deliver_rcu()
    directly, matching the unicast path and avoiding call stack
    growth with nested encapsulations (Kuniyuki Iwashima)
  - Only change the first-socket path; the clone loop is not
    reachable for tunnel sockets (no SO_REUSEADDR/SO_REUSEPORT)
  - Replace Python packet generator with ping through a properly
    configured FOU/GRETAP tunnel in the selftest
  - Add static neighbor entry in the test (ARP replies cannot
    traverse the unidirectional multicast tunnel)

Changes since v1 (RFC):
  - Moved inline Python packet generator into a separate helper
  - Fixed author email typo in Signed-off-by

Anton Danilov (2):
  udp: fix encapsulation packet resubmit in multicast deliver
  selftests: net: add FOU multicast encapsulation resubmit test

 net/ipv4/udp.c                                |   6 +-
 net/ipv6/udp.c                                |   6 +-
 tools/testing/selftests/net/Makefile          |   1 +
 .../testing/selftests/net/fou_mcast_encap.sh  | 112 ++++++++++++++++++
 4 files changed, 121 insertions(+), 4 deletions(-)
 create mode 100755 tools/testing/selftests/net/fou_mcast_encap.sh

-- 
2.47.3

