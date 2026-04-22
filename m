Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com [95.215.58.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E91623DCDA2
	for <linux-kselftest@vger.kernel.org>; Wed, 22 Apr 2026 12:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776861391; cv=none; b=eTA0yySd3x7TJ5KCU58u7MzRVudL9Yd13Aw6O87a/ses/03YUAdUD1XHp8bAQXpi+nx4wBVkWm6pXwAZSLE9UUIGemqToEyOgaqWc6lFTryw8J42omDvmbJ+AWkz/Ji85Ub4YnCWKFM9vgkTI7i0BJkk6q7/74iOisjiBABZlLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776861391; c=relaxed/simple;
	bh=1LmTa/2nISMh6mOU+dH4LIOT3D7vOAh4Af8/IN/LEsQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QGKMJp0ts4r9hruHw4GxST8bEP9p1cpVplIufu/+kZD5YFqrvSOu7rbvohv2P8R4Fk7jKSpQFMKnBWOVKwNMIs490hC5E9WbXBmmDj2MRoUMio7q7r0Cz2Eq3Iriu0jpXciJZxqTR2DsIRzlyN2nNhAEClkf0T5L68ycpG143ZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=fBWWcSKq; arc=none smtp.client-ip=95.215.58.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="fBWWcSKq"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1776861374;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=M9Gx7IlnlS1uNsPF0cg+zpWITXpZQp1mOnbZe0OCetU=;
	b=fBWWcSKqQG5zCycwG+raCLyHwjZxuRIRhAGD1Bj0GcOElJUNik4wdEm8Rf63nJoeLkD8tA
	aj07x0slv1iK+zRECsfmItUG90+YVyNxnrD4RC+Gnl/tP+L8G8F6SZW3/nA0RKq6mxw7qp
	MZ+UFS5TuUwqdNK9lwRMbremNxwaaY4=
From: Jiayuan Chen <jiayuan.chen@linux.dev>
To: netdev@vger.kernel.org
Cc: Jiayuan Chen <jiayuan.chen@linux.dev>,
	Eric Dumazet <edumazet@google.com>,
	Neal Cardwell <ncardwell@google.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	David Ahern <dsahern@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net v3 0/2] tcp: symmetric challenge ACK for SEG.ACK > SND.NXT
Date: Wed, 22 Apr 2026 20:35:37 +0800
Message-ID: <20260422123605.320000-1-jiayuan.chen@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Commit 354e4aa391ed ("tcp: RFC 5961 5.2 Blind Data Injection Attack
Mitigation") quotes RFC 5961 Section 5.2 in full, which requires
that any incoming segment whose ACK value falls outside
[SND.UNA - MAX.SND.WND, SND.NXT] MUST be discarded and an ACK sent
back.  Linux currently sends that challenge ACK only on the lower
edge (SEG.ACK < SND.UNA - MAX.SND.WND); on the symmetric upper edge
(SEG.ACK > SND.NXT) the segment is silently dropped with
SKB_DROP_REASON_TCP_ACK_UNSENT_DATA.

Patch 1 completes the mitigation by emitting a rate-limited challenge
ACK on that branch, reusing tcp_send_challenge_ack() and honouring
FLAG_NO_CHALLENGE_ACK for consistency with the lower-edge case.  It
also updates the existing tcp_ts_recent_invalid_ack.pkt selftest,
which drives this exact path, to consume the new challenge ACK so
bisect stays clean.

Patch 2 adds a new packetdrill selftest that exercises RFC 5961
Section 5.2 on both edges of the acceptable window, filling a gap in
the selftests tree (neither edge had dedicated coverage before).

---

Changelog
=========
v2 -> v3:
  - I don't think the AI's concern holds, but I think I can split write(2000)
    into write(1000) so the test doesn't rely on kernel internals.
    sashiko: https://sashiko.dev/#/patchset/20260421014128.289362-1-jiayuan.chen%40linux.dev
v1 -> v2:
  - Add Reviewed-by tag.
  - Fold the tcp_ts_recent_invalid_ack.pkt update into patch 1 so
    that bisect stays clean and the fix is self-contained for
    backport.
  - Extend the new selftest to cover both edges of RFC 5961
    Section 5.2 (SEG.ACK > SND.NXT and SEG.ACK < SND.UNA -
    MAX.SND.WND) in a single connection, and rename it to
    tcp_rfc5961_ack-out-of-window.pkt.  Neither edge had explicit
    packetdrill coverage before.

v1: https://lore.kernel.org/netdev/20260420025428.101192-1-jiayuan.chen@linux.dev/

Jiayuan Chen (2):
  tcp: send a challenge ACK on SEG.ACK > SND.NXT
  selftests/net: packetdrill: cover RFC 5961 5.2 challenge ACK on both
    edges

 net/ipv4/tcp_input.c                          | 10 ++--
 .../tcp_rfc5961_ack-out-of-window.pkt         | 48 +++++++++++++++++++
 .../packetdrill/tcp_ts_recent_invalid_ack.pkt |  4 +-
 3 files changed, 58 insertions(+), 4 deletions(-)
 create mode 100644 tools/testing/selftests/net/packetdrill/tcp_rfc5961_ack-out-of-window.pkt

-- 
2.43.0

