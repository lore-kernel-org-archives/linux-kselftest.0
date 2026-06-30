Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 334FA3C9894
	for <linux-kselftest@vger.kernel.org>; Tue, 30 Jun 2026 11:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782819484; cv=none; b=bdb/E3jQnWA+Q4bLyLJWoVxAqp11F2ET264hhHY4d73UV8wJHU0ARQtwPEbkBWNdEFyoy6S/1TCOBCfV7YaTGy1uJoOEYDu7z1R48vioOC3/JFbjyLWaObpmceuki5HuaLVLnz5zxQwlIy6aJo6gwN7SXLqCgms04tPRgSXsRjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782819484; c=relaxed/simple;
	bh=dNS9gJ59kETwtxmLRKpGI1mdji+DmuUq51Ry7zd9YVI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p0cXv0tdpJpFxNRME1VMNyjv+qMBGKJrjvmRmRPHoBf4QoE3hDY65mHJYPsUMrDU+k4og2Sw70D/HCfOWkynHcswcxHgrmtv44at4MjH23xwxmipFu1W0BTzaFXld52xfpmxIys6crwK2JS3LUZiPoJEP/M72i3a3FZCJvtyDKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ml4BlUlP; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ml4BlUlP"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-8f23e851626so5368106d6.3
        for <linux-kselftest@vger.kernel.org>; Tue, 30 Jun 2026 04:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782819482; x=1783424282; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dNS9gJ59kETwtxmLRKpGI1mdji+DmuUq51Ry7zd9YVI=;
        b=ml4BlUlPMJFq/uzp9fMfHi0D01Uoz7DNV4NJRzUZDqf3rhnwaQMe3VFUVNeVoyrSQ0
         nPZO9tFH21yojYbzQYk680W38VbvULJdjuzd3ta38FTw+P4H1d5Wq+DYVUy8BV9z7vp3
         10isD2wb/GvUh6o9h6soybjopB9cK9gMVNNHs3nh1KEs+TJlV4zK+WiQUafQZYazShWs
         X1BdmO8K7WCvaOWzPa9HtRd6DKxaKIsxGA8bIcJiyqlNEfpN9CrEBaNlY659HnkeXwJO
         8LfKV9LOjxgw/9TKLKFULcR8x/aStqPD/oZJNdIl3oJ9J49Z3rMKfO7BNBQp+gWBey7h
         BWSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782819482; x=1783424282;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dNS9gJ59kETwtxmLRKpGI1mdji+DmuUq51Ry7zd9YVI=;
        b=W0A+HF3vnTzFZbtdC1cnvxCRXGCPVdURXfZcZAfDQ1H/0P5Uohv/XtsuCAy8Z/y1qD
         ekfJT7zcUspKW8xHk7CQkVG1wdXgUpzVx25kypu3jA0bRwzbwGitvyvvWK2hNkZjNX+i
         bkqzyY0jFijhK2d/rFiKd02K8TrMCAkbURR68/YMYX7kX5Xx0qzZCWZC8lW3OYN8XSeb
         q9ZSJYX4SMwBMWqso5ur7Q7Ve5Re7yfjRWxsD3xoQX91o9tXr6pcVyS23CTxb9mf3avE
         U0esBn+B/T3BtMTLO9wko+if0Fr/pBxo3K5OdgQnp2vNLmyC5Ghl/+iJeU2pTJzGaFJI
         xckg==
X-Forwarded-Encrypted: i=1; AHgh+RpOBQ/G3ShKLEPv8XT/TkCMufJov//1rzlAjwuE2VH7AimTYjI72DFYmRlMmDl8oSXeKWU79KfKoAZ2gHh9wgQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9sq2JaVtd5mC+A3lKuQsXFZ4Yny4aRw3sIPYaIYqvoN/ffBNO
	u+26GMBP/yT5NZBcUXKp6nMJd1OrNPnkZwqZTiLK3vNPbk++nl32fKrQ
X-Gm-Gg: AfdE7cmco05l+qhKHuW46Pt5Md3f+JcuGRJ9czrFHqWR0BOr5lHgX8V4PKdKpGJeK/F
	36Je1ssWjJXScwxwNyDsC+iN79NG60IrbXdy/cNPgtgpv0tfyV7YSqldLj0XA5Vt+IaSrOkcODt
	MCJkFOd4rlrVQOqViLFqL8jhmGD2sfcZS1VkXFF7EjOmwoAxTXMFhppp8sTKv5ZQvlP3c9xb1Jn
	ibeo2EpNanBHPJDULGqQKTqNIXRTP6BRqZQU46iyvX7cicuPRnsY+WKA3NxWglW+FrhJfZYBJ1N
	CdC0s8higM0Dx2SQnTtJxZGU6ruG2yE6B3mJFyiBDNxGXXR6D+XkmBEV3NqyqMj0cOv+0r9GAui
	j11kqYZ4yzf18FsLhNatMUlmJql4QYgpSf8CK/yjGx9ZzscFi30xFyOJpB+7BzEtDHxxLeHi2AH
	KsXjxD45gdylHW921m7ysm72WlTLsf7L6rJb5G7+V/iMCbyjDu2o4fOClk4zyytHJ46rY=
X-Received: by 2002:ad4:5cee:0:b0:8ef:b23a:d741 with SMTP id 6a1803df08f44-8f1bbbdeb2fmr46454616d6.28.1782819482187;
        Tue, 30 Jun 2026 04:38:02 -0700 (PDT)
Received: from ?IPV6:2600:4040:93b4:e600:a22c:878f:7c1a:1976? ([2600:4040:93b4:e600:a22c:878f:7c1a:1976])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8f1a69c283fsm22449346d6.26.2026.06.30.04.38.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 04:38:01 -0700 (PDT)
Message-ID: <daabe7f5-a6e1-4d37-83a3-3f05da0dd3b5@gmail.com>
Date: Tue, 30 Jun 2026 07:38:00 -0400
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] selftests: drv-net: tso: don't touch dangerous
 feature bits
To: Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net
Cc: netdev@vger.kernel.org, edumazet@google.com, pabeni@redhat.com,
 andrew+netdev@lunn.ch, horms@kernel.org, shuah@kernel.org,
 linux-kselftest@vger.kernel.org
References: <20260629233923.2151144-1-kuba@kernel.org>
Content-Language: en-US
From: Daniel Zahka <daniel.zahka@gmail.com>
In-Reply-To: <20260629233923.2151144-1-kuba@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/29/26 7:39 PM, Jakub Kicinski wrote:
> query_nic_features() detects which offloads depend on tx-gso-partial
> by enabling everything, turning tx-gso-partial off, and seeing which
> active features drop out. Enabling all hw features is dangerous:
> we may end up enabling rx-fcs and loopback for example. For the
> ice driver we end up getting into problems with feature dependencies
> so the cleanup isn't successful either, and the test exits with
> rx-fcs and loopback enabled.
>
> Scope the feature probing just to segmentation bits.
>
> Fixes: 266b835e5e84 ("selftests: drv-net: tso: enable test cases based on hw_features")
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>

Reviewed-by: Daniel Zahka <daniel.zahka@gmail.com>

