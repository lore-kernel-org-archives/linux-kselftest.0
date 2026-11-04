Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793819144;
	b=4RLDrqrEfjTeMh9WVBLPSjliJUCM4+sBiu84VlfjZUJDNdMkqlFQvH2pxr8UUf2vrHz6
	 aLRvuLxdC4vuWsgFDreFpL5veJK2RKKcXW5GANY8dqw9QxsTmVXt6T64SgZB+Dhpldy4M
	 zqA4wKfZqKDMcMPoavTALT0xIUmujeUn5vwWRZ5NKP86+1acFcWNT/rA5qBsHaxLpLDOk
	 ZoJtEu11U7N6F2Kue5kDArS82aA9Ck68nA92ROnYXz+dPScbMvvegf/zjsrFpvwoK3D+g
	 fpJaJLNPzJedvPp6yGQ6FeD1zsSjH0a8DSfiz9MmNYHwoXYQskyrU6Cc/DZLpZFr9pA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793819144;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=O75HJWwF/RnbUopgDHMkFvMSL8L7W5xVT0WXc+61KCU=;
	b=F6cZLr21bcEo2lXcK0IMUyqXvCtA6bTviXrx+5JmRLEfqJxMprzGGv13YUzSq3aAP+Bj
	 dM1kAlQzS6Z+lNexigMHptNM/5Uxf+JabGLq8aqS2FD8nGM+zL9SUxIQmJE9fsVzmT4tE
	 tEkyDosrLIT/txSvhG0jTOMrgdAWwaMDopthX9QHbePD7FzcbnIWOJej82d3qS7z5R6be
	 eYXpp4rjUVbpZoHYD83ErRd5uy802wq0tTenU6rGyE3ueVIb7s9pgctkztPxgSRWEqXMd
	 BKhju+NPIeqTWIjmDT6iJbM75KjD3MIw28+BJqDv9zOlVTP0kuT/tUH3d3pfXqXHKGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MEtdHqB8;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D09B2606D814
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Nov 2026 19:05:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D09B2606D814
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MEtdHqB8
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1b244fb7fffso1506275c88.1
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Nov 2026 11:05:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793819143; x=1794423943; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O75HJWwF/RnbUopgDHMkFvMSL8L7W5xVT0WXc+61KCU=;
        b=MEtdHqB86xZ2D7eNBZrPkkUQcehhYt1vPlaBX3c7MZ1SXry3ZhhPHQVsjY8kr6Xajv
         hV2sEdfatE7yUMrohim3sPyPbi4k4n888A23qCb3SBVkB4DWEMLQmKjehPzaoEML5Dy8
         VrlFoqQkAVO5hzhEEOP/H9ZtPWPtsuJtgmPImqMQiFtueU9094P6YWLhaJ+93wFsvi0s
         0vKHBToJtstoVO94e5vCV0eF1/9iJ/hgLbmJYEQlNCADZrNikyfUaa0CBP3sDFB3yMx6
         2Z1vqdwM6yAnaw/vAwoZhJ0JZm0Au+ONlenPwfXhJ18jiA2+9ki5xfrYFJVBtfbc68Hy
         glSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793819143; x=1794423943;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O75HJWwF/RnbUopgDHMkFvMSL8L7W5xVT0WXc+61KCU=;
        b=2aUinVzJaO/YKwkI5IAqTonTaI/C6pBeViVttAwwupS3yyWU2F2vCoEKSvf7oUlxAG
         5tbho6YbG+ZWGXqjRDW0WRHQC9HGstEVq7XyVV/zKpsAqLpThva7oSeFOJ63rrFbQEER
         gxDBlqPUiC9/K7rTfzn6VzW8Cq1QujeuTV+2MG74H3Mm/vaHmGeNgavwANsF2g9c58o6
         Wx6V0imrWa6ykL+yNQSE68Zgdl1XZhis6r+5dk5oaJQcMbmWFP7isq9ztVCgquz5l59O
         2Ck55FjRGUoC+nQrtSJCdbxMt2Wonyt2C9Ay9eqUM7jhObvxoDAQf+SbEyfFjcfM6Mkk
         NxAg==
X-Gm-Message-State: APuU4Z88nLurPbe9SP4nKmCi+sgisNfEffj5+fBHtRQViITcGfANFKA5
	7KPnM1OxWXuWK/jp3O/sZ6Pfcrqyy8G8B7cF7lOEUpyRqPObo1twxgDO
X-Gm-Gg: AYBFou0o48hly8PbKWpNcq1iQvkMH5BdsP8HduSVHjS6sGRXzUpwAcf3J5EamgqBu+v
	vxIZuuhBx4FCI5454q8t55uN5jrtrb4r8aUecxgtilMQwf9rB4H82God/ZYSBcjCK+IUnfCD0Yb
	bKe8LZgfVsDR697ueyx+EF1E9GKYUBXjNNp+G9+2X+cdEmfizJYU7uJRITjka5ha0r5w7Ay752h
	Yq9Uv9cJUd71qpQEujuunRoRfvUR6Gjo9i+Dz0x3c90YHIf85rNFOOoKPZJLryt2qohiWC9DwHP
	AThEJwAzRJDKy1FIOgsz+/8hPmdEAz/t60HrxkzMmW6OJDyXOutSlYsVk04g+8ULv5t5ygRcBne
	nTKCn07lmXNF5GDk122tbL3YrtnE9VOzudxXTxST5qOrv1YDO7E7Wpv3lsba06lS9V73oJiOwI+
	GdKUfoTZvyhPfOaD9ZE8H1aQVc7CLR2sltV9VJR0WrjL+/fzbMoP1Wjrg6wAjaPuSEejd2ATr6Q
	ZMN31C44cbDSnN2tIFLyPnKnuKX73pfFluBmxRu4Lxa4QSG8Lbn5Dt+O9EcDUyllhoQrQIVfGDe
	iVg8g8n1Xfk2v6oXJQxwlLpdng5LxbF4kHs7JuZa8ShNsoYxPM2QwmB4M++Xktv6cz91BKVMQWH
	cPywj
X-Received: by 2002:a05:7022:1608:b0:185:4ad4:3d15 with SMTP id a92af1059eb24-1ac56302329mr19046948c88.1.1793819142508;
        Wed, 04 Nov 2026 11:05:42 -0800 (PST)
Received: from ?IPV6:2a03:83e0:1151:15:c56:221b:35d5:85f? ([2620:10d:c090:500::5:74b3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c2d69asm8999881c88.11.2026.11.04.11.05.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 11:05:41 -0800 (PST)
Message-ID: <aa4f18b3-0628-4f29-8e12-894e53adacea@gmail.com>
Date: Wed, 4 Nov 2026 11:05:40 -0800
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
Subject: Re: [PATCH net v2] selftests: drv-net: pause: Avoid cleanup failures
 for unsupported link settings
To: Maxime Chevallier <maxime.chevallier@bootlin.com>, netdev@vger.kernel.org
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, shuah@kernel.org
References: <20261103190622.3981970-1-mohsin.bashr@gmail.com>
 <4f90c4b1-98d3-4e98-bcfc-d9f2d17b4391@bootlin.com>
Content-Language: en-US
From: Mohsin Bashir <mohsin.bashr@gmail.com>
In-Reply-To: <4f90c4b1-98d3-4e98-bcfc-d9f2d17b4391@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/4/26 2:57 AM, Maxime Chevallier wrote:
> Hi,
> 
> On 11/3/26 20:06, Mohsin Bashir wrote:
>> From: Mohsin Bashir <hmohsin@meta.com>
>>
>> pause_setup() saves the initial link settings and queues a deferred
>> restore. For devices that report forced link settings but do not support
>> changing link settings, this can queue a restore even when setup never
>> changes the link. On fbnic, the deferred restore returns EOPNOTSUPP and
>> turns pause tests that use pause_setup() into cleanup failures.
>>
>> Fix this by queuing the forced-link restore only after setup successfully
>> enables link autonegotiation. Keep pause_test_support coverage for devices
>> that cannot change link settings by falling back to forced MAC pause on the
>> current link. Run the extra link autoneg on/off checks only when those link
>> setting requests are accepted.
>>
>> Results on fbnic:
>>
>>    Before: # Totals: pass:0 fail:4 xfail:0 xpass:0 skip:24 error:0
>>    After:  # Totals: pass:4 fail:0 xfail:0 xpass:0 skip:24 error:0
>>
>> Fixes: cbd8a536cd6d ("selftests: drv-net: Introduce a selftest for ethtool flow control")
>> Signed-off-by: Mohsin Bashir <hmohsin@meta.com>
> 
> That looks better, this patch ran on the netdev CI and no regressions on
> stmmac,
> 
> Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> 
> Maxime
> 

Hi Maxime,

Thanks for the feedback on V1 and review of V2.
