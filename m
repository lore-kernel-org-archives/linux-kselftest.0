Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9466348C5D
	for <linux-kselftest@vger.kernel.org>; Fri, 18 Sep 2026 21:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789768031; cv=none; b=E3UuRbfNfvkDcr+BoPXndMMOfZeh5XCFgZ9f5MWBcyaVZQxJzer+X86CwZCFc0C51CfOWj2EfbL6GMLGW4uV72Hcu0Avt3sIZpU5IvnbEDIklOSV2CvkLBXwOzNsXWmkPo1am8BIIBE+vheY1M7sNICL/Z0iLTb3MQt8/+xhAww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789768031; c=relaxed/simple;
	bh=3f7g3bR00ng/Tc3oO4+2cJdqY2qayCdHr7YSAaWNT/s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DKAWN/mC5IZAaZSqfQfhBN4h2L52GAUJ+Rks1HDUXESGAlrQJNG6s0RUQBVJ44RzKlKo5GxKIvOZgKbPyoWSdG9ab21IGKvv1mJBr0GJZc7lznKU4yfQNeXpqEdyLS9llqAf2xHKHVgzktEQHeTONbQqR3eH2cgGOam8Wk+0y0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SOVcWlF8; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SOVcWlF8"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843af75de5so126773f8f.3
        for <linux-kselftest@vger.kernel.org>; Fri, 18 Sep 2026 14:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789768028; x=1790372828; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4kF3kCqnenPmPclF7uOFxJbCVONn+n/x6kt5/bRZ8cs=;
        b=SOVcWlF8uxRJsPnebPFJtLFtAhcltlnRWIw7bvdxhl9WGnecGh42Hf563JX4x+zGG6
         RV95aig81LDU5I6H5agskz2dSOGMdd6/tOhQriNOWmQJgmKznM7WW+nQRHkwgVxQY0QX
         4GsWpg7W6HeRj6Lkdg3AjsWMc9d7MstVE8ehsrbVzioaNPSXy3ftwAc+mlDHpJTqkqv0
         sJ405U6Zxy/FLtBufDFwsKfajRAMlBjqbalgXbw8zNh1UHrPUW56PEtgbICxBJoYP5MK
         uOiR2hcO0uK9b9zqqU6Qt/XbjSCz3izGJByY7c7WbOqqmCAFhX5c+B5H09oxBt/PAk9U
         dZSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789768028; x=1790372828;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4kF3kCqnenPmPclF7uOFxJbCVONn+n/x6kt5/bRZ8cs=;
        b=X3bri1m2abcrYTJFWBMQkuQ7J+HpGkR/NBmaPirOMq9hZMvsCeeRSD7ZO0lO16IQ7E
         bUpSU42dAJFdVpIb4W8z8DZhSPQ1cO2kFMKpjmSd2zrpusqnzazInBJgtIqmHOU9CjnZ
         QeLxT/RsGyAFdI0+7XNKyI/7Au6YPseR0e5aVmLICs/wc1Z94V6h9q0Yn+DUrbY29g/0
         P2LAirpwbgsZmaLf7biwusjwBEewYFKR3ymh7W/m5FhKVMwe3e8EIl4jy7ZnoiS0al5k
         yxzCdlEor6dGQjSc2KQ+Up20C8fcl6Xa8FgHXgi0S+ha8bz3JZZtB9Xn1tuzcZ0bPR5s
         oeHg==
X-Forwarded-Encrypted: i=1; AKwUvBx5XnZQpDHW7Bd1lwIVDwzYG4lyznV23ePkDaQMkHySfYTHvhOynINljKTdoKhyyxC1/Y1IT+4b1dxm7po/+4g=@vger.kernel.org
X-Gm-Message-State: AFuF++kWDsYU+t4OxenB/VvUtfhTpA9BMjXNs75pc3ExvxUMWEzgCUOM
	hYuwTGFwnjydpK7GpSkp/g94DgFcT89tqPCXIYLwWPu282LZ7FZCAYhJ
X-Gm-Gg: AYBFou0uRpQS9igpQ/ewHuqyhmUMjKXEGVmurse0J2ULUdS7n9gbBpm28XQDc81ZFZ9
	AVTTUa54Kaz4G2ESw7n13bdgiqsQqp0up7rFu8dhVPuCbQSEnHSWi4tSGPpMC0dANx13wRzQWTC
	vn3WyMiTIoiqHvwiI0xx/I9MztgGw0Kei3q72Notsk01GaDeUJhtfLmg4uVrsJKKWp+R4eavmDU
	BQ/NYMMX07Io75X60+SiNetMBEWzxjQ7QiRgz79c9PwBwBW0oOrGieg6Bwx5f3Wmb5R+u59AjVS
	Hm4+N6qlF6XOkLzn4ln3AOVxuR2jpAitBGSoDSZseJ+m44uRb857s2HnimPrUCGrlhPymuVsAq0
	VvqKLk333xBgAhYHmNfNA+6uWqs1jQGwFUEfP7hR5XRwezYO0b0OksanKtjllr2tYZXWyCDqCnG
	+PfGaVr3ELpPqUw8S8Ty36egNGp07AqfX5IfaWEucbrqHYHZPGEAn6ntYOvMUdGSfVjwkolQoR+
	sLpsMhp8/+3A2B/elZQMGcswguymATC0PZXAFYxB/20Wks1o7syTRfaYnscyIWi0kvxrKi3bXSe
	xhNp5Z9KXIEHL+K/0nThdkYjAs+K3FMPRzzf/ZVmQS7hDBYa22ec+cKAP5sa/uJmS0C87jkT8OW
	wG62W/qbJz6b/5s8NZQ==
X-Received: by 2002:a05:600c:3b99:b0:49e:6683:d227 with SMTP id 5b1f17b1804b1-49fc7bbfe4bmr50760085e9.0.1789768027874;
        Fri, 18 Sep 2026 14:47:07 -0700 (PDT)
Received: from ?IPV6:2a02:3100:59ae:19fc:400:b6b0:efdd:810c? (dynamic-2a02-3100-59ae-19fc-0400-b6b0-efdd-810c.310.pool.telefonica.de. [2a02:3100:59ae:19fc:400:b6b0:efdd:810c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd086ce9sm33996685e9.12.2026.09.18.14.47.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 14:47:07 -0700 (PDT)
Message-ID: <d1aad031-6670-44ae-84d4-dc02ec23ba8f@gmail.com>
Date: Fri, 18 Sep 2026 23:47:06 +0200
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
References: <20260808004525.1551-2-xiexinet@gmail.com>
 <20260814012736.2805965-1-kuba@kernel.org>
Content-Language: en-GB
From: Xin Xie <xiexinet@gmail.com>
Autocrypt: addr=xiexinet@gmail.com; keydata=
 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
 sNySbH3veZ/55EtlXA==
In-Reply-To: <20260814012736.2805965-1-kuba@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/08/2026 03:27, Jakub Kicinski wrote:
> [Severity: Medium]
> Is the enumeration in this comment complete?  The unconditional interlink
> source-address rewrite is pre-existing and was not introduced by this
> patch, but the new guard and the commit message claim ("Other interlink
> traffic keeps its zero-copy behavior") assert that the uncovered cases are
> safe, and there looks to be one that isn't.
> ... 
> Since skb_cow(skb, 0) is a no-op for a non-cloned skb (__skb_cow() only
> calls pskb_expand_head() when skb_cloned() or extra headroom is needed),
> could the call be keyed on the actual sharing state, or simply made
> unconditional for HSR_PT_INTERLINK, instead of on the topology predicate?
Correct, the enumeration is incomplete. For TAG_RM ingress retained
in frame->skb_std, a queued packet-socket clone can still share its data
even when the frame is not locally destined. The interlink source rewrite
can then change that clone.

I'll remove the topology-based assumption when revising the COW handling
for v4.

-- 
Xin
