Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2DB8368291
	for <linux-kselftest@vger.kernel.org>; Wed, 14 Oct 2026 14:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791989340; cv=none; b=T5YuFpTUI1pPzrx4nKxvpMZj3Qe8S0praQyk1egFHpXCwmNS26T4FSfg/Wm20svHj6ylXioOtjKz4AhzsiSYbYOR0GS6I2sGOgC6zdKr+zDltNjokKHRgAaoa6ELGh18DGJR9ux8iqwcdSPH6PVVFZD+w+bPabLW4jMTjapR5vU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791989340; c=relaxed/simple;
	bh=j9+aZgHEnds3ISh/9ClPqudGNuxATzy9WD9d0bNw14o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Aa+f4Aa26kcWkSP4AoqzR6hEPej4mOXWYuxucHaZ3n8I3ZEP4zuVP29WHlXB0lr+6HxpX+GwFbnkK+Bqi2M15RuO+tt8v+Oxvjspl8XvGE+nO5dFk0txzFo/dvNz7RU1Gjk9kPwXU4MK4+cPI5Wj16C8rJkA52lL9LLyxvg7VdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TahbXIvA; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TahbXIvA"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a17ce1dc00so8994735e9.1
        for <linux-kselftest@vger.kernel.org>; Wed, 14 Oct 2026 07:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791989337; x=1792594137; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KIXMvV4RGxrQI2o+3q8hLAdGHWQv5V0aUAuVvLhThJE=;
        b=TahbXIvAjZFCxZR/gFYJ9jaFOc1J9ViibFe2uye0wcYfEiz8nkbwwCuC0yU5Et8sJO
         EmYev/bi1Jpm+hTWaxpf6mg2vx3UVmrPF5cY6haNFMLAcRxPhcbaHxqZsbXWi0ioImK6
         JwiJRbD3YRR5mISEK6k8kadBlSuhk92GxeAIaUBwMR3z1+rwi739tsql19jQs3apLD4s
         b0GckAYdO0LcUcWM+BpvXrAbb+3sddyl4vctKA5ELOd9rsbmhGza4pKjM9y8des4XYMZ
         e8GXhE3DQrkCsbVzvNreSZeqg+/hU+Wg+OIRBb04lb4HW3eKhQvP1TLZnVGkJKqvaGfb
         Ji3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791989337; x=1792594137;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KIXMvV4RGxrQI2o+3q8hLAdGHWQv5V0aUAuVvLhThJE=;
        b=ciotuOHOdpWsTXLep7ZaC7T66brphi3gD30i1ThUAa5AMtA8GbjWSd8/69DPrNRNEz
         fiiE1MRwOX0bCGNO7/AvkvPsHEvIUE8qqHEdWgDhnvMDnvosFBwa71P4UrGFGvG330im
         f0+hS7Fgmn1g6G9/0vif1gD37UQrYz1jOZdEo1+3ancpGRSaCsq+XMyWsDJLjzFUrQMd
         +pVX2LmsRTYgMJa9d0GYDy/f8cGCBCNq1rOkpvFhtJ/291kgs51/F377XL+oQwy/HKR9
         6yH/SLvDBCFnf4hAkOBPKTyd1SGftd6N1UiS/ad/1vpKSXWek/ol56xNnoryPnkMSI9M
         hSCg==
X-Forwarded-Encrypted: i=1; AKwUvBxvdzvsM0B6o167Ae61wyyDRTjGIVxPT2+mu8O5AXD7nY9gwkeJIb5DK8V9FjN41gfVn6H5YWtsjk7+MU4N1yc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLrOgEG6dXdNOGnJwcvJb80TlNeh3xRHxkvcWCTrpnCQq+xUCWU
	RWND6TeDxF8L6Wt6ekhLumnA0mUaiTlIPvXQ9XKV7LmnhKvFNoCXOHfZ
X-Gm-Gg: AYBFou01DHb/JGgceb901EYaD04JSA8Piv2aBCWOrfVMW1uEa+szlxhmMIOR0OKic4L
	KCHMu0KSRIFRVBHn1IC9gCEZwCyajPHfPxbN4cZfhTIcO9qYZrLvvOQw3+t3VNLBG7EVPcf4oO/
	eaR/6roFbcSUcOpWSDI8y4wdWN8u8SFwcp1Hu032EXDuxCcdWJ2k/+hVgS/54Bs70LpWSYRUFPU
	BU7Va/x+FdwKfxQQDlY3/X46nr9RK03zVBzZtxjE/sinh7VtsnHIvCutske9TO66N/K1aQ7jpLj
	5GB738cRiCNVaRQJd34sAoyHFlIi4KSKU8WswM00ZwutDgomcBUkeU/zww3PdddtdmoXsPThyot
	O9tS6j/Fz9kvISM24+NstV7LiBJB9USl7XeT9CsQ0x3ecTNkLvX5OjyEckagiHae4X+TUDZp11E
	ynISoSWXGuXTw1uYC/o0Uxgw8lxKBu/KH2puHXXrxufg34ipMX0QDTwBV6P77wor2cEbt2hQDV0
	d3GO/5ulr+0qPGWlQqFVGrLd3nKWXPVBOsdlocrgwpWhHjxxgNGTxIAnltnIjjcX/8sONSHTAm3
	zdcx/UVT8yEZuwfvRzzjBS579pgLxepq6eK4HgRoRujbfGrGSQsx+FrT9oZoKaxX7rMsGDPXoci
	43rhKjPUg68b1uDNpJsQe
X-Received: by 2002:a05:600c:6285:b0:4a1:715d:1913 with SMTP id 5b1f17b1804b1-4a18e4760demr324543655e9.1.1791989336820;
        Wed, 14 Oct 2026 07:48:56 -0700 (PDT)
Received: from ?IPV6:2a02:3100:5ad1:60fc:7c7a:4c9b:4d41:afaf? (dynamic-2a02-3100-5ad1-60fc-7c7a-4c9b-4d41-afaf.310.pool.telefonica.de. [2a02:3100:5ad1:60fc:7c7a:4c9b:4d41:afaf])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd068126sm4449255e9.11.2026.10.14.07.48.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 07:48:56 -0700 (PDT)
Message-ID: <003d3e2a-3568-44f6-a9cc-3202de60da58@gmail.com>
Date: Wed, 14 Oct 2026 16:48:55 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v7 2/4] net: hsr: preserve submission order without a
 forwarding lock
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, liuhangbin@gmail.com,
 Simon Horman <horms@kernel.org>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, andrew+netdev@lunn.ch, shuah@kernel.org,
 kees@kernel.org, petr.wozniak@gmail.com, qingfang.deng@linux.dev,
 fmaurer@redhat.com, luka.gejak@linux.dev, xiaoliang.yang_1@nxp.com,
 skhawaja@google.com, stable@vger.kernel.org, sdf.kernel@gmail.com,
 syzbot+fbf74291c3b7e753b481@syzkaller.appspotmail.com
References: <20261009201324.17-1-xiexinet@gmail.com>
 <20261009201324.17-3-xiexinet@gmail.com>
 <20261014134718.YGcKmfB9@linutronix.de>
Content-Language: en-GB
From: Xin Xie <xiexinet@gmail.com>
Autocrypt: addr=xiexinet@gmail.com; keydata=
 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
 sNySbH3veZ/55EtlXA==
In-Reply-To: <20261014134718.YGcKmfB9@linutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

> What are stacked HSR devices? Looking from the setup in the referenced
> report this is a bridge device attached to a HSR ring.
> An announce frame is sent and this goes to hsr_dev_xmit(). This does not
> look like a normal setup. Is this something you use or is this something
> the bot came up with?
It is the setup from the syzbot report, not something we use. In that
report the slave port of one HSR device is a bridge, and one bridge
port is a second HSR device. The announce frame of the first device
holds its seqnr_lock, goes through the bridge, and ends in
hsr_dev_xmit() of the second device, which takes its own seqnr_lock.
Lockdep sees the same lock class twice and reports it. With two
devices this is not a real deadlock. It only becomes one when the
transmit path comes back to the same device.

> This looks very complex and I am not a big fan of it. I would prefer to
> break lock chain early assuming the setup is valid/ sane (see above).
I understand. The queue exists only for the ordering you pointed out
in v6: frame N must reach every lower device before frame N+1 gets its
number, otherwise a receiver without the bitmap discard (aae9d6b616b5)
drops N as stale. In our test an unpatched HSRv0 peer received 19128
of 20000 frames with the narrowed lock, and all 20000 with the queue.

> The ID by itself can be assigned with an atomic_inc() but then you don't
> have the transmit ordering. So you introduce the workqueue for the
> ordering which is ugh. I'm not sure how this works if you get
> submissions from two CPUs given the lock is gone and the workqueue is
> per-CPU.
The FIFO and the owner flag are protected by fwd_lock. Only one
context owns the consumer at a time: either the CPU that found it idle
and processes its own frame, or the single work item of this HSR
device. A frame submitted from another CPU meanwhile is appended to
the FIFO and processed after the current frame, in that order. The
work item is one work_struct per device, so the per-CPU workqueue
cannot run it twice at the same time. But I agree it is a lot of code
for this, and it also serializes all forwarding of one device, like the
lock does today.

So for v8 I see two simple options:
(a) Keep seqnr_lock across the submission like today and only break
    the re-entry: a frame that enters HSR transmit while this CPU is
    already inside HSR forwarding is dropped and counted. Ordering is
    kept, but all forwarding of one device stays serialized.
(b) Narrow the lock to the counter update, as in v6 and in Hangbin's
    patch [1]. Several CPUs can forward in parallel. A receiver without
    the bitmap discard can drop a reordered frame, so the patch would
    carry "Cc: <stable@vger.kernel.org> # aae9d6b616b5: ..." as Simon
    suggested there, and the TX statistics move to per-CPU counters.

I would prefer (b) because of the parallel forwarding, if the old
receiver limitation is acceptable to you. Otherwise (a). 

Hangbin, Simon, your view is welcome too.

Patch 3 works with both: it segments before the lock, and each
segment is numbered and submitted under the lock.

[1] https://lore.kernel.org/netdev/20260805-hsr_deadlock-v1-1-d8a6f06fc5a8@kylinos.cn/

-- 
Xin
