Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF0A349CDF
	for <linux-kselftest@vger.kernel.org>; Wed,  8 Jul 2026 00:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783470919; cv=none; b=A8/vx5qLU/nvSrkipwen+ZbyVQ/lo/1HOg5DBE8pXAq9LUgyxkDIeZbruf9FNk9To5zD+p4AOhQEjG/qBNsCWZSlxr8N1H/gvbYdeN6xjpKRZP964DkYnFvUayGaG0aoqiiemdj8QqAUzcs+ZvP1XIiBc/5a7yz9f0o5dpfo1bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783470919; c=relaxed/simple;
	bh=wE80HFXVS6gE6NCftxK7/wkblCU0qQfZy8JtjREzIzA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tRZHILyjEHabaom7CNTG1QomumZc7UVhULlHkqtmPYgXPpqnQj020VhLyEzCAVK5m/LYoxoCclGmcDvjVTf7FxhhrRJeYH1TESawBYznjZyqkavXFg0ONdPF22DbhtS6exA8wLLQH05500JvTh50bScbOlP+5qCfVnymgsczEg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aKS4NB4H; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aKS4NB4H"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5aeb78090edso96916e87.0
        for <linux-kselftest@vger.kernel.org>; Tue, 07 Jul 2026 17:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783470914; x=1784075714; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=b/YjhnuuQIuAnyjd3cyhNurxxO1PKF/cEV7P1mXkplQ=;
        b=aKS4NB4HMNGGx065gJKx+bqwtqDevf6pw6cqVQVrnXfN6md6IJwzqABgIFxMxDR9dn
         F6cSt1vGdttAsG1dWNyPfohmB58WGslGivoq0XqQWECJFQktV8XMKoqHYwfSIcs3gotz
         JkaiQiwD0A0o5cJR3FmkFBw7Gqj4Fxmc3wl9+SCMUGvOvhvGYomL6oRw9Et+dNwETQ+p
         RIHqQc/62expsGylgK4vyAoKVg+migEEgR7RXhkd56/4aULUz0cUVR3f7v/tBEwdLtEd
         X8SI8uGe5hxKjBg7HMkEUUAsluX3FAgPXK0bZJxVwT3CF4U1iQJtYtzhYaXbI2aXZD75
         xqFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783470914; x=1784075714;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b/YjhnuuQIuAnyjd3cyhNurxxO1PKF/cEV7P1mXkplQ=;
        b=lXwbhwPgFN1xI/c7cnBUEdQeTJCwDynMfEFJilVgwu/sQcV3PwKjkxh7I+QgSq8wOZ
         6QWGIgtSOiJETuuvuGoPHkX5JzVE5XtuT9Fz+RW3tqMrgyT7kiQWrZIF/vDgSIdoPg77
         Gs2XDaPMZk21l2yTLzOJrXaDncnG+eGXS7J/P8BIHlosmZNBe1TthlVO+7EVDslNo01m
         PCBYYhm8TgbV8g4/ouV8BOkOboEPgcRUm5itaxwpGcnfE30yU8N1Aua/5lIrAqKhTDJz
         32aqTD12HwTxkdq5HEtBi3NNm8DFQ3OJFfhxr4/aldj9H2AN0sTvoWWFYmXTefxW09Nn
         gddA==
X-Forwarded-Encrypted: i=1; AHgh+RrjGLbRJ3NZRA93o7NelLWcPl8mrYTeoVXGzmRFB0vzLAEUtexnwIqx9KAAe9C8suIo5K6zXvS6wKl9UQPfr68=@vger.kernel.org
X-Gm-Message-State: AOJu0YzP84cAgshJiD1HNeFLbGzyjcBj/fh2KuzNI2ZaH9bD3fqLNmv4
	JOGO++2ruLQl8HWwvSTBwFBnvf2aMu1nuIq/hQOrH18dM1vi/+98AWtZ+zd+/rKTHVjXPA==
X-Gm-Gg: AfdE7clh37dWXxURv9xvKJuFXRnuIyXZLdsM7hGpQ1ewUpYw2BnfQ8aSfCJDJe8s7BE
	dF0k2g+kbpt3jVyol80Cpv2DAMK9aD0ShLlyAI1hMxonogT7EIcK1ZSZ7UDJvXeGtls1HJN5Ica
	lytHpS2x0Wajh/jSBBz5Ur/D+441TBDUN0ISvG5y4xRcIGF4S+v5nXsa1VE4cjJS4/+TPZbFvVo
	+cS8UqZA7em/ArbwfKk6UT4JaTbWFlCY6zp3yuLgE27QMmq8hdm8Lxd9NAN2xyoIWtEJvvSF/Me
	E8Wh4Q+atsPWLHOdajHddus1B8SXSFzA09dM5C5O0ss3SpI4UETHgSvYdti5UzNqB779kTkmOlJ
	dhB9muF7waZtIScDGYryvINjF713soRxWj9WN2lIJrL/lcfMMPEtW1i9xSTJrcxcic9Jrp/aWoT
	SxjWiAjllYOxukjRp508o9Pak4rklqV+c3ld6g4637tzLmCak5b6UWmxkgYCVJD31svsFhOtm5+
	NKr
X-Received: by 2002:a05:6512:2398:b0:5ae:ba93:9116 with SMTP id 2adb3069b0e04-5b0114381b4mr65019e87.2.1783470913891;
        Tue, 07 Jul 2026 17:35:13 -0700 (PDT)
Received: from dau-home-pc.megasoftware.org ([95.139.182.77])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed136f8dcsm4083867e87.11.2026.07.07.17.35.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 17:35:11 -0700 (PDT)
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
Subject: [PATCH net-next v6 0/2] udp: fix FOU/GUE over multicast
Date: Wed,  8 Jul 2026 03:35:02 +0300
Message-ID: <cover.1783372173.git.littlesmilingcloud@gmail.com>
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

v6:
  - selftest: use the lib.sh ktap helpers (log_test / log_test_skip)
    so the IPv6-unavailable case reports KSFT_SKIP properly (Willem
    de Bruijn)
  - selftest: add CONFIG_IPV6_FOU / CONFIG_IPV6_FOU_TUNNEL to
    tools/testing/selftests/net/config (Willem de Bruijn)
  - selftest: speed up the ping loop with -i 0.01
v5: https://lore.kernel.org/netdev/cover.1783218197.git.littlesmilingcloud@gmail.com/
  - Fix IPv6 patch: return ret, not -ret (Willem de Bruijn)
  - selftest: add IPv6 test case
  - selftest: create the veth pair inside the namespaces (Willem de Bruijn)
v4: https://lore.kernel.org/netdev/cover.1782945956.git.littlesmilingcloud@gmail.com/
  - Promoted from RFC to PATCH; no functional changes since v3.
v3: https://lore.kernel.org/netdev/cover.1777934869.git.littlesmilingcloud@gmail.com/
  - Use return -ret instead of calling ip_protocol_deliver_rcu()
    directly, matching the unicast path (Kuniyuki Iwashima)
  - Replace Python packet generator with ping through a real
    FOU/GRETAP tunnel in the selftest
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
 tools/testing/selftests/net/config            |   2 +
 .../testing/selftests/net/fou_mcast_encap.sh  | 172 ++++++++++++++++++
 5 files changed, 183 insertions(+), 4 deletions(-)
 create mode 100755 tools/testing/selftests/net/fou_mcast_encap.sh

-- 
2.47.3

