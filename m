Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794329705;
	b=3Djf0mE54KPskyoSsN+Wapm2vnU+dofVEAq4l3Z9ZiuGnAaKK85rtZkOwVcQoqS7p/la
	 gdZSn4xpPkY5p7IiNuoDuat44wZKH6Jo0okDBjtQ1gRIbH/hY3JixPdWPB3q3fgUtOn9Q
	 LcDAG1PWJw9sMY1TRVhfNKS/+1Ap5J+OUr3Jh7nXzGlPjOBohD94OW0Xv5/shyv9duou9
	 G8pZ2r3wzB2UG6A0gUkZ49kZRSsceFNyiDUveHtl7M0Ca4oJBuFtcST1sS1bScSB+NNKt
	 dzp4sEdXxM69lXyh+JyO/FanuRwOSQkzQNdYBmnPrnZzGA5yWkK6XHkgxrsSB2/WkBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794329705;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=r/J1XL/M8NofZn4/v/wPEfCpg6OLcPmfYulknqMzvUM=;
	b=HFrFnRecneRoAc/X4Yu1Am0orLn66i5YkWhDIl2uC0Wu2GsQP3tMqqNSN+ecxCzc3kGz
	 1/G8Y0ERrLT89MDbPHVmEbqncTSFeoaZzEDihtsnJEqTDLvZz4EUb8KyvDC/CSwlBNX2G
	 U7ZUJbDjQhfoq2rKg8SjnOSF95d19cY281XYbBE+La8tDFCNxgZ1Gaba6IlW0+pvebcD7
	 d1+tFzP8ifqr+C30Ile+lX/7utEiEDs8o3NdiM8ntqabb9dB9yefKNMg5VbhMsRFVTBKQ
	 8ZNJrbrndRdYZjZsvM6EmpsS3FGDUFlzD0WvRll10U63D59qJgIxEcoxdxLBjkR4Wgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iQ9MXEHj;
	arc=none smtp.remote-ip=74.125.224.139
Received: from mail-yx2-f11.google.com (mail-yx2-f11.google.com [74.125.224.139])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 907AA606D204
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 16:55:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 907AA606D204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iQ9MXEHj
Received: by mail-yx2-f11.google.com with SMTP id 956f58d0204a3-67a51292ce3so1428276d50.0
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 08:55:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794329704; x=1794934504; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r/J1XL/M8NofZn4/v/wPEfCpg6OLcPmfYulknqMzvUM=;
        b=iQ9MXEHj99R6Za/CnMtjaRwnq8PN5Dw1EHSfCZVwssJsk4YnLOJoks79peXJeTzgPn
         R5r26EzF5+5eSXOIv3mjeK5Xya+e7y9SELgiLIrEoSbZG4m/F1DZ4TrehaJ+KtXRBtT4
         871s0OCP5Yee7408DlzCO/1xf1hLqak4jTbyEXjfh9PH6uhoTUdnfC38UaL4w0PsGaa1
         I6+b1iruk6ZRzuQsaxu5gp319ZDjneKSXTj5x6wfM7ULxuq1SD4QXhp1mBXkXd4Eg2dO
         IDZOICE7voNmZ/6vXCSJ0CU1mTZy7eAXHCYANfpLPIGdKdELQfEiATA/4g6+IX2TyHla
         ZIrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794329704; x=1794934504;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r/J1XL/M8NofZn4/v/wPEfCpg6OLcPmfYulknqMzvUM=;
        b=1JhkvE95wD+juvSirEji3+Gigs5YMCGKrT3Gq8pGY2+UCXN7y7t2/iJZlqsuQC5F0x
         vau2G3snPt/mjEHwDNMsulOG4bCAwSJHpDQQDnEIPbyj3LBLBZOozMexdgrvQn+2bTS1
         MPlsISizSDGUYjsk7kkenchfA55vN6Qag3QatSdHpw8jfiknv36X07iPRnKRPcqTAu6d
         1JUNseRGspBkByrUfvyCJKLTYGXr4G+enDQeTr7xq6wpzVUPrVecvF/0MshtTk+0nzFZ
         vl2H8a7foljYEP1FUVqFgT6V7n06oajyTsm+tQG83tMDnWJVaIUH0mVqe9fMW103nJ2R
         WLzw==
X-Forwarded-Encrypted: i=1; AL+hErGWoPjTZ1bepaHzKgQ0HbLsq3aDEOTg2ob9i0yIv6Uw3Xtd/8mQg4NLeZtgWjssq/S7hT8gInDpBpMFJ2u0R7M=@vger.kernel.org
X-Gm-Message-State: APuU4Z8pzwwzo9cukXRMhVyKD/X9qQIp5vbHUL1baqxWCkkVO0qkRVqc
	E6kO9r9GCirU4So8GrOP8y5UCAhF4If7U3HP453k9NEDipkmE7jU3wM7
X-Gm-Gg: AYBFou3r/2auPaxfEWB4TnAcF2mZFfvSqRfLTWwFoCFso0rooBiq7pRMutl8Ol3lXpu
	FNZ1YCAC1unZyXF5b+lgzmAnLMm/TiwxCgHdeiQ+KHrXRPe8dwt4pSvg/klaQbviaceUJIBXkuY
	VcAALRXaByiVLkOZh8xvs0KhqGftuHDoLIgV8Uqwwy7ySyVhHybKcN/9uX4D6jilsEPkvgRiA+I
	+vlotDdxRGbu6RxcuqyFNTK3grgLHXBAfRP2mL5SQVKBZTyFQ0yzPAS+XQolOg4Kyl2ubUly72F
	MUg9Gtp2n1g4dA4B2KejyidW7POuenFTgJdkPy3epOFe4US0WmvsU545uG6HSptlDBz1kGlIUDE
	wDpzQW2WWHDwW2xacfY5uTIsfMDOWgTcnI7d36BJGweO85umT5SHkpcvSTDNJxtshgEkjFKKXX7
	9zod38/T33GsFvAWzOmrm8uGyeOZkT1OSlBKrW1rMG5St/3K/0EAH5GEkNlAhVXa0oRt9T6a4Uo
	d7KQ3Ihmz0yBvVEaLEowO8YTgEOA7+CvCIuU7lZbhN0FxwwEzFcJiwXhtdwhfHPwOSSUmHntm8G
	r8Jt+W3QnXYpPOZDSPOgEGquDodcNfywoKI=
X-Received: by 2002:a53:ed04:0:b0:679:b810:6df3 with SMTP id 956f58d0204a3-67c568c72d0mr1465408d50.84.1794329704143;
        Tue, 10 Nov 2026 08:55:04 -0800 (PST)
Received: from [10.0.0.48] ([71.69.222.122])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67c589a2354sm2255948d50.6.2026.11.10.08.55.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 08:55:03 -0800 (PST)
Message-ID: <a24bc088-3316-40f6-a9c2-acb77fc9befd@gmail.com>
Date: Tue, 10 Nov 2026 11:55:03 -0500
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
Subject: Re: [PATCH net-next v6 5/6] tls: send a KeyUpdate at the record limit
 and on request
To: netdev-bot+sashiko@kernel.org
Cc: john.fastabend@gmail.com, kuba@kernel.org, sd@queasysnail.net,
 davem@davemloft.net, edumazet@kernel.org, pabeni@redhat.com,
 horms@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org,
 rdunlap@infradead.org, shuah@kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kselftest@vger.kernel.org, hare@kernel.org, cel@kernel.org,
 kernel-tls-handshake@lists.linux.dev, alistair.francis@wdc.com,
 martin.belanger@dell.com
References: <20261105-keyupdate-rfc-v6-5-99b695f9eb4f@gmail.com>
 <179424471332.994134.12793914111732564453@kernel.org>
Content-Language: en-US
From: Martin Belanger <martin.nvme.dev@gmail.com>
In-Reply-To: <179424471332.994134.12793914111732564453@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/9/26 12:18, netdev-bot+sashiko@kernel.org wrote:
> Is 2^24 the right limit for AES-128-CCM?

No. RFC 9147 section 4.5.3 and Appendix B.1 give 2^23 records for
AES-128-CCM, for the same 2^-60 target as TLS 1.3. v7 will use a limit
below 2^23 for CCM.

> Should TLS_TX and TLS_TX_TRAFFIC_SECRET take tx_lock, as
> TLS_TX_KEY_UPDATE and TLS_TX_MAX_PAYLOAD_LEN do?

This is the lock drop listed under "Not changed" since v4. A TLS_TX
setsockopt() during a sendmsg() in another thread is an application
error. Mainline has the same window: the existing rekey takes only the
socket lock, and the records of that sendmsg() can go out under two
keys. Taking tx_lock in TLS_TX would make the setsockopt() wait behind
a blocked sendmsg(), which changes mainline behavior. The design of
this path is under discussion in the thread on 0/6, so I keep it
unchanged until that is settled.

> Can setsockopt(SOL_TLS, TLS_TX_KEY_UPDATE) block indefinitely on a
> non-blocking socket?

Yes. v7 will remove TLS_TX_KEY_UPDATE (see my reply on 0/6). The
kernel will then send a KeyUpdate only from sendmsg(), with the
caller's flags.

> This isn't a bug, but two parts of this text don't seem to match the code.

In v7, the text will say "before the next Application Data record".
The TLS_TX_KEY_UPDATE text will go away with the option.
