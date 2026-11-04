Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793804852;
	b=gsNOk8P/2PP84qr4i/4/I8vxrv0H8wEEk0CYqcAehD5Exgkay+vAqmLnPdmyo0xnRp7B
	 egUhioqlxEbqyxZdk5nJfjSKTqugFRJM5BuuacMKMsUArp+llOCLIfFrskbSzbC7n2OYi
	 i9P4TaVbIni02b6Xxv/WE0/LSuHj6x5/McKfBtkdT4KIIQgpGYTkZbpuCOquFP9bKG37T
	 hcjCTujdhj9ifEs2Ht4glG/yH93PbkoyS9Z5tovvjEkrFzYf4Ns1YAaUhwrocIIH/Yab2
	 e35k74kBd533wwIrRaw8DHBI8EuDtaRPs9QoGX7A6HWCNb0ZRG0xD4a7S1DFI5I5k3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793804852;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=SRwwF7d6JKQ+7rZ7FwUD8U4JtRdsbauXUbAizZTDQkg=;
	b=XUEi51MBJz+0KTgax/Mg+tNJ0EEJPm2oJzPwsUpgkreCGmwDOp4iiBJp1JvTrGYHbYse
	 yOceFa/LeTPRXRaJUQDtlM/Aq6PDdNCuFQH6SM5w0Xvqm0+BNbU6gBYGGx5oX0Q46hopl
	 deCTgpdAF5a+o/5TqWJNoIadDrCPAt1BKMt7EAf+SCJHeWzLRB5/wgoKB8+/OqCVRgEZa
	 mTixkfcoacLZKZ4s7PtLJABAmhMtFUGrbR2oTlFPXe3PVo7zeU0Vrg/dNrxPkZCr+MooR
	 a4ZmQYhBnJzhnGkEdtHEP3hHgxCn2b4EqzAxiiu0LjIj/B+1Unt/VAK0kD1sBV49FxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=iaPSO7yl;
	arc=none smtp.remote-ip=209.85.161.50
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21469606D807
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Nov 2026 15:07:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21469606D807
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=iaPSO7yl
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-6e560e00a86so518700eaf.1
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Nov 2026 07:07:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1793804850; x=1794409650; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SRwwF7d6JKQ+7rZ7FwUD8U4JtRdsbauXUbAizZTDQkg=;
        b=iaPSO7ylhtk6kcT1szhbnRBx/7YenRZ2KsqsxdHayRL5Vz46gvSXYRaeg7gflqS6pu
         l11ScjSb8DAMDgP/ohO2M4OIGNXebt0EZL8kwwCzzvNFJbOkFBcA8SXIpF0WxV1s/way
         I5YO3i1tPWzqyR4Oy/2YxxEdtcn+o5sek0iIrFbhGuC+9qtiSM2A6a892R+N4dUE4MIr
         eMTLWEza1A/aNqm+XpJBr6XdL2MaALHkp9Avi4ptspwk20uHIgo7JCQRKZTHO9a1QKii
         MtYUcL2RtxZi3Zo2tedy2Gl9HULVFyt9nyW5u2/Qwovq+xhJC209skaa4pwwfA1F1V1e
         dWnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793804850; x=1794409650;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SRwwF7d6JKQ+7rZ7FwUD8U4JtRdsbauXUbAizZTDQkg=;
        b=qTWrZwymdYC+hKHHAa9+rriJNoZNkoLUJh9kwPBoMmf1N8lxzC8LAI0b2jvXJSPjn4
         QEZeL3uyDGDfyeD30oXLwVvB6bShv5TJO9O8S8VNMJJXwDq6l+36ztSSSppOEMg+Tc88
         u+PX39uopIlDnSZulv7f7+0GKjNfU1p2oVNjZAtv5CJlXEFraP1KmH+3gWoviOsiYV1U
         iQXtiMn5XTb/Qz0NfID9KYSd6sMJNSe/6U/y6eQtMTZYY0XP/xzdMRzTRyuaCEVGjO0h
         +hlhX+4+uSkkBP7qavv7pfFMwdhwM5xkehOhx50ZHOG9sqppWjT/jV30sWUKqZOQdwHX
         OpGg==
X-Forwarded-Encrypted: i=1; AKwUvBwYW4dEDsfHJQZBuHBWST3lGnYA/2FjHI0fuLhWb/bodK++coi0e1iJd++m115PT6joW8BbhSOX6fHOU94dook=@vger.kernel.org
X-Gm-Message-State: APuU4Z8LllpHCDgxe9KJi8ySgIoCMeVEZv3609rb/4k9XH2K2HdAV8es
	fa0vWIGA9HbhatBmSDjFOgzowByawf9umVIezsv9wzcfgU1+1HXH/51zdImqBvZ3ljE=
X-Gm-Gg: AYBFou0zXrRai06bkKnVUCKZFa+eRtqAz15vIVCiLUenZE65wt/eWrf15rZiqpwK84o
	FE0KiBroTExi0xF+yaG4TNNZfachDgomK50sUIHwlGNKBmOnOhmrHMK+jXTc98/ljAapegf4rbm
	NxdjdGxWXGA/9Qdk703pKr/N5BzPa6bOGOILhGu8LyeKJHWkiyTE9lfXt4VVoTjDcTcD3WPjkUE
	IuqZhXzQZw1eNoSo7XpxFP6IUAf+bcoofqo3iHiaCkacveFx30jx9pok6653N0ji9sVkN3LLpY8
	cbKj7xwOrHk2EQNfjF/q1cczu1/y9FCCSC0Vh9JAfq33yCzzVOSLju5EHQwu+dDY4Wl5GRixN9Q
	F/0MfAANqV9RgLzxRY7m3Y6CLOU4yt2VYoMH3UrRf/RACXr6BJ5DiF7MA/O1ybLOIYsaavRAyt3
	jLrDrCHm47jW3vbH4+/DRPmEW1uKxLkawokYJoPisvOyJsIwWf8CDCVzmSHgfMFwNR7AItKmhIL
	7l0PG9yPn6xOWsHx4tWzfwj8AdlhdjGtN8yeTMq0UVoW2ac7+AcIbcVPGU7Pj+PKz0QcUa21ord
	7PeiuyCjQPnsx7LC0+pS+nIgiiCqvqEwwFvQOwRS1LZJeEnRqCp9v3h+TY7oy9SDm7Fq8p4=
X-Received: by 2002:a05:6820:169f:b0:6dd:4f30:258f with SMTP id 006d021491bc7-714f253a484mr9672440eaf.56.1793804849653;
        Wed, 04 Nov 2026 07:07:29 -0800 (PST)
Received: from [192.168.2.38] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716c0cdb22dsm1886033eaf.0.2026.11.04.07.07.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 07:07:29 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: Ming Lei <tom.leiming@gmail.com>, Sasha Levin <sashal@kernel.org>
Cc: Shuah Khan <shuah@kernel.org>, linux-block@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261103163928.641519-1-sashal@kernel.org>
References: <20261103163928.641519-1-sashal@kernel.org>
Subject: Re: [PATCH] selftests: ublk: fix the build and file offsets on
 32-bit
Message-Id: <179380484851.4021488.1650834850006214841.b4-ty@b4>
Date: Wed, 04 Nov 2026 08:07:28 -0700
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Tue, 03 Nov 2026 11:39:28 -0500, Sasha Levin wrote:
> kublk puts pointers into 64-bit UAPI and SQE fields with a plain (__u64)
> cast. ublk builds with -Werror, so it fails to build on 32-bit
> architectures:
> 
>   batch.c:379:42: error: cast from pointer to integer of different size [-Werror=pointer-to-int-cast]
> 
> Cast through uintptr_t. kublk also passes 64-bit user copy offsets,
> which start at UBLKSRV_IO_BUF_OFFSET (2 GB), to pread() and pwrite(),
> and with glibc those are truncated to a 32-bit off_t there. Build with
> -D_FILE_OFFSET_BITS=64 as well.
> 
> [...]

Applied, thanks!

[1/1] selftests: ublk: fix the build and file offsets on 32-bit
      commit: 3197517875fdcfae1e9b5a4dcaf35cbbd66c413c

Best regards,
-- 
Jens Axboe



