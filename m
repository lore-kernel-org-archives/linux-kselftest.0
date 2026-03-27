Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E23E53DBD77
	for <linux-kselftest@vger.kernel.org>; Fri, 27 Mar 2026 11:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774610920; cv=none; b=sZqL4/Mj1TrfetrwanXCmvd5HMEZUU8Knku5PtsXlF2v3rxVSifB6fu0v/Ybno5gTZAgmwfjqy1zT/ZZe/8pBJPUBK1U751YL1Ktg0LukJwCIua9rDRnaKxRrxYPbl3GkPLOOFKurr027YCwU3nuF/R9qdghXH+9eXGbffbe5W0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774610920; c=relaxed/simple;
	bh=Ck111UDeVadOse75OIQ+igc8a37rMR7wmP8xvfAbPoc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kq7H34WwWJzkUY1TQd/t7eHV/rk8fwCX253oYgEoiiUvMbvDRd3WApcmTYMvt4bRaI2vzNGoEAlPO/sJ4JAv4oXSpn6Sq0xZZV73xIrqaZlIFd9smrbxGDgFHsGUadNXp6J3lgc213B41atD3iiVtPOAvgOIn5UmD8M+qRgZUJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AmJskaCV; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=X9kZ3okS; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AmJskaCV";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="X9kZ3okS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774610916;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aPoRKAikqi9O5TMw7pTEWsw013Li/e5d6u/ewbLWq1k=;
	b=AmJskaCVcoid7FYTIgvBOjnHWbQAT3rEdM0aV6pmF9SA7MfxdIwbQTvgg+9JdYb2lYXs4u
	+aovb8v3nPegidLRsAByvW8jzh27iPopHF/yG18LxQB7nyYozCv3TxPugLshi1yY5MKb5K
	5Zsbb28KDMHiUWcqhlGov7rWNylusQo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-133-2cqwo2N0PG2OLPh-qcZLzQ-1; Fri, 27 Mar 2026 07:28:35 -0400
X-MC-Unique: 2cqwo2N0PG2OLPh-qcZLzQ-1
X-Mimecast-MFC-AGG-ID: 2cqwo2N0PG2OLPh-qcZLzQ_1774610914
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-486fa35b005so23192855e9.2
        for <linux-kselftest@vger.kernel.org>; Fri, 27 Mar 2026 04:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774610914; x=1775215714; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aPoRKAikqi9O5TMw7pTEWsw013Li/e5d6u/ewbLWq1k=;
        b=X9kZ3okSmP+94AQpa0D4jb1sA8N+Qqv+88v2GM+zcIA5vE0T2tWWwyMwU5E5hOJQe2
         iNihua/ypd0iH9CD+SMf5Cg1V7jhddNRN0bLDTZivx3USC1biH8SFZL+H1xtpuFL96R8
         Atrf0pqVo9EnixIZzOJoyrZaKLvObOprv5M4wqW5jJAjFiqlpOjXM77urKmoxSU5BMDU
         HKZS0Ao0gDh5DUHUbq+sThstZhsYjeQWHxmdN6psi/Ogxqu4i4fs/qnq/gOdn9BeA4NL
         1LrqFOfVY0ETE9C/Lbt5oEHEvavIQToiTNfvWqS5N8UR4VNhB3rEY0mv6lQ5H+OLL0np
         9gYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774610914; x=1775215714;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aPoRKAikqi9O5TMw7pTEWsw013Li/e5d6u/ewbLWq1k=;
        b=eoCr619Sut8tMWbXpuo1KZC2HECdBmsI17MVYjreebvVfgV7iv+vIfgpfJmHXAeYt6
         3IKPYJa/jIcbg6t7o2AHNNh5H2KI+8kS4Qe0x3fYbuaCrTJT+YGXaO+7Z5zZJ2JTpXi2
         IcktnjXUCH8Ii3RWb8s4dRxxTudUtruxiLCBQl5N/Uw1lhhGSN1p6zpYkjm992sEJJdn
         dAHT1tLoSBU94XpQNIGb457GGcSZRaZK3ZCCAk3PqSw35Lfvn61wrZPAYhTiFAgpKNBn
         +FtN5nB5zdYC0ANka+xgAKwOU016uI/pk/d5fouNPNwFaH28ERCGlw3Yx9KVADtTehaC
         A4tg==
X-Forwarded-Encrypted: i=1; AJvYcCXkqr4DicbSD33KkvndzX/GtDlPc7dOd0Ypva+43c2iPFjQnjBS1kwXVnUjPqjsuVHIbgh6fXKXjv/JuWRK40s=@vger.kernel.org
X-Gm-Message-State: AOJu0YwbYCGHQGpPwzCZedadlJOL8PqfvO6JhN0GZANL29nwtEDyUH6M
	Hbc4V4N60xHdnZ8hbvwCtKT06EfHJyPG54yvFWkWOWfqNDAtZJj2QUUjBQ2pgYa/MQ1DiVfXn7z
	HUEKQjtcYqLeh7qLVTLBFSDmE/LZ05u5P0mWt8v3lwRJDW26OxAYyr/k4s0aydS/gm+b0aQ==
X-Gm-Gg: ATEYQzzzBYoIgVGARh0A0IzjjiwoMIIjbRbUyo8Cozfyb8QAsxxl6neCslJba6MhYRN
	NkLLymwUoaZLuwJfSGwz639ZFuToNIGabME1gkqkKLdg/RA83Ipl21C+7eltbvSw1An+JqR+AaO
	uVVnen3GReWAVhwxYXjfRS+rjpOAhqpCu6ibntWwmhpwP1M6bnqYYBeE3XGjo8ZsXfJHaXH4XUa
	yBalxezSHi4zf8L4G2CMC8r8yEvwk1DJ81fB3oocEmSvbrScAmKVe6tj5hfMNJ1zEJF5i5oFiye
	xvWcB62b0pSgqArmdZ7aQAmoXy5RiBWwVvYN2pN8FXx77GWQLJJIvNtJcH6X/CTjodHCuYypebC
	+1Gqqm5MbQSOAsLs7fQVtbfwAB8UedOjzBcJwo8A35OToll/x5F7uNIfxDLBe9xD4VBdWOOnCgQ
	==
X-Received: by 2002:a05:600c:6094:b0:486:fd71:e609 with SMTP id 5b1f17b1804b1-48727f1fc05mr31217315e9.25.1774610914024;
        Fri, 27 Mar 2026 04:28:34 -0700 (PDT)
X-Received: by 2002:a05:600c:6094:b0:486:fd71:e609 with SMTP id 5b1f17b1804b1-48727f1fc05mr31216875e9.25.1774610913538;
        Fri, 27 Mar 2026 04:28:33 -0700 (PDT)
Received: from debian (2a01cb05923c9a002e69015071700bd3.ipv6.abo.wanadoo.fr. [2a01:cb05:923c:9a00:2e69:150:7170:bd3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722be47a4sm134780515e9.0.2026.03.27.04.28.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 04:28:32 -0700 (PDT)
Date: Fri, 27 Mar 2026 12:28:30 +0100
From: Guillaume Nault <gnault@redhat.com>
To: Qingfang Deng <dqfext@gmail.com>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Shuah Khan <shuah@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Felix Maurer <fmaurer@redhat.com>,
	Antonio Quartulli <antonio@openvpn.net>,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-ppp@vger.kernel.org, netdev@vger.kernel.org,
	Paul Mackerras <paulus@ozlabs.org>
Subject: Re: [PATCH net-next v4] selftests: net: add tests for PPP
Message-ID: <acZp3gRUqVIbw9yb@debian>
References: <20260326021642.29170-1-dqfext@gmail.com>
 <20260326081304.xKa7-s_1@linutronix.de>
 <CALW65jYdzn_rZWa2zwYd5J+Gd=kyaGMsVFyX0fMJfKfgULMO6w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALW65jYdzn_rZWa2zwYd5J+Gd=kyaGMsVFyX0fMJfKfgULMO6w@mail.gmail.com>

On Thu, Mar 26, 2026 at 04:26:23PM +0800, Qingfang Deng wrote:
> Hi Sebastian,
> 
> On Thu, Mar 26, 2026 at 4:13 PM Sebastian Andrzej Siewior
> <bigeasy@linutronix.de> wrote:
> >
> > On 2026-03-26 10:16:24 [+0800], Qingfang Deng wrote:
> > > Add ping and iperf3 tests for ppp_async.c and pppoe.c.
> >
> > Oh thank you for doing this.
> > I haven't look in detail but this cover the "invalid loop" cases that
> > ppp tries to catch?
> 
> By "invalid loop", do you mean transmit recursion?
> https://lore.kernel.org/all/20250715150806.700536-2-bigeasy@linutronix.de/
> 
> AFAIK, this can only happen with PPTP or L2TP, which were not included
> in this patch.

The problem was originally reproduced using L2TP, indeed. But I guess
that it could also be reproduced with PPPoE by using a UDP tunnel
device like VXLAN (like sending a packet through a PPP interface,
handled by PPPoE, running on top of a VXLAN device, that routes the UDP
encapsulated packet back to the original PPP interface).

> Add Cc: Guillaume Nault
> 
> 
> Regards,
> Qingfang
> 

