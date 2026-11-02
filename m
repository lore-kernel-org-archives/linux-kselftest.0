Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793662690;
	b=JB0VNODpEBlx15Nc44tUMysEjq7g7VnHugndvSWPhCx4oKKhNblPGcBZ28GzrCTEFrmp
	 1UOoS+v9AatNXFU2LNeURrsGrkPRZb9Y3Rvb5IMsbuhfEfcqvCsllz0uF1inLqG1vkjOl
	 S8T/QVSMXdoIkennP0LzC4Y1xQmvqd8TgC93P0B0j0zcVb+BLeR8yRNxruSKHXkbKss7w
	 rywRJVjtHjOGu7yFyiwVBFTZJZJZTCNv55MD8yxkpNr6iu7LavZWjo70BW7yPNB5XK/Ik
	 wH+2qogd7iLhtSzyeH8lwg/dNKOT87KfVScqXv0hgNqnD3K3tO+J2U4BTsnIY/dtlfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793662690;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=ajTKbCVfUpvl1PRge5ZE4DWrvmI1TQg3QGvcmd035B4=;
	b=G8NEVZBT9rNKBY5/NZu99YPzRZ5QFFkex8sXosXkNlF8cFawIUBFTKoGx9UFB8cIN/Us
	 mm2MPFo5oZ76bB+aucN3UC97Tf3KdSD8Rsdh/mDY3Jd0/jCT+GiWwbKX2KvUL6Bh2qy2Y
	 yujb5plRewWgB4uwFCoXKUHDXkbySMT2aapWJTfDsHKazFvuDNAVBbLv4yH+cBxqSjRJ8
	 Q0nLThDj/YWQqV7K8exLlwUcxjRphhDbMBkJ0e+RC/MqJu01LaLKOTePz9RfYpodpL6EC
	 tjSXNSYc6p0R0+Lm3nyXHE3sF1ABwViV4idfLF0cPrxcYN8JroW71xxoxbzYfpjGIOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eZcRAdFi;
	arc=none smtp.remote-ip=74.125.229.137
Received: from mail-dl2-f9.google.com (mail-dl2-f9.google.com [74.125.229.137])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4363C606A329
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Nov 2026 23:38:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4363C606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eZcRAdFi
Received: by mail-dl2-f9.google.com with SMTP id a92af1059eb24-164f08a9e84so813805c88.1
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Nov 2026 15:38:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793662684; x=1794267484; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ajTKbCVfUpvl1PRge5ZE4DWrvmI1TQg3QGvcmd035B4=;
        b=eZcRAdFir/tOfKhPPQaXb6mUvOPizNEbwDyFtkl3vKeIKU9Co8R0LPR3N7E8YyU+0G
         2EdC+Hi7HYUfRQP/PCKsIm9h8tS8eEbpeWjCtKW5O49DuznCRmny/sHaglVMRcQjk1XW
         wZt8hlBXazvlT3+G+BQ3Bmz9IyCxfZiYOF/RVxubvZmHO0sNkpaX5eNVfAoQpCQUlI5l
         2QeIfN1za7Fyo1Y5LFedwCSm+BskmtaBZmZEv/AWmFxszO3hxsuhm+PC8SWdRra5+cJc
         WZBdVfPBmr8WSta2fMLe085t0LYYVIzsbbeoSfFqPtbxZ27fS5V/opLjzid1gkFKzQ8Y
         foCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793662684; x=1794267484;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ajTKbCVfUpvl1PRge5ZE4DWrvmI1TQg3QGvcmd035B4=;
        b=rCxlcTV0oMTyLuqJcl+zfuNRVSxDS7rkX2+klZxU0uuteMl4GUHF+qYdBgl3InySHl
         S2t6L8SUrAAZuTT+/nfnRnVGkPisFiQgHF4MX09hEi0x6uDEIojyvxj3aYJ2/L3oVUBt
         5VOt3M2rUiv2SYlVvv3vD4gg1XrCCicIDDqUvHmxXbg6/dOL2Ndx/cxXhXjL1H6SMPSG
         91q+I/R54X5h83jzo566Sj3EJEMYGo3WrK7GGPvQr8Skc0s/XOt7m8mP6xMqN2WVbM5Y
         Eat+Uid2KjAArfsJvS7IbHr3nBOddJyJHngbF7rOANwxgqFnDeuQEzZasvQaNR446rV4
         9RzA==
X-Forwarded-Encrypted: i=1; AKwUvBxRs6NOh4P2OdNZku2N6INnU/MO+U14AiTLlPi0/UynNkRdyr9F3VjoNrnsGqqh7ZmWdtmekzlIoor5ycrKJ0I=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ+nZE728DaRhiHPIv//v0ATXUtX6ZzsjzOOjmqCnhn9BzF2SAz
	uzH92UJVCRuoVZ19QpMmoFEMmPfnWjMBmmMW8Jd1DALE6rDnIYj5lc70
X-Gm-Gg: AYBFou3+Np+NpSBiRXxQ/ytX8l0Z8KhF4YAl7Ho9qCzSRdRYncUFOp4bp7S/mQoasQ8
	eVGmddULL23DahNio4WJZ4ztHL9mLllE47Kiud9Sr+PYofGAoyvg1TinI6EmsoLmIHpcAIIcG/P
	mp+6gODUI2u4R/6nAbsrG5w4D0ZlwOZB89WzgbqeueA/1XD//qppGe8ZAUY0AFPZ4EFGMQ6jtiL
	7oi3YIJSzfiF692naWSq7e6CVg1PwZmc4zmVzQDHwLHc9PRar9QyzU5bf38RSBkOf8PrsZPqJ66
	fEnsU09fKm/m05oMbhWWaefV/Uc9xNStyOcvuc3e3cCSpJ9GM76/P5ppco9KotOyUXQU+EIpgc0
	bBdMDCXxMf5dW65eqJtkX9DRAX2Jkc4I3qCzp8PJmlvXTluApKerHvIegKH1OEFHeBFlmnpVyt3
	APIBDYjewVS71Zy+OpPJjsT9OnScgsCn4hq9NV1goAukze+4Qe2vpUfAQemOeW3AtX6EVcfgL47
	xgvcrN9f5J50OXvpz19axVYfJCSS6TLSkthGAufP1YSn6A2qr5+nvx8Oy/7dRI18MUhHyoj7+Kw
	Ke/ZgKgwoVFoRsIs6x6VYA==
X-Received: by 2002:a05:7022:68a4:b0:147:8a40:cdf3 with SMTP id a92af1059eb24-1ac5d1d155amr22814754c88.24.1793662684121;
        Mon, 02 Nov 2026 15:38:04 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:60::])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1a136537sm36897502c88.18.2026.11.02.15.38.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 15:38:03 -0800 (PST)
Date: Mon, 2 Nov 2026 15:23:26 -0800
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Mina Almasry <almasrymina@google.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, andrew+netdev@lunn.ch, edumazet@kernel.org, 
	horms@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	michael.chan@broadcom.com, pavan.chebbi@broadcom.com, sdf@fomichev.me, 
	bobbyeshleman@meta.com, asml.silence@gmail.com, daniel@iogearbox.net, 
	razor@blackwall.org, leitao@debian.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next 2/7] net: devmem: charge the frag length to TX
 skb truesize
Message-ID: <aukaiHZJcYsRCpr0@devvm16445.scu0.facebook.com>
References: <20261102191438.1059771-1-sdf@fomichev.me>
 <20261102191438.1059771-3-sdf@fomichev.me>
 <CAHS8izPefhGytGNeDWZzgZOi=gLeigZ63nFnkq1ERXXGwrNkeg@mail.gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHS8izPefhGytGNeDWZzgZOi=gLeigZ63nFnkq1ERXXGwrNkeg@mail.gmail.com>

On 11/02, Mina Almasry wrote:
> On Mon, Nov 2, 2026 at 11:14 AM Stanislav Fomichev <sdf.kernel@gmail.com> wrote:
> >
> > truesize isn't well defined for devmem TX frags: they point into a
> > dmabuf which stays mapped for the lifetime of the binding, and freeing
> > the skb releases no memory. The charge only feeds sk_sndbuf and TSQ,
> > which limit queued bytes.
> >
> > Charge the frag length instead of PAGE_SIZE:
> > - TCP uncharges in bytes (tcp_trim_head(), tcp_fragment(),
> >   tso_fragment()), so the charge must not be smaller than the frag.
> >   PAGE_SIZE only guarantees that while net_iovs are PAGE_SIZE.
> > - Frags shorter than a page now count their length, not a page.
> >
> 
> I don't know about this patch. The justification reads a bit like.
> "net-iov charging is weird and broken anyway, so we can do whatever we
> want. Charge size instead of PAGE_SIZE for no reason."
> 
> I agree that charging for net-iov is extremely weird. Neither of
> today's net-iov types actually allocates any memory. Of course when I
> was developing the original infra, I took every shortcut I could and
> just charged net-iov as regular memory, but that doesn't mean we can
> do whatever we want.
> 
> I think either:
> 
> 1. say net-iovs are not really occupied memory, so do a global cleanup
> that charges 0 for all net-iovs (optionally making it conditional on
> the net-iov type, so in the future someone can easily add a net-iov
> that actually can be charged)", or
> 2. change the net-iov size to be actually size instead of PAGE_SIZE,
> and keep the current 'we charge net-iovs even though they're not
> really memory', and then this patch makes sense.

SG, let me try to explain it better in the commit msg. I don't think
we can charge 0 because the uncharge path is non-zero. It currently
works ok because skb frag uncharges the small error that can accumulate.
