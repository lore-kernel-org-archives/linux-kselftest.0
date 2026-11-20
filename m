Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795214838;
	b=cHwuyiTILyGwUUhWJdRJTGak5610RRr0DvbSKGy5tXlFnav5oKNxIGoFcTXAV/tNrTLo
	 3KNfgg+sW1vDo0oYdXMIr3XP9bfKqYMy3TqE8XdiVyRoQbxO+3mWY28hOjD3y2TDwFnsr
	 kcKHSMOx+s6ASbg6BANZ/QKozsetTt/FYc1kckW4oYyprwyCFmNe4NcGBGvOnzR1EF/xg
	 qqO35LE2RWtqV1lyZosZXphutAiBF6AcnFAnDSAHhctGxWvuzl/Odgcx48drKOqQHeKrv
	 K7NId320j8TZruNalcqfc0jGhCrARIM7tjOwGZ7OQYAqxQiuoRc0j/ggWDjvsFVTghg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795214838;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=gEstmTuUlfOZGO7oarjh8+KZJE6tnkJXFS9cW8B8A2U=;
	b=zhv1TwyQ/Un75N+V9zyKfRQAloKnLU6oYc8+v0/NgTEEDbp+itZevVonb4pqZl6F57by
	 OQKGKvgP6wc6yjLtkjIGoaM37HITbtP9fB2P42qAaWyUvnzvOee8iaTIVsM86apeJvtJZ
	 W52s8AZKCHIzfpccy6ljAiN1Lm/uq1IWSLXzpDZEeYHuNk5GbX4MDU51dr+RXbu4XAi8i
	 dzumOBrTfQVWuhal+s9H+xrCAQXylBPGTNNNv/P7aO5OzpvW4+EZIp8zZ4emapWdD+sGJ
	 dHwQ/MXxEVHb6rcKsrqwaoRxuelS8SIX0u/gHNDt7UDWfckj4qJvDo77S7s45Shzgiw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IKKVg3cF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D061C606A6AA;
	Fri, 20 Nov 2026 22:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IKKVg3cF
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795214838;
	b=twq7U9Gl57VBs544vo8H1fV4J48fL6XVCQOY5teq2nrrWL/tRBY9YMy7+JQdMjhSFmy4
	 NVATvfd2CEgc1DDfNTIRI6lWdNHVoWMGENDRFveUyKf2Otf5x81u9zE7BlVtP7STY8qD+
	 WDEoSfw16rJil0il8cm8exgXnwifLv4vFFz/gvUcBle5MiApOSTBTV7KwpBCcfzx4s/M9
	 8IPP3Icc/NPHm0jDR+P46i/bY0GMS9r0K6KQYC67+uRpeg4Vs2JLm0U9z4L3p6yXeQFno
	 zJJMMcwcveTNqpSqejup2j3u+x4o1AF8SDPVzaErpkAucPLFoIB3FP14HPiqL6WiZYw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795214838;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=gEstmTuUlfOZGO7oarjh8+KZJE6tnkJXFS9cW8B8A2U=;
	b=P2935c3JZ1EON4JuAqdRndM4mQsmy9qt+ifzyHKtiMMFPN34R0oDDphk+9qyEwrMWl6h
	 nuYJWoJjCI4hsAXlKfaU2hjuQCR+2w3+CCsCQrx6lfVXlghBTNjaXlwtl1Y7Oqvl0ohtp
	 F9fb7PYH12uo6Kv+boOeEhFvTXYbxNEJwypJFftn4nbt17mAlGKrjmcOxYZ1ICq8ZGZbU
	 s4rmL5BwhaIIdcg9gwE1SPLro17EHGgYs1N3IEhGZmN1BcAsyWZJIWOMlb5r/PFQGYjej
	 jQtna3zU2QXFvAhN14oTOXhYzyP9avVpUmPDSe29joVGI7A9JdiSEQ+HAhp6WdCvHeQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 08F391F000D1;
	Fri, 20 Nov 2026 22:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795214838;
	bh=gEstmTuUlfOZGO7oarjh8+KZJE6tnkJXFS9cW8B8A2U=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=IKKVg3cFCiLbEGcxRj0LpXhBJgsCn2qztDnVvQ1j2N3Atb+hwZHHGGkkp4MlknxWf
	 tC07s7gjBr1uIAcxO11gXsrpxSs7YT/Ehpkji/H5xu4eXhDxEzVa2czCXhC9Msm8IE
	 KZBkhXvsXMQ1KiND8IuNkUSUDY/JIIeEI6wBsjTz7bNEmlo4z6mTvo3KJ6ITyeV0bG
	 jPWdaRVtUs87ineibxuNdGPCBsKIevK9N+cdaS7b6zc/6x6BfnwllA50OhQEvuWI1B
	 Hc4wuujXOLDbREVX8cyPDq1/vwFwjvH0ez+IrDOvbF87kWjkQr9/FJgxCRgVrtGoHh
	 2cR/xuiFfgwMw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 541A64BA61;
	Fri, 20 Nov 2026 22:47:06 +0000 (UTC)
From: Kalash Nainwal via B4 Relay <devnull+kalash.nexthop.ai@kernel.org>
Subject: [PATCH net-next 0/2] tcp: add net.ipv4.tcp_l3mdev_exempt_ports
 sysctl
Date: Fri, 20 Nov 2026 15:47:04 -0700
Message-Id: <20261120-tcp-l3mdev-exempt-ports-v1-0-ccc2a3a6cd09@nexthop.ai>
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
X-B4-Tracking: v=1; b=H4sIAOnNAGsC/yWMQQqDMBQFryJ/3Q8motBepXRRkxebUmNIvhIQ7
 960LodhZqeM5JHp1uyUsPnsl1BBXRoyr2eYwN5WJt3qQSndspjIn2622BgFcxSOS5LM5up66zC
 i6weqdUxwvvzPdwoQDihCj9PkdXzDyG9Mx/EFqCK7g4UAAAA=
X-Change-ID: 20261120-tcp-l3mdev-exempt-ports-c9f5dfebe356
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, David Ahern <dsahern@kernel.org>, 
 Ido Schimmel <idosch@nvidia.com>, Neal Cardwell <ncardwell@google.com>, 
 Kuniyuki Iwashima <kuniyu@google.com>
Cc: netdev@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Kalash Nainwal <kalash@nexthop.ai>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2534; i=kalash@nexthop.ai;
 h=from:subject:message-id;
 bh=5+wJ1wgapkViv2nkjqCc0s6p6SRRlJLd1BhMgD5qp6M=;
 b=owEB7QES/pANAwAKAdTKslu1X9B2AcsmYgBrAM3pSLifdKN9WQiB9uTQC326a2VgvdGJGuG0Z
 ZcS1mQdXgCJAbMEAAEKAB0WIQSWKdfHnHcAucb08LDUyrJbtV/QdgUCawDN6QAKCRDUyrJbtV/Q
 dpiQC/45wVLA7WusfOWS+DB5ZPRdHU4CjiyC2sqtaRTkjfypUyKuBek3eeEGhV0mYpsFR4ubI00
 zFWDbkpjtkmpVplJwk1ppAE+gXen8Q+FKiybedp5ZHWyQLR2mxdbJ6kLUXwbpposaaMmcR0VugI
 mPEbW96k3yMzIYude7imhCg5JwGdBy02gcmr6pI1Pwtouzjue22PLwICmfZmik2eZHMBTKVaDNT
 CibfZcVA9Aw4kavc5jsv4PecwzhIGXxC0m/Lqc+MzYSBFSMESuyrH969rI6eDa+uQud0g+pT2Di
 RNovoVTwMokPw3BGaERqzDJdNi6p2fx8aFKsYMFV0qHZw/k0RAHOjK0Ogp2dmfDNziZKEM8zCtT
 YU/HRthwKC26zR2iUlXdTxi+4WSqMtygy4qtCxpfAbkwGDKI0kgFLG9Ap5YcOfEVmV9CjZhzcd/
 c6q11CKgB45X1HSm2PgesjFfpL+oKWsgt3Dbe7t88fI33bOqkr/DgfZOK9shhptPng2Us=
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
- New selftest on net-next in virtme-ng: all 10 cases pass. Without the
  port listed, the first listener in the bucket wins (IPv4 fails when
  the VRF-bound listener is created first, IPv6 when the unbound one
  is).
- The same change on 6.12, with a BGP daemon over a VRF with TCP-MD5 on
  hardware: the IPv6 VRF session now uses the VRF-bound MD5 listener.

Alternatives considered: a BPF sk_lookup program can do this, but needs
a loader attached in every netns that runs the daemon.

---
Kalash Nainwal (2):
      tcp: add net.ipv4.tcp_l3mdev_exempt_ports sysctl
      selftests: net: add tcp_l3mdev_exempt_ports test

 Documentation/networking/ip-sysctl.rst             |  19 ++
 include/net/ip.h                                   |  14 ++
 include/net/netns/ipv4.h                           |   1 +
 net/ipv4/inet_hashtables.c                         |   5 +
 net/ipv4/sysctl_net_ipv4.c                         |  14 ++
 net/ipv6/inet6_hashtables.c                        |   4 +
 tools/testing/selftests/net/Makefile               |   1 +
 .../selftests/net/tcp_l3mdev_exempt_ports.sh       | 213 +++++++++++++++++++++
 8 files changed, 271 insertions(+)
---
base-commit: 2208ab00f4f213ade91ab775e7f8c4dacdcc856e
change-id: 20261120-tcp-l3mdev-exempt-ports-c9f5dfebe356

Best regards,
--  
Kalash Nainwal <kalash@nexthop.ai>


