Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29E1872627
	for <linux-kselftest@vger.kernel.org>; Wed, 15 Apr 2026 18:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776278900; cv=none; b=S2RLqDnuYUeeoi5r0ISjfC2gxmE4MXyTo6T9IHJ+c8zG9wWg7osCAsfqZvcXp2pQzgT38b7jPKrOI4F0bbt1QU39JCZm53DY4WPFIoHjPMH/393gE1cuXO+ySNWzwHYzBSINsMgstbt2ttcYFUSkwwlcBAone2pFOKPInDzkLLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776278900; c=relaxed/simple;
	bh=acK9LkwVJYGBHLimrLDGviQpqFjShAknFwnK7mICTZ8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=REg+xbdm5eQAh8GC0ObPUQ/GFh8JpolbceMCJ7Q7au++ksrmDFLQyq4mqkMDBRjnBFfM1pyEBg5mfULyrYGEGcb5oNLtcpWSIYftP7oPwu7ODX7myugT2Xc2SXFUbkf50RPkFTl68NmjT+3jggQ0noYGsTesub782A1z1btKjMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=odJRrvOh; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="odJRrvOh"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6716a2d9596so5562679a12.0
        for <linux-kselftest@vger.kernel.org>; Wed, 15 Apr 2026 11:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776278897; x=1776883697; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o8AKpNB+fNRgXfs+tQXp/OXvp8qWOWVTBMYp3n9lbAA=;
        b=odJRrvOhVsi38rwjRAHirsIK9+n548bCwPY2RImlOkWbAG2veD2bICU2zaD8JlRTYn
         Y15bWCAdGg6EJJQBTaxF89pe28HpyCHqcgg+/GZNn4ZUV0u9j5Vhq9dPOwCXEhFdSDN/
         kgbaK596UO0/dv0u+TNvAdgRsi85FETXFkwwEc2McqroMbIwOz9x5KFlPMNJm/AewCn6
         HVGDaY+Q2yG+3ViFe+Yo9ml1FIjSxgXRHWCYe4FBn908GMJihPIEWqw1IuLjZRbkpckv
         jabydnAt4wj8s3JuXVTR5PQasg1j6KCjDh0/50Xxyejk10agrSB/K42Mn1GYKlN34nwR
         52ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776278897; x=1776883697;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o8AKpNB+fNRgXfs+tQXp/OXvp8qWOWVTBMYp3n9lbAA=;
        b=A9Gn80n86WuOC/R7gQLKxzUFTAOyzD1VWI20tKH69PZJsUFpdJ53CxaXkQgkg0VEKA
         66k3ya65pFP7vLaJ5RfitRnN7EsUn4bX2Oz1x+1zvS17bXzkoXa8qVyGEem7ya856wvr
         5STgtUnjr6oJw5LV1z3hFeaZSF/nH813QTcete0pjULZVhu0AXpScx3jQ7cy77zCiPaR
         ttVj3KMQU9/oK2vsNzRULBez7nxqjxJiSF7u4lCcfooZ/zFMWmLwKqxV3pqXtknIcRPD
         Y92DffI+wtmD4bFa3Ep8JySDvZIJVwuIwK0umghHaefu6KMqyzcUL7r858fd+1Pqe4MP
         X+Tg==
X-Forwarded-Encrypted: i=1; AFNElJ9x4czdwS+ELC/iYC+nUfjGMEhT360Lxn7jud2D23g5xrwA92ThL2e0RDimbX3NTi6n3Rj9+y2bTT38QE/gJMo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzo3dDYLGu1WUIN/516Mc2GgRLtQPZCkyd3zcSMfhZwFn4Pmfi2
	7X5gzC4qK+otDPBWu22+qggfAZorKuHkpePUB60U2qRZ/a//Y4rhPfjM048uHxN7
X-Gm-Gg: AeBDievI35BvFizGNHKKX0X4B+mUQUCe7tLJUgV98rVdFRLr4m9EtgbJY63bUjiIgss
	nfPWkRM4l9ZpqiBAwoV9OepFtOu7aI4cZ4NYPrTyPDqF70ZXX8w340IkvRZ3e783PFUQ3DMaK6y
	l/o9OQARnSAN+o+gueWSscmC6w6PsH0Q2Cj1qqDbrqlEhFQJGq4BXX1TOW7pn4uA0UKv69FkTjC
	qfg9yXoJ5M5j1m6uMV1rMpf/XW8yNvREmcuktmfV/WhhzapN5JKSZQoe2gOtytyKMT1xDOSbYIp
	HpsgfRwvUMNLohYKebe6AIyk3RWSzh96i/H4qUremEAwZZYO/MFZ8NndfX7TpEOjGV34sIUjmDW
	WCzyOHPepnL3L/raxOjy3WN6A4pXkt5CDIRmXAHTh1ad6piUSRrmn9+Sr6ApwOoLlgbRzejmQ97
	NeSni8NKQurcySOIwY5yYzDw6WRC/XtXSYDCUNTYEr1PnP7PiPmC4auAH4kPZ+Op4wvy1Qd4vjX
	ak=
X-Received: by 2002:a17:907:9484:b0:b9f:18df:8821 with SMTP id a640c23a62f3a-b9f18df897bmr407715466b.48.1776278897159;
        Wed, 15 Apr 2026 11:48:17 -0700 (PDT)
Received: from dau-home-pc ([89.222.123.96])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67237fff72dsm657388a12.22.2026.04.15.11.48.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 11:48:16 -0700 (PDT)
Date: Wed, 15 Apr 2026 21:48:10 +0300
From: Anton Danilov <littlesmilingcloud@gmail.com>
To: netdev@vger.kernel.org
Cc: willemdebruijn.kernel@gmail.com, davem@davemloft.net,
	dsahern@kernel.org, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, horms@kernel.org, shuah@kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [RFC PATCH net-next v2 0/2] udp: fix FOU/GUE over multicast
Message-ID: <ad_dal164gVmImWl@dau-home-pc>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

UDP encapsulation (FOU, GUE) has never worked correctly with multicast
destination addresses. When a FOU-encapsulated packet arrives at a
multicast address, it enters __udp4_lib_mcast_deliver() which calls
consume_skb() on packets that need resubmission to the inner protocol
handler, silently dropping them instead.

The unicast delivery path and the GSO segmentation path both handle
this correctly, but the multicast path was never updated to support
UDP encapsulation resubmit.

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

  # Sender: FOU + GRETAP with multicast remote
  ip netns exec ns_a ip fou add port 4797 ipproto 47
  ip -n ns_a link add eoudp0 type gretap \
      remote 239.0.0.1 local 10.0.0.1 \
      encap fou encap-sport 4797 encap-dport 4797 key 239.0.0.1
  ip -n ns_a link set eoudp0 up
  ip -n ns_a addr add 192.168.99.1/24 dev eoudp0

  # Receiver: FOU + GRETAP with multicast remote
  ip netns exec ns_b ip fou add port 4797 ipproto 47
  ip -n ns_b link add eoudp0 type gretap \
      remote 239.0.0.1 local 10.0.0.2 \
      encap fou encap-sport 4797 encap-dport 4797 key 239.0.0.1
  ip -n ns_b link set eoudp0 up
  ip -n ns_b addr add 192.168.99.2/24 dev eoudp0

  # Test: ping through the FOU/GRETAP tunnel
  ip netns exec ns_a ping -c 100 192.168.99.2
  # -> without this patch: 0 packets received on eoudp0
  # -> with this patch: all packets received on eoudp0

AI assistance (Claude, claude-opus-4-6) was used during root cause
analysis of the kernel source code (tracing the call chain from
udp_queue_rcv_skb through encap_rcv to ip_protocol_deliver_rcu,
comparing unicast/GSO/multicast paths) and during patch and selftest
authoring. The fix approach was identified by observing that the
unicast path (udp_unicast_rcv_skb) and the GSO path
(udp_queue_rcv_skb) both already handle encap resubmit correctly,
while the multicast path did not.

Changes since v1 (RFC):
  - Moved inline Python packet generator from the shell script into a
    separate helper (fou_mcast_encap.py) and added it to TEST_FILES
    in the Makefile

Anton Danilov (2):
  udp: fix encapsulation packet resubmit in multicast deliver
  selftests: net: add FOU multicast encapsulation resubmit test

 net/ipv4/udp.c                                |  13 ++-
 net/ipv6/udp.c                                |  13 ++-
 tools/testing/selftests/net/Makefile          |   2 +
 .../testing/selftests/net/fou_mcast_encap.py  |  81 ++++++++++++++
 .../testing/selftests/net/fou_mcast_encap.sh  | 105 ++++++++++++++++++
 5 files changed, 206 insertions(+), 8 deletions(-)
 create mode 100755 tools/testing/selftests/net/fou_mcast_encap.py
 create mode 100755 tools/testing/selftests/net/fou_mcast_encap.sh

--
2.47.3

