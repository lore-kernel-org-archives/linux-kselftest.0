Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795434533;
	b=xh9X8jAQHEKFhYn00HNFThN4lvbiu7DdOdYvF+cjIR2tXxhhhVthGH0mVG4XV+RcWAqa
	 JrAHsJlmD7QsVI9fy2G7fgDX+xUcI0lp05ZvZT9zfG2vDp9zmDODeXa8mC1SSupnxjBZS
	 GhgkILRfht9wqRGbxpcnNPKqi2GuZHMicEHOkTd5dHVh79Xl0zMLHULMbik7jJAPJ1csN
	 BSkrRqiCGa78+QliwKhK+GcY5pdrKNj3BSTkBB+WStgQ6RhyObGQKMGSgvzAFpl/6XnI/
	 hjiR5vOychXw5N++6JYK5twsLVZCH2sEEIfFzN8jACTnwgV5LCu+oM0vt2WeFO3fzzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795434533;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:CC:Subject:User-Agent:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=bVLWph7B2WEr3md9baVPpYweSSyWCOp9inF7HhcfyZY=;
	b=P5vUJY82jUPBMK9QISDp2/IjIzn/kkpt8fCdMHbXfDy0RFvmulN9Bas5cv7hJEaH88Kl
	 ydrTBwy1yEEoHQ+rHFOXdAu+Qe0HJLQNbg/egqBFMtA3nTUZteeP0xNALyDRDq7S6k7i0
	 Z98iGjm3gDuURToZLXyoE+aIlD046zEqlYnbGfLI9NKUs0TvnCGEujzABLJJ800Kbuu+q
	 5A2klTPM/zYQAFE15qn4vfItNvfufdKlgFo+EWsMrvBPpwS0ZUxqyhfGF0D81VCyv9VuC
	 1WDzbT1HbOSlMcnFqyTgaO0+Mdol7L1JsnL5r1eAkt3XKyT07zRKolZiiJj6b8ByH5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PtBRx4f0;
	arc=none smtp.remote-ip=209.85.217.47
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 837DA606A330
	for <linux-kselftest@vger.kernel.org>; Mon, 23 Nov 2026 11:48:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 837DA606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PtBRx4f0
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-7cc53938a8fso2211062137.2
        for <linux-kselftest@vger.kernel.org>; Mon, 23 Nov 2026 03:48:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795434532; x=1796039332; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=bVLWph7B2WEr3md9baVPpYweSSyWCOp9inF7HhcfyZY=;
        b=PtBRx4f0zHMPWrKCeYo4jmRaJQ1LN5JSKPTl8SuaDwwGOylL4gwkeWZuRFAir8i0Oc
         XB5k0mzLRktyLJg+vl6aem4aZ3S0217Q3kedU2XJ6a+Rx8VhSCyQSgIcPtDw+IP9ceJx
         J7XQA7M2DQ9QOU9CoOt65NNP+M3zGNqHutwCOtJDBV4E2sybFUpiotdRZ3ia/0Br1aW+
         VZ6Kom8GTYEPap127qiISr/1UNfo3AcD6EfhKm7hnT7W26Ny4mS5A50oLqj7OTJQAqFu
         fZ9Is/5bx67lwhC+m4nxemqFdjv14gTMpbZYwWIzCosqHuaHMYyuL2c09z6O+3MlbY/5
         9DJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795434532; x=1796039332;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bVLWph7B2WEr3md9baVPpYweSSyWCOp9inF7HhcfyZY=;
        b=If1OHUZa8C0acnbAn1sX8LY+1CMJxX8Z3p99g5Kk6/ICoxYC0SahBIzYVoeb7M7AU7
         SjFxJ9TmevxdA9n5f+F5/ZI+NOJ/O91Kb1tmnXXaOg0XuwDCBaLM+JtQ4OWxRHxuRkXf
         akAS4Ra8x5I2/fQDkUb8gUwAiJPNPD3wzXkTLhDeNiYXNcPZSefEiCLgO9VbD6iVx+Hv
         NCkKTmoqfSziQN4aBFFldeyhuOKtSOArZ4P/pPTKgxsrsVYfJugnp3/Bq+aVVcE3BN44
         gH6Swu4K2Ecs9pKxvR3jau6FBzZ02gb0zLrWLmT+D8a9gR/MzqgwIn1tl4AtBoCxZbbE
         hC2A==
X-Forwarded-Encrypted: i=1; AL+hErHI4ETR1a7lAOTmZXQGHdCE+xdpCXyQ6/NGnwL8VGs6EniIQuqWS176KdTtgQD0AF0U/kEHUCZ82XCm0qiWWCg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/FphbrPVryNxCr5n9udix4fXT/+O+VTNv8OIcYFDl6hMn2Gt/z
	camEuYJNqZnEKwP76V2bxVbwqghTiVMT2NKGhL7e3sNevSVH1XKQnkd3
X-Gm-Gg: AZFdTZfBXvBIeVUQ2TFKDK8GPpVIaARWzdRrxAs+dmd0qV7bPTCoD6KGc5b7+5AlJ0S
	POgu39fF1LU4LvSo6u+HlxXW3L2dFIy6VzL6Pi7vn0MelP47zj3LWEH0mLJkwnyg8gWKFdHbh6u
	eIxYp+ztcbP7fGoJlnoNqts26eoI541ZZv0o5s3p+XcMnFyf8Ci9YfHxrzURqwXB5CEPmAj9uvW
	nIVJGB2kcgNWUkufbrZOK7z0GJnFdKIdb0/c5/BEgkQxhL5PxsXJgexwNJrrjALvscca4FMM/P7
	ij/rQ9PJ9TSr4836qssi/qPj+jiyUkIbQVuuonVmSQayaV2RREcHnJ91ZoM3KNut6+ttBzlwB9n
	Fv9I/kWVI/GVSKG4ut2TiwjX0MxlR8+rxgfD5yOGzRTZRl6/dWMiYEZZ3hkYlB/QQ+S2fAlGAot
	tpcy28gfyBKKo4IFv7Jdc89znPxjP2Gw9ybje+LB3HJeqiDQpn1jGrgS9WvU+mGWogBdkBdrwxN
	V7/N4PLKl7htPyEllBKggbpPuj5CPGIYS2KIDOCwZwnBHa5qOu4L0bk/RYskqzoP3dPyvBaJYDP
	sjRtvSKe7RmfYMfgZYFGHz2J/8/7hIZZrsI=
X-Received: by 2002:a05:6102:374d:b0:7cc:971a:61ee with SMTP id ada2fe7eead31-7d7393ff678mr5339224137.10.1795434532277;
        Mon, 23 Nov 2026 03:48:52 -0800 (PST)
Received: from ehlo.thunderbird.net ([179.181.85.100])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d6e7f92680sm11676646137.5.2026.11.23.03.48.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 03:48:51 -0800 (PST)
Date: Mon, 23 Nov 2026 08:46:43 -0300
From: Felipe Stival <v0idpwn@gmail.com>
To: netdev-bot+sashiko@kernel.org
CC: john.fastabend@gmail.com, kuba@kernel.org, sd@queasysnail.net,
 davem@davemloft.net, edumazet@kernel.org, pabeni@redhat.com,
 horms@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org,
 rdunlap@infradead.org, shuah@kernel.org, netdev@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net 1/2] tls: don't hide a queued KeyUpdate from poll()
User-Agent: Thunderbird for Android
In-Reply-To: <179538279534.3135.17423952957860887247@kernel.org>
References: <20261118-v0idpwn-tls-poll-parked-keyupdate-v1-1-8e25101e7be6@gmail.com> <179538279534.3135.17423952957860887247@kernel.org>
Message-ID: <B373FE61-88E2-4F2B-9796-01B39ACF7635@gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

> Can a poller that is already waiting still miss the KeyUpdate here?

Yes, any record tls_sw_recvmsg() puts on rx_list has no wakeup for
concurrent polls=2E This predates this patch, and I'd say it belongs in a
separate discussion=2E
