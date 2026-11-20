Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795210366;
	b=34OVDUpgvOa32XwrUAXyNVcXGpLk8789tC8NNT9MEWQLDgOIGW8qW9nBrBY00QroyOZn
	 f8RQPtX3AohrMk6uYvVOpTZJZEwBg9omnOyw/HkTzG+z7ZBv+fFBQdshubHXgfmcRZWlh
	 oT4VaaR0X7QKZIcYvSlBi/wkmvvdNfneLdVZixatm/fofj/pCriyVUrN5xs0RuF4wNB1q
	 oZN8v7FjjBSwh2TFd4GYKSYC5lUgI8ok9yuNf70bFRGFJB/+C5FV/S6ALltNeLIS6aXmy
	 mlWpobZuYIDA/p7a8bbeqC4NezbGjlNCBrAuK3n2jG+IKzcqTpqlPbrkNOLs3iV+XpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795210366;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=4p2T2Zg2uEfX0S3UgngIvYy2v+9xvr8BhJ1ygzeVIy8=;
	b=CZDvW0JqOkLtLIAiVuY7f+Mz0xkdN7dbPREWKQOhMNhdJNA9JlYnNRfOc2xHLEZqR4LZ
	 4sK2KzLZq0wJJYaldbp9Fs+xes8xnPQkojZh/hBXhvnRheP44SY/yQ/0E1ZVAePspwsSZ
	 7j4Gd21bZ3pBZtGc3Px/smoOPFygl8fi/jwqwvGzPY/EO8/7QTNJyjjPVuRNegVWt4jth
	 HVHb2agzMZxDvK7m+QfKAoCYs0f2NHUzdgSstOjAI+f0kAmsreiLZxuVAVbZ6YC4AqYn9
	 aYvfo9uUrDzxujFq+IX73EZXPhkxJqtO2PjbF83Twex5jweAHdvcv/yyXOs1g52appw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sEkFnFKr;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3935A606A6A9
	for <linux-kselftest@vger.kernel.org>; Fri, 20 Nov 2026 21:32:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3935A606A6A9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sEkFnFKr
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4a3dd785f65so120443f8f.0
        for <linux-kselftest@vger.kernel.org>; Fri, 20 Nov 2026 13:32:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795210364; x=1795815164; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4p2T2Zg2uEfX0S3UgngIvYy2v+9xvr8BhJ1ygzeVIy8=;
        b=sEkFnFKrbLKiLRg/2IWy9pVLL+6oFVl8o8YQE273/dZ+0JwnhrNtj1iaGush0cEzK0
         INnm+iA6hWaWQX/Fnfv71VP2979ZVUDrHM4EdGUuxr82PKwuFX7vfPUQWnWiVTzpZM6R
         UoayqILUGs/vBMSUfIOnU54pl2JyQ7/LYc+xKEl2eMfFN2Q7IuhnxYL7/x0/GtGb35O/
         LBBIa7W9YuuFOM7IrJaPIWbyqWuhtyXndezJbYptud+1B5quwJoXE2NW5vIvelihvln7
         PA2XZRtm/zIBLKFUCMlT5QBGuGxDVnnQLe44BKMSLuG0Cp+q3i6VCY34uvXl9FhXFYVS
         J79Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795210364; x=1795815164;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4p2T2Zg2uEfX0S3UgngIvYy2v+9xvr8BhJ1ygzeVIy8=;
        b=pvrAm3+zv0Ya9ynZCRq+ImIFzpGPtDAmkDor+yy5hmk+QKQmYhI+mvY8jmFrytIJRP
         slWhxubiMAp+BlkRiTFKwpNpzQaOHz3eDiRshPSBo5XIc+4xciPWYLEYuxSrbqTHwO3C
         HQIwku3k8z3ExHrFloYn2zhHNtGhhlbmwnnf+pvlKj2ZDsOGP+CLBPERbdzYHkoV0YNR
         aC1+UdlAQXRRplpUh338qdg2DAn/EqyV1wRg+ilCle7l89DOGVtxmgxiDykaJCXB5IXO
         4RDLlJQHWSirUtBu/i6DC1CHwpZI2NSqQZujLhe83Pzq0TUl58gmGe7yUfZrlkX/DQBX
         Xy2w==
X-Forwarded-Encrypted: i=1; AL+hErFlo5HyrG2Mr9c2xIKQZS82v4OsSfsM0gIOCmUIqyZrYyNil51ESm+EB6VvXMCfzOi9JuBUPIhkj8cWBp51oAI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/liqy4SKxPPGdrDSu9TKyLwZuw3IZxp2PH39zCQTWPbs1fr0pE
	yy1gjycwkike8XceZJSyDmZ8jSphlYKwf7JaZkCmCSGpSJM7D3CcH+k1
X-Gm-Gg: AYBFou0OG4K461AB2ArzOFGcosh6tPVB17IoY+wT0CbBxzgNUbwtHRJ4l0pynBqr0I1
	PpANb74HCfJGm4IOUX1Nc3a/ohcPxBQDHfSnTlC/fKznjpSzLDAXpZvskjj2lvIbXvdR/AE3LAb
	xz8wLbLJa3KdYa+HkuIaXxqSnkFcNNhl35fMpI+wb2vv1XdMlzPB4ixBhObSDFpcxZJk5so/tC/
	NhUmtRnGj9lGchmy7WKlSUNzwUhVPMoIFdwoe8y6LvlfZ0iwkQ3esdMUqE2dfE9uPMWT/1LdhMa
	QI91NHFX3GAOi09xFUR43mT5JC0ofyH13v3ppzSIzkBwweUWZWleo/oR5fIXwlKzrQaeWADwAR6
	udRSEfwHLV3PQrGQkBB7oQ1E2feMeO1r+W+xozFrXqL7b9/XxH6X2p3ofDr3bfIcg54XQpZGSXM
	zwcHsZERC3prVdSJ6uQ5Au/QcJjk0JMZsy39LiJd/eJ82eM8Ew3DhQ01Avq921cGqZ3IGxDw8I5
	ydWxvQE5gFIjngTHE3KW0+pErhEarDso+lfiAYCg+9P9r6Ii5fZYQRnSLv49B0SXvdXxmDAlHWZ
	ppCTGxxjHDel1JBI1SEbAVDCS+IHlBdee1AjC3c73YNrwdhCRv9tc0oVEBFMDtGpuug4lTJEd/Q
	xMo0c+ruPmid9Gf730zNU6rz0XgsiQwU3yzRx8kgrO2FfYNA6BCr97CMcCXTeyhv5y7i+KdBGeT
	qvyxK4d7lze56JfFwTBT+MixbRnQ9hGzOWBI7k3/ZvUKmj1dQ=
X-Received: by 2002:a05:600c:217:b0:4bb:6a02:d42e with SMTP id 5b1f17b1804b1-4bb887f3fb8mr69797915e9.1.1795210364452;
        Fri, 20 Nov 2026 13:32:44 -0800 (PST)
Received: from ?IPV6:2a02:3100:65ed:8fc:216e:bbeb:a7f9:ea1d? (dynamic-2a02-3100-65ed-08fc-216e-bbeb-a7f9-ea1d.310.pool.telefonica.de. [2a02:3100:65ed:8fc:216e:bbeb:a7f9:ea1d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb895f7bc1sm37514135e9.3.2026.11.20.13.32.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 13:32:43 -0800 (PST)
Message-ID: <caa0bad2-0c73-4cc4-b0ca-360a568a1947@gmail.com>
Date: Fri, 20 Nov 2026 22:32:42 +0100
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
Subject: Re: [PATCH net v10 3/4] net: hsr: segment GSO before per-frame
 forwarding
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, andrew+netdev@lunn.ch,
 shuah@kernel.org, kees@kernel.org, petr.wozniak@gmail.com,
 qingfang.deng@linux.dev, fmaurer@redhat.com, luka.gejak@linux.dev,
 bigeasy@linutronix.de, xiaoliang.yang_1@nxp.com, skhawaja@google.com,
 liuhangbin@gmail.com, stable@vger.kernel.org, sdf.kernel@gmail.com,
 lukma@denx.de, fmancera@suse.de, danishanwar@ti.com
References: <20261117141922.20-4-xiexinet@gmail.com>
 <179514132368.3136.11119943958824488606@kernel.org>
Content-Language: en-GB
From: Xin Xie <xiexinet@gmail.com>
Autocrypt: addr=xiexinet@gmail.com; keydata=
 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
 sNySbH3veZ/55EtlXA==
In-Reply-To: <179514132368.3136.11119943958824488606@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/11/2026 03:22, netdev-bot+sashiko@kernel.org wrote:
> That covers only the gate drops, not the segment drops counted in
> hsr_forward_skb().

Yes, the sentence is about the aggregates that hsr_forward_input()
drops as a whole. A frame or segment that fill_frame_info() rejects
later takes the existing tx_dropped path in hsr_forward_skb(), which
the patch does not change.

-- 
Xin
