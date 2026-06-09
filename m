Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB15B3F4DEF
	for <linux-kselftest@vger.kernel.org>; Tue,  9 Jun 2026 10:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781000638; cv=none; b=Vk1gPj72g92fEQJ+OraGlhc4qW7ZWe2qM6lOM/z7fbybsZX9EpSeWnWTYybvM9xVL+1kpkHHvaUtP0UmwZj6SHOLaXs94kNxJOH2f/6XKOkVLp+s6mfuWFKTFCJxpiJ+a4+ZXYypLS9JLxTQXt2C05leNBJSgzfhHk1rWaT20yA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781000638; c=relaxed/simple;
	bh=DsAPMvK1q5MvOezA4jpsh8gZnYxwxhG9chRJt8+cysU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RpwjRj1ZEwfeikzyBWCA19/JuFI/NfdNexA8O58zQvumdFcKfE4ivZV9s8V7Ltrf+oD0blzMB6BdWHkut5cOEj9k7FXugZU3c4XAMFyCtoatG7haP/vvbFoGT0vbRqWbFraS1A+2pZ/7a7X1KEZBO6xsfQ44W1FjRCgJ+FRHUPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OdPpIOQM; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=R/5OQ6BI; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OdPpIOQM";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="R/5OQ6BI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781000635;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cXZk4k2k6EZBTKlJ5PyGn/p9m59BVNFUwlqXim4fTfo=;
	b=OdPpIOQMv6GmaDVE7p/oBQ+AKjBQpmNjzDxc9D5AYOxnL+7zNkVjBH3jut5pTavedjFVzN
	UI1ZkC2tUy4B1kdIzddXLtYk4wKd6tHPIk6f/5i+r6ZeKd8KmDG1iLvF2JIKZBCBG3n+j+
	Q+R4z4w5TarJpd+E4hvyrncfXJ6vZD4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-147-RRll8b1ZOuiSE_8u80OnxA-1; Tue, 09 Jun 2026 06:23:48 -0400
X-MC-Unique: RRll8b1ZOuiSE_8u80OnxA-1
X-Mimecast-MFC-AGG-ID: RRll8b1ZOuiSE_8u80OnxA_1781000628
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-45ef4931de5so3109945f8f.1
        for <linux-kselftest@vger.kernel.org>; Tue, 09 Jun 2026 03:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1781000627; x=1781605427; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cXZk4k2k6EZBTKlJ5PyGn/p9m59BVNFUwlqXim4fTfo=;
        b=R/5OQ6BI6f+cVVVgVAmkpxXl4zXWChy/CbDurfZ2UmvIixdqsGGiFjDOExf25UhdEZ
         VuQxUJX3rsWJkHrIX8T6+rzjEueymho4d16nVqBYZUlPOEBsXp0lH0eCj7h15ouGukxD
         4bpJLMLMwkW/z+jyGoVlhvNs8ZKv/dtNXtQGe8hFw2ft6FlJgR8+XNNhMJWlt/2XJ3N9
         7o+YL1RP/QJqTVSWOQpn2I2BQP8Vv+EQq9qs4BCViy8oxnvj5oHltRi4ElTlZbp1AIY8
         ujxy0wXtju67BX3k9cIdtZq0ga/MmgX1qGYy/23Ar7xDHDNhpoompAl8BrSjt4ylbbT7
         R46g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781000627; x=1781605427;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cXZk4k2k6EZBTKlJ5PyGn/p9m59BVNFUwlqXim4fTfo=;
        b=JVEods4xRsuRXl4lGlL9FYoL3lm/Cpg2RiWQ5lO42GoG/VJ/dQ0BEVTAZynM1NpF0v
         ixxmO06GJtU9RcWfjXi6KxTbRGW3lscYc6xXSCaE5MAxOoW5rPcKvJqu80Wwh34Xk9uK
         Py+MSfyDnBx+c9641eIhfkhAOkC48f3fnBsQcSdEAsaYdCTp/iL0ZaGofx81TgTjSJsI
         DvIzpqxezPQsCF8dgl7tfpfzUXl9IaL8gi2d+YdOIIj3qarxIEju/Kpe1+mS0ekdAKrT
         SHVO7w97OHfJ+Phqe/hvxTKWMOxwgLDBIYgNGWz9lElBa6MWTNPXD7FCe+ATX1v+384U
         dlwQ==
X-Forwarded-Encrypted: i=1; AFNElJ9iVrw+Qbljd60/H/QfWamDgaiSNUIPYqCjTFFPBnYD2QE6044BvaSYt8vOaNtg07TYnq+qqR/Fs06poUAFeFo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUiv5furW/wjtyQm64PU2CJhN9g2GyHg83IredEv6trHoJfMYT
	M9BX3ankiyy4YNeXXcfKQLQXJ58QyKmrH84sL4TWLhsQ3U60UkHJVpi6idlHT2eQKxK8gqTFyF7
	HN161SauT4tWBEYi7zNNUmJNpKseKG+pg00RMVknDX0M+h3oWBaH4vjd1q/IDZh3JDp9exg==
X-Gm-Gg: Acq92OH4/2pV2EVAh8pvlFuo8sUd9R5NBNDJL3myugtpuS6JZuqwghA+REcIooKpbuI
	1EGEius/eGy5vvFH38kI95t9Jun2rJexO8nJrk/brBlztkndEHuUWEhnMgduN6sUcXkzPweFLaL
	qL6U03WmQmCaH09SqdGyDWJYPgd3pSc1cJ9JQJIAbYXUWCQUeDSrfv99TqvaWYTpobNhRfF+WlU
	MO2EN5rN0m05c1xSdEfPccOSwmCqlGrMWA5rDAnpHyHMPdg2n5udPw/xO2mSFwFM+dCvu+iHNTS
	lRF8lG3fMl+i5txpqqOfVUk4zv7FiLxXCCwKQPOFeelJbIlSQ84PsWj9aFQFlbWD71DGt60Blra
	dM2To5vfMHFo47pEZikNMC3yjHKYYb/XzMD7T1ZaVusxfuVCyD56L4msyHqrU8TGHIA==
X-Received: by 2002:a05:6000:1aca:b0:460:15b7:769b with SMTP id ffacd0b85a97d-46032810ce6mr24624565f8f.0.1781000627606;
        Tue, 09 Jun 2026 03:23:47 -0700 (PDT)
X-Received: by 2002:a05:6000:1aca:b0:460:15b7:769b with SMTP id ffacd0b85a97d-46032810ce6mr24624531f8f.0.1781000627257;
        Tue, 09 Jun 2026 03:23:47 -0700 (PDT)
Received: from [192.168.88.32] ([150.228.93.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2f67c6sm58456915f8f.16.2026.06.09.03.23.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 03:23:46 -0700 (PDT)
Message-ID: <3ff13fcb-1587-43d2-b749-ef8ec14d5ba5@redhat.com>
Date: Tue, 9 Jun 2026 12:23:45 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] selftests: drv-net: gro: signal over-coalescing
 more reliably
To: Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net
Cc: netdev@vger.kernel.org, edumazet@google.com, andrew+netdev@lunn.ch,
 horms@kernel.org, shuah@kernel.org, willemb@google.com,
 linux-kselftest@vger.kernel.org
References: <20260607002401.212976-1-kuba@kernel.org>
 <20260608195320.007b34ad@kernel.org>
From: Paolo Abeni <pabeni@redhat.com>
Content-Language: en-US
In-Reply-To: <20260608195320.007b34ad@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/9/26 4:53 AM, Jakub Kicinski wrote:
> On Sat,  6 Jun 2026 17:24:01 -0700 Jakub Kicinski wrote:
>> +	/* Signal over-coalescing explicitly, it's a hard failure, unlike
>> +	 * under-coalescing which could be timing- or loss-related.
>> +	 */
>> +	if (num_pkt < correct_num_pkts && bytes_received == bytes_expected)
>> +		error(EXIT_OVER_COALESCE, 0,
>> +		      "over-coalesced: got %d pkts vs expected %d (%d B)",
>> +		      num_pkt, correct_num_pkts, bytes_received);
> 
> Sashiko complains that this condition may mis-fire if we lose a zero-len
> RST or ACK. This is true, tho, if the device drops pure acks ignoring
> failures where ack disappeared puts us back at risk of false negatives.
> Happy to respin but feels like we only have bad choices here..

My personal take here is that packet loss at (very) low rate in a
controlled environment should be threaded as fatal: I think the patch in
the current form is the better option.

/P

