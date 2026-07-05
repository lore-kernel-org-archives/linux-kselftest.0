Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CAED175A93
	for <linux-kselftest@vger.kernel.org>; Sun,  5 Jul 2026 02:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783218987; cv=none; b=IALTRL/07MXiQ163ZYszJ0vhsrP7YOpClhHSY00mlnJPKOomY88fBtIIGCKDEF2FC+Kw+EM1nfJbc0rmuvZmWR0Xb2KIPh/JS6hGW4bqBDOyuiD3OZS6YXxIjTKgNTRPpZM0G7DJXTWc5iNcGujydUqj802iAjb1zjYJkKjiu0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783218987; c=relaxed/simple;
	bh=FVnq+QFxh+qLqKfpYnn4iEE5oE+A+Of8H4mc623bJ+M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZVDjEuHOFHLoX0V+WIJseJ9OBB5diygRfSfkll8GTuvAym/2XJB5vIOBqHOE82l7aIueXX/NCe0aQXsmEh6QZSEWci+Yj/JDMlYLKGThXPjsP3mnB827IjH8LEJJZcBmuLZlBxZ9+y3IPcLfk0y9JoLU6xWpMGKUj+fKNHOUKls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TXlnEXjn; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TXlnEXjn"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c029505b389so397082266b.1
        for <linux-kselftest@vger.kernel.org>; Sat, 04 Jul 2026 19:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783218984; x=1783823784; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3ci/3PhCLxwaAMpB1SnTOw+fEBBoxsM4i+VO38xxMJM=;
        b=TXlnEXjn479kcST5Csb3dKpx8k/I8MEHSD8Q4wbea5XA6Xw849lGn2pC+o4QWyV76r
         ZcM922ZD4QPnq+cFvVa0lOMUL+wr2CsWj97Ss/yzxE0RpfRYKJxfCNtdXJvbbExEkSt9
         egfIxrUD8zVKBXzDz6puHNtDw+VsthmZmKpWv/0/7M5oggOqUpvULKsDD+94kPOX6Dhl
         JIZr1CScsv/5vR44aijipieo4r/lgjh1jkqMBcaGN1fn7OCCTEObI6e+s1/w1Ezj63sM
         zWw5ccxJGqB1gQdP4dAw8IOUkbty20AmdACc303JfC8HyZFHq1pfVXgKtvfqOwtkqWo8
         dZ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783218984; x=1783823784;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3ci/3PhCLxwaAMpB1SnTOw+fEBBoxsM4i+VO38xxMJM=;
        b=L8cy4axiV95a5nuiKeFD/8ZEr07ETP1OVDFX2CVNjmdDwviSVr8t/zGVfQ5ygk6vdl
         2xvfI9sLz2cidBEiy4kFWojfd+OhoSlNJnzOwAeyGM37FZ2QsJOw9ahPIoVL/wX4hFdZ
         f2bBSHPrl/uvDwPE+SoBZnxg5l0Tz/GAPue/25y3GFujNLWMV0sTFJiNoCQxGVE1lV2+
         4wuwDl/1c20VPAf95OPDdKINTvhtgLKNxsgfQ6uHcxnkL6EXwI2nWi++JfN2LPAmcZrx
         6PnDF1QPLhKWWIQZABltl5tQ5stJh1uo/d47sVewfutBh3aoyVd9ApdN7U2Y9ZOAQybO
         RhQQ==
X-Forwarded-Encrypted: i=1; AHgh+RrrrMkEU11lMrsfRzakij60RWVroVg88Zk7ehKzuZnhJ8MNhfYQTOjj3TvLKuhVnF6VvU2SmiLn7HeUmaT16AM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsmZdQFzSNnLwecZqe3rVLl592MGt37fCc1yFpaxtKknDWNhaj
	hV11CQmcFE8doy1dRudyYpPYs6+ho1C/Df+/7qbhDwhA876ZdvkP/lh5
X-Gm-Gg: AfdE7ckDcL1d2ig9NArxM7idLm/DykpYr/I3M7E9jThP9ubA2QzTuhTsA7VkQn0s+JI
	HVtx7Ce4LfeYTXaincq+tM/jfpao2r+5zCX7JmsJSUXpv/GhmBHOVzJHWC08SPBSTS8hhhZC5/7
	nWxkHpD+MTy8wovukb8xVYBJLN6wuRaSbPiv20haMRISt2azsuNf0stfkI8XBcL8G9UpeOWFJs3
	vUlLTgNg9u3TzxAO2CewS+zE7s941E6R6farw1V2yOd7BimYeu4BinGvc4qXdadw9kPqvGKfv0z
	VeeUHG3SCWwUJWIwo1grM/A2n8yFoBcoXlzPpU5Ihyq0EACDirrCdC3E3xdfUAkXKNMAnuVFKnZ
	mVHfk7roBhZYuSuHMWZR4Y5N4Z66gLEo+4Lj1k5+/UM0wP24mSyZ1bcq7AZuh32Rnoa8ZPlaUEP
	I/R6TYczWKWHFl8nA9PV68/mxMkJMLiO3XcJYusBAEHAYDlzOWw1G1RpqyYw==
X-Received: by 2002:a17:907:f814:b0:c12:8c27:e2e1 with SMTP id a640c23a62f3a-c12c9d3de15mr350524266b.5.1783218984349;
        Sat, 04 Jul 2026 19:36:24 -0700 (PDT)
Received: from dau-home-pc.. ([95.164.115.35])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12bc53e065sm463082166b.46.2026.07.04.19.36.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 19:36:22 -0700 (PDT)
From: Anton Danilov <littlesmilingcloud@gmail.com>
To: netdev@vger.kernel.org
Cc: Willem de Bruijn <willemb@google.com>,
	"David S . Miller" <davem@davemloft.net>,
	David Ahern <dsahern@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net-next v5 0/2] udp: fix FOU/GUE over multicast
Date: Sun,  5 Jul 2026 05:36:02 +0300
Message-ID: <cover.1783218197.git.littlesmilingcloud@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

UDP encapsulation (FOU, GUE) has never worked correctly with multicast
destination addresses. When a FOU-encapsulated packet arrives at a
multicast address, it enters __udp4_lib_mcast_deliver() /
__udp6_lib_mcast_deliver() which call consume_skb() on packets that
need resubmission to the inner protocol handler, silently dropping
them instead.

The unicast delivery paths handle this correctly by propagating the
return value up to ip[6]_protocol_deliver_rcu() for resubmission, but
the multicast paths were never updated to support UDP encapsulation
resubmit.

This causes silent packet loss for FOU/GRETAP tunnels configured with
multicast remote addresses (both IPv4 and IPv6).

Reproducing the issue (IPv4):

  ip netns add ns_a && ip netns add ns_b
  ip link add veth0 netns ns_a type veth peer name veth1 netns ns_b

  ip -n ns_a addr add 10.0.0.1/24 dev veth0 && ip -n ns_a link set veth0 up
  ip -n ns_b addr add 10.0.0.2/24 dev veth1 && ip -n ns_b link set veth1 up

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

IPv6 (using fou6 + ip6gretap) exhibits the same silent drop with a
different fix (see 1/2 for the sign-of-ret difference between
ip_protocol_deliver_rcu() and ip6_protocol_deliver_rcu()).

AI assistance (Claude, claude-opus-4-6) was used during root cause
analysis of the kernel source code (tracing the call chain from
udp[6]_queue_rcv_skb through encap_rcv to ip[6]_protocol_deliver_rcu,
comparing unicast/GSO/multicast paths) and during patch and selftest
authoring.

v5:
  - Fix IPv6 patch: return ret, not -ret (Willem de Bruijn)
  - selftest: add IPv6 test case
  - selftest: create the veth pair inside the namespaces
    (Willem de Bruijn)
v4: https://lore.kernel.org/netdev/cover.1782945956.git.littlesmilingcloud@gmail.com/
  - Promoted from RFC to PATCH; no functional changes since v3.
    v3 was posted as RFC and consequently dropped from patchwork,
    which explains the lack of review feedback.
v3: https://lore.kernel.org/netdev/cover.1777934869.git.littlesmilingcloud@gmail.com/
  - Use return -ret instead of calling ip_protocol_deliver_rcu()
    directly, matching the unicast path and avoiding call stack
    growth with nested encapsulations (Kuniyuki Iwashima)
  - Only change the first-socket path; the clone loop is not
    reachable for tunnel sockets (no SO_REUSEADDR/SO_REUSEPORT)
  - Replace Python packet generator with ping through a properly
    configured FOU/GRETAP tunnel in the selftest
  - Add static neighbor entry (ARP replies cannot traverse the
    unidirectional multicast tunnel)
v2: https://lore.kernel.org/netdev/ad_dal164gVmImWl@dau-home-pc/
  - Moved inline Python packet generator into a separate helper
  - Fixed author email typo in Signed-off-by
v1 (RFC): https://lore.kernel.org/netdev/ad7MsSJOuUU6EGwS@dau-home-pc/

Anton Danilov (2):
  udp: fix encapsulation packet resubmit in multicast deliver
  selftests: net: add FOU multicast encapsulation resubmit test

 net/ipv4/udp.c                                |   6 +-
 net/ipv6/udp.c                                |   6 +-
 tools/testing/selftests/net/Makefile          |   1 +
 .../testing/selftests/net/fou_mcast_encap.sh  | 177 ++++++++++++++++++
 4 files changed, 186 insertions(+), 4 deletions(-)
 create mode 100755 tools/testing/selftests/net/fou_mcast_encap.sh

-- 
2.47.3

