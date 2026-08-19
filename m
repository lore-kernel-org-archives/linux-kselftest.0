Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 552CB492531;
	Wed, 19 Aug 2026 17:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787160103; cv=none; b=R+bIFFvrPkUW2tEmtpug996t3/MBtTFEy0yqGn+3FIv0NmwxWT0Yh1j4fxfMGcKbJcbW2WJ9xILqwvEQmVtP2ruQzWNv5DofJKGC6gIn5FxnWIX78JOqPaN/td+qYx9+L6fD3uqB29W61A5C2SLNGsQSGboVR5lS6XvsGvBL14E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787160103; c=relaxed/simple;
	bh=reyOikJeIgz8Wh2yKLyAJLiVo42x0TSWEUdhf5zTah8=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=OWA3kto9sGBJCaxpw9FVjRm4ROMsikaaYvQIWRuSmRX6vSlSFBuDEN0T2fJxscJ6+Y2J2TdDWw+s+zJYRJzHXW9pN7DnYmq85K3WgQFNkikPCk135RfktQcdbtO6GylTrBnKWZTVpJqaVt9/ZDEmelOmBhjtbd/lbDa6/+vr27c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.im; spf=pass smtp.mailfrom=fastmail.im; dkim=pass (2048-bit key) header.d=fastmail.im header.i=@fastmail.im header.b=ZTbe2faa; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=MmG+8dvi; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.im
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.im
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fastmail.im header.i=@fastmail.im header.b="ZTbe2faa";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="MmG+8dvi"
Received: from ams-compute-01.internal (ams-compute-01.internal [10.64.2.61])
	by mailfout.phl.internal (Postfix) with ESMTP id 4BD7AEC01F3;
	Wed, 19 Aug 2026 13:21:19 -0400 (EDT)
Received: from ams-imap-19 ([10.64.2.39])
  by ams-compute-01.internal (MEProxy); Wed, 19 Aug 2026 13:21:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.im; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1787160078;
	 x=1787246478; bh=Vpi4XMO26isCR+trSfji5hGrrTOXYenjAHeGvwnIgGk=; b=
	ZTbe2faaguQ0j4pbJssm68Iehm+hM8aENI1FxotUzKjbAL4VbCz3NGXsvuBADfGV
	8pTkRZqdVIBQ230/sPWC/3qjMECSCC7pAmEBshMo8/4eTs724DvoNN9IuZMg6bMp
	t9z8+nWF8xBDQPPCUB42uWtmd87W8MCOF4gRW8iF1YRcIl9fPtSDEfqTiNmv8XRH
	rkv8qMSvx1Eg28dBwprV0F/tNQOaoVf+b41RerqIVnXHVhJPafpuGlm1kivUN0rs
	v1WMlCN2BT5ve24S4wGxG2IO61lwix7ahaa2NSXVm22IMXWj1e2f8SIQi6Y+0DMe
	tbb0PciBNOQMU+Cq7cj/mQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1787160078; x=
	1787246478; bh=Vpi4XMO26isCR+trSfji5hGrrTOXYenjAHeGvwnIgGk=; b=M
	mG+8dviFMKu1Iic48ecXN8LWO7Fpv6efMXI6jw6eEjtmlBASPcUUJH0JEjovoNPF
	fzcVBXMpFicKzvGDpRlRFcyyBCCZvEQdXvXsA6gytD5o0rkRmBQVHPdA9cHYBd7n
	sfnSWl2Ddac/ba+vXxOyl7heqK+pn5qUgEEfob4SJq3nKmJTTmgpWjTX94G1aiSt
	XD0JWKX8UxEbQU/tiKxSh+zP+d38bdRxQBpd+SZeHmV1QyGr24mgBJ/JWxF5BxNd
	01grvihbZypsqvPYRJMLMEwYy4z8NixAbeV6FYP+H6ZyIuxxgjhAQGCVyyH5okg4
	FMPGqu7As+vDumKUIlrwQ==
X-ME-Sender: <xms:CuaFamzXYZUbxrA-k01utO_pD9nAjpabvEZb_E2wQJeDJzUbP7LPBw>
    <xme:CuaFatGUUp0BwLoEpYgxs4Rpv7sdcuDWNOmXfPF6psq-ZullNak4J-pmgN-Wj1lEk
    0PPs6ul4-pxlO7WNjIs3JHmKszWWUW59jwnUUo5DAt8lzYZ8EQDHcQK>
X-ME-Proxy-Cause: dmFkZTEry2p1IRtHlwQ175BjwbyvRzdULnm39XDvG3GbYy2aDHzcMxZgqdYfskY8aa5RA/
    6A3G0O38rbwaTCCx42jPHVvGUU+iF7Nr5GmvFEBmvjcJOsZu8wYn9KE2lfjQtKNSVWFdZF
    9i/LxrCy7J6oSwGLRXWglSjfcVeqkAGCBK7/eKm+badBzkwqxWJNtqC+6RNpPUfYtW8zOu
    6v8ZzbrhyD63HsrAJ1iHc7/fF3Fz+CBfYdC/9reZDYrcDeOW5/A0V49DkBt5FHevqwnDyv
    s81ZAfeCDjUBymJCDj+Xm40fBUKrtfiqjvbM6rODr3AXsIPygTmauB/pgd8HQUQ9IfjFcy
    F17QTGFJp+uaTpO3v5geP2+wJzmDP0EHxh/bt+PyFznOQSA2bdgSiDg5XZi4vI4pnngNEn
    odaCxDwDs4kDgHTZ83/VC/226LotV1xQxXiniJTojmDM7mRuMLYLM5vIQuAYCMOFKlFvYt
    p8UiJAAODCDwoP2wA5vogy9MDBVG65WcMk7Yodu4hKliE8rsNf7gD6/hVdEkb+2Bd4cqlw
    kETgB9qLkhdtytpHiL8Rvw8GN8hOMaWZzm4BnyKxbMzBTiKEdVccIb0qJZ6Of0ypaGtetM
    kACbufnuxSAMJEwF+aX9DVJ1hOJI+pYaUpxGhllkPsj/V1C+ve9ZOEndmNUA
X-ME-Proxy: <xmx:DOaFaqf2WEGBzru_Ei5VpqAyS6W5X5kyh34h5ffMk-ZO4euOcPZxcg>
    <xmx:DOaFaqOGcc1cOHe66rLBYqtV84_iavSasJx1wiUNA58XnfH731VBhg>
    <xmx:DOaFamUuUYRE2Ra2LgJMTzWDN0pX5rySQ92GfQ-dzYmb1mvDawHJmQ>
    <xmx:DOaFaqyPzWNDhVV5bk6rRGYBxZ2CigAQN2GYacXfV2DDqHiG9NAHHQ>
    <xmx:DuaFasYQaB3m_Kob6ZKcjpLbVvqArSj7Acv6SFvhbzzc5FgEwnfgGckS>
Feedback-ID: i559e4809:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 20B4B2F81644; Wed, 19 Aug 2026 13:21:14 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: Ag8pyDs4WbsN
Date: Wed, 19 Aug 2026 20:20:53 +0300
From: "Alice Mikityanska" <alice.kernel@fastmail.im>
To: "Matthieu Baerts" <matttbe@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>,
 "Jakub Kicinski" <kuba@kernel.org>
Cc: "Eric Dumazet" <edumazet@google.com>,
 "David S. Miller" <davem@davemloft.net>, "Simon Horman" <horms@kernel.org>,
 "Shuah Khan" <shuah@kernel.org>, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org, "Alice Mikityanska" <alice@isovalent.com>
Message-Id: <d4634ee7-28b4-42cc-9a5e-3467b0b22397@app.fastmail.com>
In-Reply-To: <ea0ae140-86e9-4578-a24a-d50fc0b19c4a@kernel.org>
References: <20260814194124.3102581-1-alice.kernel@fastmail.im>
 <20260814194124.3102581-3-alice.kernel@fastmail.im>
 <ea0ae140-86e9-4578-a24a-d50fc0b19c4a@kernel.org>
Subject: Re: [PATCH net-next 2/4] selftests: net: Lower threshold on debug kernels for
 big_tcp_tunnels.sh
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sat, Aug 15, 2026, at 02:07, Matthieu Baerts wrote:
> Hi Alice,
>
> On 14/08/2026 21:41, Alice Mikityanska wrote:
>> From: Alice Mikityanska <alice@isovalent.com>
>> 
>> CONFIG_DEBUG_NET kernels run slower and generate fewer BIG TCP packets,
>> making the test flaky on upstream CI runners. Lower the default
>> threshold for those kernels.
>
> Thank you for looking at that!
>
>> Signed-off-by: Alice Mikityanska <alice@isovalent.com>
>> ---
>>  tools/testing/selftests/net/big_tcp_tunnels.sh | 18 ++++++++++++++++--
>>  1 file changed, 16 insertions(+), 2 deletions(-)
>> 
>> diff --git a/tools/testing/selftests/net/big_tcp_tunnels.sh b/tools/testing/selftests/net/big_tcp_tunnels.sh
>> index 9b7d0456bcc1..e27774eae20e 100755
>> --- a/tools/testing/selftests/net/big_tcp_tunnels.sh
>> +++ b/tools/testing/selftests/net/big_tcp_tunnels.sh
>> @@ -17,11 +17,25 @@ CLIENT_IP6="2001:db8::1:2"
>>  CLIENT_IP4_TUN="192.168.2.2"
>>  CLIENT_IP6_TUN="2001:db8::2:2"
>>  
>> -: "${PACKETS_THRESHOLD:=1000}"
>> -
>>  # Kselftest framework requirement - SKIP code is 4.
>>  ksft_skip=4
>>  
>> +is_debug() {
>> +	local config="/proc/config.gz"
>> +	[ -f "$config" ] || config="/boot/config-$(uname -r)"
>> +	[ -f "$config" ] || return 1 # No config found; assume non-debug.
>> +	gzip -dcfq "$config" | grep -qx 'CONFIG_DEBUG_NET=y' || return 1
>
> Are you sure it is CONFIG_DEBUG_NET that causes that? It shouldn't be
> that heavy.
>
> Do you not want to change the thresholds only for the -dbg runners using
> kernel/configs/debug.config? If yes, you should check if
> KSFT_MACHINE_SLOW == yes:

Thanks for the suggestion! I'll switch to KSFT_MACHINE_SLOW.

> https://github.com/linux-netdev/nipa/wiki/How-to-run-netdev-selftests-CI-style#dealing-with-slow-runners-in-performancelatency-tests
>
> Cheers,
> Matt
> -- 
> Sponsored by the NGI0 Core fund.
