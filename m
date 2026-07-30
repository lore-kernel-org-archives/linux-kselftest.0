Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5BF421F0F
	for <linux-kselftest@vger.kernel.org>; Thu, 30 Jul 2026 13:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785416740; cv=none; b=LY6PPJhLvX/zqZWgR+sniMzmovjA53TQRaW9SegQQ1Ge2LxbfNgoIVZbsZiHWWcnKSW/3GboEzn9fUVnqfKFEHbN9e5DohXF6PvBSrBuvEqCz4edoN4V1kICF24FeDg3/ZBFIV1OwBlJJHtNtXyXD6kFno+JclqCFis9mxFx56c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785416740; c=relaxed/simple;
	bh=EjmTf8LwIIx7Ib5CT6rFqnT5a3W8I7XG0yLS3L/og14=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=DDQI0KMROHHoX9RBG0UCTx0A9ySlqY0lfy6DuXO/BY1UiNOvBRq7IDd1tVwY2CwaMn0nSQ0rxcfXj2HKBaMECjuDe/UhlKq+/NmkOAXcl33dIo+OAxjrE+JYw0/vpRT5xGd0HxVXt8pXoi+XPR/BPQEtPYOSX2yIg+7Z5vXkVVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l0xgh64r; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l0xgh64r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 053FA1F000E9;
	Thu, 30 Jul 2026 13:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785416739;
	bh=DJrzZEt6s3ePrW+9VHCPUcX/GaLLt5IZAmd1xaq4w+c=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=l0xgh64r4V99nsQzcnvLgW1JELM5DuZ2B7mEh2dkbZjSIIzRPGpimlMSM4YBuOz/A
	 VA1Fp/A0m7d0RrmHW2NDwSJGdzoZ8mvEDhDtYIALZN1LhN4KTam+nlW4yPcAgUAw3U
	 tcRoQ2Z0dJTwmd12UHqH5zEJHR7FuXSrOg7l3ykvUcrtXVi1SKGQyEfumnV5K15WO3
	 uKPL8SNvUH0Ylm3XhQtUBxIdwDAhLlRIDZ8QMU4c2Zn51DEhNwJlruMCXD/KxA++Rg
	 cdD8OXRY//dqL1jM+M95txaM6IdaXDwlJjCnE8XQYJyMIFdKSKcbXrnGT5vbWV3o6L
	 cd4A027xL7L5Q==
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfauth.phl.internal (Postfix) with ESMTP id 0B86AF40071;
	Thu, 30 Jul 2026 09:05:38 -0400 (EDT)
Received: from phl-imap-15 ([10.202.2.104])
  by phl-compute-10.internal (MEProxy); Thu, 30 Jul 2026 09:05:38 -0400
X-ME-Sender: <xms:IUxrauuU-EF01Uc4TRuFIXKRLd7oEs0m6IbB7uiH-vN9x2kGJaU8Cg>
    <xme:IUxrauRd1Vp8wbXN3mNAGIOTPURpYjCJIodFaOKDVXB7bNtRqLeCbFzDre-LPoDVl
    AapzNlfFiq_Btt0iaxiFm4dKU7TtgXKwU-YwWP3QA7MCmQuzWc_jNA>
X-ME-Proxy-Cause: dmFkZTEFaJv/n2Fv+ED/y8q0JWs7hY3wITl5ESRQfzfCfIfeLB0g81SERaKZShlS1jUxcf
    Bts6VF10pEPw/rDGRa2T6wbQb8XYXNzzoWnZSux05lJR5vGxGFF4zC0j2Bm8skso4/6R1u
    OrgGF2zPtaMXeGseDQML/f6IHp3inbqDcNUb36Qg/c5DH+4d19/i60xEl6kKd8M5c4Ay8M
    IPkSBySFzbigBzxEWzK4+5PktK/eoNVGMi9aaKd+O3dunrjdgeAEr/HZPMrqxnhW7l31A+
    v7BTguitmAHE2HuSjxKjE4Ap6kBKvjy0E4+M61z5SuTfiZDP7VgN4xRWz69ljJ7Wwq+TA5
    TGlJYh2I5CsrwGFc7dejV46U3c1vVbV9u+MbnFoiSG/nQhbTdFmDVM8z99yVTHgH+u1N1S
    JbfGsYSAvycMLa5Jlt6NvY9/ILqZ6IkDPluTkOW62vt9NZNVFN0zpp/k0KSbxHOZnOb7Tg
    tO3BhqXvHkj8z+PbHwKYHmp27fdbWxdstMfW0c7Ww1uO0y5HCNtNx19zJqgC+0JGlMWPS4
    5k+fD08n4ZKVpisq68mGOsI2s2HctiVVifouj+83ATo3IHTG7iFyuJZ1FOKOR3ErXM/VD7
    w2jElzsO21SJZGhfi7VervF/cDRb0xUa6e4ye74PHHHFfND43Qmhq1Q3+/pw
X-ME-Proxy: <xmx:IUxraiSnnYhfsGmIL_kikgMylyrsBvdXBnIzxTCyBvkxjI2DMtg5fw>
    <xmx:IkxrajpVXxOW4-ZMDrnWLOxlboiWwRRId_GomPHhm8P-Q_KVxNR2Xw>
    <xmx:Ikxras2AbJOccyYBM5ud20C6DkiraTtEGBmDXBJrQBD6ct95-YDzsw>
    <xmx:Ikxrai5wGIFiwvy_94EygPsCaEVPII6XHwZdpn-zfoltfa3gs9U0uA>
    <xmx:IkxragRR6gI3-WSS2yuGjf1XFAwOKdzhjIm-WyEMbQkwcCK1lwwrAhQl>
Feedback-ID: ifa6e4810:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id D82A4780070; Thu, 30 Jul 2026 09:05:37 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: A0WByMxMWtsc
Date: Thu, 30 Jul 2026 09:05:17 -0400
From: "Chuck Lever" <cel@kernel.org>
To: "Sabrina Dubroca" <sd@queasysnail.net>
Cc: "John Fastabend" <john.fastabend@gmail.com>,
 "Jakub Kicinski" <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 "Eric Dumazet" <edumazet@google.com>, "Paolo Abeni" <pabeni@redhat.com>,
 "Simon Horman" <horms@kernel.org>, "Dave Watson" <davejwatson@fb.com>,
 "Shuah Khan" <shuah@kernel.org>, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Message-Id: <eaa66ad3-fd50-4ec5-b097-e60bd11b2bc9@app.fastmail.com>
In-Reply-To: <amsVm65P9E0_SUT3@krikkit>
References: <20260726-tls-follow-on-v1-0-99bf4cc1c729@kernel.org>
 <20260726-tls-follow-on-v1-1-99bf4cc1c729@kernel.org>
 <amsVm65P9E0_SUT3@krikkit>
Subject: Re: [PATCH net 1/9] net/tls: Bound time spent on no-data records in
 tls_sw_read_sock()
Content-Type: text/plain
Content-Transfer-Encoding: 7bit



On Thu, Jul 30, 2026, at 5:12 AM, Sabrina Dubroca wrote:
> 2026-07-26, 20:33:29 -0400, Chuck Lever wrote:

>> Bound a run of such records, as net_rx_action() bounds a softirq
>> poll. The first record that delivers no bytes arms a deadline
>> TLS_RX_NODATA_NS ahead; any record that delivers bytes disarms it,
>> so a normal stream never trips it. Breaking out with nothing copied
>
> Another thought here: I think a peer that sends "some" 0-length data
> records followed by one (possibly very small) data record, and then
> repeats that sequence, will not hit this "rate-limiting" of no-data
> records. Is that right? And if so, is that a problem?

That occurred to me too. It's right on the cusp between still
making progress and gumming things up. Neither the packet-count
limit nor the time-bound address this case.

I don't have a good answer.


> [I'm guessing that the caller is doing something equivalent to
> recvmsg(WAITALL), so it could be stuck for a long time even with this
> new bound]

Still digesting your other feedback. I plan to send a v2 to
address it.


-- 
Chuck Lever
