Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794242623;
	b=Zgjcctq/ll8tnJYkK8WbuIdorUcLuk+FjBd814dNSzQhWXr0wf8CRXBTAUz694bd5Js1
	 2xhRxuR/oGvz/dPsz6suClvMm2DR2CcMSx59ZKCmBIm9jpEjDOhiuyOWrdSJ6spRPpppA
	 ta4QWbxAQ/cY3xNjj4iNncvBYNByrXuEuPB9+gWcB2oS3e6gYe5Lh35O4wPnMFLfcP7YL
	 So/XO4BCGLp7DFif2DDefGNasCCH4F6bWFJ0zNRUKJgXHclzp99DB2xvB8DBFxEKlafRl
	 5tSyc86LLPUsrKia/Fr1CZ18eJTIlOsPrjDAqhaHFj7W66ys2iMblvpy/846tgtE6Xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794242623;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Content-Transfer-Encoding:Message-Id:References:To:X-Mailer;
	bh=cTcx+iYQEwQqlDWtvuitNRUigxF9/D90op7v+uRHdIo=;
	b=dZoTSgsHJBq9G8y+4Kji1tz47RtZ8hTp+zrM3VwQnMJ/f1CYd32/jDEMewnhYqPEwwra
	 DaVw/CVAKuBM36WFg9wlwwHz6T/1bKtbcaB+JCwTv7Tjh3jKYCg2FyGwvec7uhkzU/eUI
	 Uo1eJ4ig/n25kG+Zdt5Y3vyx4UzwJ24F02UnBRBcI8J6ZOjscT96ojQgI7CcbBndR1Zax
	 DlsCYnwBEFRz1GAE/TEGz3aXV/A8M3zZKXvPVG+F99mM60qU573ctfCGfIGoSbYDPxkCI
	 phF54QPoLulO6cy3YJm3V2j+rU0FlrCZzRDknvyNftxQLqsWzabNMiMNA951jmsmWiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="K/BCf1Cc";
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D032606A333
	for <linux-kselftest@vger.kernel.org>; Mon,  9 Nov 2026 16:43:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D032606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K/BCf1Cc
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-3712b6d9843so744257eec.1
        for <linux-kselftest@vger.kernel.org>; Mon, 09 Nov 2026 08:43:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794242622; x=1794847422; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cTcx+iYQEwQqlDWtvuitNRUigxF9/D90op7v+uRHdIo=;
        b=K/BCf1CcnsbXSn9afua9y6dCw1fhSD50tx15jtTyJSp6Mk6ALw+eZxpNTvhTCPVolO
         4RrA2wNZS3czpBVR6OqVHo0Iyx2vrY/tlhd1/kMAIGH6GEZ0r4NG4CU7sFNUEV6tPyjK
         ADdkObIkw56597yAY2xrIgg2QNQz6i8TKD4jPnGF6rCxhHTRHkgazvdPnyd7WFylvxaT
         gLAiq4bOZguDFEc7i4+5N6hm3VmXkv+BoN1iaWv6PN2swkzOhaOo92J7BoEMGe1zZTrm
         49n7kc6/a5Cp2FSzJxx8kIoPngYm/UydiZadvmY/BHHDNT5kVHgEeTc7Co4b2xG8vPKR
         lctA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794242622; x=1794847422;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cTcx+iYQEwQqlDWtvuitNRUigxF9/D90op7v+uRHdIo=;
        b=TDdbR25AuMriZy39NTmP8UDv3RonCvvm3GWDJ9Cr1a6VXWdrguc2RJfFw2rbSu1FzU
         THC0azOSeiFIhVH0mqPLRlCnxavU1ikRHO3JESqMVTwlrCcl9qBYAD7YU7e2WuMER92b
         9ewMoynFrIqi8Gucc9qkH9RIXIsrWZdEcaWTnzWqRaJviQ2d7pbsIjH4qDrq8zVMYzMp
         dbLL8j3mpqUYD4E0h3bF9XAIrvXjjCdk4e9nmkOmqnbDxrPYnEJbJOAhdMHy9BjjsaSz
         NUtGi1BWS90dfFf0QXEDagIjxzses+1Vd+171dc9pRQCCn+CA4S43vFgylH5nQGl+FG5
         QXSA==
X-Forwarded-Encrypted: i=1; AL+hErFjcIWCKxkKcUFFWOIKOT9fjowczKgZw2IeNFSZLeXld6YACL+YnKTfJGJVF2PMKfdY7EuZLiGs+ycRjv+JaRk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8G1Satw7Nx3c4T3tJcLuo+7gotXcpFF457ja5zNp63CYUR9gw1
	llXLTn3g5odVjSPgE8on4ScIQgejBVN4+vwhZGjWAAkK4hGPDxhdYwjs
X-Gm-Gg: AYBFou0uYF1fqDRicGtLCJNwHTdmCXQ0C26WvLR5TrcojqtZV3LEjQFxbafi65SHYr9
	IBGSq4uGBExfsjIbR+DR7X0OX3H9yD8OsVQXMIxHTg48yLGUGx2MaDN33m3naRCAspWsYHcvPgS
	DpZo+yLhN+p4HTg4DFe2cz/gZ13WcMhBsiB5oM6xynpGTO4bUgpfiOAodhXAMoHr45J/nNUr5AP
	gX3sVyoxtMkcM0zfU2Ijuwxz3E7z/Ces64d937cKgWfuqyJkM7CuQs7iEjtF1S6bxRMWIKmvO85
	brSkhTHpwtacNTGjHRq7XVlTaYhlJSUzSUm//oDMDxwUTvl+LRJofFZb2fYIWbQLD6kH2OcOzw9
	Neu8mBu4ybr5j1NLpe1WCrzP6UjSjbUhPI9qv1d9Zvs268dhhtzl2/FKqTuPTb125jn44DtZoDq
	HuVMObhGinwXKtEZtrd2fuakcNl0sKmVeeQlh4mUtquyzWK4fNkRSGFZUFAzhOC9k1jTNKYd42X
	NoOaRA/O/AXWKvyPvdEXwal6Z+XYdKbniHyrrH3bUALIDZHgVnjihupro0Kf3Sk2KJix+6GoOdv
	XYm7x8d5NSf7T/xjVIBCBNYPAhaB8/ytW1V5xx2iHI6qy2IC6z1cuZDUySBN8T9eEbGSkUHd/2C
	O5MvYHX86EZPD
X-Received: by 2002:a05:7301:180b:b0:36a:1732:1e7 with SMTP id 5a478bee46e88-37255e4c0fcmr8052837eec.31.1794242622101;
        Mon, 09 Nov 2026 08:43:42 -0800 (PST)
Received: from smtpclient.apple (v133-18-180-162.vir.kagoya.net. [133.18.180.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-372665db733sm12958545eec.23.2026.11.09.08.43.37
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 09 Nov 2026 08:43:41 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.12\))
Subject: Re: [PATCH net-next v2 4/4] selftests/net: packetdrill: add TCP MTU
 probing test
From: Esko Mobius <echoowall@gmail.com>
In-Reply-To: <CADVnQykAX6Fw8_86emqtTUDWgFzRd_jXTZKdDJLb0s8AUmfUaw@mail.gmail.com>
Date: Tue, 10 Nov 2026 00:43:25 +0800
Cc: davem@davemloft.net,
 pabeni@redhat.com,
 horms@kernel.org,
 kuba@kernel.org,
 kuniyu@google.com,
 shuah@kernel.org,
 edumazet@kernel.org,
 linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 panweiping3@gmail.com,
 netdev@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <93CEDEF5-5204-42D1-AF92-C63D64546D31@gmail.com>
References: <20261108-mtu-probing-series-v2-0-355d6490c3db@gmail.com>
 <20261108-mtu-probing-series-v2-4-355d6490c3db@gmail.com>
 <CADVnQykAX6Fw8_86emqtTUDWgFzRd_jXTZKdDJLb0s8AUmfUaw@mail.gmail.com>
To: Neal Cardwell <ncardwell@google.com>
X-Mailer: Apple Mail (2.3901.100.1.1.12)

> AFAICT if we drop the tcp_timestamps=0 line here (so our SYN offers
> timestamps and the scripted SYN-ACK declines them), the script should
> pass unchanged with patch 1/4, and fail without it (2072-byte rather
> than 2048-byte TSO packets, i.e. 2 x 1036 bytes). So I'd suggest
> dropping that tcp_timestamps=0 line. That way this test also covers
> the active-side part of patch 1/4.

Thanks, Neal. I removed the timestamp override and updated the commit
message.

The revised test passed with patch 1 in all three IP modes on x86_64
KVM. On the same net-next base without patch 1, all three failed on the
first data packet. Packetdrill expected 2048 bytes of TCP payload and
received 2072, as you predicted.

v3 has this change.

Thanks,
Yongjian

