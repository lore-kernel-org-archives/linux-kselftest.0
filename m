Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A27694B04BE
	for <linux-kselftest@vger.kernel.org>; Fri,  7 Aug 2026 00:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786062116; cv=none; b=Z1CntONlxxS6OE8aSrIMBA3oaffeyzNg0zzl/ezxOsu1tSSUxH1a4h7lPz2aYubTfLl2/CYj0UQTsDljBm/nECdI8thRrjEHQlo/Z01cugMdrkBCZGnp3BWZySU8Fu1rcSt445r2TlmbRe4DDGdjCKHzAxPg3fLS0JcMn3RHdjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786062116; c=relaxed/simple;
	bh=GgmzBn2bK4/+Nptd0PQMA3IKNs50uCHVJqzFT5zonJA=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=Z+NaY6DFRuy9ARzl1E+4e2C/RPIeYUy5qrl4wTP3JRdEoZ7RP46V2cPWlzU0XUVVHXAP04I4SM9HWEo11hclq8Bi8EBQqhljDJOxY4lG6YvbqJ0HhhvcEPxeqoupyD/012xuzLFMAlHdqdZa9kGBaeafOmzz0BJSCx9xIntffE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TifKaZ21; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TifKaZ21"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D5401F00A3D;
	Fri,  7 Aug 2026 00:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786062115;
	bh=ovFPQ/DXQo9dXBLb8dyq//h8ZYEpAII21uwyLWlh3BI=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=TifKaZ21XyeRqPaN9D2TErcvS1rC20MTBGPXqzHFV70RDTMIUaHBGRK+coVgXgfpz
	 vBIXxrigNWqLG9ZcxlZZc0Ay22eTJJqsyFgrueZdlzZYkPz6vYxRStcQOSoK/g+8v2
	 uvkZOMMUkq8uqovcyaPUzL/X4yYxglL9H0jdqoFOWbSTwIppEu9+rf38AJWtxIcgA/
	 5dJuuGwauVree6h1FsTD2vxdpEaNnkz/KOVUEK87/KALd8nvLXSuohznsViq1Q7Er1
	 /DGlIHw8KHdmbXmC/HS7PmDEHnvgn0d/1RHe3TB4aHzJvDq/5pCZPqCj8r+CqRf3vv
	 DTtLN1dy21C/w==
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfauth.phl.internal (Postfix) with ESMTP id 17952F40071;
	Thu,  6 Aug 2026 20:21:54 -0400 (EDT)
Received: from phl-imap-15 ([10.202.2.104])
  by phl-compute-10.internal (MEProxy); Thu, 06 Aug 2026 20:21:54 -0400
X-ME-Sender: <xms:IiV1ahGlcBzB1dYw7k46LTef6cPyQJPSeIxSTW8l3SkbTEV0YbYpDQ>
    <xme:IiV1ahJifhW64ewlT1nJd_5d8eFXlDO_UiwwkqbfHp9XKh10ZLPzB7UTiSsMf6ULq
    qyDxWdZ6u5_hF_sS-DTuvw52kHzZ2hQ4zHJV0Zhss5gYDbcklGd5Yc>
X-ME-Proxy-Cause: dmFkZTGpG8kugYTZ8gIs8s5LYJjkyVCQ3+3h8nqdl5GfXl8WEhceEM84zEDPrmqAKTmQuF
    JehrkmagCcuJpfOVF9Mc4dYhvxULaJCaECBpvrIvaoTXZPq4KM4U/dgK2yJeuk+y9L2VXP
    X//8npVNslDOKQpuIyKfe5ASnoGmfuxXxXg4zBK3bhY2LLjzpTBVc9VoUhlMkqq07Ieg+T
    uwi1GuSlWKy7fCz6pw49WOYkY6H0YMpCsd7BC9V3T+Z2ljQmY2BaagYOXM+YapH7JfXuSK
    Ym5DZ/+YLxpJjCZuf9br/vYMR9l1+VpA8OvLxWQKHlxDVYCSbaNTtkjcYkMRZIe8z9VXAZ
    19S02MA+HnSVb7XZ69+MjF0NDH8KfZGfCDs719LZb0K+oVduotKDKsz1lcf4finfVQ5fsv
    IVElWFqlY3n9o91/hFgJbm7VTftSCmHBQ8QEJVRh5ym54D2LVFqEfijqujRO1DBTwqyCos
    jNDcQEYDSGdkNF3gZJVKJ3aq4MUBvliZl1/X8ZZD3nNTVItGEGzDhoqVa4XqJgFkg7wPab
    d4pJs5JqIRMymCuGfeqwEuXXxqiGGh+pia7trR4OLVkWPco8s2PMCHHkBERmJA88ulxAkY
    em77EiFKhJDOVJhQ8sZbrBYaDjscR21Gc45ZhOt3B7DBWf7BuW1cwhY3jMQw
X-ME-Proxy: <xmx:IiV1agqsje816eoaQ2GED36nZIfGvCqOIZB8B3Al8gjfShyrWOqdMA>
    <xmx:IiV1aigPAIRoDd_-bWcjvW4cNLaHsfYg8E9WgwNxTlITOfyBoMsRGQ>
    <xmx:IiV1aiN_T7pL8_mcyDcEY03KLq8pRE3fgk-5HcrlLMfCLoiABvJz3g>
    <xmx:IiV1asz-hwsuMGKsYCn6RYQ1uXGa-IoQm7czm7CxNOddzEy436XpgA>
    <xmx:IiV1akr-M6x44oBH3QVea7iDfoBVaFK0WcZtJc2xUKiZoovtU8PYGRT1>
Feedback-ID: ifa6e4810:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id F030B780070; Thu,  6 Aug 2026 20:21:53 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AaCQ_tCgbt_c
Date: Thu, 06 Aug 2026 20:21:32 -0400
From: "Chuck Lever" <cel@kernel.org>
To: "Sabrina Dubroca" <sd@queasysnail.net>
Cc: "John Fastabend" <john.fastabend@gmail.com>,
 "Jakub Kicinski" <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 "Eric Dumazet" <edumazet@google.com>, "Paolo Abeni" <pabeni@redhat.com>,
 "Simon Horman" <horms@kernel.org>, "Dave Watson" <davejwatson@fb.com>,
 "Shuah Khan" <shuah@kernel.org>, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Message-Id: <967e5460-0b80-4689-889f-c160fcac834c@app.fastmail.com>
In-Reply-To: <amtGINRBf2NTqt_J@krikkit>
References: <20260726-tls-follow-on-v1-0-99bf4cc1c729@kernel.org>
 <20260726-tls-follow-on-v1-5-99bf4cc1c729@kernel.org>
 <amtGINRBf2NTqt_J@krikkit>
Subject: Re: [PATCH net 5/9] net/tls: Consume empty data records in tls_sw_recvmsg()
Content-Type: text/plain
Content-Transfer-Encoding: 7bit



On Thu, Jul 30, 2026, at 8:40 AM, Sabrina Dubroca wrote:
> 2026-07-26, 20:33:33 -0400, Chuck Lever wrote:
>> TLS 1.2 and TLS 1.3 both permit zero-length application_data
>> records as a traffic-analysis countermeasure (RFC 5246, Section
>> 6.2.1; RFC 8446, Section 5.1). Such a record decrypts to
>> full_len == 0, so every arm of the receive loop reaches
>> "decrypted += chunk" and "len -= chunk" with chunk == 0: len
>> never reaches zero, and tls_strp_msg_ready() holds the second
>> loop term true while the peer keeps records arriving. The peek
>> arm and the async arm also queue each record on rx_list, which
>> then grows without bound. tls_rx_rec_wait() returns without
>> waiting whenever a record is already parsed, so its signal check
>> never runs
>
> So we should just move the signal check to the top of
> tls_rx_rec_wait()'s loop? (just after all the existing error handling
> code)

It appears that only the signal check can move. sk_err and sk_shutdown
are tested under !tls_strp_msg_ready() so that an already-parsed record
is delivered before an error or EOF is reported. Hoisting those would
let an error preempt deliverable data.

However, hoisting signal_pending() alone is safe, since the record stays
parsed for the next call. It is also just two call sites rather than
everywhere: recvmsg and splice. Let's target that consolidation against
net-next rather than net.


> > +                 if (!darg.zc)
> > +                         consume_skb(darg.skb);
>
> I don't see why you need this special handling. Could you explain that?

On the zero-copy path darg.skb is the strparser anchor, which
tls_rx_rec_done() has already released. Freeing it again would be a
double free. On the other path it is a freshly allocated clear_skb
that nothing else owns.

Or, were you requesting the placement of a documenting comment?


> I don't think the way ktls handles MSG_EOR on RX makes any sense,
> outside of non-DATA records.
  
Agreed.


-- 
Chuck Lever
