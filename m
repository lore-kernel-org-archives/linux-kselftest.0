Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42296522EF0
	for <linux-kselftest@vger.kernel.org>; Wed, 14 Oct 2026 14:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791986693; cv=none; b=Y/74CCad38S1nQSlNBFtPqwvHtiUfWbgXzAoQpJ8y8pKP+8Jn81q1b29+Pdlct69Lxf+ZfjuTfk3+bvIH4edrpXXNDqTXNlaV1RjkkUUByiLdgQXZn6UqrC152zWNqE09lw58sMYi8QrgxZmBiWeLVU1eridsvad1tHEhFmFm+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791986693; c=relaxed/simple;
	bh=4IeqOwaK2rrpKgev9njqDsFhx5MrGIsfZe95yekEfiQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dUanbmZq3hhYQ6oawoUeD8dIXIGayCSCPYrYogeDvmELhoZbp2lFkxMbi6X65D0Uxp+xsRzr3Etl1NRlc3vXvhE2D7dwM7/pFzVvM5K7LEmIbBgK5AjMeWSIjQHZ6yJIbvxPcf3TDu2s+gJhxGuaWNFbJbnjKUjhfwtaGyS5/uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X29gUViD; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X29gUViD"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c3156eb3e9dso45754266b.3
        for <linux-kselftest@vger.kernel.org>; Wed, 14 Oct 2026 07:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791986690; x=1792591490; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=py4RYEm0XcehXYKw0bZP2hy4hM7I93auwoYlpwG9CAc=;
        b=X29gUViDBn7wdG19oE+fqgU7scpwATQKElEOoiRT+AOiUNx9YSoSFch84I85xjtjWw
         wpd3ctg7+91f/d5TROMidQREk/YX7+j5uwjilqVgkYse9RR2NMr7M6w356R/rbQPXPOh
         vsflS0fUFBrlawhWaZBg2Tz/5c9lZHwPfqUPLVBZMsfxkGARGcZEkOIPggfkCofoHDKw
         X7ps3haYIL2V1z1yMrgXE+2bZT40ERwkPfIuHFEp6bdjAuDCKuvGEUIrm1nudNuj1wZg
         cEzLAJdwmsRmoz+QV4P/FEEMkJ2vsrZYuxS4zeaqc13e4uIF0DY+lJoIxkD9ctz1eh70
         y5AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791986690; x=1792591490;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=py4RYEm0XcehXYKw0bZP2hy4hM7I93auwoYlpwG9CAc=;
        b=W5dm+GgAZKNEpmYifLbAcuvz1375B+PGH8QirqFjS41f5Izw1nEmqOVnz9msutumJc
         t2EwP5oCxvFfG8dpf9YVNZ6Q1/w4bzUkNiQWwyUQtRnzuQuw92+Iut1a2evhVU8wWW2L
         X4wFBZCn/iYyrl2wI1sanrg4G+fJ0XlShPdUo0AOQzVdbIW/QYrU6RwVaOoRFp0SpyIv
         NKpizBnhELXdi/3TpUMJ1IDE9xZ0svq5ukMsYtoJg17dk7VSY9Q4cWbYckZWI99CHuIF
         EFUuEhOPMUFe5XrCNqcBNMBIOWJHpP9jEDjRtzC8JLZs2RTZJq/VYF9vTjK+QH1rrzLl
         u/Zg==
X-Forwarded-Encrypted: i=1; AKwUvBxxqXjFPtIVJXci5ShEhd11/8Ji7uu19PiK7qLyzQlp6efQY6FFVB9eMjC3h2kyj7sNTIV7PA0R5XgAtSiW9qg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIZl5SkXTQKs5qS7yj2nF27xrDZghurA2ZNxDfmuJI24vH9EWRO
	IoJEIIdgLUl8+HQL+sucJpyylu0OzMsQzyEREB7W7w+oUk+Sh/Gr5IWB
X-Gm-Gg: AYBFou3YLWVK6faaI621xVdYWMYW3u77EFv2PtWT22C+22dlo/BiA0xmXM026t69L57
	NIp0hOzahXLx6bxkM0Ht08Qni0uCV7H43mUW9jV3pBr+InASLBwet/Q2RP84jJrXwjNidjMahXI
	Wj6JjG7eCo2Gp7ec/kBYb46RQ9FEyB78i60VuguiYcbmKlrkiE6IGaN9TyXMU8pfkJF1MHNk0E6
	oDKFwObrsQZA5udpW5qigvUSOLZoMYkxKgqDdBh8B12yQC4r4tH4+neSJvsY7KQdDEdKmFljfFv
	2dLoAf2nuBNBKNCoQu9HiGMV6yN09STMzsnUTEno4BBeMpdXH6RzWU/+/iLJ2B+zwOr3syIzkzo
	q1W99rDDCTxtd3lKSmLpy0L9U5H7qgCWSxwn9nTdOeFfy3m9iBjdQSByxIQTzvKIn00n39r4j2G
	9fskACsfh/gf/KMt3oy370wP/1gk6Lh6cnMExVFBA2zWY/iu1/WDtKl14HSOPZ5LHjYVrQHtJQ4
	gOiGtD3A4+KyVlGTwZqII/IpxyCJuxsJAjjWM20PVQdPQQoE3VRqCkA6kq7FeSK0ofQyheodq2j
	3OyxDz/JiihtmKsnRJx5IthXhJzMj6TOjPtO1IV9F1d9XR82hKbm4CV94gy+FcuR5AYj+ujFuir
	OZiukJTWLMrO3RFkC4JKCvp944MUB32g=
X-Received: by 2002:a17:907:ea8f:b0:c2e:8801:9139 with SMTP id a640c23a62f3a-c31a9a065f7mr1436482366b.1.1791986690166;
        Wed, 14 Oct 2026 07:04:50 -0700 (PDT)
Received: from ?IPV6:2a02:3100:5ad1:60fc:7c7a:4c9b:4d41:afaf? (dynamic-2a02-3100-5ad1-60fc-7c7a-4c9b-4d41-afaf.310.pool.telefonica.de. [2a02:3100:5ad1:60fc:7c7a:4c9b:4d41:afaf])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9a3bbe2sm707482866b.27.2026.10.14.07.04.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 07:04:48 -0700 (PDT)
Message-ID: <ea399b99-3ce4-4180-b960-d3c8e3b2ed7b@gmail.com>
Date: Wed, 14 Oct 2026 16:04:46 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v7 1/4] net: hsr: keep GRO disabled on HSR/PRP ports
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, andrew+netdev@lunn.ch,
 shuah@kernel.org, kees@kernel.org, petr.wozniak@gmail.com,
 qingfang.deng@linux.dev, fmaurer@redhat.com, luka.gejak@linux.dev,
 xiaoliang.yang_1@nxp.com, skhawaja@google.com, liuhangbin@gmail.com,
 stable@vger.kernel.org, sdf.kernel@gmail.com
References: <20261009201324.17-1-xiexinet@gmail.com>
 <20261009201324.17-2-xiexinet@gmail.com>
 <20261014132001.BzOkgyrC@linutronix.de>
Content-Language: en-GB
From: Xin Xie <xiexinet@gmail.com>
Autocrypt: addr=xiexinet@gmail.com; keydata=
 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
 sNySbH3veZ/55EtlXA==
In-Reply-To: <20261014132001.BzOkgyrC@linutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

> This looks better than what I remember from the previous version. Are
> the bot's complains legitime?

Yes, the Critical one is real.

veth creates and deletes its NAPI instances based on wanted_features
(veth_gro_requested() in veth_open() and veth_close()). This patch only
clears NETIF_F_GRO from the active features. So after the attach,
wanted_features still says "GRO on" while the feature is off.

Two things can go wrong because of that:

- The member is up with GRO on, then gets attached. veth_set_features()
  deletes the NAPIs. Later the member is set down and veth_close()
  deletes them a second time. napi_disable() then waits forever.

- The member is down with GRO on, gets attached, is set up, and is then
  detached while still up. veth_open() created the NAPIs, and the
  detach creates them again. That ends in the BUG_ON() in napi_enable().

The v7 selftests always attach and detach the member while it is up, so
they did not see either case. I already replied to the bot with
"pw-bot: cr", but by mistake under the patch 4 report.

My plan for v8: keep the persistent filter, but at the same place also
clear GRO from the member's wanted_features. This is what
netdev_sync_lower_features() does for the UPPER_DISABLES bits. Then
requested and active GRO always agree, and veth does not need a change.
The downside: after the member is detached, GRO stays off, and the user
has to enable it again. LRO behaves the same way today.

If you or the other maintainers prefer that veth is fixed instead, so
that it looks at the active feature, I can do that.

The Low one is only a comment problem. For stacked members (bond,
macvlan, ...) GRO runs on the lower device, so "software GRO must be
off before frames can arrive" is only true for direct members. Patch 3
segments any GSO input anyway. I will fix the comment.

-- 
Xin
