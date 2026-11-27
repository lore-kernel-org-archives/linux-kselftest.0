Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.128.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795793204;
	b=aPBE6y5MedZqXetv26WG73gh03Tfnjy3Ko0wVRQofvG6+QWTw/hRCD9ip/qRcCMRKw1h
	 mcP/bAityPcwOMZhcj1Pm7Lvv8f7W7X00YJS8qbqT2TXYd2kUiqVGS/siYD1lSMQJ4ggj
	 INSB3DS0hPcnxzbNbqJlfZEp3hEyprwiYvXJBaCdUUe6QBTzLwa78vR7JAtWTvezLT2SK
	 M4CduAc0hUL9qL+RXZ1sjyuKsPKaWHv0NJoqHBN01Gm2y4glXmw3vCstSVgN7wmvvWEnS
	 frRjlg+zgq3H9bx4PUhb9j80CH8laB5FX3s2qNkdcQmWgcrX6d+5/ULnQ0nuZpWwDyg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795793204;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=+cNaFNq+h0C98G3vTstsz5kW6XsnAXUPToskRbu44xM=;
	b=00EOObCcftTQ6xgIGMPKtBUzYkxXSPpoDwqs4fw969nMFbBn3hci5UwA6A+3VDtrmCiX
	 I8Bp0MbCFRa86tB8hIWxDJJKhhUsA2zmeHYnGtdNivZqy2KE1f1KLGv+STV73NyF1fbH5
	 yCim3RCNRstWUMZcHlEHB2Jj7vsXc1pt7kQbyvpSN5NxHmpV2CgtbsF+U4pmhS0cZemUD
	 zOQXU5N+zJ1pr+e1q3Qmh4TNz9DBf9WgxdQg5i6K1E2Qetu5YceufBZQVZHBv9hstuSp9
	 C2RvFXa2tFuQbcKxtEoqNFzH9L4mzXm0QJSJ52RR5jdjCyX2aA4hGtbH9H07mVlptQw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=n94mAkyJ;
	arc=fail smtp.remote-ip=209.85.128.170
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87564606A31E
	for <linux-kselftest@vger.kernel.org>; Fri, 27 Nov 2026 15:26:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87564606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=n94mAkyJ
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-8b51389f58cso88865377b3.3
        for <linux-kselftest@vger.kernel.org>; Fri, 27 Nov 2026 07:26:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795793203; cv=none;
        d=google.com; s=arc-20260327;
        b=egTRUg4FbN590URUTU8u3mcqjQBj3YdQsCvRdiqTCvzB6rPJCQliqTRhWtzh3Tj/Pw
         hNX3YRlzl1GsKbJRIl+6z0CEvGsdr2kiKWHLUp/Wm7QbhDkRgYFO3VAfk2awu4ufjvqH
         LfTeZVtKcIGgl8iIFtGszBsqhYdIV8cXyh0XniF//zCKsbIDf+gtTF5tSruILxiFtYTy
         WrA0NNiAvpEzovyA4hAmAzVfp5J2o3c85FB+FqIF0UhYC8F4wqcpniGjyOEhvaJ1hMjC
         SQrj1XuqGhMEi963H6ShHwQgg/Ls9vu6lI4/ub+2gLwhSi9rsi427bSx5ndoDWvL9YeW
         IpBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=+cNaFNq+h0C98G3vTstsz5kW6XsnAXUPToskRbu44xM=;
        fh=Kw7cuvzf3otRZV34pkihaobQvAnnY7zJgnGeRBV6RiE=;
        b=diKoBEKNTDPKu6pvKhBQBTj0SggKamji8sCUIj/4jh03I5MJm8CwjNmiX/0QPPccg/
         m9hmexF068bfI413teWXds0OKF9LXGOy6uT0gZi8apghzwxsa6VCHlvsDg+BeIAmnkdh
         QFYOYFx81+Rzv0ycIPQZbPgInaSa5v1Vhh7GzKP3eawn1l69yS3FzyGb4D7VuBnY7vD2
         kPVIRIla30b0c6GhFnPu/9d7Bvz2NgZbytzF50nmxwk1QQPTiPloqsm8r9O/uV1cSt45
         qOs/FKRSBWgWOUPhmiUwAjCh89b5Kc4bUFFK4obUFYaGwYSdCmsGfIipnSK1L0kZVsdv
         zuTg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795793203; x=1796398003; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+cNaFNq+h0C98G3vTstsz5kW6XsnAXUPToskRbu44xM=;
        b=n94mAkyJOfvvvFdqyDtEpzjXrweT8JaZWeLZ+JYOiBFDDuYaMPknPGxHUMwIf2p4QI
         XbOKYuOKTdVMFxaHokKbNXTGDBUktL/B8JSyE7b6YdHb/W74KbvW6rbiCZmnIQlF/i8I
         ALou6ktP1I5Zbs41mBTFycRR8rPWR02G+g/k6UH6l6DD/aedUb053tQ5jkZ91GKvmJIw
         67G0iRK3SJp9Ne0ESx6cqkBNNWwucbSzu7o0e1KmDO5YpJZRB7LNyeyOHGcjxEYRPjwa
         qp45YwL1Q5w8yIJrLzHHQk7QAC0knp49PvcDTYRwISeZGMmOYrkYRgoOL+1gkc/Fe8L+
         ufMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795793203; x=1796398003;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+cNaFNq+h0C98G3vTstsz5kW6XsnAXUPToskRbu44xM=;
        b=0UWV9tV/uNj8T3TAWCskV+tifcdU8qfHPySzy4J8exxNQds0TqhyBWsGRUttyPMolR
         JRlavz5Lmz7Bl+rOpFcEAb30vPCh1ghUizf3UF5P1arKjlwUv/6htBFxTU+7nVHv/+RN
         Z5E+y/YA2iJGGoagqxHVlogVR76k3BOSIaH+VgPOnRN0oipTcQ/e08NT7hx1M4w9/HIE
         kKRowvZt/T9FiL2H7FfHxlLHQXVnHYCqXTWgk9p1D/dwdgngZnMklrrj7IVaFDoXJGEc
         BphDpy4UD+etXc3uQpjzqm/zxANx3gHxwtzXvwPrC4653GHSmrUaE6l/6pKqEezqCE+L
         WgZA==
X-Forwarded-Encrypted: i=1; AL+hErG+KVw9KCM/SRlGyzoWp//57vUPQ8e7r6iw7qq7+EYcMV5wTBHyy3YmgJIku/PtDLTBFXvvcJcaUpztVA/et3I=@vger.kernel.org
X-Gm-Message-State: APuU4Z8FFZ1bY6dgPVs+lCs9qFWU6THRi9LabMi/Y89dXoKKSX0K1Urh
	N2ETb+D/Q3aQJJKqMhE0z1jPcv9i1Urh6tbDYCuaIuUP2qu0eJhE3igO7Ubu6a2R+FoUqM7pHfC
	H8YKIp7b040DvAz6Z4g4gGCnR3uGJuYNKvY8JnbQO
X-Gm-Gg: AZFdTZcnYsu/dbhFPqAVqZpOCjEqf2IvQo3s/KPLpH6tBQtSW2K1/VqAOZEYiWuwItV
	gL2vI+2txd+DM5h8a4Alkv9Gq9hZ+n3oHJNNCVKl5t09w17lt9oCGNTb1k+HS17BLB+vK2P8XE7
	NQhLGZhhfPxWHYJkHOerpx4d8RPPrseqyb4HLNZt47a80LSyBDfq7qMHw0LlMA2EY9MOszFI0ky
	kS/m8HskGxPE7Qbn/JEBhw3OrzcsAe+VKrF/GUbVlDSqUSN3KEoNTd/44vSfjlSi7zpZRkc9ZTn
	kXiLE/kpuZB6RljF57RnOtRAL6P5wfGkDfOpqE4HVpfNV5VFg1x0ukGYvkKJJP8ZtOb7P6g1cmb
	U+7HAglF3oUcKIau5ptiS22Og/91IHOJFEdOUjq27oK5qIj50UNavOQMc7W0rj3Oj3f+mLeTC18
	3XDbveSC03tIWckdpM/nUhhv4LSPvflm2WMx93NWE4Ii1kAXASxsbN3IbRENV6tvjsYpaUa9U9u
	MfY8m9639MC0lKxu+9bdBQoOs3UIEZIZdEj/Jmcf5B4Oa5UO0gRCVaIp+pjeAvtGJv8+5nfXFXP
	1bZmIIR7YU7U5oGTePIBYPR1EkqUgcfMBdVw1BMsnJfTDGi3gSa+F/e5VD8VFWQkgq4dzGL3UwQ
	6N9zgKTYLmj1ojL3TOQ7SNOmTbO0FvZ1z
X-Received: by 2002:a05:690c:698e:b0:8b3:45b:a4f3 with SMTP id
 00721157ae682-8b5204ed736mr106681927b3.83.1795793203488; Fri, 27 Nov 2026
 07:26:43 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1795284858.git.julius@bairaktaris.de> <7c74b2076dc7dee1d481d39a135e0946d5e04145.1795284858.git.julius@bairaktaris.de>
 <34e77fff-c57b-4ed0-9035-b9682ad3914e@redhat.com>
In-Reply-To: <34e77fff-c57b-4ed0-9035-b9682ad3914e@redhat.com>
From: Julius Bairaktaris <julius@bairaktaris.de>
Date: Fri, 27 Nov 2026 15:26:08 +0000
X-Gm-Features: Aa3M54pxMqgZ_s-9JbfNek_3dyGz87LXsEraMMuneoiDkKTrHn3sKg0m5hARvDM
Message-ID: <CAC1t37L_+P72w+gNcrdphB7xkBmCQp5PQRFpcu1zqM1m-2Am+A@mail.gmail.com>
Subject: Re: [PATCH net v3 1/2] net: keep the TCP fixed-ID flags on the header
 they describe
To: Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@kernel.org, 
	kuba@kernel.org, willemb@google.com, horms@kernel.org, andrew+netdev@lunn.ch, 
	dsahern@kernel.org, idosch@nvidia.com, ncardwell@google.com, 
	kuniyu@google.com, steffen.klassert@secunet.com, herbert@gondor.apana.org.au, 
	richardbgobert@gmail.com, ecree.xilinx@gmail.com, andy.moreton@amd.com, 
	alex.austin@amd.com, linux-net-drivers@amd.com, saeedm@nvidia.com, 
	tariqt@nvidia.com, mbloch@nvidia.com, leon@kernel.org, 
	linux-rdma@vger.kernel.org, alexei.starovoitov@gmail.com, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, eddyz87@gmail.com, memxor@gmail.com, 
	martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev, 
	jolsa@kernel.org, emil@etsalapatis.com, ihor.solodrai@linux.dev, 
	john.fastabend@gmail.com, sdf@fomichev.me, izaiahsun@gmail.com, 
	corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	shuah@kernel.org, bpf@vger.kernel.org, ipsec@lists.linux.dev, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Ack.

Thanks for looking into this!

Julius
