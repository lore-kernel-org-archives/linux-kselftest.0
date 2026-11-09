Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.67
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794248960;
	b=Bms6FOAWIcQtpx0Ehq7zUizm/Lz9XbWwo+Yrk64Q8c/9111F4eH1vbBoR5eJsg3pOODs
	 8Y/2sOjtKmbgY1Rm8hjJiUJgyEOocNY1ZDdXsHZS4LtXJklix6/v4iWscs7YFZDdZrrsw
	 ZlvGq8eLVFmdFZqOBEn1Mu6I97Fh+bud3pFRquGy9QQtahvk/2ItAXOc47s4QXrU2rEj8
	 uJ9zC8ojd1DG5f7s+d0xdWkM2imFcTqksPjJZA9YFn2Wbb5Y7j6InIkIObhVHDW2bZkxv
	 fryDlLSVrIURW5OcEVQ/625/33XO6cCGvt1Ld3FDxegX5Ab1u9EFYCrypAhU7FBxXvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794248960;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:In-Reply-To:Subject:Content-Type;
	bh=U9tBWhRBh3Q/NIaZ7pvcEWgchBntJxEwV8o5plMJv5s=;
	b=qnLXogs4Ayxzeu8psD9uF0wMly3KmZKBPSp/s6b08rbCUUvQTUOxoKiARS7wWOVI3PwK
	 kHWv1K7VjqjgQjWXXjnfWkRyaL0kg5CqWMuN0J1J7fnT8hfAlPuKJZ8CsRnoepOOCUzQF
	 1qG6lY/1QCjF6iRDNqRKGEUwd/G7TqhbzlX9QeTksdSjBuS869ORGy64MFuYRDC9/etqP
	 0TZmzysi6Qr+eI8w2sw5XNk//rNyw1hvasV9TJ9alXR1tJPPT0BWblKle/BB97x2NWBzF
	 gpaRKI6By7KSAAkaHbNBiWSGTOG4VR/d/uJWGh6fKQ9SfTNInEacO85B/UGjx4XOqaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H+g8qHTx;
	arc=none smtp.remote-ip=74.125.82.67
Received: from mail-dl1-f67.google.com (mail-dl1-f67.google.com [74.125.82.67])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB7C6070EC7
	for <linux-kselftest@vger.kernel.org>; Mon,  9 Nov 2026 18:29:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCB7C6070EC7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H+g8qHTx
Received: by mail-dl1-f67.google.com with SMTP id a92af1059eb24-18818daa3e7so289840c88.0
        for <linux-kselftest@vger.kernel.org>; Mon, 09 Nov 2026 10:29:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794248959; x=1794853759; darn=vger.kernel.org;
        h=content-type:subject:in-reply-to:cc:to:from:message-id:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=U9tBWhRBh3Q/NIaZ7pvcEWgchBntJxEwV8o5plMJv5s=;
        b=H+g8qHTx/1ABTl/J0fYJk8LmReb6tQX8eqOlhMogAupx8Y2+3vIn0oTm0tGGP3USEg
         MA79rIdUVkkQHJXzuMLCwiNGH03XRFTZ+Whl3gw4xKlMuZlAPwQyFzIPepp20O/9tdOB
         KO1p8a+HMsYkPSqgOKZWOdnuvMyJ5CNaLDPKYW+7pUscM02XbPSQKdNsKpo6G4voGoqO
         etYxNNkqRu2JxRmdlye1zTQpLJ1Ky7NmprSAuY1Qi2sxsYn6G2QgweRAAZUTpwEioysx
         9qNKmpiIRCgofwmFJkA6ZJe1qLLExTiwsj9Q1sIOpWgHuBNztIMr7nT6sdM6W+8SSeQb
         bF0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794248959; x=1794853759;
        h=content-type:subject:in-reply-to:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U9tBWhRBh3Q/NIaZ7pvcEWgchBntJxEwV8o5plMJv5s=;
        b=q/DQBzJ6zW+NUej99Vm0xF156EqR53wW/9er4njAxAOZ81xycIG0wQ6Laj3ZKjkiOU
         KtcbefULVyAXeriyz5ohaCbWF5vY1q2qLkLj+yPwR0/SCp+cdYcCViKgStJEHGVWOvxD
         9ZR82JwnoiXNHS2l+dvKQe7+zDhcj5vLXhZJQ7yjv411+tPckUmF308RQLLKwzGIweTv
         xFoHikQNPwsWtGkUxHf+kTIGzZUYYnsbtDCLzhq2halb26bQcQn5USy3+RTR9vwvCNn8
         QXHDXnZzpvY8QxJRaIJekff0SrLptZ4nzY68z3W+b5Z+P+Ena4Q9Nv1yodDZlHqFs46U
         u2ow==
X-Forwarded-Encrypted: i=1; AL+hErFkX65iflamXm+S4LblSTQ81XP1bApdf771mA0/l70h9vpZiamSxdcEl1AQeDwITeN7XfeUehXhCV3vjoOMGvA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9k8Ug/RFN+T0NgGYcS3oI47bjmcGHItHQmtS5vCn5Ptb8J3jdl
	xVC0bNAHqsO8ZCzKWOxzxpH1QOlFlfqpQQYB6gTsaVjM8PMCbBCxVA0D
X-Gm-Gg: AYBFou1vPwRgTdn7YSTDGLEBfRnAZYdaVRQq1yOahvXs2KcFnBFn+Np7M+eiXXQER7v
	mpqgi81InX+TBkGm8QTWjDnVeXJqNp+qn7mpIa/Vk7MMA3M1BaWt3xhSV8ogzY6R/2LiIfa/oQA
	FO/9uhrCbSP86PIe1OkphS1QhGjDmaXSk600wMSUGksnHouR56oa3hQ7v57xYDukIDbxd7cIDLY
	4zsQ5houu3Nn4D9PeYgyhjYoFEmMCGwGek15YCn0EZJS558Ei9Thwargn3YvWsGsp+Px5u1byg8
	nt7Rn+hbT1nDv6O3NkVsaOvv+Sd6OiVQcrNbyTaW83SEviSYlzhO7FPIiEDHzEUnTt08PfBb7AG
	QLE4zXhw2XZm+vTsHWRzXXKtAc5wUEqjLK107VkMY6oJsoxifE0aYModkJzbN3Vhmigr3Rkp27Q
	7xKAywoxHftRyMvaqXX4igeA+mLCan6u3hdoNi3EGuloP8oauWkiWtmImJscCpYPOkJFdGr5J0I
	BozGCvJXp1clStbMpQljP2LDX5l4RZS8Lc0TvtKneUlxw+P+kvSsKf+cM+TUC9qFiS5D2k65bWe
	gyIQZrpi9DVP3I/nN6axYk4Dquy+63dPpoqawPMDSoSL
X-Received: by 2002:a05:7022:5f0d:b0:194:e9e5:11b0 with SMTP id a92af1059eb24-1b3b5e27137mr363920c88.14.1794248958814;
        Mon, 09 Nov 2026 10:29:18 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:67::])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2eeffsm684335c88.9.2026.11.09.10.29.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 10:29:18 -0800 (PST)
Date: Mon, 09 Nov 2026 10:29:17 -0800
Message-ID: <08dc804d3ce9bf9b8a1c0193ee7443c5@gmail.com>
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, andrew+netdev@lunn.ch,
 edumazet@kernel.org, horms@kernel.org, corbet@lwn.net,
 skhan@linuxfoundation.org, rdunlap@infradead.org, michael.chan@broadcom.com,
 pavan.chebbi@broadcom.com, saeedm@nvidia.com, tariqt@nvidia.com,
 mbloch@nvidia.com, alexanderduyck@fb.com, kernel-team@meta.com,
 sdf@fomichev.me, dimitri.daskalakis1@gmail.com, almasrymina@google.com,
 dtatulea@nvidia.com, bobbyeshleman@meta.com, asml.silence@gmail.com,
 daniel@iogearbox.net, razor@blackwall.org, leitao@debian.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rdma@vger.kernel.org, linux-kselftest@vger.kernel.org, leon@kernel.org
In-Reply-To: <179418737922.994134.6838913010792422653@kernel.org>
Subject: Re: [PATCH net-next v3 5/9] bnxt_en: set the netmem TX frag size
 limit to 32KB
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list

> [Severity: Low]
> The commit message says:
> 
>   With 64K pages it lowers it, 64KB frags would otherwise wrap the BD
>   length to 0 with BIG TCP.
> 
> Isn't this a bug that already exists on 64K-page kernels, rather than a
> side effect of the new limit?

[..]

> Without the tags and a note about the dependency, stable kernels on 64K-page
> systems (arm64 64K, ppc64) would keep the wrap. Would a separate minimal fix
> for the net tree work better?

I'd rather keep both in net-next unless there is clear evidence that net
is buggy.

> [Severity: High]
> This isn't a bug introduced by this patch, but the same 16-bit wrap still
> looks reachable for frags that are not netmem. bnxt_start_xmit() writes
> every frag length straight into the TX BD:

[..]

> BIG TCP has been enabled in bnxt since commit b6488b161ab2.

Ignoring pre-existing..
