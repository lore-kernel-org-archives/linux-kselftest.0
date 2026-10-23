Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792768720;
	b=Jv4BSPGN7JbBYnOgcS2o5T93OQqvmtgVSbF6IOoLTzmvH+jLvCM1uQascCQIW1STH7Bs
	 MEv3jK92piX0iDjUNrVBYCdgJGyZjaOdYV5aqDTSjCeoLyRm5xJ7lZECjhLFhSrD/Guo7
	 c37u2kGO7tyvP3vIWfInyInc2iqbkxdZkgi4C5kibzXnKfS8z8bbDKm40m3ubzyOIjISE
	 I1x6EF+VxBFj6IqcFS5ii3ChZRhyOY/PnpKFcZUleBbuSqt6DELBVM/DVPue5OustKkau
	 A25PRazU0mmmvRdowye2HijbF36jY8jKBexYktSt5nzUCNlhiuHyouXO4TsZj7KBJwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792768720;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=t8taL8edTQg/YBtvxE6kIr3WTjB4jdlSUIYz98fZHsc=;
	b=UyokJ/5Rne+WUozwIMRbZzhN0dcxxpIXyQYM7j3OABSRbkkIHCEfaxveLhWriWt8lAZz
	 KCaCjwTl83kN1dvM8XjIp9dDm53nzAG39B6rRK4c+CSAMOs35e1jUm5QTktrgeRF2R3KC
	 vHfpfzT1XkUi+SgCC9S7dZEkP8x+H16JG2mQNqEXHeCT1TrwaJo44Q+qUXn10z1PqdzSh
	 NNCIrDU1FryHzPBIDOHaGCnL+x9uhQQgTvz/3YWN4+acuLmLHu1dnSUl53lfBxLgTvqIV
	 ieqig/kh477Qa8lC384a0PpsWYbdPP6Mx9n6z8ibVxaLrBkZ6SLD/k27a9ge/z/HCEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="bk2u/FkC";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C56CD606A31B
	for <linux-kselftest@vger.kernel.org>; Fri, 23 Oct 2026 15:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bk2u/FkC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F29171F01825;
	Fri, 23 Oct 2026 15:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792768719;
	bh=t8taL8edTQg/YBtvxE6kIr3WTjB4jdlSUIYz98fZHsc=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=bk2u/FkCcJcaGjZJrf7Dpl07p3+GDSPp1i1L6HHMY4ObXuadOXJ8tXSljSCmu/ADg
	 CWMvxcYo5/zwRQrwvVgaErty4MvILj5lpvVVRQR0qEOmNfVRXKFPrwLvbNSlYIvbw3
	 LsMueE8qC8otzYoZrISn082MYa63OM++XCyFxIl29r1iQWIu18DG8yYDg5cJBN2gkI
	 1TR2diWOwakp9v1fKna+jODvP5hjcU99MN6dTyHMV+wAiVn3wQYH2moBHpooXIWO2U
	 D7pEovzqDljVftoDhiCkeqstp43nOWFVkZsviecMQLTk0Yfdm17ABitE+HbRbyVwqn
	 qXolYWpVfPS1Q==
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfauth.phl.internal (Postfix) with ESMTP id 607B5F40066;
	Fri, 23 Oct 2026 11:18:38 -0400 (EDT)
Received: from phl-imap-15 ([10.202.2.104])
  by phl-compute-10.internal (MEProxy); Fri, 23 Oct 2026 11:18:38 -0400
X-ME-Sender: <xms:znrbakHBQ8mifCGJmew34QKAAj2piEJoyqWXEIwSqF8exRnUeWHFzg>
    <xme:znrbaoKC9PL6iHfjMESxy1hYKFFcgphHxRPRI5MbpPjcULJKqpWWFtyT2CO9ki56c
    ptaz6RAazQwrsXiwckBcBqt-8sZmTV16PeYOW6HEir_AhvBIgrdQaw>
X-ME-Proxy-Cause: dmFkZTF+BpdEMgHuzWE4WwiA8xiGC9WjVwxG+HFHt7DFnIE2Zjih90ttPNDP60Fp2XAuua
    sjicSL5P2gGGwpSP3jovCa5hOQw7cIBeSXbFxHYdD+UnTCvlLa+0oCwVJ90PBkG7DJ+yHM
    o3/VvfqeW1kXOtuk/GcSh+pCHUfWXIbfGnU4AZHVFvc87RQEWSBgIVl5w8V1nH2670NPSs
    kSd2I/jdY3IfBgc122CVlWEu/wQus8sUM+oCnIjAylogqIsxqM4J31Ni5uBqJnOz6knfOU
    tMMNTmcSc/9nf9Kr+7zQ14EEdKQMyxS4EVr9Any7m4CK6mlsJp2qyU2B3YnVssY9pLyejo
    UfIeMrhyt7oSaLpXeyjaUgiU+j4eHu5N8rNFUUzJI47HSREBUeZMy5AaVf2dEhEXBafM4Y
    BGxB42rB8spu8t5leUPP9lE9YtKY/UqZX6N4RgW/nAAgYJmcFAAE+31/jZYP6amVrmIfnD
    nHKPvLKczD7xy9YRrR1KUhK6vTSsbkLePcpRBC1kLhbRy5wtq1dAg9fD4uW0E6iGPvXxrM
    fw14xATHzKrOfeHApJIDiDBY0N327MSijebBus7x6EE9IF4sOeL/fH8NW5pdgr3cDovbmG
    r1pBsuldqWivkndbGc9T0MHhcEaAvbauig+g/jl8+XHJKB4MjfWdZXGsBauA
X-ME-Proxy: <xmx:znrbap4dvUJuj58Eb_q42t567UvH8jhCDDmauoozy-VX3uY9zkEnKQ>
    <xmx:znrbajncc7KIrNRm6oqbjOhdffvKlUxt1E13E9aUoa2bD9CWz2cRXQ>
    <xmx:znrbakXdqf-CdtaEi8e6jNgKNxZKRyqDIdrpgZGYkpIUPmRsqIPwTg>
    <xmx:znrbasQngee1SVFQvp7Q9fucbaYZP8J4kY0PkH7MmV_1pbm1ahcd2Q>
    <xmx:znrbahBU3wPVT5MCOsTo9gt1H1IOzOXGaZLDOksEsCUqw5BNBtH_2rtE>
Feedback-ID: ifa6e4810:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 3F5DC782738; Fri, 23 Oct 2026 11:18:38 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-ThreadId: A1Ll-oUXMl1J
Date: Fri, 23 Oct 2026 11:18:18 -0400
From: "Chuck Lever" <cel@kernel.org>
To: netdev-bot+sashiko@kernel.org
Cc: john.fastabend@gmail.com, kuba@kernel.org, sd@queasysnail.net,
 davem@davemloft.net, pabeni@redhat.com, horms@kernel.org, davejwatson@fb.com,
 shuah@kernel.org, qingfang.deng@linux.dev, edumazet@kernel.org,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org
Message-Id: <1f61d167-cc15-4720-bfc5-5db3d27e064b@slotpi15m67>
In-Reply-To: <179269905670.1189532.10172561334611048258@kernel.org>
References: <20261019-tls-follow-on-v6-2-ab01c4ecca0c@kernel.org>
 <179269905670.1189532.10172561334611048258@kernel.org>
Subject: Re: [PATCH net-next v6 2/9] tls: Check for a pending signal after an empty
 record
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 22 Oct 2026, netdev-bot+sashiko@kernel.org wrote:
> [Severity: High]
> Does this close the hang for callers that never receive a signal?

The cover letter scopes the count bound to tls_sw_read_sock() and
leaves recvmsg() with the signal test on purpose. I consider
addressing the hang as out of scope.


> Two kinds of caller appear to still be held for as long as the records
> keep arriving:
>
>   - nonblocking readers (MSG_DONTWAIT or O_NONBLOCK) with no signal
>     pending
>
>   - in-kernel callers that do not take signals. One is nfsd threads, via
>     svc_tcp_sock_recvmsg()->sock_recvmsg(sock, msg, MSG_DONTWAIT) on
>     kTLS sockets (there is no allow_signal() in fs/nfsd/). Another is
>     rpciod workers, via xs_read_stream(transport, MSG_DONTWAIT).

Both exit through tls_rx_rec_wait() with -EAGAIN as soon as the
receive queue drains. The hold lasts while the peer delivers
empty records faster than the reader decrypts them, and that is
the behavior these callers have today. This patch narrows it for
the callers that can take a signal and leaves the rest where they
are.


> Could the run also be ended for nonblocking readers? One option is to
> return -EAGAIN after an empty record. Another is to stop after a bounded
> count, as tls_sw_read_sock() does.

An -EAGAIN after every empty record returns a readable socket to
the caller with nothing copied and the next record already queued,
so a poll-driven reader spins on it. A count bound fits read_sock
because a zero return there means no progress, and a work item can
call the consumer back. recvmsg() has no equivalent return for a
blocking reader that has copied nothing. The in-kernel callers hold
the socket lock across the run and cannot take a signal, as the
cover letter states. If a bound for them turns out to be needed,
it can be made as a separate change with its own Fixes: tag.

I'd like to leave this patch as it is.


-- 
Chuck Lever (Come to NFS bake-a-thon! https://nfsv4bat.org)
