Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793106791;
	b=PQy5ffJ2u2B6IN9OQjh0J0Yzk9fEMdU81NqEySxeOVSwvfViNvjJOa+TRe3hEA9RrCPi
	 /0ydB/UHxgC5k4fCq/XHlMXvsie8Us1+prnHaeew+lU0VbxALScy1C5CBVfhQPwydkEFL
	 g+KiuPu/+0Ckp7h0ofiztb+k8A/qQTPkBqsYF+Y7V6Du0yptd/TvgpnAIVS4w9No5FSRW
	 ZS7Cvp6DyTrsvo01Gm5z1v0zVQsOGwn4FVjpEsZoau/sZzr5PDPJLclVWJwfR1w7QI07U
	 3Z5KLohSAEFN8kLJAaOpmWx4k40QaUHsrQz2htj3fATDzEUlk431FutFtWjWPSVBc7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793106791;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Content-Transfer-Encoding:Message-Id:References:To:X-Mailer;
	bh=NLb4nDnDa6CheKrcmNiCI0BRgJPIlEmNmuOLfa1pfGM=;
	b=IQ7jNt4YTG0hz/+1xIGwClmMmiJfYbIjGEdxmQzmHzgEgTNc8KVF1YQ0T8xXD/PxCDwl
	 6WCVu61R70X9R3tZewrwcrKHlaii/hoat/QVOibr20p040NZDwxbc2HimyQkJPu4tNyoB
	 f6PNSa1G7L7kZOtCgyLJeV32h34cfKd4QQamKZY17UvINmspQaegp5IB8Ug6HNo7ZYyiJ
	 Nc0TpbwAbyisoh8u63sBmJmBV9tdITBUcQrlHbOpmzMFr6znfeWVTCsGregxivIkZEUA6
	 htR8uEu4sU+dmjR9nPJkLHtZKG3BgaZPqG9UhSYb6r2a0rIT+rzh8lAPRdej07RZSug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GdQnafCf;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C04606A330
	for <linux-kselftest@vger.kernel.org>; Tue, 27 Oct 2026 13:13:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1C04606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GdQnafCf
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso7485023eec.0
        for <linux-kselftest@vger.kernel.org>; Tue, 27 Oct 2026 06:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793106790; x=1793711590; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NLb4nDnDa6CheKrcmNiCI0BRgJPIlEmNmuOLfa1pfGM=;
        b=GdQnafCfs4JjE1bf5swyZn+lUdfkEWIe19XaOfaI/jr6nZJrRlM6EDaidtXyggEWzn
         z6mqlIb+cs/xO51JFD+8ZiFR2wAQvf8Dlrvh7feSj/iyZtu5rSvjsX1g3WFw354kr6BK
         4DcL4gBDT+Er/iQ5G3sLJbNJeWLJYv8+4YD5JrZiUDT9c1qaWkCG5dWJp10g1rfT4x6R
         E2ncrHWrcjzOo+gNaB82xl0fyCHWwBzbmGDop1K2JWsasCX25ZRdaDtihYxiOYWIjtSi
         Oo0KW0aKkdsirAuAo4RnGtiqb7evofLpBW4k3c4W+XIT7MgRamX9jVfkGGbLyvFVfEgc
         8Qpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793106790; x=1793711590;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NLb4nDnDa6CheKrcmNiCI0BRgJPIlEmNmuOLfa1pfGM=;
        b=iVuD85MS98dsMnSEX/9IrS/oOnZckk2JU+Ea/7dTKLe9LjQ4cGfTqU044roBsXbPn4
         OHfhfl5VPxbg+TTeulDp4ctvrNUQQXbMJQBah3yaCcPHXGSQ8FKw8slnwGiuku119o5Y
         ekHzJIFKVRdbi2E9n5S4DcQ9vUSVrnl8QuRGve8+ijpdBGec6/CU9GnWNFzP2Zcnsvr3
         /zWT053e9Qlu+wxcxk6EWFwcV4G1vdVuk1Dyh7EL6K0q4sCrUXPzyTvutq5EpGrGuG4J
         n7pnEPwidVUg16PCJsIq5kDxUgpxmdmbN328BvYYT3sxRz2SX8HLtdd9G4LFKKR6G6k/
         wdRA==
X-Forwarded-Encrypted: i=1; AKwUvBwrX8dg886TVDYs3qMDyKeW8Kw/KBYG6mAVuRXQHE0aJZ5WN+kouP2m7Uk02vJ2CTTIx0Y9gX3eipw6WlU9D5o=@vger.kernel.org
X-Gm-Message-State: AFq9FYLNDfhgtS/FQcci2NuL4pxFVyIXHvVmGsJlV6EhQT9l7C8aDxnu
	tuOXsdrzjl5ftUeqOPFliA2nKBg14oRPGn/Q6xpu4t+V6cDWE/WO6cR3
X-Gm-Gg: AYBFou3CweBmv4Mi20+0l/j9jd4HGk5oGJGWuIlZ4TxsmONffPKv1DG58jONIaX3n3f
	wDc5G9g3QrzPY115UZ0KL9K7xM9wySW2Ed/V+BPEUq23TwGRmljTLtZ87e0l8a2UjriX5Y3WI4k
	mbFfnPzdg9ra0uX2df4xlWTK/M12hC3RHTQn0TFRx8GkK1M8gOYEdbp0Zj2bcbNr5DsMfT3aOEP
	nvN2dNmzJYFsclk6iACBN7GNvi7eeRlcHo1V5UHMqORTLzo7+wn4P58DOCVAk3A/ef6TscL8YmH
	pBZ/X5IwwOqhElDTEZ7Ap3sCcGGu1JBuiVIi5XzgnZftErGX/v2k81+8r4r96uEXJI0NxUoPex6
	ChB57dbJeSn04oV7iS/d8sAOhI87k0AH4fDH6o7P0nB7yG0LSIx/cqEqZhHVGx5tVTP/J1ALMvK
	Wb7ddKhB7+/u68VoJOo+IUCCEmL3edoOd9vlZgNYPjE0oSCu+LsF46UwoLd5NwZU/80e7ge9NwJ
	twxOgG8g1n6KY6qtX+/G4jYWeUJA4ngsnJsLcZv8fQkxseJYOC7oMxyD0yBuuwKflfNuJXScxwk
	mmD6MqNw3+lYwD71VA==
X-Received: by 2002:a05:693c:88c1:10b0:367:5e31:ce29 with SMTP id 5a478bee46e88-369e84fe37emr14011879eec.20.1793106789881;
        Tue, 27 Oct 2026 06:13:09 -0700 (PDT)
Received: from smtpclient.apple (v133-18-180-162.vir.kagoya.net. [133.18.180.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a002a486csm19339403eec.22.2026.10.27.06.13.04
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Oct 2026 06:13:09 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.12\))
Subject: Re: [PATCH net 2/2] Revert "net: advertise TCP MSS from the
 configured MTU, not the learned PMTU"
From: Esko Mobius <echoowall@gmail.com>
In-Reply-To: <CAL4Wiip=TkP2hmOFR-1Y-CU4rYHY_q=TBDhK6RmTj9UEMQ95Gw@mail.gmail.com>
Date: Tue, 27 Oct 2026 21:12:52 +0800
Cc: Jiayuan Chen <jiayuan.chen@linux.dev>,
 netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>,
 Simon Horman <horms@kernel.org>,
 David Ahern <dsahern@kernel.org>,
 Ido Schimmel <idosch@nvidia.com>,
 Shuah Khan <shuah@kernel.org>,
 Thorsten Leemhuis <regressions@leemhuis.info>,
 regressions@lists.linux.dev,
 linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <D438C59D-09D4-4008-9240-18DA0ABBDCEA@gmail.com>
References: <20261026-advmss-revert-v1-0-272fa4b7ecb6@gmail.com>
 <20261026-advmss-revert-v1-2-272fa4b7ecb6@gmail.com>
 <e25fd292-5391-41fc-a324-0ec260828415@linux.dev>
 <CAL4Wiip=TkP2hmOFR-1Y-CU4rYHY_q=TBDhK6RmTj9UEMQ95Gw@mail.gmail.com>
To: Eric Dumazet <edumazet@kernel.org>
X-Mailer: Apple Mail (2.3901.100.1.1.12)

On 10/27/26 1:45 PM, Jiayuan Chen wrote:
> This precondition does all the work. The server only learns the PMTU
> when it sends a full-size segment itself. [...]
>
> Please re-run the 6.12.107 case without seeding the PMTU.

You are right. Without seeding, 6.12.107 stalls the same way:

  kernel        PMTU seeded   SYN-ACK MSS   1 MB upload
  6.12.107      no            1460          stalls
  6.12.107      yes (ping)    1416          OK

My reproducer took a shortcut there. What it should have modelled is
our production setup, which is the masquerading relay you describe:
the clients share the relay's address, so ordinary downloads by other
clients keep the server's PMTU entry fresh. Modelling that directly,
with no artificial seeding (cliA downloads 1 MB, then cliB, behind a
firewall dropping frag-needed, uploads 1 MB through the same relay):

  kernel        SYN-ACK MSS to cliB   cliB upload
  6.12.107      1416                  OK
  6.12.111      1460                  stalls

So I agree it was never a designed mechanism, it is the side effect
Eric describes. We have since added MSS clamping on our relays.

If it helps, I can send a v2 that describes the masquerading case
instead of the seeded one in the changelog. And I am happy to test
the net-next follow-up on this setup.

Thanks,
Esko

