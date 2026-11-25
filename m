Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795641477;
	b=j9dFAyMj4ELnQfyY2vEeU/JuR3/G3i3o49p2z36gDmjX/45mKJ0UhDxO282qpcwL1cIm
	 NuXJGOSK0lI11YuxKgjMhqFPryQfo47WjcI5G2+m66mglvKGv0AhAP8W4OLOBAPRc3uVo
	 KrXgOsIjm5tAk/qHGjTrobWSVJe9tHlnA4fqK4izo2fQeRpvovQDQ3Jg5mxV2MDUg9X+w
	 rSbgfvx5Mb380qxbgtDPDIaTYcFG/kdukB24IugsYaQhcP5SQOhAVtz0sB7kzEo6zGRpF
	 BticeRDfaU2HpaWIrf9pHcREnvmJMyH//KEXFxZMh/Eq3y2h9Mbhx0Uwtpo86NUVLZQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795641477;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=Q3LohTUTvTDKTOnmMCdsVFV7yA521KeB7VGeO+9OdHQ=;
	b=ix6OU71SzJIFUIZAgC70w6oQWqfth+s/3yIYzU0M6LMFHiHCkN+X9HIMA9K2g8yFoWYs
	 zidKxfTnV3QNAQaF8IIjcMgnYF8wjiAJuuiQxjUWY+wQfTcbpuJafi1OiP+MkT2IjJ2Yy
	 Gf6ezVpLQ2NKUR4F2tmdGXtG8TAGl0xerp7dAhCjuK0NeAiuG1fYeVaz/0SZHBhuUrrgH
	 rrDa+VQz7IDM5EpcHMvrnqC0MnNq380I1n531Yqczf1FiRND4vaAxu2qN9jfvUpmdQZVi
	 8KYGLiW6p0e4dI1mhcynXDTalkOgp7HvXOOP8sPVrA0qgPw9T9TnKQ0jbfCl8z/yqFg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YyMW2j68;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA689606A32A;
	Wed, 25 Nov 2026 21:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YyMW2j68
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795641477;
	b=E7EvnVMkS/uuRmwl9oAL60IdVOzZil5wBNAzr2j6uLIHZpqO8UsyxZh9okudltXziTXb
	 GroD/NpSTDOyBReNCGwzeGbcw6iz9fxYKQkzSv+ZDGTnpe47nvEMbxbrD8GkWJzTStucZ
	 6OVoBJ1qlWmiGXEkeB06bwtup59QOlVgsmvGsXxrDyZz4Fcw/8F/K89qPVMzomalxek4D
	 RDmK4OehAdB6m2f/Gs5m6srKPE55/HxG1Hbm4JlD9B+3yi3nuqV0aJUKGpwL/OOnMcnyZ
	 5TyaL7EQuCHO7ar/stI5aqWYU8/nTbXXxhwSZW7m4ra+oTkZm2IifDyTSTTMPXNQCdA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795641477;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=Q3LohTUTvTDKTOnmMCdsVFV7yA521KeB7VGeO+9OdHQ=;
	b=HKHNYgBNknSjsfxETZsoArSY4DpMYFz0pj+vwjJKGkTju4512MFDDydJiI3A4tY0Rd6U
	 3vb88N6/LJFRlmz1JGrN9leh+SVl+JKddUnByRSVcSfhuxb8P2fN0QdwiSKsYzjIgUbnK
	 /KSRnl09cy7mg47Lh5jGvKipjsUKNxVSsrrmkyQjaDrD6Jn+6QiyY3s7K7bBXHEoDPdP3
	 kyoa34AfUp7yN1PVIiUOdqOQwlNgsEQhdfxrwfJNXm0qIarM77XqbJA0TVWvztoTSBHY9
	 9MshzAVxc1AkQ3Z1YLZcU43xjKq5UL/fj/3qFEtaX0q9Zb5OSIfEg+hS6eHUsImNB+w==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 612291F000D0;
	Wed, 25 Nov 2026 21:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795641477;
	bh=Q3LohTUTvTDKTOnmMCdsVFV7yA521KeB7VGeO+9OdHQ=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=YyMW2j689EtMMJMQysPk5Dbu05K41zBDSuU+1czCBdQPK2xbYgFCv2FfskS/n+qST
	 IhMyTcDJxNqMUwEpnwuqi/1UIb1IvaJtFcDku72CCoFusdAskTZpPnU9KcV4g6EV/y
	 DH0W4PLRV3Yfw50aFwRjPUkk/2aWms/Q7oZam+YM0N+UZGHMC58TTV6Kurxsb5D0iR
	 +WwtRHPLM0+z+3AVxGs29TacwHGjW10q1qQQ5pbvC11f/an3CN+rhM4VGcEyUSZNQw
	 obHbhe/yqf2qpBjfZq5Ce5BVdH05h67qyLevyECFrg5pXUb+Y2u/+3dIah3IJfIJvn
	 AQxCYIrd06iZg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id B72D14D04F;
	Wed, 25 Nov 2026 21:17:46 +0000 (UTC)
From: Kalash Nainwal via B4 Relay <devnull+kalash.nexthop.ai@kernel.org>
Subject: [PATCH net-next v2 0/2] tcp: add net.ipv4.tcp_l3mdev_exempt_ports
 sysctl
Date: Wed, 25 Nov 2026 14:17:45 -0700
Message-Id: <20261125-tcp-l3mdev-exempt-ports-v2-0-b920f3ff8f5e@nexthop.ai>
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
X-B4-Tracking: v=1; b=H4sIAHlQB2sC/4WOQQ6CMBREr2L+2m/aEkhw5T0Mi/L7kRppm7Y2G
 MLdBTyAy8nMm5kFEkfLCa6nBSIXm6x3m1DnE9Co3YPRmk2DEqqRUgnMFPBVTYYL8sxTyBh8zAm
 pHWozcM9V3cBGh8iDnY/mOzjO6HjO0P2c9O6fTHkv3rOjTdnHz3GiyIP4u1ckCiQipSvdkBHtb
 R8YfbhoC926rl+pVAgu2wAAAA==
X-Change-ID: 20261120-tcp-l3mdev-exempt-ports-c9f5dfebe356
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, David Ahern <dsahern@kernel.org>, 
 Ido Schimmel <idosch@nvidia.com>, Neal Cardwell <ncardwell@google.com>, 
 Kuniyuki Iwashima <kuniyu@google.com>
Cc: Shuah Khan <shuah@kernel.org>, Joel Granados <joel.granados@kernel.org>, 
 netdev@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Kalash Nainwal <kalash@nexthop.ai>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4398; i=kalash@nexthop.ai;
 h=from:subject:message-id;
 bh=gL/eOMgLt2xrx8fI3Mk4bs+cV56GAlBQ2KWpr+GQrDw=;
 b=owEB7QES/pANAwAKAdTKslu1X9B2AcsmYgBrB1B5M7xrqSbAKxNuP3sEOE16/RtTSoroHMNR/
 dacFmbMmzaJAbMEAAEKAB0WIQSWKdfHnHcAucb08LDUyrJbtV/QdgUCawdQeQAKCRDUyrJbtV/Q
 dhpTC/9MGgLNn849nJhgPys67rtFmcKAntVW9pYhI5Cbws2z2r8JbXw7CL6VSBWDUgSFkYBdgKv
 8XT4Rzule/r1wEpFYOLTEaaWKsU7Kjup6ixO01BvoseO3Fsfyt5kObIu6+xTVbp2cnLOOdRASFs
 7Vq60grwUc5MVKxVt6s21hHW72ySCZ7rLhMG2+YQqDB4dzS21vPZrHyNN6Z/oH0ipAUJszkCvmK
 uL1V87t/jiQUkrFHMIJSBqaX+ibuAQ9qiSEgMiInSNH9RPBBlhqUIH9V/mLMQDnlEXe6eVFXgMi
 CtgoQHKMMROHcdo+qccg2HciMfSqis9due22AczJ04AQYSan3xa67/jJf6y/Rdkn6f6kZCbQdHw
 /zup3MtEL+HUjDjmlAfCxtjuXoKE6GAcBI6n9ED//+NJJ70NwwQb/rReQbv/vaJ8ksHx6EbnPE0
 MWtnSodiwtxc5RGZ0qvkvgfrb1liARaOLEWFt15glHY6Y91pqJ94t1Ci8zZAmXbjOMV90=
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

To: "David S. Miller" <davem@davemloft.net>
To: Eric Dumazet <edumazet@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
To: Paolo Abeni <pabeni@redhat.com>
To: Simon Horman <horms@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
To: Shuah Khan <skhan@linuxfoundation.org>
To: Randy Dunlap <rdunlap@infradead.org>
To: David Ahern <dsahern@kernel.org>
To: Ido Schimmel <idosch@nvidia.com>
To: Neal Cardwell <ncardwell@google.com>
To: Kuniyuki Iwashima <kuniyu@google.com>
To: Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org
Cc: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-kselftest@vger.kernel.org

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
 .../selftests/net/tcp_l3mdev_exempt_ports.sh       | 260 +++++++++++++++++++++
 9 files changed, 334 insertions(+)
---
base-commit: 2208ab00f4f213ade91ab775e7f8c4dacdcc856e
change-id: 20261120-tcp-l3mdev-exempt-ports-c9f5dfebe356

Best regards,
--  
Kalash Nainwal <kalash@nexthop.ai>


