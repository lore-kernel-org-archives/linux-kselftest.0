Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 114691C5D5E;
	Fri,  7 Aug 2026 00:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786061977; cv=none; b=Dtr/Wd1e345mowcd7cxU3CHehk2SJaBGDUTt5EwIpGfBOZjGxZgUEyBh+lSn1Yswol6GuJcl4agyEeszs4OpTouW6TXDrJxRvDLhulZACDobAjIiZS1JRSeKFtE9lHe3z4641AGReOnzGA4MXguRXdd2onGCex19z5cUGskWaXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786061977; c=relaxed/simple;
	bh=V8IaqEy5qWw7jIE4YOq+dbpEGeWEW2R8k/1/Gr6OQgQ=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=kcoFaa2Wlwln5q4Mey/hD+8HuORJf0/WHnw9N0AO8dqXEkAmiYQzQ7f1kvTK9I+IYf5u5x7838H2k8Ni7xJyPk0GxPiiI5U9726NJwK9PSjYuc6/9NdqiVyA70yWGh3nAFuT3sjsJ78nQDvDurq7nAooPUGVZM2qtAI0ixXFsR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MbaR58Ly; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MbaR58Ly"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3401D1F000E9;
	Fri,  7 Aug 2026 00:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786061975;
	bh=W4zCl7qHolRbQRkQLhBSvQ7C4Hj5pceivvDw4IzZRUY=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=MbaR58Lyry2zkiY5uZ4GeMcHyOtFymOUz0QG0oA9JNG6PDyZ3hMq4QD/4UBoeFyIt
	 /pUb8jGcNzkHBnnxNo1guTvzhKo8NlGHrFYlHiZKzPSnVsB0plDbxzVQWixHfT/aYV
	 w0J0Ri+7RTikBNeM00GB/NRQw56vGID/1qHpNkuTYxA7qyUIZoApR6iGjoS3QLPA8E
	 nJsdbI2qYSWB2IIp+depS3A6wTKLd4o9Bg76VP66x3W5w1oft5eVwiM4Tq+ae2Tqn3
	 ValzZB76VSNf+EhXsHp/jCFAIVTs7JhZvgY6c62IeMwBxzlgrEoqAKV9GYi4q5blL8
	 NvSc0WUOOpEuw==
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfauth.phl.internal (Postfix) with ESMTP id 4086AF4006C;
	Thu,  6 Aug 2026 20:19:34 -0400 (EDT)
Received: from phl-imap-15 ([10.202.2.104])
  by phl-compute-10.internal (MEProxy); Thu, 06 Aug 2026 20:19:34 -0400
X-ME-Sender: <xms:liR1alf3tWGjW7HX52kCmVbpcNQYHOAuMp99ZbthUv8iI5dA-Y1lPg>
    <xme:liR1auBNdWi9o50EjXoKANo4Mutofb9vkelmyv3iuJlyC8cJ4FkNGUiCqKoGTocmO
    iVwuA-1vX2WaXvpCfdf9VTE2zwrs9QpptzStUvJWybgig4I2zudrF4>
X-ME-Proxy-Cause: dmFkZTGSY9PEkFs+Z6IK1TdtwMvMWIX8CVW5mG4y2RyRaPt525LAaaUM76zO0O9DYqZ+v4
    OqKkQzYR1b2AyaroH7pladrEHvNJUQbYSpnENMU16hxcqvW4tWKim6aXB26+RTXriSM2RY
    MSuAML4d9+5YYkdtDPUYxZY4nMxuSOvMSkoFMAEi3eCVSh7cWyOgQycFnOvQA65l7BsFca
    UbcF0L0LpYrU6u5crjw/XbdZT8Cv70BDepUHUCpv5XluGS1U2Vie56lrg461HxUaxuQQbm
    MXjB1PD6zkUx4mgSCcZNY85QsyNI78mTF0nnBjwWQ3pNrGo0YiF9w/ZMWFJst/q7hqfolN
    ydeep8t9tSm3vQY0cYvVldGZtx8f9zJYODMTPg/uPUXvo0AmvDCsbSIVDl/CQlKokSjZFv
    xOIytJviUHOtXoXjq008cOtovyBY91dLjaBYr9IhEsiwL99jc1oN9R7SDoNYLeNm1+kFKs
    D8nM+ccyudD49Td8X7Tlb+XADP/a4jH/ypmeCq2zeJ6i1AFAlUL7A1EkKsQ3lxv+KmYwCH
    Ly8ZAhYkGF5heCl7x0teiDmKMVAAUtp8pxONoCNFt4x+7GVBU0IaK+Mptn1wSR2qpW3c1m
    tHxLRcRpoJLT2zUZrezV4y4b0iMM8+lDy6ZykBgtkKuTfjemjcGuk1xQCQXA
X-ME-Proxy: <xmx:liR1ahA3SPJkEtsE_NaU_SrIZJqs2at3zUYSNJietqYCKax4jldgfA>
    <xmx:liR1arak3KOhgCCG42pycu4wSXwpoCPrg3E8N_7kpvDQi2VQ_OLCYQ>
    <xmx:liR1apnAgHxiZJYjxotF2edMNXMYTis2Ici767uzs7CEQoJuwB69rg>
    <xmx:liR1agriGKjNMDiYSkoWekydX9g99DRcb3utb-7jXxOd5LCIWlDPZA>
    <xmx:liR1arBzNsMgQdA8PH1wEqZ1P459baeSFAl6c1-axQlVhr39AnB6WKTG>
Feedback-ID: ifa6e4810:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 230DC780070; Thu,  6 Aug 2026 20:19:34 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AtKkMkI09JcJ
Date: Thu, 06 Aug 2026 20:19:13 -0400
From: "Chuck Lever" <cel@kernel.org>
To: "Sabrina Dubroca" <sd@queasysnail.net>
Cc: "John Fastabend" <john.fastabend@gmail.com>,
 "Jakub Kicinski" <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 "Eric Dumazet" <edumazet@google.com>, "Paolo Abeni" <pabeni@redhat.com>,
 "Simon Horman" <horms@kernel.org>, "Dave Watson" <davejwatson@fb.com>,
 "Shuah Khan" <shuah@kernel.org>, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Message-Id: <afb12cda-18c3-407b-96aa-a8bbd6b0b475@app.fastmail.com>
In-Reply-To: <amsppyDTgxm-b5pk@krikkit>
References: <20260726-tls-follow-on-v1-0-99bf4cc1c729@kernel.org>
 <20260726-tls-follow-on-v1-2-99bf4cc1c729@kernel.org>
 <amsppyDTgxm-b5pk@krikkit>
Subject: Re: [PATCH net 2/9] net/tls: Consume empty data records in
 tls_sw_splice_read()
Content-Type: text/plain
Content-Transfer-Encoding: 7bit



On Thu, Jul 30, 2026, at 6:38 AM, Sabrina Dubroca wrote:
> 2026-07-26, 20:33:30 -0400, Chuck Lever wrote:
>> +/* TLS 1.2 and TLS 1.3 both permit a zero-length application_data
>> + * record as a traffic-analysis countermeasure (RFC 5246, Section
>> + * 6.2.1; RFC 8446, Section 5.1).
>> + */
>> +static bool tls_rx_empty_data_rec(int len, unsigned char control)
>> +{
>> +	return !len && control == TLS_RECORD_TYPE_DATA;
>> +}
>
> I'm not convinced by this helper. The record type check is redundant
> for splice and read_sock, and it doesn't save much for recvmsg.

Agreed. v2 of the series will drop it.


> If we're going to keep it, I'd rather pass it the skb and fetch the
> length and record type directly in the helper
  
That doesn't work for recvmsg. The length has to be read before
tls_rx_rec_done(), because on the zero-copy path darg.skb is the
strparser anchor and that call releases it. The type it needs is the
accumulated control, not the skb's. So the three sites will have to
open-code it.


> I don't think we should be leaking mentions of the "anchor" outside of
> strp.c.

I will reword it.


> This looping (and the existing one in the other RX handlers) is making
> rcvtimeo a bit pointless AFAICT [...] Am I reading this wrong?

You are not. rcvtimeo is applied at the reader lock and again in
tls_rx_rec_wait(), and neither bounds the loop as a whole.


-- 
Chuck Lever
