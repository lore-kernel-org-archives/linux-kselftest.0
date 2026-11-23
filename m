Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795436865;
	b=eEEwnB5pbucDvesz9IlYa+OTvdTFO9v/ta4Cw3jgByyKB/S9yJROeZITT2i8bCk/iHgS
	 VMWp/59UYB/iGPc92od98Kc5jTuRVYj8whUQP4DHr64neLopZC0bgXvREigKRsFQkX8Fv
	 jWRnt1Md59rtMPOsVR2CCQylinAWhBWoEqiOAeWELK8u7oi/gxcF7evbB0x+NPDlrZBRL
	 ZGhQI6QxtvJzlA9e9PGpDRcOhkp6uqFryYHT/ZeVlx5aT/exlh3Am6aAK0JkQTMhwceYJ
	 bDoEtgK6JCRx+nPG0lIIouWX43J+FdDVv18B3FC+rKE04ktSn8jMvM16SoOsttWO1iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795436865;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=VPJ4qxbI93bPzZzijKlNpT2z2hanGh/YCxc/VAqAnNU=;
	b=uqDDRG/PgNSd/Eeb4NxhDzqT1M8CU3Ak0nofNSN3V6An15ihR8T3EEP42NyTc7FhngqB
	 qjoSxZxMfUf8NLQ9UUuey7huDDlr6of82yO0afdcTgiysBXJ5+Q2GVTIZ3DaJeFGZhHzX
	 WLvKPOQfJuHygqJbuTENPci8mLJxIGw9NGkyHlsjfLlreCacRuE3+YltWE01PXLU/0Y4H
	 j168S889JLj11fTqv2IATTB+UIrxvGfZxGBhw6UjrZ3YRJ85wLX07GeN7KDf37iDFrSeF
	 u1fmqC+wAT1ej+6rBfxYltRApLGGBtcws+9qo+pjekHUR3clX9/idW3rg32Jm+Bij3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XC01C9nY;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b="YMM0r30/";
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D45E4606A31E
	for <linux-kselftest@vger.kernel.org>; Mon, 23 Nov 2026 12:27:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D45E4606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XC01C9nY;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=YMM0r30/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795436864;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VPJ4qxbI93bPzZzijKlNpT2z2hanGh/YCxc/VAqAnNU=;
	b=XC01C9nYqEtraV32g/ZWZHsEyG2VD2VMTF/Hanzkv6nsiHo0IMHHBWUnL3pbV+/wF3kr1W
	ZYX+J/G2Ohm7RgRfTdiCoYov3zuKqxL21CtRNXHgClbEg+xDy+iAr7lyQmhErPHMDJf2zJ
	dIGExyqLXaHJBs6d/L1/oACml2LMro0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-471-B4afy7DMMPq51MggrQ4rbQ-1; Mon, 23 Nov 2026 12:27:42 +0000
X-MC-Unique: B4afy7DMMPq51MggrQ4rbQ-1
X-Mimecast-MFC-AGG-ID: B4afy7DMMPq51MggrQ4rbQ_1795436861
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-4a647e776b4so2377836f8f.1
        for <linux-kselftest@vger.kernel.org>; Mon, 23 Nov 2026 04:27:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795436861; x=1796041661; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VPJ4qxbI93bPzZzijKlNpT2z2hanGh/YCxc/VAqAnNU=;
        b=YMM0r30/1FOYi0d5us+CD1V8yqGm8dAiU0V3hSguhGVgfBpBxxePLbrR49r3SbQE54
         efGdwpdwwN8cz8+TjcyPH0G4B+4ARjNeP7Dxs6JVANgdFYEfvqYpkUt+pnw4L3YgnmHf
         vDuYplafZglf5pzfmidinFQ5hX7QSKmANdeII1yZpGlZdo1/Av2zA/osHDKpD4oJmYIF
         /9yNOkcWmO9MvnSH2vqjMapBT3c5JYFLvxVi1ZYZoc/8FeFvzjoSOds8J2u3YCOT07gp
         N9x9RH84BtFQ55FgXqxKDA5s/WquJaG53+vw+QzpAx5wobVF2pRqsMShL+Rp7M+UZCNj
         3npA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795436861; x=1796041661;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VPJ4qxbI93bPzZzijKlNpT2z2hanGh/YCxc/VAqAnNU=;
        b=jM/CwxmZF3MVymp7PYz2847cUHpPYzM4+55fxXQorHmBVaQc2mRZEtkQjWPwYvo4OC
         eu+P8aqYUKYif73OsmaF/t1V+2057dfXFMvorpjMhAXi5vBE9icQ1Tfk2ED3JEt7ohvR
         GQ9621rudh3xdsaeAcbdSepcTn5+KMpxnphvj8bebneK8hMu6lm4XChzuIg7fwZ86rFG
         pjt8zdaMYpjHtqguVqxS/sX3mZ1Z5diBGjyassu+8EzcS4+Ee107GsLT5jsxU4dEj3OD
         RVkJQIx5QLhRr7Siq3mZZxEe1dpJKrkbf12wy56Iv9AsFQFFiyw2rSE2S58kk5ykbzSL
         6CPw==
X-Forwarded-Encrypted: i=1; AL+hErG93Ujy8v7Yp8QhqBBZkWc3I6dkGVYfMTTpzjCp3ce7jTaJ3xc4C0V5xzZWegryn8mHYyEMjb4vtxb7bguCtII=@vger.kernel.org
X-Gm-Message-State: APuU4Z87hf6y+EWBXrrBhLt9IgG4D9Iio/fC4CEvtrJxSxcLCo6QHKdE
	1pgWMF20rsGIVLRseVNQPgQuXkYD/VTeg5TxGmrOwx9B7vKMwHtHbICXP67W4TnwviKtwwiAQHF
	Wy4qi6G3YmOHB4t7dOoHcPJgpFYR/jZU1aLbcgnEbKsmMTJUlEzGHu92eVt8MgX8uzDJXgQ==
X-Gm-Gg: AZFdTZffLfckiMtVGLL0K8dtkBgeqTw6J6bVwXQpgi2nfNpHK/LBQlkSHNZVLcB8zoU
	U0ypwEOQ8SINLHVrUg2uVe4DOm0ydGXcVBhYB/5VjZPaLN/LcB0Zcf3UfkNl5rV596Eg7jP1ktL
	k2iKTzgITMGscYhx6ah4K2iS81tfRMVp7JKPp/unZ1XMmGOCuDFuXV7NsZyp8wJq5bC309NaGeG
	fNvzTKFl+MXCCFKfkl+1nnrNahGHlGK1qjRDVEmiObaub+hTLpqqfVKx2/6Uyd0O9i4EgOb0voM
	t0BwatpLpvQv/0ALJr8z4zq2oPRXl5MCBuKQY1evZLuworRDDddqLsq0JDbO+qpylfBv8zZb4kE
	uDHMbimIF4NGUU2ATJ8GjZEkVxXdhdDT+5r72fopswyJN+V8C4xm9bU0PMiK/5j2cNeXoLXVy/o
	eS4HiUy40rLdGxKDg/kaiBkCGwCXcl8c4DESJW3fSWkkiW
X-Received: by 2002:a5d:4492:0:b0:4a8:1b63:215d with SMTP id ffacd0b85a97d-4abb6eed6e7mr16616462f8f.27.1795436860770;
        Mon, 23 Nov 2026 04:27:40 -0800 (PST)
X-Received: by 2002:a5d:4492:0:b0:4a8:1b63:215d with SMTP id ffacd0b85a97d-4abb6eed6e7mr16616425f8f.27.1795436860290;
        Mon, 23 Nov 2026 04:27:40 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b5f6sm20481994f8f.34.2026.11.23.04.27.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 04:27:39 -0800 (PST)
Message-ID: <6aae7800-5306-4839-a4c8-56265a0fae45@redhat.com>
Date: Mon, 23 Nov 2026 13:27:38 +0100
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
Subject: Re: [PATCH net v7 1/4] net: hsr: keep GRO disabled on HSR/PRP ports
To: Xin Xie <xiexinet@gmail.com>, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 horms@kernel.org, andrew+netdev@lunn.ch, shuah@kernel.org, kees@kernel.org,
 petr.wozniak@gmail.com, qingfang.deng@linux.dev, fmaurer@redhat.com,
 luka.gejak@linux.dev, bigeasy@linutronix.de, xiaoliang.yang_1@nxp.com,
 skhawaja@google.com, liuhangbin@gmail.com, stable@vger.kernel.org,
 sdf.kernel@gmail.com
References: <20261009201324.17-1-xiexinet@gmail.com>
 <20261009201324.17-2-xiexinet@gmail.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261009201324.17-2-xiexinet@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/9/26 22:13, Xin Xie wrote:
> HSR/PRP add tags and sequence numbers per wire frame. GRO can merge
> plain interlink traffic before those fields are added, and userspace
> can re-enable GRO after the port is attached.
> 
> Mark slave A/B and interlink devices with a kernel role bit. Filter
> software GRO and configurable GRO_HW requests before ndo_fix_features()
> without changing wanted_features. Filtering before the driver keeps
> feature dependencies intact; fixed-on or driver-required GRO_HW is
> left enabled.
> 
> Apply the policy before registering the RX handler and reject attach
> if software GRO remains enabled. On failure or detach, unlink the
> upper before clearing the role and recomputing features, restoring
> the user's last request.
> 
> GSO skbs may still arrive. A later patch segments valid GSO before
> HSR/PRP processing.
> 
> Fixes: 5055cccfc2d1 ("net: hsr: Provide RedBox support (HSR-SAN)")
> Signed-off-by: Xin Xie <xiexinet@gmail.com>
I don't agree with the goal of this patch. The kernel allows a very large
number of bad configuration. Explicitly preventing one of them may
lead to regressions and leaves the lower device in an inconsistent
state.

Please drop this patch.

/P

