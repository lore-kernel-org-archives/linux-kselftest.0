Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5239B494819;
	Wed, 19 Aug 2026 17:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787160105; cv=none; b=TfbmTQkJTF76mvn288Ukq7xjlGQUFaLf7kSSbcQqixP0QR39SPfKaqx704Cew/6xiEBhtl8V11ELDRdGECOsTeVDn0jbo9BlmbKf5e8RUExrdd4ew+uMOsIjvew6etlWAIRk7+9CNy5+qA6fzlwD7RmFPOeOHZjFBap+cJV9mg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787160105; c=relaxed/simple;
	bh=SCr60vNLYRoscAoPPkstQELvgfOrFGNYS+uRrQZtJgE=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=OMYdJlZSzQI6+E2Bysv7f/iGSA2HctdIgucBVhH90iu2BS5/tZRGMQTWKZGs1nC+HUvqU6+92QaLLpJsTANuEV+SERtV2MLJZBflCMyh9h3FHGzKkDn/Kflu8DNb4DoK+MOVObWDp3ML6ELgADWpNxxk/fS814+3pzganMdxZ/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.im; spf=pass smtp.mailfrom=fastmail.im; dkim=pass (2048-bit key) header.d=fastmail.im header.i=@fastmail.im header.b=i7Virrkj; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=B6cgfl4n; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.im
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.im
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fastmail.im header.i=@fastmail.im header.b="i7Virrkj";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="B6cgfl4n"
Received: from ams-compute-01.internal (ams-compute-01.internal [10.64.2.61])
	by mailfout.phl.internal (Postfix) with ESMTP id 02AB4EC01F5;
	Wed, 19 Aug 2026 13:21:23 -0400 (EDT)
Received: from ams-imap-19 ([10.64.2.39])
  by ams-compute-01.internal (MEProxy); Wed, 19 Aug 2026 13:21:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.im; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1787160083;
	 x=1787246483; bh=BphdidcoZ1arJQI+VYkSbMxVV2lMvAfgVQPxH+vma6g=; b=
	i7VirrkjmhlpsDIzjwJVGSFcEZ+PvmJwBsCCknSQ0tHtT2vtohFg3k3n9tSw5a+Y
	MJAL1RAC4hByU28AmVetu3OQIXSl1u8L25ycwQqfsZM0LW259H1gM6H4OQ+dJ++H
	u66d3ptG34LaGHyiiCucpjqYhc2JhII2BENuyMOjMT4fgmA0lfus4iRey+Ysa2db
	B4BZ+xgewnmNqmTc6UHiZj/df0a7birdBfwbQWxRUZzCPmkKiMjLb2RkkFTh/l5v
	pcOPQwFyTH9DU273dEvoI+rvZKQa+lvhyqJMMskzLXfjvRX2eEI4ac/k+xbZNQbI
	O/PU6oWMj/N5sk/maE93/Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1787160083; x=
	1787246483; bh=BphdidcoZ1arJQI+VYkSbMxVV2lMvAfgVQPxH+vma6g=; b=B
	6cgfl4nGckDpEiq0FpOEvUi/OLZrUIYl6hga6Ut8B+H0Wqr88vcHmGtX7jygb7QL
	XwzUI09BgspsOvESakF6TR19LTAyu7LSfwuIMCk/gN+QPTN0neN0InwFxDw4oUIn
	HHo+9uQJtNoOG/DpS1DozaMkslw8dJ52FrOaR1ZhAfbQUM0a7kra7t0UAEnW6iFR
	XIVva8HiaHxasNjz0A1X1BcitdSMNK3fl5jitPnWCGvmPMGbzFSIr5m4hWkpDb9z
	/uOR5BZNVl1AfhNcgDdu1I/5HAeqsoQ7N122mh+btzCVsFsfBIayVtRxuBdGwU1v
	dAu0X2F3nah1NZG6RR9jA==
X-ME-Sender: <xms:EuaFapI1XBmG58Xh2WEp9woXfh5FJpihrj6Hi1nDVCf8MlY1NSEbiQ>
    <xme:EuaFav_Oin4XJhHfNi9snuWwgI25g9gfP1TCg389sUEi7DN7B9ZOtczwc0brHlo-v
    7afcl7lNdgXmo9aHtySmxxEkXlAFrIFlXwymaEeCJ0Enq4jxK9b3u9U>
X-ME-Proxy-Cause: dmFkZTFHYCCjAx/fLI7ixT+SILyIdU4U/qq5bX/Mpi+jHfAcLWIeiFl+qrLGSYERvDGk0K
    C2gkZzIydrECZoSxIfUhRyrs6lN+uWNBq3aLh2S8XjU4G+kMCn9mBzMdwfUEt5kKFjhPGo
    TC/EooUrhSMY4fPF6+SX5jlVpvwbSung9ajMPL6CCvcuJx88dOxozYIEL4dRoNewbyvg3o
    T5gRdgq0f2H5CqbEyv1PIB7RKFTz65h2Lzn9ijQJt+6kAMPc6fk3Pb9Kb+eTUVuTnOa55X
    rPHh32Px4W7jtn1Ubhw1ipS9mtuQGl+yxGnH34RbK/krKmfCnYJiqQQajE1vadB6iQ4qPY
    2tSOgryHugHkOFCJbTn9YHGT7kdC8jEuk0H8RWGzbcoh+k2Awo2zVCOSyfTpQJn0tmqkSM
    J24vk5ox7UVMv18Y+KWn2Hs3z5QiGqjOSq+xHozG1lmW1O1bt5iYQ3pzzw1JnAZ1f90b1q
    IGav6tILzhYeIV7fAB/P/mOv6pzk4iYRvvoZVrLYkSV/GEu5fWdaYr9o1I/QzTsBk9qL0M
    8hHaEauJ82T2KatZ+MQZq4HDRZuHdXk4qJKuVaXBRF3OMN5CytF/Tz9/U4hGlND+lqMmwe
    uHz5IotVNnvwyDSddnRslMNlcD5+GFqBAFZU96WbSHvU/bv9A36PwfDsGgdg
X-ME-Proxy: <xmx:E-aFaj2WSakVEMD4Jm3hk1mLW2RCPpkMD2cL-CBJz66giDLmGfCaBQ>
    <xmx:E-aFaoE9jnC7fZMSt3R6Ge2SkjF3BY2E2V4eVMzZYojcxlKpaGHwJw>
    <xmx:E-aFaut-ftyEEdVwAwp7-BnN2L7lI-L3j8wtQT9rmDOskNlkfVh0uA>
    <xmx:E-aFaro8-RSWPxscBixN_6phsRB60HDZ_B0f3BpnGgC9XQ63prShhQ>
    <xmx:E-aFatA-KO7T_4sJuIW2dDEz68puRS1uRSkRY0NmsRfVDG7dsVOmwj6I>
Feedback-ID: i559e4809:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 7ACF82F81643; Wed, 19 Aug 2026 13:21:22 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: A1V9CAVVk0Ww
Date: Wed, 19 Aug 2026 20:21:01 +0300
From: "Alice Mikityanska" <alice.kernel@fastmail.im>
To: "Matthieu Baerts" <matttbe@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>,
 "Jakub Kicinski" <kuba@kernel.org>
Cc: "Eric Dumazet" <edumazet@google.com>,
 "David S. Miller" <davem@davemloft.net>, "Simon Horman" <horms@kernel.org>,
 "Shuah Khan" <shuah@kernel.org>, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org, "Alice Mikityanska" <alice@isovalent.com>
Message-Id: <de5dd3a9-9ebb-42fe-9007-499dde722d74@app.fastmail.com>
In-Reply-To: <4a8f39cb-655d-42dd-b776-a272e5d34466@kernel.org>
References: <20260814194124.3102581-1-alice.kernel@fastmail.im>
 <20260814194124.3102581-5-alice.kernel@fastmail.im>
 <4a8f39cb-655d-42dd-b776-a272e5d34466@kernel.org>
Subject: Re: [PATCH net-next 4/4] selftests: net: Fix slow configurations in
 big_tcp_tunnels.sh
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, Aug 19, 2026, at 12:25, Matthieu Baerts wrote:
> Hi Alice,
>
> On 14/08/2026 21:41, Alice Mikityanska wrote:
>> From: Alice Mikityanska <alice@isovalent.com>
>> 
>> The combination of checksum offload disabled (that causes software GSO)
>> and CONFIG_DEBUG_NET=y is inherently slow. Depending on the CPU power
>> and load, RTT may increase, limiting sk_pacing_rate, so tcp_tso_autosize
>> caps SKBs at around 40 segments, and zero BIG TCP packets are produced.
>> 
>> Increase sysctl net.ipv4.tcp_min_tso_segs and set a bigger initial value
>> of CWND in these configurations to force BIG TCP.
> Just an innocent question: would it affect the test somehow if the
> sysctl and initial cwnd is always modified, not just for a specific config?

That would guarantee that BIG TCP kicks in, but IMO it reduces the
coverage by not letting BIG TCP kick in naturally. I'd keep the defaults
in fast tests.

> (Note that apart from looking at ${KSFT_MACHINE_SLOW} in patch 2, I
> think the series looks good to me, and can probably be sent to net after
> the merge with net-next.)

Thanks! I'll wait for the selftest to be merged to net and send the follow-
ups there.

> Cheers,
> Matt
