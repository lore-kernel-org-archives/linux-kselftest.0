Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0232C3033E1
	for <linux-kselftest@vger.kernel.org>; Mon,  4 May 2026 07:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777880478; cv=none; b=lS19xJDJ+Nn2PFyXt0AgYfTdvrF8k4RlXgbvmWKJ/CullgW5LZad1XZsG//SgZPkZ4A7Q15ANZ7Z60PjeC3pUbat3HLR/ajaMp4nUw+iZDjmufVrgPfGQa0rvi49hF1iklMWOq0UHmK9dxt4d3+avjbfDg+63S/ZmiC0hojax10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777880478; c=relaxed/simple;
	bh=2rpPDoGUMbl/OmiwIJkP4efIs256LD8njZZi9FevGN4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BCM7De+CMMIYiEIG0qjBzmT9M1hcmTVtohlBBWb5AkDI5nc7vkK4dCIp7023ZFw4sYtHvs2UnG3zKj5cOgQYPSv6Yz4JBN9yxKkTOY80UMtmtbrUcFLZyP4sPjwk6OARSw6xqVzyv6agAyjvO+dm6m3bS7/fhRojHQhSgnQPTdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org; spf=none smtp.mailfrom=blackwall.org; dkim=pass (2048-bit key) header.d=blackwall.org header.i=@blackwall.org header.b=OgDUOEl/; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=blackwall.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blackwall.org header.i=@blackwall.org header.b="OgDUOEl/"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-48984d29fe3so55624855e9.0
        for <linux-kselftest@vger.kernel.org>; Mon, 04 May 2026 00:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall.org; s=google; t=1777880474; x=1778485274; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZhDFU6GxZcW7vndx5L08YOJX1khbTM/b3o1EeqP1uk0=;
        b=OgDUOEl/SnI6akw+4wx97LxnZxmG7Jez9kRErHykE2jOv5HJubkHsd4Yahl2eSYVJd
         Qy2+ys6mBmufS0FIIxL0zF3vQWUeSCXfb6g7+3Ay03SCt9qVz/QD0bFt6HYuN6z/daBR
         JzghkMUi10fkaQGhIg9QvssIrzMw6rVMQPUbVskl4u8ue+5N3exYL1RQFQgmwtwv71Gc
         sIh9mWDCX23BSSp5BjAytO+IgeraYmZmpp6bsCFbGavTO/YIcJxPdM52g+f8MQ28E/Q1
         QPPmCg7ADVSNEyaoI42O3nz8NjkqiJDGcw8x46TB6KVEjam3mbRFGMxHxLxy+WKxofug
         ZYVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777880474; x=1778485274;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZhDFU6GxZcW7vndx5L08YOJX1khbTM/b3o1EeqP1uk0=;
        b=A72Q/OzTz+TE1OSt0nrQv6hSeaBnAvYl2k2i6OcGSsHaBtYGqrM7oLTfFV6rlyeMc4
         Zm2oaJWODmj2WDhoUsqYvgWSQxuxcXHo3bceIXzaq3O+R7KTL8VYcjMe5nDH4Kt1XFHT
         Kucek12vOIo8CZELza0lbjTV3SyfBwf3JOlvDbyefCAXlM0apdx80eVHB8UDGK0xY7Yb
         btaSarB0wdms+JYq4TqzMFrxtaCxbierPZjbEQcMD6Nx4d717s7R0PPSoPPDLYJli+gh
         74BSsiT/GfwtlHa7UIhX+pqrfVoJ41TkdbHopq6nOxK8LonmEMnWAS4Srd4cmJJAyf2L
         JfvA==
X-Forwarded-Encrypted: i=1; AFNElJ9BzrIoZOLnDhDAmxt+rPQ2I5D0pF0JC2xyAZS3RJ4uaJ+XiXAea6cSWJ7ltsLlR8sJZz+V2E+PJFeuOrenaT0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbmbVBicOG7nClUSyc2a9vRMI0dB2kRQBBJYETw1TDwfh2+iDV
	fc7V2wbTZVwUmRsY5HQS2QBnsR7YO57N+VyJGtBIDQNzE/bWtIygevO+4OCr5m/HBQk=
X-Gm-Gg: AeBDietIRIjmsELrqum/Zk/JxjfuSgiD/DWeNRS2tP9Lbo1fx+0JtYhQ9isH7pzlI6y
	uzgWxG7K3wXFnweXBu1MKcpby6hXhtYFep7wlcBE8HGTQV3A9LTB37NPDm/oq8bHtVqXqsCp3Io
	GYWurPBA+jWKlwG2CLb7VsPst5QxVX7teAMy5zl3KFDNLWlwRC4pO3eURK5qKTSSxEmpcHBkXEl
	OByr6yT9au14lr4cph2T8R5ayxYp8/6WOfR1sDeanYUXBNGVhixTTtKVS79Y6TlRqxux9FH1KgC
	seGPwVVulJM7T5iW7Z7Mxh7xherC12Lh5B94vQU+lEvnW38ICIjKRIOnI9ZTGJ330RKRt4kLZuZ
	9qpUiTpsbVHFoUdFVICDWjeRabG6O5hLLZJUIjRtPm8umF4c2ULRw0ZZmS4A7B3+d6g4lASYlLY
	BpOAu6FeMdKm0dkyzEKUIC8Fp3SfDECpgRYE2E3LZe9EWIVUfychdsDxMIJt9xqY4B
X-Received: by 2002:a05:600c:1f11:b0:48a:f18:ece4 with SMTP id 5b1f17b1804b1-48a9866e803mr139507745e9.24.1777880473443;
        Mon, 04 May 2026 00:41:13 -0700 (PDT)
Received: from [192.168.0.161] (78-154-15-182.ip.btc-net.bg. [78.154.15.182])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8fee4da6sm74095385e9.18.2026.05.04.00.41.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 00:41:12 -0700 (PDT)
Message-ID: <6803e955-7512-44e4-a0d1-8ad4d62e31e9@blackwall.org>
Date: Mon, 4 May 2026 10:41:10 +0300
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 1/6] bridge: uapi: Add neigh_forward_grat netlink
 attributes
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
 <20260503073532.2138165-2-danieller@nvidia.com>
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <20260503073532.2138165-2-danieller@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/05/2026 10:35, Danielle Ratson wrote:
> Add netlink attributes for controlling gratuitous ARP and unsolicited NA
> forwarding when neighbor suppression is enabled.
> 
> Add IFLA_BRPORT_NEIGH_FORWARD_GRAT for port-level control and
> BRIDGE_VLANDB_ENTRY_NEIGH_FORWARD_GRAT for per-VLAN control.
> 
> The new attributes provide independent control of gratuitous ARP and
> unsolicited NA packets. Operators can enable forwarding for those packets
> for fast mobility across VTEPs while keeping general neighbor suppression
> active.
> 
> Signed-off-by: Danielle Ratson <danieller@nvidia.com>
> Reviewed-by: Ido Schimmel <idosch@nvidia.com>
> Reviewed-by: Petr Machata <petrm@nvidia.com>
> ---
>   Documentation/netlink/specs/rt-link.yaml |  3 +++
>   include/uapi/linux/if_bridge.h           |  1 +
>   include/uapi/linux/if_link.h             | 17 +++++++++++++++++
>   net/core/rtnetlink.c                     |  2 +-
>   4 files changed, 22 insertions(+), 1 deletion(-)
> 

Acked-by: Nikolay Aleksandrov <razor@blackwall.org>

