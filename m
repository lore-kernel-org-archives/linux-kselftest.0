Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE98A3A544A
	for <linux-kselftest@vger.kernel.org>; Wed, 29 Apr 2026 09:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777453452; cv=none; b=iFtEnxF71EH7SBEPDDW963rFAXe3tTxrhZs15z83vObIb9ZZRhNJiojLH+MyCEY74dsEL2pCzhjAWdYrsSGooHVDJm94fosaypa06PkLtFFmjX1/qlR8dk9lIZMs25C//YKTBYplxXeoPv15AO3wdQvBbKgeVL3Nf9C1s5T05A4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777453452; c=relaxed/simple;
	bh=LJ5MyJOBQxjnHJBZCuWhdVRGlvLTXvOSKs7GWnM7aFo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SslX+e+CAVUgJnbdqovbd6qofz7u+Px84nfWlDp4pd2ChsPUQaWhawGBJCfOREV2GMy0go95hsxbQtFK93vpknTgNFEwyRNBb1j2NK1NL8kwd2vLHlJ2U4xS+WQQ1GZyXTbESRJfMQiADnLPjbE87XOHPngHrbv8BRLS7TSjPDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org; spf=none smtp.mailfrom=blackwall.org; dkim=pass (2048-bit key) header.d=blackwall.org header.i=@blackwall.org header.b=ilTfElJi; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=blackwall.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blackwall.org header.i=@blackwall.org header.b="ilTfElJi"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-48a563e4ef7so88400025e9.0
        for <linux-kselftest@vger.kernel.org>; Wed, 29 Apr 2026 02:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall.org; s=google; t=1777453448; x=1778058248; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EmuOh+kGeDXrP0yx3685UynvWNqrsYu6pdmhoYjK2d0=;
        b=ilTfElJiZmcFR+UvtFpCKcqi3PdXHVPyV0fva+3Sna0e9uYdr7hyN92Fgk0O+qxG3p
         CpXN2U5n/NczFzcKlXCRz2qBT4TeVMOcXR0CrQtQm/IN+r9KScd4ODZWvGoUrBBsqqrM
         p9bOQhYfNrYwQKf9i+XjVOkivL4nbqGp27DrBFLg2jyubBou3t4+d2/EkGtvuLZqPSMh
         4/choMJ3UQUC5A6htKXtSh+v4mIPc2yX+SHaa4BJJMGYs4YdNzkWj93x+4hjRHw/sVpV
         w0soxLJQpHcQn+tnp9tpok1Fr9sirYOo3Ut6smGcccEB01trqG9p2K5cIAGXmJVRMfch
         kwJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777453448; x=1778058248;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EmuOh+kGeDXrP0yx3685UynvWNqrsYu6pdmhoYjK2d0=;
        b=b/EQ04hc3ziVUVs5RjcccvJ3/YcylAm/eqyXGp/jCTnmKOdvfxGDZ9D4i2U/2+RshV
         8dzeHNRHHhGSpYUX4pxITWygG0ijMWylwkoIxeQxDHj0lOKlqMAzqX4IesJFWTjKRMMo
         S0pkXIzLeHF3UX+lkymLz+7Uz2NHpNwqyikLGvEATG+k1gZCDM6vDe/IeZ2j9+3z+Yka
         0o+zIKDzgu0EincI7s7MA1baOEvPaRFsqk9bx4JhituCHstuv2L3p7k+lvfdVrBwwIn6
         TS+D1r/FmcDVhuqrzX/8hnQYtw6yicODBBrSN9uRBUTfdV/g5lw+08x1d7TYEAw5OoH0
         emgg==
X-Forwarded-Encrypted: i=1; AFNElJ8IFvYZi6s0/TlAtseAsiNAw88m9wYDhK5qm1+x1NK4p4yLcrHJSxsyKmbzdmk6eJldoVKbA6E14N+aCQnzD7s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxh44OTHwECg9D3JugEL7IQh80LwvWGDnf/XZ4f3MGR5GGLXHvg
	vK5lL53fMjlrR8Ii2Pox6O82Q8GeQhs3CZFP4nZ0aH/DJEKrzYcsDIkbWEDU+DceR6I=
X-Gm-Gg: AeBDiet5QYNC7K1rWAZE4H/Zezp27iv7o6CVQ4jsMh/lOfOUXPYQNtmXdd9yjsVP7xo
	+HDh9/SF1LGauai39+v67wZ4ts7fugbv5ZedD5NMBpCNJOY7swwbTOEWGuv6Kb3vrrgPjKMHtoA
	oXHjSRq9MhzmMgdjvsQmuJj2g2pvowb+W1994+NPYexZ4vlu75EtwLzo51t37gjYiPrisD6BZLS
	sK9MGT3VsS3F3JZqnZuaL9prhp/FG3IAAuuLu3Z5YEzcVdwnOtMRXrodRUlITdcSuYvfmuPLhyf
	RC7AYMbPczltyiLSG9YnWog7JZMRoMEuIXquEW/Q5cl8iYUMcm1KgznzoiZNZBhKwq8NZSDVYFr
	5SgHRCJBa/TzX4+99Eh9U4I6dAhPoFu2VTaK8iv1rGqRkH/9vZDuH26WZxvssQHaaBqoUz86zKA
	eAfSjKMmaLp5Fq9c+iG9aGaQ5LsPHGP2EWc6UBhRGIW3+9FTnxhSjvZHZWyyvVBi3a
X-Received: by 2002:a05:600c:3505:b0:486:fb69:4960 with SMTP id 5b1f17b1804b1-48a77b12983mr102721605e9.19.1777453448112;
        Wed, 29 Apr 2026 02:04:08 -0700 (PDT)
Received: from [192.168.0.161] (78-154-15-182.ip.btc-net.bg. [78.154.15.182])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7c30f856sm13683255e9.21.2026.04.29.02.04.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 02:04:07 -0700 (PDT)
Message-ID: <f30f3eae-ef39-4b95-b39a-b68aaad608d2@blackwall.org>
Date: Wed, 29 Apr 2026 12:04:04 +0300
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 1/2] bridge: Do not suppress ARP probes and DAD
 NS unconditionally
Content-Language: en-US, bg
To: Danielle Ratson <danieller@nvidia.com>, netdev@vger.kernel.org
Cc: idosch@nvidia.com, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, shuah@kernel.org,
 bridge@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20260429062405.1386417-1-danieller@nvidia.com>
 <20260429062405.1386417-2-danieller@nvidia.com>
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <20260429062405.1386417-2-danieller@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29/04/2026 09:24, Danielle Ratson wrote:
> When neighbor suppression is enabled on a VXLAN port, the bridge is
> expected to reply to ARP/NS messages on behalf of remote hosts when both
> FDB and neighbor entries exist. This allows the bridge to suppress
> flooding of these messages to the VXLAN overlay.
> 
> According to RFC 9161 ("Operational Aspects of Proxy ARP/ND in Ethernet
> Virtual Private Networks"):
> "A PE SHOULD reply to broadcast/multicast address resolution messages,
> i.e., ARP Requests, ARP probes, NS messages, as well as DAD NS messages.
> An ARP probe is an ARP Request constructed with an all-zero sender IP
> address that may be used by hosts for IPv4 Address Conflict Detection as
> specified in [RFC5227]".
> 
> However, the current implementation unconditionally suppresses ARP probes
> and DAD Neighbor Solicitations, which breaks Duplicate Address Detection
> (DAD) over EVPN.
> 
> For DAD to work correctly over the VXLAN fabric:
> - When the bridge does not know the answer:
>    flood the probe/DAD packet to allow remote VTEPs to respond.
> - When the bridge knows the answer:
>    reply to indicate the address is in use.
> 
> Fix by adjusting the early suppression checks to exclude ARP probes and
> DAD NS from unconditional suppression.
> 
> When replying to a DAD NS, br_nd_send() is adjusted to set the NA
> destination to the all-nodes multicast address (ff02::1) and clear the
> Solicited flag, in accordance with RFC 4861 section 7.2.4.
> 
> Reviewed-by: Ido Schimmel <idosch@nvidia.com>
> Signed-off-by: Danielle Ratson <danieller@nvidia.com>
> ---
>   net/bridge/br_arp_nd_proxy.c | 16 +++++++++++-----
>   1 file changed, 11 insertions(+), 5 deletions(-)
> 

Acked-by: Nikolay Aleksandrov <razor@blackwall.org>

