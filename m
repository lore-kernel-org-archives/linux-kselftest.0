Received: from out-171.mta1.migadu.com (out-171.mta1.migadu.com [95.215.58.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4943233C532
	for <linux-kselftest@vger.kernel.org>; Mon, 20 Apr 2026 02:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776653704; cv=none; b=ktx8UBpsmfXEx1x0lBwjnhzg+s4PInQHruKmr7bABy8fexnsF5CtXDXWfVlEIjfUj1R6R/8PYrQLSkAECc43nEMf2Dz28MWaVXqwz5zpUs3MdGhkatCtxTNdKN/WUkUp5WBN1oehJVfLUr765g1Vk1F/sWob8mry6gLdD7lsK2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776653704; c=relaxed/simple;
	bh=TRQmr5m2Pb2uWL2kgXGK5YQvYZA5Wl9ljtXrjhhoGzw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gyrkCm48Uz0DRS2FkELfDLK9MNhh52IRKj0eLpNdIHJP5pnsyoKZh39N8huLKqo/dT/G57bz1gcHKwEOoqJXve6BOeXC8qcm/c0kk9mB9M1yuqgxpksEwfQz7UwWMj5Ln30XMldOYbwIaw1A37xJynnaqhrDHusifLs3tNjt7w8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=lnT9nnbp; arc=none smtp.client-ip=95.215.58.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="lnT9nnbp"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1776653700;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=YFCGag2+RARMnL+MuWGy6ZpexdQQulX1NigU2jaRQH8=;
	b=lnT9nnbpxaHOTA4jVlYHs9/NOASScjeuENcxVZZ/xvWqlOmydsneyGVfoAYhhAf4XhdZlW
	WUtAqxpDEJ9Eyfq4FKfoG30AOem9ZRd4/qE1ZuYwTh6YIOi3Xx0aPcL2OghCNqo5VSuXDQ
	dyb9AOUzazo9f5grLj6wtr5V8HLhTR4=
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
Subject: [PATCH net 0/2] tcp: symmetric challenge ACK for SEG.ACK > SND.NXT
Date: Mon, 20 Apr 2026 10:54:07 +0800
Message-ID: <20260420025428.101192-1-jiayuan.chen@linux.dev>
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
FLAG_NO_CHALLENGE_ACK for consistency with the lower-edge case.

Patch 2 adds a packetdrill selftest under
tools/testing/selftests/net/packetdrill/ that verifies the new
behaviour.

Jiayuan Chen (2):
  tcp: send a challenge ACK on SEG.ACK > SND.NXT
  selftests/net: packetdrill: cover challenge ACK on SEG.ACK > SND.NXT

 net/ipv4/tcp_input.c                          | 10 ++++--
 .../tcp_rfc5961_ack-beyond-snd-nxt.pkt        | 31 +++++++++++++++++++
 2 files changed, 38 insertions(+), 3 deletions(-)
 create mode 100644 tools/testing/selftests/net/packetdrill/tcp_rfc5961_ack-beyond-snd-nxt.pkt

-- 
2.43.0

