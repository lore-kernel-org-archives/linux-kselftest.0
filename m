Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34CBE40862F
	for <linux-kselftest@vger.kernel.org>; Sat, 12 Sep 2026 17:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789234898; cv=none; b=jCGQQL7uRvtjw6yOTcjbHHUCCxexeDZIYT7pS10DFCWicJrA09tzUYyPqg0gku0gHFvtRgKyJu5/n7UgJWOAB5dUNSur5Ucpd74mdw6bwrbyaz6yAZuSO4X6j2WJDsg/Y79qEi2WLa/Joey++J12G//PvC6mGf4M7EW/Y97KQDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789234898; c=relaxed/simple;
	bh=WwdB+ukEtegGwsv+CHfPaA5VNrMqODmWH1XFSPC8TsU=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=FfY95uhMBl4EemHN2MoT7dFUXmE5WQ5ctglKzTFc3xMTDjRwYMBlh5ThGmbWllkhdxZSn3hvs+Tp66tYsI9kaB0iaT+tCqenOamFO4ZFu/jBL/Fr+LXRyDx98QDSGyHw4YGiAiF3sGuSiQeFCymjz1a2fuvt1PzRvy2KuLnUWzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marliere.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=marliere.net header.i=@marliere.net header.b=INz7LgxS; arc=none smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marliere.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marliere.net header.i=@marliere.net header.b="INz7LgxS"
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-6b12942ed04so1804636eaf.1
        for <linux-kselftest@vger.kernel.org>; Sat, 12 Sep 2026 10:41:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789234896; x=1789839696;
        h=in-reply-to:references:cc:subject:from:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:dkim-signature
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Rf6X63a3owflg9x45ncqhPfrFvxaABmj6y0D/zWTVkY=;
        b=CMVuZ6iJgQGV5Vc16oWYlcAbL0+z6Y9rKgOQIgkFRf8LFSpBTSYXuB/4Flqq33OFIU
         BP52Xr4oc6AOIFuQR65PlKoFlub+dT4RP3j2HjvV9fUZN46uRcjrcbvVzC6J/4Yoimni
         099iyCT/g6pJ9ZReTVlYqbZ73QGA2/YztOBFEG8Ya2Pj+FMOur06btootNQoi/KFDip5
         YfaIy54vPAeewYQe2PZCh/FgY17t4TCkpBzvv8CL/wbv1fXK3wsWHWvYrjwOvCYLhkh/
         P1POEg2gjoHZdavLfHdAIOIVpYhetdttJZMrHoJCteYGCcBApI/sTx8G46Oh88G3WxMt
         Lg2g==
X-Forwarded-Encrypted: i=1; AKwUvBzxhR6r1GCHMGilrcAOT3wKDg08y3N/ApxgBmJs9A9rbXmAjITnNYxP1Q6bCkjwZyCTNR4VNcriXqPlCdiNHms=@vger.kernel.org
X-Gm-Message-State: AFuF++mvUInUGDMEaWk37cFAh4c5upyuJOje45xETmYqnBzJL5oWlS6K
	dJs3+hOZlofkGgv53tiaq0iw0gGf95vz+o/ossltMIisxi2fYIy6neWS
X-Gm-Gg: AYBFou2roc51YfTgSwMHuZjEl+s+7SBYD8GCXEznt3vLKDQUDxEHAVccr+hgH57okKj
	x4rSTdNr+If83WmP/8ewFpB50MpfxbbaeQXKeJxGtIg8BEyZc9sF5xexsuRrrf4aaxzcAv+OK1S
	VpD4yn92IUaIVAv9+RhIa0gb1hd2lhCK+J5uYdmcSOvv72lmquY73qSnw4Vuf5wMbOhqy9mXkS9
	hfsjJ9j1oyp/YgwUlH592KEeufU2weCx51wRF6gRmXtln5O6notg7wbJPyj7w/ZObBmUgx+IQGT
	gKleDQtkNDyZZNuDzmqHiPWNx9jEK/oYJcpAM3K6n0e1O1FIroB6Yru0V1COT/PqazalwVwYiVp
	yoP8cOUDGzYE5oeTyk6jg6hxHER0m8/MRXG4qPrHwNzzKWiQDYoxpkAlUm9iAm4+eNtZ0uqr+8v
	zQXbeXJIT+LLkf0TUa8luZZ9gJIHouwTQGyTz0iMz3x+h4fsd4G8LTXUsrhfiDNyjtv4aGFXiwz
	Nl20RRwFebQxePi2p2ehGAkmF6YRqcSaKqIf51AnSXWq0KUyK5/jvT7/YPSjovdosCk7YtlgnbT
X-Received: by 2002:a05:6820:5604:20b0:6b7:83c5:fde5 with SMTP id 006d021491bc7-6c0bb1f3cedmr4855066eaf.38.1789234895896;
        Sat, 12 Sep 2026 10:41:35 -0700 (PDT)
Received: from mail.marliere.net (137.65.66.34.bc.googleusercontent.com. [34.66.65.137])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c0996dc5a6sm6063572eaf.6.2026.09.12.10.41.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 10:41:35 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 181FF614C0;
	Sat, 12 Sep 2026 17:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marliere.net;
	s=dkim; t=1789234892;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Rf6X63a3owflg9x45ncqhPfrFvxaABmj6y0D/zWTVkY=;
	b=INz7LgxSl5imgrkvj+dGIF2TkBK5hTdU1+riBZTI1WABNWSP3oVx1rqL9aNE//Ce6V0jMs
	54U/ObBDcHvQq8EkwcUSZ/L2JOqGh7Mseu03lj6sa/HCQhPXi9uzpInQjZEywRe6ps6M4G
	9SSOY9kOVVxu1OFSya8tYfOwCivhh1oeKfr2+zqqIllXGK3O8CccLrYMZe87sZbDQOPLEP
	G8ZhhxrFuTzaizjRYvAPA6zCfLeJT+oUR0/8iR4CAPmU7A5q8Wm7bFL//IKucf/ta8GhEG
	rUUwt2S9uUJfctL2l62UOQqC6FOq+u+M5VMXYZ2D1mp+LW1HbU+JAGbGYlgkzg==
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 12 Sep 2026 14:41:28 -0300
Message-Id: <DLDIU0FHU2UY.2SR6QH3U7PYB1@marliere.net>
To: "Jakub Kicinski" <kuba@kernel.org>,
 =?utf-8?b?UmljYXJkbyBCLiBNYXJsacOocmUgKFNVU0Up?= <ricardo@marliere.net>
From: =?utf-8?b?UmljYXJkbyBCLiBNYXJsacOocmUgKFNVU0Up?=
 <ricardo@marliere.net>
Subject: Re: [PATCH net v2] selftests/net: Fix icmp.sh race between ping and
 tcpdump startup
Cc: "David S. Miller" <davem@davemloft.net>, "Eric Dumazet"
 <edumazet@google.com>, "Paolo Abeni" <pabeni@redhat.com>, "Simon Horman"
 <horms@kernel.org>, "Shuah Khan" <shuah@kernel.org>, "David Ahern"
 <dsahern@kernel.org>, =?utf-8?q?Toke_H=C3=B8iland-J=C3=B8rgensen?=
 <toke@redhat.com>, <netdev@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.22.0-16-ge144528849ba
References: <20260911-selftests-net-icmp_race-v2-1-c7458dec9d0b@marliere.net> <20260911174045.76579e91@kernel.org>
In-Reply-To: <20260911174045.76579e91@kernel.org>
X-Last-TLS-Session-Version: TLSv1.3

On Fri Sep 11, 2026 at 9:40 PM -03, Jakub Kicinski wrote:
> On Fri, 11 Sep 2026 15:41:33 -0300 Ricardo B. Marli=C3=A8re (SUSE) wrote:
>> icmp.sh backgrounds ping and then starts tcpdump, with no synchronizatio=
n
>> between the two. If tcpdump is not capturing yet by the time the ICMP
>> unreachable replies come back, the test fails even though the kernel
>> behaved correctly:
>>=20
>>   FAIL - got ICMP response from , should be 192.0.0.8
>>=20
>> The empty address is misleading: it means the capture matched nothing
>> before its 10s timeout, not that the reply had a wrong source address.
>> NS1's Icmp InDestUnreachs counter still increments across such a failure=
,
>> so the replies were generated and did reach NS1. Ping sends several prob=
es
>> over its 3s deadline, so losing every one of them takes a multi-second
>> stall in tcpdump startup, which does happen on loaded CI hosts [1].
>>=20
>> Fix it by starting tcpdump first and waiting for its "listening" banner
>> via slowwait() before sending traffic. Run ping synchronously, then kill
>> and reap tcpdump if it did not already exit on -c 1.
>
> It used to pass in NIPA CI and now it fails:
> https://netdev-ctrl.bots.linux.dev/logs/vmksft/net-dbg/results/819341/86-=
icmp-sh/stdout

Thanks for the pointer, I'll prepare v3

>
>> Fixes: 7e9838b7915e ("selftests/net: Add icmp.sh for testing ICMP dummy =
address responses")
>
> Please don't add Fixes tags to selftest improvements.

Wouldn't this mean that the commit would not be picked up by stable,
creating a gap there?

>
>> Link: https://openqa.opensuse.org/tests/5907626/logfile?filename=3Dicmp_=
sh.tap.txt#line-2 [1]
>> Signed-off-by: Ricardo B. Marli=C3=A8re (SUSE) <ricardo@marliere.net>


