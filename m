Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.132
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794329998;
	b=BTb+Yp1SIzGnska3Z0rChZP7UgjPUnSyqeCx776G6/WJfwihwXqLbYb1r6eD7e7r9pjR
	 d4qaV1BIUx4V1sTwuUu8MrIPw920DYbFx9gbh3Y+8sRTxL1Fzedauxe3cvFMaxIjLIPh6
	 b+HNNKK+sZ3M6VT2GULMovHlZSjGbg7OA9WZc8rG7tyM3d/KRd9qT+n1FixpOXgiXWGTZ
	 yyNShF9kdAiFsFxOiMIq8ZA+//zj/VHaCQBnKo2La+P2fH9yJiZIjxmLHBDoUJ+Ke6Asu
	 Wdr4ohjI97tvUAIyYOpKqRaWIdeArUQdB608+dcH69hMK+1Bvf6uBcQOsK8MFJ60ciA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794329998;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Kf7w354TnqYFz6mNyIxqofoq3s7JBFyBYZ6UqKXQCes=;
	b=sPs4VNJ4DJOsRI0LNuPCxgRThytxTVh25zBUvGMN0H+y2C4Ndf2HnyeI2JrzQg8fcbye
	 tMUz1Euy+e7Y7i7FOvcLzkZ5XOIokgt/eMTUUK3smjhZ42Nd4A9c+wEDqPv+xc51OMAYp
	 zFtWRRNF01B9sUHnDMaD2CA35zIOkjwLlCwUI05sd/kNF5ux2zBVTSeuj1AB7u8tnLI6b
	 lMgwzZDelvGZJLMrLq8io5NSZHUjCUXygaqicBnWN+QzoFzQvTcRVt4OkNCMKWHoQK6gp
	 h0PzdB+n6mUh5YROdb7tfOSYm7r2CJ8TR+iR+cxFKQsvz27KgT2CpbcBe3pz6OjOFjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="VMlRc/dY";
	arc=none smtp.remote-ip=74.125.224.132
Received: from mail-yx2-f4.google.com (mail-yx2-f4.google.com [74.125.224.132])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13472606A333
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 16:59:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13472606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VMlRc/dY
Received: by mail-yx2-f4.google.com with SMTP id 956f58d0204a3-67603b254bbso482766d50.1
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 08:59:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794329997; x=1794934797; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kf7w354TnqYFz6mNyIxqofoq3s7JBFyBYZ6UqKXQCes=;
        b=VMlRc/dYo0gG+xfLo/0j8ixz2semg2ZuvI3E8PQY+x4HxTGob782iCF9vJDNiutK3/
         cybGhnZmlzPzZ3o9Dx2IZMw06MVNhJS26tA826PS2yNQiQc+i1Xz+laPs3C5xf6uTRfx
         E9iARkRgmd7apWFoaDw0aSKRaohSqG3oHo+EyOSf8CFEM31Sk5iAhgjyY3NU6lwlT2DG
         2CsbJr/caRHdjZi+TYdtEY8r6vjtFqO+XkM8si4qQDTYLLTw8LYznx6kmOMxt1YLo7qK
         X9YaQ7p/whE9IuG6a5jrkTuqcLQgiKCiq7OqnQm3H+oqDVLLodeSQ5PWXxVYZPKmSiAg
         oQHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794329997; x=1794934797;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kf7w354TnqYFz6mNyIxqofoq3s7JBFyBYZ6UqKXQCes=;
        b=uNw+hZvJyWrpubP9yam4pwi9wjviP2ElQTyLF6gNxvCuKHPoHbIRBEfOts+4q3ASc4
         1xNoleXrpXeSvSFov7SrAZxUn3RI64PosirjDHWAiPZWE5R3UHVrnoLkHY4mbvKGb/Fu
         cA4D5EKrZRTWR50FstfnGqUNy8mhyA/C9qy9vy+JeCy2IBW2rJtc1UfnqaO6moid/Hfb
         +Lx+QUVd8lqlfzzYvUlG1EaAuzQiY1USktufA478Ldr9uS8vR9bCbP+yaR/FzEqEBJaz
         J1NgB2cDhTLlNVLy5kJWVXJ1M031UGlgTEuZLjZp+IXBXi2BI+yYJm1gRL68RfndmDkQ
         FnKA==
X-Forwarded-Encrypted: i=1; AL+hErF1toVc+pBrZASvvhHWa2u0luf1EAKIdmHXVCOraNpUREenqvuOSdvMXru4AH7zm9zYya77Ry66zxR+v+W2AW8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9GX7L+yFx/D8Qa64QRsfC0EJq1WMskGbwXIyXnDFsox2uCFgoF
	rG8CqatfBDmx/l57wsgkhFYw2pcrU1O1MQnfCT8nJQ5gIirwsE43JX5n
X-Gm-Gg: AYBFou09RB6JDnQXhedZmtPWUB8uIxRgyPliZyjzuVNlrHJXWV2HkvwI/+UtSmKUd5H
	p7lzvcLb+KnQcn8kEEACp/Cy7UAMB7pfLcIcpZpJQnIKJgz2nKEJRnO/QeFmFF+78q7qem8s+XV
	n8m7aH25ocbpIgCybiFDg+/d8wOZGMxg/TbB918+PeigRRF1trYHyaN1+7QFjPi7yPdnfNAJUBH
	yo718r9eKW7R2S3AUbrbkSYPEln44VOc7L5cyc+m+t1cHzu8fdKuludHCAL8mHXVRnZSGdrZTRK
	VDLVa4/KQKqgbz2ixpQvEb8cjYzqCE77N6jkwQn/waeTWfnWTo4jggl0iXDseCUFk8M4L7mnw4s
	o41Jwt1Ital6Yt+6BGhKkXYq04yf6ebGa+Yla5BSPgoWbGRDbZ85/gT1+YS2JjY2YxLnwm07W+a
	74c3gjoNqJkZKntrQA8Z5MzEkVhc9KoIbfKaGJzazJ3RB3HjW+NaZrvl2pSX+g+Vdfg2U4AuFLl
	d5GbeYjwmrwUxZjpkazSzQJ7jq8g1Gag3fvrFvXdfzhBkp8E84DRKxf/fIM4V+hBx12fI0ICl3P
	DIdr5OxfPN4KSIv1w5t4wDe0gJFX7p5On2k=
X-Received: by 2002:a05:690c:e211:20b0:8b0:6d2c:1895 with SMTP id 00721157ae682-8b392b410d1mr14729287b3.32.1794329997081;
        Tue, 10 Nov 2026 08:59:57 -0800 (PST)
Received: from [10.0.0.48] ([71.69.222.122])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b393b2e455sm22746087b3.41.2026.11.10.08.59.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 08:59:56 -0800 (PST)
Message-ID: <85e09745-7bab-43b9-9982-4428f5b61750@gmail.com>
Date: Tue, 10 Nov 2026 11:59:55 -0500
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
Subject: Re: [PATCH net-next v6 6/6] selftests/tls: add KeyUpdate tests
To: netdev-bot+sashiko@kernel.org
Cc: john.fastabend@gmail.com, kuba@kernel.org, sd@queasysnail.net,
 davem@davemloft.net, edumazet@kernel.org, pabeni@redhat.com,
 horms@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org,
 rdunlap@infradead.org, shuah@kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kselftest@vger.kernel.org, hare@kernel.org, cel@kernel.org,
 kernel-tls-handshake@lists.linux.dev, alistair.francis@wdc.com,
 martin.belanger@dell.com
References: <20261105-keyupdate-rfc-v6-6-99b695f9eb4f@gmail.com>
 <179424471492.994134.1896421329544039632@kernel.org>
Content-Language: en-US
From: Martin Belanger <martin.nvme.dev@gmail.com>
In-Reply-To: <179424471492.994134.1896421329544039632@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/9/26 12:18, netdev-bot+sashiko@kernel.org wrote:
> If the AF_ALG hash interface is missing, should these tests skip rather
> than fail?

Yes. v7 will skip these tests when AF_ALG HMAC is not available.

> This isn't a bug, but does any test check the next-generation secret,
> key and IV against an independent calculation?

No. v7 will derive the next key in user space and compare it with
getsockopt(TLS_TX) after a KeyUpdate.

> Could the test also check that a KeyUpdate sent from cfd now reaches
> user space on fd?

Yes. v7 will add that check.
