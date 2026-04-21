Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com [95.215.58.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E636F19D89E
	for <linux-kselftest@vger.kernel.org>; Tue, 21 Apr 2026 01:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776735719; cv=none; b=ojBlNT/TqT7XCZWXISjV9CXalgmeenU4rk1BYWFx80IyJznZdcUmBmjgr33R80Yy2kt5XOsEBJniNMoQzCfB9M4Y2FUBPU8DJ62FnPUOULqgs/3H9Ae92HifFKmhANa8No5nO5TUfpzKEZ2v58pEd9jVvNIAlVhm93Od4OccjcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776735719; c=relaxed/simple;
	bh=xGNRs67avlSqbJqN4bE6daG8ATvnj5UZMJz81YX4ITk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YYPIq33dcLDkmZ2OKnqn3rWBYPRe/f1tEhDWO6L+0walshcBZUaoLWZ+iIb5oSAdsjS0TA0nYcZexT6wRD7l8dfV6+EfiNjK5uDwcHnW9zDLOTZhcDoVJjonJ0xuYQIh9dhNo84oy0xNz3KDFGVFjnnIBBUaLtBSVM4j+zJtNY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=lBWDuWed; arc=none smtp.client-ip=95.215.58.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="lBWDuWed"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1776735706;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=n9Wjds9gfYG9hcGpHzgc5qbfR/aZU4udFuWpgj4YHEY=;
	b=lBWDuWed/5BX3sZXNPoTGgjnSGrfjaNi2AOfMZq1gakbHN+gAhlq7lmRXJTaP91YDeqFxj
	ARbbJ1hvR4oqHzxVUTq2ClcvCP7lz423I7I1kii7xFpnbiypQgZma6qkmasz2HmJlkI6uW
	CBCRvdG20A/tIaohIaCzrUYYkLwI2P4=
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
Subject: [PATCH net v2 0/2] tcp: symmetric challenge ACK for SEG.ACK > SND.NXT
Date: Tue, 21 Apr 2026 09:40:59 +0800
Message-ID: <20260421014128.289362-1-jiayuan.chen@linux.dev>
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
 .../tcp_rfc5961_ack-out-of-window.pkt         | 46 +++++++++++++++++++
 .../packetdrill/tcp_ts_recent_invalid_ack.pkt |  4 +-
 3 files changed, 56 insertions(+), 4 deletions(-)
 create mode 100644 tools/testing/selftests/net/packetdrill/tcp_rfc5961_ack-out-of-window.pkt

-- 
2.43.0

