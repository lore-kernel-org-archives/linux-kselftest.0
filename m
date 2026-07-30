Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0375436A03A;
	Thu, 30 Jul 2026 15:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785426405; cv=none; b=uyHagFdgyM+TyLrHK/SsUtUqhDWE2rvpSzR/ewT+ohG5Y71oguUDaW8PJlmD9QbI/BcjQzLZtVZU9t8KUPjjTvRmKNkdBg9kee3068BNEbn0aNRBDAM1Ft+Bx7ycq7bqftATlQP0Lbz4SD/8A9nVaMBAruXIG6KVK4//XPKJDvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785426405; c=relaxed/simple;
	bh=ISje5j4TbGjdxujN3oabyB7XbWpeKMCZ3jviVqSv+4o=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=PshPlsj16xWf2BYd0rk3MsGlDWs3MVgtcAuFrU+xHz/BC17Ioijp6cYyU8m3Qj4Yy7+06AY3qFZ44NqbUXmipzQJCs5ahylFo1FLnn59163uINqdqoASFkQrNwmwh6Bf9vvcvbkvQcNFc0SDmXql0+nJsOrvMWlF0TAunGIZDMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.im; spf=pass smtp.mailfrom=fastmail.im; dkim=pass (2048-bit key) header.d=fastmail.im header.i=@fastmail.im header.b=mTna9431; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=jNSmIlC2; arc=none smtp.client-ip=103.168.172.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.im
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.im
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fastmail.im header.i=@fastmail.im header.b="mTna9431";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="jNSmIlC2"
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 0203114000E2;
	Thu, 30 Jul 2026 11:46:42 -0400 (EDT)
Received: from phl-imap-03 ([10.202.2.93])
  by phl-compute-10.internal (MEProxy); Thu, 30 Jul 2026 11:46:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.im; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1785426401;
	 x=1785512801; bh=EPx7ldPkYz7H8YR2YG1jaSpG4h7nt4R9Js2IOlyWFU4=; b=
	mTna9431xMo4VtjkAfZltSBp+5oXAXJPCqGsgRpGHsj/8P4g7SlqB6UGvomoziPT
	m34gJnclz7ja7F6RkqbP0mgSZw3d3UKcIFv/+tPbT05hMJdxXgXSuPWC7In4ScDN
	B8JaUe9XCU/3OwCWjcuzX3NcQcTv7vafSyNnvqDIjt/8EYUbVqJBWOpVa6k4lqxa
	TTzeCCNblSIroV1nisaAITISSw9sapSad38WnN6B0Emg9dip0NVZxBFa/LqNNV9U
	j3z0ok7fmqC4x/nPLjgd9JyPwZqlIT+LuChv7Bl633AO1HXlFYdLf1pj4vOBYkKX
	KagX1fBbKuJZJjoDLvkpZg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1785426401; x=
	1785512801; bh=EPx7ldPkYz7H8YR2YG1jaSpG4h7nt4R9Js2IOlyWFU4=; b=j
	NSmIlC244na/rrb1oChZF++kKJIi/wClt8gYDwjVDTYOhUNgjwlrELB4ATb4lpQj
	httPFY7ILBqeyxcFxYoX0EVz1Q1vfMcrENlevv6FG97DRY9fGZ/ykYridCPQId+S
	oUAdWRNGgrt3IAVO1oOSkI2Et4cVbexW3Wv0u9H0ARoozCQdjDQkc3hSLnOUobLs
	6Uc9iOJ+OSWJw0FkBHOQ2Z5NRJjt6kULWqBDFpLnGilIQq4+t4aWolAnTnYQQ0aG
	Ikvf97XHQYtxkIW+704Usw9AqeszSsaeQr6TBt6/oOxbVZ8US1jehnh88vwPijdU
	/i+ytULDqqVPvJ5hGCPKg==
X-ME-Sender: <xms:4XFravInZMRQr5xuLHmdE4PG9BW6nWfuZnEBgG__4mpl_ZdC_PjsBw>
    <xme:4XFrat9BLyVzbCn0sxgD2meDFSrkmG7Sbr1OgCJ-9Zas-INogsQO6SokUa5z1ZMVs
    -wfW6OdzEixWAUyX1xBb1lPdhJTj9FXxVd3maQZGjAtPGW4KU3CcqkF>
X-ME-Proxy-Cause: dmFkZTE6sxYGvXKpNbu8pMlXILMywKeyYQodCqz1lDjkAHxGhoWnEg932jEC4+gwjO9mMR
    m1RbyFA/Jng4kcjKUiU5wmvL15ov/9JL/+hzpFshdz9F8U2WeRUTy1bVeWS2zzJQ7UGZgK
    8TA0SXNfjJ0RUrU5DOzep9N3NunXA5mG0XfbunqZDpO4alsawClsdLnI/EF7oAotSRE1BE
    8ulow8RMHFLiEwIrW/3Eqj7yQNGkCCB3n8tvo0nrdcpagYePm2vALS2Q/XVeUiib9GnJDm
    8svVV0rDQZTB9xkm+Hjpy9CwtpzdjG9iEicdjASDndU3GfiD3nUzoy6qv8KHHppzTVf4cM
    x93/3yf9X4nv1pPuL0aXimlomCRTHcrKF6eK+4JLWjyHm4y+icTATk5hb7h7udbjYrH7UT
    splq+5B9QCAhQLaSAn6Njt3jR7yxvTiOPragHR3o7thiTg1dkrutfX/5pmAcRi2hMfWVMB
    nVs0GIJ2oomdZ2/elFHCR2gWeABAUqcWoI8dFiPhBjQgjchN5aj8pynaDyYqSJx2ZxY/XC
    JgEZ0M+KPOUiqVOf7I/yIHLrmA4Sd55/0ljder9WbJl6YnZtPe6zLv6rCAixzXRsyFvFg3
    7JwNspDEQcpssPDU69YOmpwi/vfgk8AhSAztorii2I389WgGTkhbBAK7RdBA
X-ME-Proxy: <xmx:4XFrap0fPLs_vM0QfhVCBxAFGj37sOjlvzgPa3Djha4SUsYOtkiV3A>
    <xmx:4XFramH7vuDDwX2RcvASAr7bEbWCtKS3fzyglFSIomy0bljOPtpnRg>
    <xmx:4XFrakuXVraSieZJ_hYtORqDDL8e8lWTUbALvoyEJVbYMDm3uRsetg>
    <xmx:4XFraprdYbQz_kon0P_EoxKQ36jys8zXxCXr1U8ukbsWf3KdUBN89g>
    <xmx:4XFrarCEHa3jlj1Z9bN7AOgQq28UqYs6vXi0dB0QxP2YL7mgfAsoa9rt>
Feedback-ID: i559e4809:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 31AC518E006C; Thu, 30 Jul 2026 11:46:41 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 30 Jul 2026 18:46:07 +0300
From: "Alice Mikityanska" <alice.kernel@fastmail.im>
To: "Paolo Abeni" <pabeni@redhat.com>,
 "Alice Mikityanska" <alice@isovalent.com>,
 "Matthieu Baerts" <matttbe@kernel.org>
Cc: "Jakub Kicinski" <kuba@kernel.org>, "Eric Dumazet" <edumazet@google.com>,
 "David S. Miller" <davem@davemloft.net>, "Simon Horman" <horms@kernel.org>,
 "Shuah Khan" <shuah@kernel.org>, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Message-Id: <349c582c-73e3-468c-91cd-ad6cc3562700@app.fastmail.com>
In-Reply-To: <606acc01-e22d-4e69-ad26-a8afff262b98@redhat.com>
References: <20260723140241.132120-1-alice.kernel@fastmail.im>
 <47b580de-9d11-46c9-91c5-55eb13c00bc4@kernel.org>
 <CAD0BsJVqmQRz1yNKMMWH1MT+kgVEh=wY=LOTy_ObeTDCsrhHFg@mail.gmail.com>
 <606acc01-e22d-4e69-ad26-a8afff262b98@redhat.com>
Subject: Re: [PATCH net-next] selftests: net: Add a missing config option
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Jul 30, 2026, at 10:46, Paolo Abeni wrote:
> On 7/29/26 10:44 PM, Alice Mikityanska wrote:
>> On Mon, 27 Jul 2026 at 12:09, Matthieu Baerts <matttbe@kernel.org> wrote:
>>> On 23/07/2026 16:02, Alice Mikityanska wrote:
>>>> From: Alice Mikityanska <alice@isovalent.com>
>>>>
>>>> Commit 5cb53743e1ff ("selftests: net: Add a test for BIG TCP in UDP
>>>> tunnels") used iptables match comment, which was missed from the CI
>>>> kernel config. Add the missing config option.
>>>
>>> It helps, the CI can now run this test!
>>>
>>> Reviewed-by: Matthieu Baerts <matttbe@kernel.org>
>>>
>>>
>>> But I think another follow-up patch is required, because this test is
>>> flaky when using a debug kernel config:
>>>
>>>
>>> https://netdev.bots.linux.dev/flakes.html?min-flip=0&tn-needle=big-tcp-tunnels-sh
>>>
>>> Maybe because wait_local_port_listen() is required after having called
>>> netserver?
>> 
>> The issue is hard to reproduce on my machine, but I could reproduce it
>> in ~12 hours of non-stop testing in a loop. It reproduces even with
>> wait_local_port_listen, so it must be something else. The log above
>> (and my repro attempts) shows that it fails in a non-first test, but
>> netserver starts only once, before the first test. If the failure was
>> due to netserver not being ready, it would fail in the first test.
>> I'll keep investigating.
> I *think* this kind of flakes are sort of expected for 'performance'
> related tests when running on debug kernel: the environment can be
> painful slow, and few failed iterations I saw has csum offload disabled
> - even lower expected tput.
>
> AFAICS the target packet number is independent from KSFT_MACHINE_SLOW
> and the actual offload setting. Possibly you can tune the target value a
> bit WRT the mentioned variables or skip entirely pkts number validation
> in the slowest permutation (note that the self-test will still have some
> value due to code coverage with sanitizers enabled).

Hmm, the above makes sense for the failures like this:

https://netdev-ctrl.bots.linux.dev/logview.html?f=/logs/vmksft/net-dbg/results/754376/28-big-tcp-tunnels-sh/stdout

971 is slightly below than 1000 (even though it's typically 1600-1700 on
the CI runners, in this configuration). Tuning the thresholds can help.

But I also see failures like this:

https://netdev-ctrl.bots.linux.dev/logview.html?f=/logs/vmksft/net-dbg/results/751124/21-big-tcp-tunnels-sh/stdout

It's a complete zero, so lowering the threshold won't help here. I could
reproduce it on my machine, although it requires hours of retries. I'd
like to capture the tcpdump and see what actually happens in this case.

> /p
