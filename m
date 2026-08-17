Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 386053D9545
	for <linux-kselftest@vger.kernel.org>; Mon, 17 Aug 2026 15:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786981195; cv=none; b=nTR0dLFahrPGANopRcpnzV0DguXh08H5CXebDvFl3pYcBXHhrRihmCm3sWas4JWPfKr9Rv2Sxqgjt8/EYwce+ndJttI5fyeoG5KAa2lRDlJk5Px9bUqvOm75PUXEKGmQi9rqqVFOi72MblPXG6CrfzTV1pNQpX9EEfPRyWgeGTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786981195; c=relaxed/simple;
	bh=H3nptbdADxSff+uLFke9+TPoMwCWTAyD2+uq/GPDw/A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QoPKxGUJz59+OfTxuGoSuoqv5Kv7NbGyaK+KudcQkAzVfoJ6oyYHYfjlmyg5ftTl30r7cGz8ZdnMuT/Goqv0eRkpOZeolC1a6xYaEeX+QwJbR9DWLNHGwdPWuTNXFtHCVsYGcyCWAPnZL1c8oEy52xRaNpxDOOXj36wrEIe21gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xm+QwB3e; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xm+QwB3e"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-ca53979f8e8so233940a12.2
        for <linux-kselftest@vger.kernel.org>; Mon, 17 Aug 2026 08:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786981193; x=1787585993; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SpEuEX+rM6EWcPcctt8ZdTluERNGSkeRbbqFIS9qfEU=;
        b=Xm+QwB3eMCCaQI+IU+4G64qVgYDVj+0hzAE9/MbO9EDG1NBRR0jDC3uwT1Q4m9yePc
         XZahDPE/G2Us+dtPlVtiTRmCFzF0Wz1AWLvBrxTwh2l4lQjwVskqcb/Ih702bz7bOCCj
         G7dhftKGHaXnHwlsjBx+qglukpAHsNqXhN8Spa/WFN2as/Ds/CKOiLdap8yeUk9jo6wF
         5UdrkCHHSZFMIoSJSdMFAQG+b7bDp9Cm5q3T9FfAVl6XeAs7kSlkLRUQJjHgN1mSKv7K
         nGLgz2jRBR74ZGlYY2p0PMVQb0ELaA8Jv24I6/obfKV7MY9YwKaBuRGGaHuSUbvprxML
         J2CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786981193; x=1787585993;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SpEuEX+rM6EWcPcctt8ZdTluERNGSkeRbbqFIS9qfEU=;
        b=Ko9FWvBiBon89he9g2vHDN6fQi+sH+MpuxiH4o92yrUxGEAwYds34kwLaK0WFfs+mu
         5KNyeXerC3Xj3f5ATbXNVAp05JpFFg3b+PaQd3WvPsJAx5iys/B4BqEg/DXPQwo0SI0I
         A87GxRTeobIf7l+RIWhQgZ1Anr7PZu+cuyFZ3lOV5vOL9kCYR379YGMOfcpSFOmwYVT+
         hpFgFCse2AESZHhhrwlb3XNuNZiUJ7QnMbDVI93S0IOdlOmdVFkfi7w+kcBCP/B8pEnG
         PT9B4K8w0fCPAte6Yh6WdSXdRu70sershKe+/hL3vIXld7lkxdE1wjX4xmOY7Log6+7u
         SdRQ==
X-Forwarded-Encrypted: i=1; AHgh+Roc/jd1qVBx7+QZJv/clBL+bcfBGcxfn0OdH7SJwAD5YWUy17URhfuSM/e0SZG7Jlgk3IFR9VRerF6CHFhh3S8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwpslFYbBnlnOQK95oMz6zgojrn3nnmzc0GuS/2ramgMgXyU1ld
	QrNkd6qqatfp4r9oIfSt91fdQgA542mighZhN6c0VZn+XKGWxoRj7f8h
X-Gm-Gg: AR+sD12+puw5EVa8PD4NJ6QHHfC0InT4jmYmKRsygG2UcDJHjVMYT6x3AlyfZqyOFi5
	K5UzZ16fNklCYSKrkKUPhdVTUvBFkrBXvSYO25x/Byc+lz3RvzRRT0Omq1rlU5wpRjCRL/ZDsTd
	+aqhZ3Iegt4AzdYTbPDwzCStEBPDGQRezfuro1xTGR1v+tjxWWOQeA1Ek1hUzGTjw0IQ/Pb8oBq
	H/ZUysoNRcbrSp45yculetizdR0Vk9FaXrGj4geNCbpeT+/4VO9K2824FlXFxFgep5Pj88KmPvT
	KBkgv4um7E32HoPo7ZRG2PA4kfUeO/aptfOqcLyV/uIShPZaa2aFtqOPlFc6VYKdIrWyxchuwaA
	feKkF8MJDKQglwXWptfTp3r0P/+pRb9bRH8GdWo4NN4zmji4zOvqkfPen8yi8OtUxgIgliB4m4Z
	J3MpHk/UYDG/0ziyD90bwfhyzNlpRdcyvokSs+wvWPEyjSjyYJ50U+x4OXJb2tuJePxZ0UP0zjk
	/uevnGRBbFA
X-Received: by 2002:a17:90b:4c87:b0:38e:549:9e04 with SMTP id 98e67ed59e1d1-3933b7d1d85mr18726489a91.1.1786981193455;
        Mon, 17 Aug 2026 08:39:53 -0700 (PDT)
Received: from ?IPV6:::? ([20.24.212.12])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3954d2e64dbsm2672735a91.8.2026.08.17.08.39.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 08:39:53 -0700 (PDT)
Message-ID: <1fde2f37-4048-4c7b-b29a-12273b2df503@gmail.com>
Date: Mon, 17 Aug 2026 23:39:46 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v3 1/3] net: hsr: privatize interlink-bound skbs
 before address mutation
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, pabeni@redhat.com, edumazet@google.com,
 horms@kernel.org, shuah@kernel.org, lukma@denx.de, m-karicheri2@ti.com,
 fmaurer@redhat.com, luka.gejak@linux.dev, bigeasy@linutronix.de,
 ali@iusegentoo.com, qingfang.deng@linux.dev, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20260808004525.1551-1-xiexinet@gmail.com>
 <20260808004525.1551-2-xiexinet@gmail.com>
 <20260813182744.4bd0002f@kernel.org>
Content-Language: en-GB
From: Xin Xie <xiexinet@gmail.com>
Autocrypt: addr=xiexinet@gmail.com; keydata=
 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
 sNySbH3veZ/55EtlXA==
In-Reply-To: <20260813182744.4bd0002f@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/08/2026 09:27, Jakub Kicinski wrote:
> 
> Would skb_cow_head() be sufficient? It's much cheaper, at least for TCP.

I am currently on annual leave until the middle of September. I will continue this topic when I return.
-- 
Xin
