Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9B2F36F429
	for <linux-kselftest@vger.kernel.org>; Wed, 14 Oct 2026 18:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792001571; cv=none; b=XCmjKx/LGKgZ00rjmjVbvm2qBnmiug5lJ9EmCp4sZ4zMLFq/VnHDI3Jf32dMVmqaSZUeA9aer3QahrpDtDkOj0NxyEIhTkpvyRIrFvwQlb7XUgXWtI8fAl/pF3HlJTD/ahwIozMDeEchOjIrHfwfUXON8vo1/hpAiayynUeIZMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792001571; c=relaxed/simple;
	bh=Xc+lRHZy2ZJ4991Q8MS/zZxpXGn8qh1AmNhbt/Uit+I=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=HoSMS9c0g86Bas/KijtVt90WpfQ2kMs9XWYU9addGpoCGjNlt551Qzi7Ek5nw49WaZqWZUB8AIcZtfEBOBhrLFfjrI5berJGiRdxqvU0MEgCmR3wqro6rq3f9gkkAwAHeCTBWd4nfpTQBpujs/CJaPF5+4dB/DL1U+Q6xtyM2UU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OleNOUmV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OleNOUmV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4873B1F000C4;
	Wed, 14 Oct 2026 18:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792001570;
	bh=NR6A5LL9yOdOhxWXqJxESp6Cj2BKsSk6ZBcEvw4P39g=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=OleNOUmV/Fqxy5BoxBAw5vXTeB2h08rQoV1qp4qxj2rqzucZBnm1Kz3jR/j54ufoP
	 SQZsM/p5yKRomMupOjGUGvpPEQ9RAsMVaZCLNtQ8fYvuVOVdFtW2O9HvZsO2UC5zKc
	 92YnN/OO0eWBO1q7n4ms2ACJ/j0N/jvoWEmlcdX24U4rXJLgr+uShgEN+KS5ul13sv
	 hS1CQnQidoxCDAvXaypyREcogTxImrqaDMu6W+RruFRWidf7Sa38LK5mMMK9d6qpKH
	 HwxBG6ezO1doTG3XTl1bOgP22byL8+gHDkD8X/Yxg4AymJ+tG77v84ao9QFnSutOcE
	 ++2Uo3kaw+Rng==
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfauth.phl.internal (Postfix) with ESMTP id 9BF8AF40066;
	Wed, 14 Oct 2026 14:12:49 -0400 (EDT)
Received: from phl-imap-15 ([10.202.2.104])
  by phl-compute-10.internal (MEProxy); Wed, 14 Oct 2026 14:12:49 -0400
X-ME-Sender: <xms:IcbPavJyqbn19-6N38veFuetn_azDY_I6uxImY7l4iIL7Aw2DSld2g>
    <xme:IcbPat8wEvl3cDoxMUUgUO7x8_C7d6nxCzHw-6OcziCg_4Rr81Ew5kUSRdiqufTQq
    NOdYNVUixstFCe9HG1dvek88OWjxPsOTyWjFN8WEV5fuOooqFwh1kE>
X-ME-Proxy-Cause: dmFkZTFJPHNcbPzmp73ASbH2O9qY2ZVmn2EEOIMAvCRpuNDXB2vU03LMsfpKpoNgDxz+Y3
    9puy5PBVf70mrWmPfV54N6xznV8eWeXRXJNvUhGqTR7S9r/qpcM6mjuHF9gpp2p95xgRVO
    lWep+01fdhcWh7HmvBg1OPYnXNaFWyumTvMimD5YL4ZDC5LnytPqEO0ft9EceltDDpnhwB
    qbdKJWxvrhF+TDoEhGxIs8kMgEI24B7p8E2yVYF0PoHwXOlGdkQTbDBWTixGSbS8pn0hsm
    KUVvkrMN6jhtJ/cOCwRt/6nA5Pki1kkdlsW9tPeLz6ivIiUh4h9wQ25mKdalC4XrWKKokr
    BfRUFzIK/ulqT5X3+ZKeectlVHGMqMTz/Wmnj+dLbLOF2DojBGj7AJ6xTgDQ+neS1cT/RP
    cbvv69PAE7oSGHCO31Dn5IcDEkTh7bVAXZNjXYocJ/+PeajwYBSCjWyX5DYOtzTLYKZqUp
    WK7cMKfG963Kox7ZuI/SJzxm0GqYldBhugCNeUhmMS56fMt4Zj2UouYjrUoBP5hefWiHK9
    mEKGxhU4qyYi/SxKUePlNsjNB0SPaDo+sa1VphUjpTPhBaKnce26RG/HSPpZYfU2kUlHc9
    TBf/hVEBxxWv2zAAk6gxybJZ+MIbyXRRUpmmGpP6tk/M83U5MNZ+/oGpKbEA
X-ME-Proxy: <xmx:IcbPap90wY69rQ18fR0E59YK7zHQAKSQt7mB2wmcl2V9wYOdQ6ciMw>
    <xmx:IcbPaqbNYwnfLU9d30Jiai-pubqtrFfVnRlL1aawHsbkgvR03ElOlQ>
    <xmx:IcbPaq6WN62wLaI1aV3Mnoth0AEaFtbmrTbWy3HmNuyfE3aLS7bnuA>
    <xmx:IcbPanlvORycPlgozLQwmpBjcgPU6ukqoo84g3-lKaq4ndqgdBTDAg>
    <xmx:IcbPaiF6nhc8wrshPM0i8IqhclMlaiNnuyw2owQ2nNrh6pUTJGdBDxg1>
Feedback-ID: ifa6e4810:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 7C91C782738; Wed, 14 Oct 2026 14:12:49 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: A5NHe7wxkV1V
Date: Wed, 14 Oct 2026 14:12:28 -0400
From: "Chuck Lever" <cel@kernel.org>
To: netdev-bot+sashiko@kernel.org
Cc: john.fastabend@gmail.com, kuba@kernel.org, sd@queasysnail.net,
 davem@davemloft.net, pabeni@redhat.com, horms@kernel.org, davejwatson@fb.com,
 shuah@kernel.org, qingfang.deng@linux.dev, edumazet@kernel.org,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org
Message-Id: <b65d8fde-c1ce-4543-ad3a-5e3819466230@slotpi15m67>
In-Reply-To: <179190790064.434549.9638297306862394280@kernel.org>
References: <20261012-tls-follow-on-v4-4-8cea429565da@kernel.org>
 <179190790064.434549.9638297306862394280@kernel.org>
Subject: Re: [PATCH net-next v4 4/9] tls: Consume empty data records in
 tls_sw_splice_read()
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Oct 13, 2026, netdev-bot+sashiko@kernel.org wrote:
>
> [Severity: Medium]
> The socket lock is held across the retry. If the peer keeps sending empty
> records, how long can this loop keep lock_sock() ownership and the TLS
> reader lock?

For as long as a record is already parsed, the same as the loop in
tls_sw_recvmsg(). Once the receive queue drains, tls_rx_rec_wait()
flushes the backlog and then sleeps or returns -EAGAIN, so each
drain cycle gives up the CPU. The cover letter explains why only
tls_sw_read_sock() takes a count: its callers hold the socket lock
across the call and never return to user space. A splice() caller
runs in its own process context and holds only its own socket.


> [Severity: Medium]
> Can this retry make SO_RCVTIMEO restart with every empty record?

Yes. The cover letter states that SO_RCVTIMEO does not bound these
calls. recvmsg() behaves this way today. splice() now matches
that behavior. A nonblocking splice() that finds no record ready
returns -EAGAIN from tls_rx_rec_wait(), so a flood holds the
caller only while records are already parsed.


-- 
Chuck Lever (Come to NFS bake-a-thon! https://nfsv4bat.org)
