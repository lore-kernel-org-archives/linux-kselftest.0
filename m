Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7345540EB9D
	for <linux-kselftest@vger.kernel.org>; Fri,  7 Aug 2026 14:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786114182; cv=none; b=MvmPSiX8VJLTvNBmWlXkN5TgUFkbkbMS2hnrY79qog52ExshjP8If4r3inbPCKyEZoiIVNLn61twP1bKq8c1SlZr1qUBx2eDxDbKz+4mKG4rNQkoApSZ/tgPmRFvZldbXdDBcEn7YQAXGXfW9hVCU+Rx6U/i8+Y9INFshn1f3uM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786114182; c=relaxed/simple;
	bh=rIBVD0ltrU8+8xGc90Oa/79dIW3TVRlPoGEf1xQTtFM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IoZAI27dW7u3IIPngA6ktodBq0zUIifjPgD6jM1ucN/BR1JfWB7Ymj+BijHAr1SQBRqDWwihVDM7lyWb3BIRjJMLVxjUNhb77lkOjsgIg7R7GJy0i6rCvkEcAx2kqDG2mi+DjF/E/CtQLqmUFXlY1vga8O7sNEbN974FL9conVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sslaz9qR; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sslaz9qR"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-47df6a5655aso452218f8f.1
        for <linux-kselftest@vger.kernel.org>; Fri, 07 Aug 2026 07:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786114179; x=1786718979; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ukm+OuNktymp77TFPbZkArdXVPXyYalBdkMMLYPXS10=;
        b=sslaz9qR/vyd7bq8Jp3kC/7MM6pDm3ok0jS0ye5F72fSL//pg44ult3NDuC57AznN7
         Vs1wMnEuJzbWWuiLbQ+peM1204aAfC/vT0F8pt4jJcDV6NcnbAmOLGFusdatHeqclcbk
         Vi+P+evunyo1FFr6ughqdVFHx0EwjQe5xPLUb5g8uPXyRyzEwjKnzjM2KiLLvDiMVBsu
         AE6F709bBBpqy8xrctxGjCknf0KlWbA+fDve0kgL8Vp2jpieBfsBPaCqzvyXleLfdN2t
         o6AMi6M+pl1L0pySGJAObaaEvsS3qTxlPdul26jf0ZCqfqNENPBH3zkyc0oysYE7t02P
         nIJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786114179; x=1786718979;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ukm+OuNktymp77TFPbZkArdXVPXyYalBdkMMLYPXS10=;
        b=ZJaNIFg3IxnhbQ7W1OeOsmo+5aEl7JulLo8M2YUxWM10PnnAHn2720vDsscVtMsnad
         aMiyV5epwQLy0jVKjDZ/LVdlksGd3tkbMBQcJKIN2yLxAI/M6ZxFi9fQjIAQi4S2+rcT
         D4JTYhQ1/UFOUwDj4B2tMgCHMLfmOjaQP3AUgZdC5RGDjsP2XnWwniglwn41AdHxxhG8
         LYFuPTbjngZviA6EuwTO2VlZPlw7vWywUuVFIpTpUnRxanUiZ44xS2OXTYKYbn/0umFc
         3aTsyjbjO/knR+U9+i5iDT2nZDjkvDAzzuQDoOWJQ19IOMsrBm1WsOO9UAWfoOLcvt9n
         PAUQ==
X-Forwarded-Encrypted: i=1; AHgh+RqswxlCBdj47wPSYmT6FHq+DtcLvC98F0P44jjytIqiwUvQaI+GDoXrVvIdI4gkQvIecVpjieDp3g8534xAQ6k=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTL7wpXU3s49NSToCDfKcY7gBixvmEDO+lYBiRixHhsrbKIH78
	+9nE7xZ/HPKtfXEWoPWj9lQ+1Bzrsi+15gwdz8N1Yc1Pdyc3yAyzgtgw
X-Gm-Gg: AR+sD13u34760GkewMfLT4NwSZx5rFe7Vo/hzLGVKPlgANmtlTwSCmhDrHzW8PyD4eu
	Jr/nWaqqJeRIOJiyZ+iG1b7SQc+RUfsStUEstEpxRtPhgR1BdBg64A/QRGwxnalL+BXHcyBSwZH
	naq+kbiy1/vwJLp+d+KXDT9rmJ0MKqjK80BBq2UEqHXPCtavVDli6oklfXj0B5j49DeLNzUyR3h
	jEeU+neg2ptWEDihFEknnccT4ArEmIisNqQVuek/ObBVmuPm3UwM+Gh8gvoUp8w03UIH3drXz4W
	GBD+RilaSe5LcGa8c7fAmOQ0OGqXqex7spLAcx2ADBF+7oLH4Xu1ytME00yhiwOM7KbaZWIDwkh
	tMk3Xz9THWKneoBhQvl98gFQV32ZeOC7BuCK5+xC4aaorzznX0SUUnDED2XsBdthApHPnRiZRv6
	oDyJoYzFOiWaVhSJiXy8leOAlLMsj2h9LvTaHa0QJylptyOB8Lkbl2sbRRjMpw4Q8/G02RpmUrU
	YleuFjYKTShO1Jr32pWzufNF7OGq6/ENQRJ4OnJzdn1gIVeOS0UoqamaL4FNpJgTnBMYSj3f/re
	v6qlEKzx5gy+M4uC7WY7W/yZrn9WvIYLutXn
X-Received: by 2002:a05:600c:34d0:b0:496:c249:ddb1 with SMTP id 5b1f17b1804b1-4994e7d7feamr167001975e9.4.1786114178649;
        Fri, 07 Aug 2026 07:49:38 -0700 (PDT)
Received: from [192.168.2.69] (dynamic-077-179-201-133.77.179.pool.telefonica.de. [77.179.201.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995d85254asm26878245e9.1.2026.08.07.07.49.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Aug 2026 07:49:37 -0700 (PDT)
Message-ID: <156d1de2-927f-450c-a809-dff6892d527c@gmail.com>
Date: Fri, 7 Aug 2026 16:49:36 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v4 2/4] net: hsr: shrink seqnr_lock to sequence
 counter updates
To: Hangbin Liu <liuhangbin@gmail.com>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, andrew+netdev@lunn.ch,
 shuah@kernel.org, kees@kernel.org, petr.wozniak@gmail.com,
 qingfang.deng@linux.dev, fmaurer@redhat.com, luka.gejak@linux.dev,
 bigeasy@linutronix.de, xiaoliang.yang_1@nxp.com, skhawaja@google.com,
 stable@vger.kernel.org, sdf.kernel@gmail.com
References: <20260803222211.877-1-xiexinet@gmail.com>
 <20260803222211.877-3-xiexinet@gmail.com> <anXrR6-2UVYF1iZa@fedora>
Content-Language: en-GB
From: Xin Xie <xiexinet@gmail.com>
Autocrypt: addr=xiexinet@gmail.com; keydata=
 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
 sNySbH3veZ/55EtlXA==
In-Reply-To: <anXrR6-2UVYF1iZa@fedora>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07/08/2026 16:27, Hangbin Liu wrote:
> 
> Maybe use a shorter commit description.
> 
> Note: Avoid these macros in fast path, prefer per-cpu or per-queue counters.
> 
> And the counters in hsr_deliver_master() also need to protected. Especially
> multicast.
> 
> Thanks
> Hangbin

Thanks.

The long commit description was from v4. I reworked and shortened it in v5:

https://lore.kernel.org/netdev/20260807140751.1351-3-xiexinet@gmail.com/

Regarding the statistics, Paolo previously suggested addressing the HSR dev stats races in a separate series, since there are already several occurrences:

https://lore.kernel.org/netdev/4fc3b9f1-4bef-4b34-ae7a-e89037cce829@redhat.com/

Would you prefer that I drop the DEV_STATS_* conversions from the next revision and address all HSR statistics consistently in a follow-up, including hsr_deliver_master() and multicast, rather than adding per-CPU accounting to this series?

-- 
Xin
