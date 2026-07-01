Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF2A34CFD1
	for <linux-kselftest@vger.kernel.org>; Wed,  1 Jul 2026 23:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782947458; cv=none; b=fWxqyToVXWZj7vN+YwLV1INa/jlBa7SShrWY1hlyP+Brz55guNjh3GemgV9WZkNNDjg6ffwHwJGM6EwpbBonV6eEIJs0Ks1PPOx3wRy9aNNvWS9TOQFnUhOWZU/lOMQv+MoP+f7PA/8ellC5QruSA7kd8yclBk4gl5xZZodsdik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782947458; c=relaxed/simple;
	bh=k83TnmWAzHvHC3KVASwPO8YB1Q+fyFuZJU0QKeLyk8Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cOhBa5XXX13iAmAEBTJgZts9Wx+IFe1IxZs11GVl6q1rEhOnFBX3qTqpOSQmpXlIkQYTf/HEXjUVJ2l1ndN5a3CUa+mF9nO1Po43T7RDf/nJG5F+TcarkImXKx11g9zn3a4p3fktUvDGJKVbNXs0KGOxBNcuMe85zw1gBHj+Nkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fpz3gJdR; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fpz3gJdR"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-697763eeafcso2043804a12.3
        for <linux-kselftest@vger.kernel.org>; Wed, 01 Jul 2026 16:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782947455; x=1783552255; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xYzWf3P7KpvKQlLi+J/DIqbvJI/jkF9FMNIVS2/7nwo=;
        b=Fpz3gJdR4BxJON1+xTWK7NJSFe24quqYGIuGBTwr7McnF6HEinQfE/Chsi/sXnKK7s
         ayygxsihemTtqdXnpBuhhXINgVARagNSxU59ZqSTp+hKg/yABzBRkG2Y0oTMnxXRYLIK
         RTsEFTF7gE4KEVfB7gwLRySFcaliGdmehKnkM8U7pEMIP+c6qLekOT9zx169M5VAJnvK
         a4FAfJbjTyhwN8o9pJVpY5xcRCANC9diWxyapOckoRNSYaUbtWgL6e4l2DhHqb17SAPk
         C1DxfwaY2cQfWX5dTF0CPcWroYFs/VKJ0zOESzDNpOENxcAh8sneuUxCRAoiDljLvPyq
         G9vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782947455; x=1783552255;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xYzWf3P7KpvKQlLi+J/DIqbvJI/jkF9FMNIVS2/7nwo=;
        b=cVFjVLJ1JD+FX2R4uUS/hOFBQHEpTwiCoC1OwMtLfOor2MwDYhJwfWLSpu8MkQ1R8g
         GZ2RQcxfHVjv11Uz4RrB5sCD+teYic66V7Ra7Hn5TMqsDKhHAZbeuihgei68pZzhlyRn
         HKOilzpUwo/hpolU0jO/+5EPNT0Y9QxwwUeECOqcolxNtBsP1ICC7u0oaPXIkviy1vUG
         rd9qyxXQG7xINNzdUpMoNcjC6K9EVazGMte7jMWlKhmurPek1FEYs6WP8mo9/QaSWbhr
         KhodHg1P064yeLGjzpmcm5bkyqhns9Ss6KwRxNo1O2tlJsbitodYneWu9DY8UAz5VrYg
         DPnA==
X-Forwarded-Encrypted: i=1; AHgh+Rr0JbM0IOGlEgskUdsZUR58wr6fpmMwFCY3E9BVeO/eVdcGLkTAhjhhC9fmX2Ha7jXtDPR3Ql0rk0K7Fh6WlDs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDX8bMPP8/SyK2HV4KObwxL53OwImhf2uU5X0T5L9H1jdQuk7b
	w4a3KPU7YyESkq83OKeMIcqAoOa8ZQWgxfI9wjvwtrHtOG0u5XZfs++D
X-Gm-Gg: AfdE7ck6dYHI8LPy6Wqnf63jdq0uru0JKGMELuyKtJdCmNo9CJ3RKuN7sR9lyxPLPSE
	H0uAdUZm7i/qvgv2JwAuoxfmtdZ+7w8ljowfjZ3mRvT0yb8r9/oNCwE8I+kaVMlxWTslWErNsAN
	N9fh/NfCaa+a/9xIg8g8DO52dz5g1UX4O9es5ZPglthUX6MPwBGrCDxvYJ+8wx3VXhYgrD7mgB9
	1JsthttVUJlTgZyt56QUjE276Fug36lVIjVPS7IcOA4UHRN/YOqbVYgoor3pTowKrK2pbHtHkZH
	N8BKLVegn1Cpo0H2/B3Jmqo8TvlJV//6Nrhhlsf9JURQcFdlAHiJZDtawSYDPv51kexwkw08TOF
	0TF8GTPrBdIsSXU2nnGrtHU89YYqhb8FHo2SRZ4sQQVBVw6CHLlfffrwHbiyMvGeOMw5sl7L2gK
	wx3yYW3T+S7GSPxVunk5qdhE5PmgXimtBQor9qmFUPBomGuNoX7Wv6B6/BVFKo0d9abXC5Nee71
	QKxrw==
X-Received: by 2002:a17:907:a709:b0:bed:9a7:5ed1 with SMTP id a640c23a62f3a-c12ae45c996mr161885666b.5.1782947455206;
        Wed, 01 Jul 2026 16:10:55 -0700 (PDT)
Received: from dau-home-pc.megasoftware.org ([95.164.115.35])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b629a1d4sm30663466b.39.2026.07.01.16.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 16:10:53 -0700 (PDT)
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
Subject: [PATCH net-next v4 0/2] udp: fix FOU/GUE over multicast
Date: Thu,  2 Jul 2026 02:10:35 +0300
Message-ID: <cover.1782945956.git.littlesmilingcloud@gmail.com>
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

v4:
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
 .../testing/selftests/net/fou_mcast_encap.sh  | 112 ++++++++++++++++++
 4 files changed, 121 insertions(+), 4 deletions(-)
 create mode 100755 tools/testing/selftests/net/fou_mcast_encap.sh

-- 
2.47.3

