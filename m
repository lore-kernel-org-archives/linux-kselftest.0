Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792768531;
	b=PIGcAQapcMmaX7J29J5n7/ecNTS7eu/sHf98XEUBnrw+J+VtxjrrSTqzlYsPGjUesnkw
	 kEwZkkj0cZGCeDvHGkWhl7cQzZWC1ByPRDYgq5Gc7u2t4zfhUm3BG4TAE7gdbTiExFeYV
	 yIhS/pW9e5H0kRTVuV9V388XIswxdFkot2kTCVWh6bAsCfUZTQ3w5fT1hNyqI1eEDpnua
	 BHfyVZvr6O9jRFfH7SjR9SqmNeBsjJkToqr5EkchYy0eF/ziByR4jQg8/baDcO2B5NIZE
	 KVruJL6oEVcb8ujPfxZDmCNS3yzwcPHUMsy6K2aog/t4INS6EolaueGphsjMt8HS+Mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792768531;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=n3iOAGlkC+FkFfz7XihQCahJx8tfVvvTkUKXRSo49zc=;
	b=GV/Gqma9Rl0QGu53xrKQzPP2f+GfcUKS7gzJipyvzrPJUzT+crSLxw414S9X4mnKaZsM
	 DQKWow7WKLfn09fiN6kXd4RygHYzVA2Y/0w0Bm4E6eJv2Obyz6NZqsDSJhe3OuAMxMmLZ
	 l5jRMJMELnrOk4dWNhWOSFXdFT86VM3yMgzSqhhZiD7oWEedSAZtgAtrCuitIA3Rfzmxd
	 /jnC7HMbNd28L2eI0nIpXUz2IzVD/Bo671b8sD+LUMMc6BXJxN65+XBho/8RAKpPz/87J
	 ZyY1UF157RTzLU7D9ptgt+SX8AuJ+zg55b6G/KjrDrWftln0MlfEHnjQvY1jC/o/5AQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Gimej7v1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0891A606A320;
	Fri, 23 Oct 2026 15:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Gimej7v1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 543A31F01828;
	Fri, 23 Oct 2026 15:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792768530;
	bh=n3iOAGlkC+FkFfz7XihQCahJx8tfVvvTkUKXRSo49zc=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=Gimej7v1/v0wTVFvdHlRJmhJ49fClgopyax8GXVSXvHnRSOfw50gzDVrgB8yBKbTb
	 RS3/6YhUFALci5Co/9F+qsp4Otm3WhFl33244lp1KnxtGJS8rdWulhB2V0aFxJmkc8
	 81lqf6uND1CL2WhFbqlzLKtlBqf+QHA792v/UtKFGS4258lTKitDJ6U0SA+TtgL/j2
	 0ypYIu/floTOKkWFoQ9wcZllkh3q24U7fY4p8+MbRCe96ND+Ig5KQjC2jVj92YRCV1
	 8EVWtb+6vC/92PrlOPNcCNv/1J6w26tejCbI6U4SUZFvy2ihh7tCJAsFS9WJVRef4h
	 nbsnxzaIT4GVg==
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfauth.phl.internal (Postfix) with ESMTP id 9DC25F40066;
	Fri, 23 Oct 2026 11:15:29 -0400 (EDT)
Received: from phl-imap-15 ([10.202.2.104])
  by phl-compute-10.internal (MEProxy); Fri, 23 Oct 2026 11:15:29 -0400
X-ME-Sender: <xms:EXrbakjJY7UgDwJTKbZNF4ElmfvH9fABOChRxQYSzQScP-Udl1XgKg>
    <xme:EXrban03Qrw0qUVcDRcmzdAt6zxtbIB-Tp1B8Z2APD7KIgkqIRO3HeqmzVo1eQj34
    sThEG8tMrowbnj9GsjeQtPzFC-WnV-EVoU9WrMAskgA8MSAkj85_ao>
X-ME-Proxy-Cause: dmFkZTEQsLx0PwaPYyK4QgkZcxkuswYMF4VADeH3rqBffibsumIFS6lJseJ3sFuHkHoef1
    YMiaGsfTST/BmgDScxqDI0/JyNTjTrCo/gn/MldC5L5z+oHVrXyWhU4bOl3RmsbEhu0ZZh
    UKEKxqTSb4Nfkl8zKLkHNzum8qHXz6o1hD+mkUaFG9a1zrkoQ3pGETwjgWO7x/YpX0vF0o
    +ZZr+Ocj8CZGQYL2GxihZ4R4gQ0LcZ8h1c2zS4b+toxaJnvwdFv5AVwwomGzOY3wBPCXIc
    wchK2lQsgwzxvIA7b61OS75f3gBreEQqw0gwddS7chJEHZGnKanJmLM0F7GbmZFYCtM2CN
    /4bYSlxeKfTvOSKisZnOTlS/2XqHHNgx03xcQo0vXjoIUNiNow6JiIrC0fdZzYcH0u9pj7
    LoVTWP/md2rKE0+8VVrmIqTvE4CZGWi+PIOo694UgRRHM76TDEegYRmntu6iuQwIHOyb05
    gY9idM4/u4+2Vu+WWGlvgk7fyrhOMheD+cWMWf35bdHXf4PLvIIVTspMNgsJd6fO+YLpGI
    AHKauUgYBAUGqhM0yRO8IaUXLtQUiGHtpjgrxerrZTHlKNYc4pLebfl/+RNyRKaUI+AgRh
    ROsRtTFg3upWeX4EKzKGqqb79rNYuDMjiKdQPPpqTwoZlJuVylXHywvyVrcw
X-ME-Proxy: <xmx:EXrbatUZ4WksbiAwAbD-DDoOAxDlGUgImZ4G_vTET7dnWLICuUEd2w>
    <xmx:EXrbaqSpE-aSaLrvL6PlYMbcuM3jU3BWEdnAF3vdSR4pKVHMNyTbEQ>
    <xmx:EXrbatR15rVNP60EHxcWUB6xTN8UqJYG9-74vF6jA30FRkr65PtzBA>
    <xmx:EXrbaqeWMpb2aYH9UcyULXdk79Zoyl_hrhS7OtZ-JhE0VKAYeA0UnA>
    <xmx:EXrbard8T-IUICBdQwT4m0ELVMPf7RjtrCZkC-V2p_P5ClY32gjYVEiZ>
Feedback-ID: ifa6e4810:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 7BC8678273C; Fri, 23 Oct 2026 11:15:29 -0400 (EDT)
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
X-ThreadId: ApVy2ZgDP3UR
Date: Fri, 23 Oct 2026 11:15:09 -0400
From: "Chuck Lever" <cel@kernel.org>
To: netdev-bot+sashiko@kernel.org
Cc: john.fastabend@gmail.com, kuba@kernel.org, sd@queasysnail.net,
 davem@davemloft.net, pabeni@redhat.com, horms@kernel.org, davejwatson@fb.com,
 shuah@kernel.org, qingfang.deng@linux.dev, edumazet@kernel.org,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org
Message-Id: <7d69b735-fa5c-46f2-bfe8-38937380fac9@slotpi15m67>
In-Reply-To: <179269905526.1189532.975361221217060549@kernel.org>
References: <20261019-tls-follow-on-v6-1-ab01c4ecca0c@kernel.org>
 <179269905526.1189532.975361221217060549@kernel.org>
Subject: Re: [PATCH net-next v6 1/9] tls: Bound consecutive no-data records in
 tls_sw_read_sock()
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 22 Oct 2026, netdev-bot+sashiko@kernel.org wrote:
> [Severity: Medium]
> Can this break return 0 while the next record is still being parsed, with
> nothing left to wake nvme-tcp?
>
> data_ready_work is only queued if msg_ready is already set. For the 16th
> empty record, tls_rx_rec_done() calls tls_strp_check_rcv(&ctx->strp, false).
> If tls_strp_read_sock() returns -ENOMEM, the parse is handed off to
> strp->work and msg_ready stays 0:

Agreed... but the gap it leads to is not one this patch opens.
When the strparser defers a parse to strp->work, tls_strp_work()
announces the record through saved_data_ready alone, and a
read_sock consumer that installed its own callback after the
handshake never hears about it. That is reachable today after
any record, data or empty.

What the cap changes is the number of allocation failures that
reach that state at one point in the loop, from two to one. Both
need GFP_ATOMIC to fail during a run of sixteen consecutive empty
records, and both end in the same place. The fix is in the deferred
announce, so that a parse completed by strp->work reaches the
callback the consumer installed. My preference would be to fix that
as a separate patch so it can get backported.

If netdev maintainers would rather have the work item queued whenever
the receive queue is non-empty at the break, that is a one-line
change and I can send a v7 with it. Otherwise I plan to leave this
patch as is. Let me know.


-- 
Chuck Lever (Come to NFS bake-a-thon! https://nfsv4bat.org)
