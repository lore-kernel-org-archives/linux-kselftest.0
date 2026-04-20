Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 284FF1FB1;
	Mon, 20 Apr 2026 15:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776698696; cv=none; b=rIhKczWrK5ndnPoJBSX/E4RyTkHVXzIX0P0FFcDNTQxw9WCBbTYRQmZs0aY9OEKCoHgXkiMOU+jyQVp810L0p4fUd+G0CC3dk2VGx6YaDEthMBbBN1u2j0lrQ+Sfq8G6GBoQbfJLrM4rbjds8cOWkfxe3ugBrlB7iEPWQE750aY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776698696; c=relaxed/simple;
	bh=AkvWrNUWNRWxUJYdEoaj/ioSzDpjxDpY/3IoYXvpygw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YG912O6AoR3yPHCX9Su8RxwvARsAwLDxdXJBw4PLZBuGWq9LCy00rVvuWRw85BLt0qyjENE8smhrFnIn9w8xfOnC9YCk9j60BZgJBQEEgAbHr6hZdQYcZuajzhUOypqqpH8BQbW8MKcbl0skJk5Ks2AW/KUnJ71wVwhPAoHpaUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SugkjtPq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SugkjtPq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48DB7C19425;
	Mon, 20 Apr 2026 15:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776698695;
	bh=AkvWrNUWNRWxUJYdEoaj/ioSzDpjxDpY/3IoYXvpygw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=SugkjtPqXW+WXf1iNRlnxK8Qkjy/REVAuQrjy4aR6RN0fsKCgZ5rGy474O8rryN0F
	 Px4x+mVzjXn5P78RhNMnVc5vb+kjWHF7sYY8XZb1RRoTQcKkkf8M1NpcuawwLdJY06
	 ct+ywAPphUSsYDCMyrMnkO51mh0PeEq4F7kqOmoayPFe+Naa0LC9EMgfPZ0UAPcUzu
	 v/oiTSsrK9bhRO307EmSOj5erkNJ94TDsqXD5bVvbZRkW3aziACOE0xTM+xIEjqtbl
	 ogGx8JIQrzoF34uDfYGgOTFR/VOxhp7WHgAILgh7SILOSW27KIj13WCAnrRy2BtWyQ
	 P79y9i0eTTT9w==
Date: Mon, 20 Apr 2026 08:24:54 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Jiayuan Chen <jiayuan.chen@linux.dev>
Cc: netdev@vger.kernel.org, Eric Dumazet <edumazet@google.com>, Neal
 Cardwell <ncardwell@google.com>, Kuniyuki Iwashima <kuniyu@google.com>,
 "David S. Miller" <davem@davemloft.net>, David Ahern <dsahern@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Shuah
 Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net 0/2] tcp: symmetric challenge ACK for SEG.ACK >
 SND.NXT
Message-ID: <20260420082454.1b85cd94@kernel.org>
In-Reply-To: <20260420025428.101192-1-jiayuan.chen@linux.dev>
References: <20260420025428.101192-1-jiayuan.chen@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 20 Apr 2026 10:54:07 +0800 Jiayuan Chen wrote:
> Commit 354e4aa391ed ("tcp: RFC 5961 5.2 Blind Data Injection Attack
> Mitigation") quotes RFC 5961 Section 5.2 in full, which requires
> that any incoming segment whose ACK value falls outside
> [SND.UNA - MAX.SND.WND, SND.NXT] MUST be discarded and an ACK sent
> back.  Linux currently sends that challenge ACK only on the lower
> edge (SEG.ACK < SND.UNA - MAX.SND.WND); on the symmetric upper edge
> (SEG.ACK > SND.NXT) the segment is silently dropped with
> SKB_DROP_REASON_TCP_ACK_UNSENT_DATA.
> 
> Patch 1 completes the mitigation by emitting a rate-limited challenge
> ACK on that branch, reusing tcp_send_challenge_ack() and honouring
> FLAG_NO_CHALLENGE_ACK for consistency with the lower-edge case.
> 
> Patch 2 adds a packetdrill selftest under
> tools/testing/selftests/net/packetdrill/ that verifies the new
> behaviour.

AI says:

Your patch "tcp: send a challenge ACK on SEG.ACK > SND.NXT" breaks an
existing packetdrill selftest:

  selftests/net/packetdrill/tcp_ts_recent_invalid_ack.pkt

Test output:
  tcp_ts_recent_invalid_ack.pkt:25: error handling packet:
  live packet field tcp_ack_seq: expected: 1001 (0x3e9) vs actual: 1 (0x1)
  script packet:  0.200125 . 1:1(0) ack 1001 <nop,nop,TS val 200 ecr 201>
  actual packet:  0.200119 . 1:1(0) ack 1 win 65535 <nop,nop,TS val 200 ecr 200>
  not ok 1 ipv4
  not ok 2 ipv6
  not ok 3 ipv4-mapped-ipv6

Root cause:

The test `tcp_ts_recent_invalid_ack.pkt` sends a FIN+ACK with ACK=9999
(which exceeds SND.NXT=1) to verify that the kernel does not update ts_recent
from an invalid packet.  Before your patch, this packet was silently dropped.
After your patch, the kernel now emits a challenge ACK (SEQ=1, ACK=1) in
response to the ACK=9999 segment.

The test script does not expect this challenge ACK, so when it subsequently
tries to match the expected "ack 1001" response to the following data segment,
it instead sees the challenge ACK "ack 1", causing a mismatch on all three
address families (ipv4, ipv6, ipv4-mapped-ipv6).

Fix: update `tcp_ts_recent_invalid_ack.pkt` to consume the new challenge ACK
before checking the response to the subsequent data segment.  For example,
add after the bad FIN+ACK line:

  +0 > . 1:1(0) ack 1

so that the challenge ACK is explicitly expected and the rest of the script
proceeds as before.
