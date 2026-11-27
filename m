Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795817769;
	b=SKmQcs/XARrawS9FVwuihdFSlaL+sirlHX1dFTRc2mDnGhX9XeKNr1Dxt/W2NjoJY7TO
	 ExyHAsMzQwXGM6mwinxaEXQGTyG5O6/HL130i5n2C6hHa2xa01MJBxsJjA4Q9HM2KrrOO
	 RdcIsWO7FcZVBgqqRKFo6I26bUXFMvUmDAkp3HdrmRH+1jyROszm0Ofqc7z0jEHxOvZUH
	 9cCij1WZ/6Ssx0oMcj5810h+Zu+l/JZ8rPBX74wR6oQNB7fgyWWP9KdQmYO0fybYtjBKb
	 8VIZFrnTnzDqoCe0PeAqgwKU67HF+1PWXGF6MCc0zVjYWyVskNfx59oXp1oklD9GtuA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795817769;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=RF+BDTVytMd4+8F4875igTh3Y3eN/fTvSFzzU0Uk2tM=;
	b=qkUCDeiSy2ItOxx1ATfBWHxL+1mIFD2PH0xHvsSOEyJvDVCLOeUPIOjiKZPw1j3ZGCKU
	 avo9K+7S59+ph+VPYE6hSewbfoRzioi4tY8BoSaZaRSUOs6epiGe+IxEbPuL/CGUCiqMb
	 003fv1n+zQOXyKPzbLnbeXIrvPSVNZhURwO/z95yf3wU2rE2bgMETuA+n2UkAoi+9qulZ
	 HOtYLWoepGDB4/E7RQ0ri40v0yoIEVoZDsxc3mCA5A6FBQH7ds6PnBXlqLIfNLe0qbJEr
	 +k62BwSh8FZ+i1qCMeZLmFDNcvrMHXMpjIKIGhf/28dARm1DPnz3T/2rWU/uo6Nw2Wg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C5s1OKlh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CB75606A31E;
	Fri, 27 Nov 2026 22:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C5s1OKlh
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795817769;
	b=y6GSl8nJY3Vw/InfzoQQ6wwQ4IiKutOcLZLMHkCYcev9rNUHXyzQ5+z03yorEcjJl1sa
	 NclGZyo3hi6Q54knjReR7dYkczKL6BzlQsUQ3ZBGcAgMVxDE73h4ndxntGb/3WyAKI8nZ
	 4nlNjePU8VhYtbBu9PlFV9ABDSbEAKWi6bz1lljkjAFpdGydnsSwUEgtJ5/ligZ6DufTk
	 Q7yNUeLvyxGoYvDxfiMrtODAXmGSIWVO7TdU9EJeaf3s7Fx+lt57oanPyLlcNXp1x1Um8
	 zZNCXaRhK2tMBDKWOzqTE+L3Zp8DVPFS2ufzycYtE2vcUwDvOcMrg3jSY5MsD4LgBhA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795817769;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=RF+BDTVytMd4+8F4875igTh3Y3eN/fTvSFzzU0Uk2tM=;
	b=gfM6V8/y1hA1PPFHeEht8AGL/H9hbddlgDkav7HiOPf5JAe9P2xZKaLBwa+PvOTK7tFE
	 v4eCcAeAppFYJUUnWt8rjqg5xXLmzJu/AqQpz+3LJqRSZGOf6+8VVJBvEi8XoPu2EG9uG
	 dsH3s9qOj7gpW/uyM/2EaroYDSJSsWHTQMfRvWTNCYC8Qnn2+AnYanKyCZFHSsOtlk54O
	 3QbHQcBgC9EdcKXTQDF39ijTl19IBDp74KulV6WSVnlrI49CcyIwiByq8D3rGOovMBTu4
	 7ZIqyNZoZvaTkMwEeQpx4HTzr5WiJOaPN19cDmhf1ry/uAdvCaIDbAsHTsR5T6UHIPg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4B8751F00923;
	Fri, 27 Nov 2026 22:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795817769;
	bh=RF+BDTVytMd4+8F4875igTh3Y3eN/fTvSFzzU0Uk2tM=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=C5s1OKlhm1cSS4YaXQFUadcwzNmkwQIY1QN/zhkAX3Friae+GfOwv3BpWEXI7vXJg
	 1dYFiOhbfoQqZq3FT4NqoflMbZORDOkWMsfImpa9kASgHGFWlct5SFT9XxgB1YOC/R
	 5lCxxytch2njR6Tt2at6ZDKniKRTZ2e4OA53t1e8UaIDP4PbsZGNgkHBLV8pqGzjL3
	 DE8fSXLt1QERev3Kzv0S9vDh6F+JEC7ljxLaVtDTbwN/MU7lo/Gs7MJbafp8SzloZT
	 8DtYJZvHYo1ecu4Pc609P8XP0wWOxNzPuejXhnpI4rEPVr4EkGcukKAenvphuMQ3Dj
	 p82S2TQPzXa5A==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 9744F4DE3C;
	Fri, 27 Nov 2026 22:15:50 +0000 (UTC)
From: Kalash Nainwal via B4 Relay <devnull+kalash.nexthop.ai@kernel.org>
Subject: [PATCH net-next v3 0/2] tcp: add net.ipv4.tcp_l3mdev_exempt_ports
 sysctl
Date: Fri, 27 Nov 2026 15:15:49 -0700
Message-Id: <20261127-tcp-l3mdev-exempt-ports-v3-0-f875b1184f26@nexthop.ai>
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
X-B4-Tracking: v=1; b=H4sIABUBCmsC/4WOQQ6CMBBFr0K6dkxpUyKuvIdxUYap1Ag0bW0wh
 LtbcKML4/Lnz39vZhbIWwrsWMzMU7LBjkMOclcw7PRwJbBtzkxwUZWl4BDRwV32LSWgiXoXwY0
 +BsDaqNZQQ1JVLK+dJ2OnjXxmA0UYaIrs8m7Co7kRxhW83nY2xNE/tydSuS3++lIJHBBRaKkrb
 Hl9WgXd6PbabpokPkHqN0hkUFMLbqQxB6PoC7QsywsewH9TJAEAAA==
X-Change-ID: 20261120-tcp-l3mdev-exempt-ports-c9f5dfebe356
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Willem de Bruijn <willemb@google.com>, 
 Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, David Ahern <dsahern@kernel.org>, 
 Ido Schimmel <idosch@nvidia.com>, Neal Cardwell <ncardwell@google.com>, 
 Kuniyuki Iwashima <kuniyu@google.com>
Cc: Shuah Khan <shuah@kernel.org>, Joel Granados <joel.granados@kernel.org>, 
 netdev@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Kalash Nainwal <kalash@nexthop.ai>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4456; i=kalash@nexthop.ai;
 h=from:subject:message-id;
 bh=dP873GVt6fHbxXC6AGVRUb9qtuTt1OmkUinH0EhNZd0=;
 b=owEB7QES/pANAwAKAdTKslu1X9B2AcsmYgBrCgEVrEo3Q6GI7qFviqBuob/+YSri6SzujfOb0
 tKPyWjDBtmJAbMEAAEKAB0WIQSWKdfHnHcAucb08LDUyrJbtV/QdgUCawoBFQAKCRDUyrJbtV/Q
 dhEyC/4jVueuY4HCS3IxPISHZwwbeeEd9YptFQaT3fbbSGjf2Gj5IoJtNTcMFeugS9s3cg9yFgv
 3vRBWnFi3NjkDMB6MK1u1jL/fsdA+7mvIbfepzocBrkMg2w8TnDYbzM8NP7Ai1M0bv5WXM27yJB
 ns1BWCjFQSwkrJyTcgtyOTU7cQa/mLWUXkc7mksRQBUlymv9e5u7+tuGkJcNcxzuDC1hfLr7LLy
 K86FpJkUU5IX3+sLEcdUqicfeRamu58/yMOBmwK6NGhWSd+t0leNGR11crcgq85gvuut4Ryux/W
 BgWYE+jdhMdRhPMer30wdgofmQ2IPCMWP1EciTZHG4cn9dBHpjujiK6E88YfELFCg3rY/A6rbQV
 mIMl8zDuH/M3gwl9ICBeQbBXlswXGuWHNRVd3itfnz7GRuSkNcYzmsTnv2DaQuz61z9oyl7lZ9R
 kLx08n1aalrNMIyrNtiCWfI72mXLoozjT0PEXih7FtjlLxm4Fb1+7fLGJSLVGbnZp1CpQ=
X-Developer-Key: i=kalash@nexthop.ai; a=openpgp;
 fpr=9629D7C79C7700B9C6F4F0B0D4CAB25BB55FD076
X-Endpoint-Received: by B4 Relay for kalash@nexthop.ai/default with
 auth_id=1588
X-Original-From: Kalash Nainwal <kalash@nexthop.ai>
Reply-To: kalash@nexthop.ai

With net.ipv4.tcp_l3mdev_accept=1, an unbound TCP listener also accepts
connections that arrive in a VRF. When a VRF-bound listener exists on
the same port and both use SO_REUSEPORT, the lookup does not prefer the
VRF-bound one: inet_lhash2_lookup() returns the reuseport pick of the
first socket that beats the current best score, and the two sockets
are in different reuseport groups. The winner depends on bucket order,
and AF_INET6 reuseport listeners are added at the tail while AF_INET
ones are added at the head, so IPv4 and IPv6 behave differently.

We hit this with a BGP daemon that has a TCP-MD5 key on its VRF-bound
:179 listener and none on its unbound :179 listener. IPv6 VRF peers
reached the unbound listener and came up without MD5. Setting
tcp_l3mdev_accept=0 is not an option because other services on the
host need it.

Patch 1 adds a per-netns port list, net.ipv4.tcp_l3mdev_exempt_ports,
modeled on ip_local_reserved_ports. For a listed port, an unbound socket
does not match VRF traffic. The check runs only for VRF traffic
(sdif != 0) on unbound sockets, so other lookups are unchanged.

Patch 2 adds a selftest.

Testing:
- New selftest on net-next in virtme-ng: all 14 cases pass. Without the
  port listed, the first listener in the bucket wins (IPv4 fails when
  the bound listener is created first, IPv6 when the unbound one is).
- The same change on 6.12, with a BGP daemon over a VRF with TCP-MD5 on
  hardware: the IPv6 VRF session now uses the VRF-bound MD5 listener.

Why a sysctl rather than changing the default lookup: with both
listeners present, existing setups get a result that is stable but
depends on creation order and address family. Making the VRF-bound
listener always win would change that for every tcp_l3mdev_accept
user, so this series keeps the default and makes the new behavior
opt-in per port. If changing the default is preferred, I can rework it
that way.

Alternatives considered: a BPF sk_lookup program can do this, but needs
a loader attached in every netns that runs the daemon.

---
Changes in v3:
- Patch 1: explain in the commit message why this is opt-in instead of
  a change to the default lookup.
- Patch 1: drop the fast path annotation from the net_cachelines row;
  the field is not in a fast path cacheline group.
- Patch 2: add cases with a listener bound to the VRF slave device, and
  say in the header that such a listener also matches.
- Patch 2: stop the listener that must not get the connection instead
  of waiting for its timeout, so a slow setup cannot make it exit early.
- Patch 2: do not connect if the listeners did not start.
- Rebase on current net-next.
- Link to v2: https://patch.msgid.link/20261125-tcp-l3mdev-exempt-ports-v2-0-b920f3ff8f5e@nexthop.ai

Changes in v2:
- Patch 1: only build the sysctl with CONFIG_NET_L3_MASTER_DEV, next to
  tcp_l3mdev_accept.
- Patch 1: say in the docs that only listener lookup changes, and that
  a listener bound to the receiving device also matches.
- Patch 1: add the field to net_cachelines/netns_ipv4_sysctl.rst.
- Patch 2: wait for the listeners with ss instead of a fixed sleep.
- Patch 2: skip if VRF is not supported; fail if setup fails.
- Patch 2: require a timeout from the listener that must not get the
  connection.
- Patch 2: use ALL_TESTS and check_gen_prog; fix shellcheck warnings.
- Wrap lines at 80 columns.
- Link to v1: https://patch.msgid.link/20261120-tcp-l3mdev-exempt-ports-v1-0-ccc2a3a6cd09@nexthop.ai

---
Kalash Nainwal (2):
      tcp: add net.ipv4.tcp_l3mdev_exempt_ports sysctl
      selftests: net: add tcp_l3mdev_exempt_ports test

 Documentation/networking/ip-sysctl.rst             |  24 ++
 .../net_cachelines/netns_ipv4_sysctl.rst           |   1 +
 include/net/ip.h                                   |  15 ++
 include/net/netns/ipv4.h                           |   3 +
 net/ipv4/inet_hashtables.c                         |   5 +
 net/ipv4/sysctl_net_ipv4.c                         |  21 ++
 net/ipv6/inet6_hashtables.c                        |   4 +
 tools/testing/selftests/net/Makefile               |   1 +
 .../selftests/net/tcp_l3mdev_exempt_ports.sh       | 297 +++++++++++++++++++++
 9 files changed, 371 insertions(+)
---
base-commit: f89726ffabef1b08c52e6163b7ab94b0d5f15503
change-id: 20261120-tcp-l3mdev-exempt-ports-c9f5dfebe356

Best regards,
--  
Kalash Nainwal <kalash@nexthop.ai>


