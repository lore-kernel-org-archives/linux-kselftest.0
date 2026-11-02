Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793647610;
	b=xGoMFZpKxNFvavyFSOdpZ+DbY3//rg9WGJG2CHmyCW3J8PMo0UPmk6+Da6E003YYsQ9Y
	 jGXhb7AWq881SFkoZr1/vXZyhrqoiKkHzu3MiDfLcDFGBv8GTr6HlJmqvF9JBDkrC130s
	 40T0ziGE6QxLy0cUhHq0oGgSbO7/cYkVcEIjAHRiIURzR43MP74WbHdFSNDVCXa447yQQ
	 fzQWeOkxIlCit7v7U4agKLcIcqWuF3Cj81VWyGbmOETWLLHLUJhGxVyvPXQ4PdNBYI4js
	 JTzeth66qj7fmbGGwbbeAsz3mMQI9XC3RnbM6OniEvUureIe44DKvBqKx/wMvJjTFeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793647610;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=GGgFPYYG6oWLUvP1KotHDJ9Xw83iP8ii3ww9kM3hKP0=;
	b=169wSZ2zwUlHkHi6s0fLxHv7E8EbgBgH/BcatLpYwXX2bgahfwGAF9KGeQ29XS2/VKXC
	 ILC9ThNOgaZJgDC8d9FRrQvccQaDGwcxR5fvVkUg5GxrZuJgM6W6lb/OcWPg6URkU+maa
	 Or06ntX+CJyp8M0AkSqRn7S06UNLCxtqRS2DZAr24hR7uw7IaJNYfVWZB/TYs+cLpLh21
	 0bDvVNZm7AXOw4sXy+qo43DKHH/UV6J2+DXW3ydgmSBwpfHgWi2hT7Onb3qlXQaPVuKfC
	 P7fm9KXSZEsJODbXWnngTMu+TARpg1dR1WfMYqtbKRIsHzRTOyaOxjhzxFO71IpXFeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ji5BHOzQ;
	arc=none smtp.remote-ip=74.125.224.130
Received: from mail-yx2-f2.google.com (mail-yx2-f2.google.com [74.125.224.130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C606C606A324
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Nov 2026 19:26:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C606C606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ji5BHOzQ
Received: by mail-yx2-f2.google.com with SMTP id 956f58d0204a3-67569b8cbf8so1728917d50.1
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Nov 2026 11:26:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793647609; x=1794252409; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GGgFPYYG6oWLUvP1KotHDJ9Xw83iP8ii3ww9kM3hKP0=;
        b=ji5BHOzQ1RzwPyqsk2s8cHAViYOWD/O+3bZQY/tAGPh6iajASEYoYfopk4UXn09Dvp
         a8Y3e2wrg8IO3piRB36K67BsnG7u0nhbSW+8Ju9C2+l8e4PSWFRKG3DHntj+sT/fctga
         4R6gRl67e2TJBXI2nqrqp02Uj3sBQ8yzPwhNpwHIW8R2V6i2xrLJ0gU3vj79VkfBnMpJ
         5UoLOdz12VNFiwzSkpjsJT5tWJh95TTv8UHajaoTTo6ciV2sUFHKn09peiEAe3KCubYa
         gmdR7/rtDT7RHk67imJuw2/NIFZXKHl0hTZH0cbZIjhp8KOT1bA+l8VGOwaPX59+N1dJ
         pdZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793647609; x=1794252409;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GGgFPYYG6oWLUvP1KotHDJ9Xw83iP8ii3ww9kM3hKP0=;
        b=1NGWLQgVy6oDgAZadc7fTqCrtzvRfwi2D6P2m7Nn7CyLK4ZbkK3Y/x7GcuSCGpX4xy
         W56fJspkOyp6zw9ywiNu+ADPnEstwIRu1Pl+bJvsQQw27q376kVEQAfG9WsGwHRv+Fhf
         JXtVKBOTLFacD+atveN0oAXcj4jOgU2yjgYYcLs6pJiH8Yc7vCxhGllckEtFmxFgARIa
         i39ZHHpgVralIZafkS0ZyI2Gjm47FQ6+C/LvLOyHeWtRTQg9WWHyzi+wZeFhTSyO8xQ7
         RvZNuQ/u4qbPUkjdZpdLcc6o3OKjMGU/XvYwt2UorjBtEdFYTqcrf3zG/Lb2u4R1Mvbq
         ocAw==
X-Forwarded-Encrypted: i=1; AKwUvBz4j4dExutwow3bAvILYpx4fqTgfnO2IvsQlp7PO2zTTBJlOMmc0UlBfO0GeyQqxWLeYxUK6L5F5VRMD/UxLYM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ZEd9aDw3OZpnP2QrZ73DYlWEmNX9gkEzfzKcrrjnSR6r9gViS
	e/K/mcz/F/25YF81BuJA+vPsq9dAfqTR/JdbRJNvHxebW2U/sTia/HFQ
X-Gm-Gg: AYBFou0rltgqhQo2euXxMdH6GBeXModLt+SR8sU6HVP9xwvmbD/z4fQN+lmrrhDb/la
	FGb146i2VkPIV2+qi23a6FzAYUbDB21H6UVWjLC3SMLN/z3IOSl9lOq/nmPBItxSd9//cTjgI1c
	P6/gsxBiRQx8r2qFeKIcp//WjxFbrpeQ/ScHkjV4pUAyauPLL1StTe9una1mI+O0USZY7yVzUSy
	42nFpmqYmP5RMzcOX/TbLt4L+M0Ssn0SGQL8k6FuyfV97rryk5Hn0cuEYDoO4J3aanqjYplmw3W
	BCjz4DkiJ4sRjXW5UU9or31oc650GQBHgEM59b3JL15ILZxXPPPQc1yenjtocDEw395I8aq4fDD
	cicvUNCJL/IP77JV6krTxgwO65fFTSZe1B0BysKHRRqauOgIbRbQ2epC0NWygNlowGh03LkRBTt
	EDZtrC+QaI+Zy2Z3JxxkaIC4DeumPW1nLDrRcvQzODUrYGnmZFhW03lqXAbP+ysuDrrMHem6Hej
	16PvdNmoP0xbfcQdy6DZcA8NzK4qLBJeoR36ZSaUcysI/v+DhSW9RZP75rmT5lWsZ8NOkrunKfm
	yP5h1/GOXik8VWiRtKFg1LV3MW+aB8LBu8c=
X-Received: by 2002:a53:d148:0:b0:679:93bd:85ee with SMTP id 956f58d0204a3-67ba4ffc1a6mr6007860d50.39.1793647608751;
        Mon, 02 Nov 2026 11:26:48 -0800 (PST)
Received: from [10.0.0.48] ([71.69.222.122])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67baf3700b8sm5719489d50.23.2026.11.02.11.26.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 11:26:48 -0800 (PST)
Message-ID: <d39dfdac-e0e3-4c42-9a55-fbcef6806d77@gmail.com>
Date: Mon, 2 Nov 2026 14:26:47 -0500
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v4 0/5] tls: perform TLS 1.3 KeyUpdate in the
 kernel
To: Chuck Lever <cel@kernel.org>, Martin Belanger <martin.belanger@dell.com>
Cc: John Fastabend <john.fastabend@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Sabrina Dubroca <sd@queasysnail.net>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Shuah Khan <shuah@kernel.org>,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
 Hannes Reinecke <hare@kernel.org>, kernel-tls-handshake@lists.linux.dev,
 linux-nvme@lists.infradead.org, Alistair Francis <alistair.francis@wdc.com>
References: <20261102-keyupdate-rfc-v4-0-f17419972b9f@gmail.com>
 <785aa669-8229-4909-ad33-66f0824687bd@slotpi15m67>
Content-Language: en-US
From: Martin Belanger <martin.nvme.dev@gmail.com>
In-Reply-To: <785aa669-8229-4909-ad33-66f0824687bd@slotpi15m67>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/2/26 13:24, Chuck Lever wrote:
> On Mon, 02 Nov 2026 11:57:57 -0500, Martin Belanger wrote:
>> The matching tlshd change for ktls-utils is a small patch to be
>> submitted at a later time if this series is accepted.
> 
> Recognizing that there may be further API changes, for the series:
> 
>    Reviewed-by: Chuck Lever <cel@kernel.org>
> 
> I don't expect any changes for the sunrpc consumers will be necessary.
> For tlshd, as far as I can tell the whole change is:
> 
> - In tlshd_start_tls_handshake(), register a callback with
>    gnutls_handshake_set_secret_function() before the gnutls_handshake()
>    loop, as quic.c already does. We rely on SSLKEYLOGFILE to decrypt
>    NFS traffic in Wireshark, so that needs to continue to work.
> 
> - In tlshd_initialize_ktls(), after the existing TLS_TX and TLS_RX
>    install succeeds and only for a TLS 1.3 session, set
>    TLS_TX_TRAFFIC_SECRET with the write secret, then
>    TLS_RX_TRAFFIC_SECRET with the read secret.
> 
> - A configure.ac check for TLS_TX_TRAFFIC_SECRET in the installed
>    uapi header, so the build works against older kernels.
> 
> I assume you plan to send tlshd patches, but let me know if instead
> you'd like the ktls-handshake folks to take care of this.
> 
> 
Thanks for the review.

Yes, I will send the tlshd patches. I have a prototype, but it uses
gnutls_session_set_keylog_function(). That replaces the default
SSLKEYLOGFILE writer, so I will switch it to
gnutls_handshake_set_secret_function() as quic.c does, and add the
configure.ac check. I will post it to ktls-utils once the kernel uAPI
is settled.

Martin
