Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C49239A7F0
	for <linux-kselftest@vger.kernel.org>; Wed, 15 Jul 2026 14:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784127264; cv=none; b=qSMDyjppUbaYbq46E+LkgM7vcc94TPPpjFGSmXmRZF1HpdUs03AffXqHWxOgbd3rO+54xDb5JKJXjtC0GIRWnpvfQNpN6xbXD+oZ3g5GBDCz2edwmOfDLPnThZ4PpzEcGVPiItu0HAYM3iuBv748F+1xXUxDMGd3tMLtfCnFjB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784127264; c=relaxed/simple;
	bh=R+l0BoEIULdGpPMTKiBinIBNKvPrlGhKO6LL/ImEs7A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qwDO1Y8Y/wMYjWnhu4V2lrq49tT+13ocApp1/U9pTDhfRVHUle8lQ9o5QgURR2ur5QmOpGAu/cbfknjes9PqbEbFAEEbqFGtjecyqhEv3FdSyvua6eW/hl3hoWmOo6jZA0d3M0KwAiK3D3+3x1Y/caYUdwCSzfxe8aJ2mtCPLjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=VzVlT6Lu; arc=none smtp.client-ip=91.218.175.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="VzVlT6Lu"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784127253;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jOShTpG1lf1o8AyRmdTFIb3iL+dIT2emRuFOvlyVsDs=;
	b=VzVlT6Lu2OjZRRsil4JjB9tukxpjUfkgyxgjqjyPj44/SFXsG+C/D4NZW6so6DBI1mf01u
	yYFF6IhC5NJe9BUo8yO3xJnlKvGZ24WfpBHJcGbWk2XHS+H3GVeOtdGep8rDNyTqZagKaL
	hbXDKUSTjocfTUK+pONAw5eCiyVVnmo=
From: Leon Hwang <leon.hwang@linux.dev>
To: netdev@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Neal Cardwell <ncardwell@google.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Ido Schimmel <idosch@nvidia.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ij@kernel.org>,
	Leon Hwang <leon.hwang@linux.dev>,
	Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>,
	Yung Chih Su <yuuchihsu@gmail.com>,
	Wyatt Feng <bronzed_45_vested@icloud.com>,
	Jason Xing <kerneljasonxing@gmail.com>,
	Lance Yang <lance.yang@linux.dev>,
	Jiayuan Chen <jiayuan.chen@linux.dev>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [RFC PATCH net-next v2 0/2] tcp: Add net.ipv4.tcp_purge_receive_queue sysctl
Date: Wed, 15 Jul 2026 22:53:25 +0800
Message-ID: <20260715145328.54597-1-leon.hwang@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Introduce a new sysctl knob, net.ipv4.tcp_purge_receive_queue, to
address an unreleased SKBs issue related to TCP sockets.

Issue:
When a TCP socket in the CLOSE_WAIT state receives a RST packet, the
current implementation does not clear the socket's receive queue. This
causes SKBs in the queue to remain allocated until the socket is
explicitly closed by the application. As a consequence:

1. The page pool pages held by these SKBs are not released.
2. The associated page pool cannot be freed.

RFC 9293 Section 3.10.7.4 specifies that when a RST is received in
CLOSE_WAIT state, "all segment queues should be flushed." However, the
current implementation does not flush the receive queue.

Solution:
Add a per-namespace sysctl (net.ipv4.tcp_purge_receive_queue) that,
when enabled, causes the kernel to purge the receive queue when a RST
packet is received in CLOSE_WAIT state. This allows immediate release
of SKBs and their associated memory resources.

The feature is disabled by default to maintain backward compatibility
with existing behavior.

Note: the user-space issue, the root cause of the unreleased SKBs, has
been fixed by https://github.com/IBM/sarama/pull/3384.

Changes:
v1 -> v2:
* Update 'tp->copied_seq', 'tp->urg_data', and 'sk->sk_peek_off' like
  'tcp_disconnect()'.
* Drop "memory leak" words in commit msg. (per Eric)
* Add two packetdrill tests. (per Eric)
* v1: https://lore.kernel.org/netdev/20260225074633.149590-1-leon.huangfu@shopee.com/

Leon Hwang (2):
  tcp: Add net.ipv4.tcp_purge_receive_queue sysctl
  selftests/net: packetdrill: Add two tcp_purge_receive_queue tests

 Documentation/networking/ip-sysctl.rst        | 18 ++++++++
 .../net_cachelines/netns_ipv4_sysctl.rst      |  1 +
 include/net/netns/ipv4.h                      |  1 +
 net/ipv4/sysctl_net_ipv4.c                    |  9 ++++
 net/ipv4/tcp_input.c                          | 22 ++++++++++
 .../tcp_purge_receive_queue_disabled.pkt      | 40 ++++++++++++++++++
 .../tcp_purge_receive_queue_enabled.pkt       | 42 +++++++++++++++++++
 7 files changed, 133 insertions(+)
 create mode 100644 tools/testing/selftests/net/packetdrill/tcp_purge_receive_queue_disabled.pkt
 create mode 100644 tools/testing/selftests/net/packetdrill/tcp_purge_receive_queue_enabled.pkt

-- 
2.55.0

