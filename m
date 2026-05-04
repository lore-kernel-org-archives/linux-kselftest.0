Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 107C930595C
	for <linux-kselftest@vger.kernel.org>; Mon,  4 May 2026 07:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777880522; cv=none; b=H7gkYczhBRIKKhohbR+v7aWq3nlWpGQ0A2SKVS3HFKs1iYchzu+McEia5cFZQO9Zx2KFlrbznM1MU2AwULoLoB6C8Ef25aJ6ZieiMcCJhPlxCDJb/3jB7tyAYldzTG1DFhgvsTQh6Mg7aetJHEuiiZB2OsLiGKZ32nGkjoJEw3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777880522; c=relaxed/simple;
	bh=wppOGaRjuNDplImhUtX3yedW8XVD+Rjnv4702GUsXr0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SZyXlKpZ4epAk2UqVWcqF4PPjFuiOyxyDIZyuvrLxbObGiBSSIyR3IWTBfxvmMayj0lNDjAneJt1Ze+iC+fOFluIL2KtPADIXhYNZP3m/lWf6lrLKqP44zD5mLBqZO4/ry7IxH54ztbIQNyzOOiDNeKIb4QypL3+1L/l+VxUlLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org; spf=none smtp.mailfrom=blackwall.org; dkim=pass (2048-bit key) header.d=blackwall.org header.i=@blackwall.org header.b=n3dL+a0A; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=blackwall.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blackwall.org header.i=@blackwall.org header.b="n3dL+a0A"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4891b0786beso25657085e9.1
        for <linux-kselftest@vger.kernel.org>; Mon, 04 May 2026 00:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall.org; s=google; t=1777880519; x=1778485319; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C3RAkK6cIEAorEjiat0wspxnHljFQkJZ30oFU41kBVI=;
        b=n3dL+a0AITT7wMJ+2WG2k2aw+20TwJLDw30kWbJF7NXj7OpKpMV4otW1caMBiIs5zv
         C+TWVXvoZwedO34GZrE6m0bskRY7XbUKTsgWbDkNxa/Qn8kAteEmenwHBbNAl42CZb8b
         kefAaI8RnJHocsQQTPrMY70OsTM8F4ClUFYp/HYl2SD0c8QUbYSIvfPe0P+413s93caH
         vFnLnJG/sgH4EroecFQ6VI3ZmNp+UcXSoFX1W5GH37vYqiTQTfBka7Ep1WSVVC4uFgtE
         6DUd4s12zZe3WBsnnD4zvZmBdh2r0wSongMF+FqopFaaohKl34ZHrRpjwPjIOOZMWvUn
         FiMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777880519; x=1778485319;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C3RAkK6cIEAorEjiat0wspxnHljFQkJZ30oFU41kBVI=;
        b=qWP+fcsqnDr65Guxu4g8ZzmXv4VZppfGhXmWj/nsc0BMshgBONdV8gCGPA0OLpUD1y
         sVCKjaWFdbWY6PFTNzzHiraUQz13QjLQWeN3gXGSyGvZHc2hMcNRcMEyED7dLMR3N6kU
         tulMbEXzjFXsqFjYLuWMtAX1gVTRO6m12CUS/2HvZnfimw7Mxphsa6bG0+ZetHaGzT3s
         xzoDADImDGXkedWKyGtGqO85woo8hlei2iMsqNKinBRvffEC2ttPlfmbIgrjSmHSIU72
         PCRytVw9Dq/qp4cdnQdEz6uBVTvJyqqvbGyAYPSTOR/xpNn5AKXZ1BVel6l21JtoNG9N
         jRow==
X-Forwarded-Encrypted: i=1; AFNElJ/qE7g0a/XP7pHlPHMn1HkKKtuEKcUjbGHEreiABgYUct3+z/UKA6sDPnrxCHCuBe+8ubDjM2M8jcDWiYwJvcQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzvIRbTc9/d9qqizStajCIHW4ued179ISUtdAisS3+4ZyNgC8vL
	H5Eu8Cr4Hz6v42UEkbAFfKEDw5I04uNceBHEcQGVvgH3P7ibI8Mgn2Z1cLWyJgtP0dQ=
X-Gm-Gg: AeBDiethQW9/u/GYckcnt/gRKdrJnx8V3wtLC6O/YqU3lHRVzGuwqCxbT1pPt4fDenL
	kYRlb/ZSboF24i7CVEA3e5rOaZcixCi4euvwSvyRF3RL/ONpRiIyfKFr6tzP6N1eyNKN7sJuGEH
	YF7cI1cN3OMbkQC1/XsjnGhU/XB5N240j3ZUx27WKuLX1hpBHr8rUbSl/AFaUTjHpGFZZbjvwZv
	JnTpgapU9YBv4aOduiKLC3AFz8lLNGrK1gmpr6Pil15cwi9CV/fYUGjPu0yUYSY9rw9U8kCIPGX
	c5+C3+RnhmUBwgPRPryPSdA3nLN0riwWakDO1Zi9Au9yxysRaQ4uSO+wQhsl6o9nkXGTN1Cgxl4
	+t5QFSY7mdyzrhcI5nf/QcfBQSwWatpQhV/RLTBVH6+PIwEP4Vew9GGQIMpBwxq9YLDHokZIrnG
	7YMdYY8m534EnoHO3ZxF8naL/AXUyarsGAPo5lQbYJURID3utav4HCCmjyCGGWNyi0
X-Received: by 2002:a05:600c:1386:b0:488:9439:881a with SMTP id 5b1f17b1804b1-48a9852f471mr135743855e9.2.1777880519512;
        Mon, 04 May 2026 00:41:59 -0700 (PDT)
Received: from [192.168.0.161] (78-154-15-182.ip.btc-net.bg. [78.154.15.182])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8fef8f39sm73312865e9.32.2026.05.04.00.41.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 00:41:58 -0700 (PDT)
Message-ID: <4e172860-1f37-4de9-8520-dcf3d53d5ad7@blackwall.org>
Date: Mon, 4 May 2026 10:41:57 +0300
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 3/6] bridge: Add selective forwarding of
 gratuitous neighbor announcements
Content-Language: en-US, bg
To: Danielle Ratson <danieller@nvidia.com>, netdev@vger.kernel.org
Cc: donald.hunter@gmail.com, kuba@kernel.org, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com, horms@kernel.org, idosch@nvidia.com,
 andrew+netdev@lunn.ch, shuah@kernel.org, ast@fiberby.net,
 liuhangbin@gmail.com, daniel@iogearbox.net, aroulin@nvidia.com,
 fmaurer@redhat.com, sdf.kernel@gmail.com, sd@queasysnail.net,
 kees@kernel.org, nickgarlis@gmail.com, amorenoz@redhat.com,
 alasdair@mcwilliam.dev, johannes.wiesboeck@aisec.fraunhofer.de,
 petrm@nvidia.com, linux-kernel@vger.kernel.org, bridge@lists.linux.dev,
 linux-kselftest@vger.kernel.org
References: <20260503073532.2138165-1-danieller@nvidia.com>
 <20260503073532.2138165-4-danieller@nvidia.com>
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <20260503073532.2138165-4-danieller@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/05/2026 10:35, Danielle Ratson wrote:
> The existing neighbor suppression unconditionally suppresses gratuitous
> ARPs and unsolicited Neighbor Advertisements, which prevents fast
> mobility of hosts between VTEPs.
> 
> Add the neigh_forward_grat option to allow selective control of gratuitous
> neighbor announcements. When neigh_suppress is enabled but
> neigh_forward_grat is disabled (default), gratuitous announcements are
> suppressed. When neigh_forward_grat is enabled, gratuitous announcements
> are forwarded while regular neighbor discovery remains suppressed.
> 
> The implementation provides per-output-port control by:
> 1. Adding a 'grat_arp' flag to BR_INPUT_SKB_CB to mark gratuitous ARPs and
>     unsolicited NAs.
> 2. Setting both grat_arp and proxyarp_replied flags in
>     br_do_proxy_suppress_arp() and br_do_suppress_nd() when gratuitous
>     packets are detected.
> 3. Checking neigh_forward_grat per output port during flooding:
>     - For gratuitous ARPs/NAs: suppress unless the output port has
>       neigh_forward_grat enabled.
>     - For regular ARPs/NDs: maintain existing behavior.
> 
> This allows gratuitous announcements from any input port to be selectively
> forwarded based on each output port's individual neigh_forward_grat
> setting, enabling gratuitous neighbor announcements to be flooded to the
> VXLAN fabric.
> 
> Regular neighbor discovery (ARP requests, NS queries, solicited replies)
> remains controlled by neigh_suppress and is unaffected.
> 
> Signed-off-by: Danielle Ratson <danieller@nvidia.com>
> Reviewed-by: Ido Schimmel <idosch@nvidia.com>
> Reviewed-by: Petr Machata <petrm@nvidia.com>
> ---
>   net/bridge/br_arp_nd_proxy.c | 22 ++++++++++++++++++++++
>   net/bridge/br_forward.c      | 15 +++++++++++----
>   net/bridge/br_private.h      |  2 ++
>   3 files changed, 35 insertions(+), 4 deletions(-)
> 

Acked-by: Nikolay Aleksandrov <razor@blackwall.org>

