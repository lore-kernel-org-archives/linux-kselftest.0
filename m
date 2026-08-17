Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E10444236A
	for <linux-kselftest@vger.kernel.org>; Mon, 17 Aug 2026 15:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786981134; cv=none; b=Vxfv11eykcjcJ7xt9HfAgd/ZfoMyw8dmG1FHpGyHgVlYti2eh8n9PyWZP8W/sgYXSASoFyHzrc0qT29DeZsV8JWEQVdEZs3LmZTFOyOgFDCPFBLgC84Jxno6TAa6c4+d6W7pb5rsSutokn7cIidV8TWBz4zs5jU32EgGGF81hiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786981134; c=relaxed/simple;
	bh=oBrnpScWWBrQJQdo/rLjHvow2EdW7eY5TmIXqt2jKak=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h83DZc5VQ0R7UpjlnYMlmS+E1R9lvwQ7G13craDM2x9nHxDIWV+D4FlrKOm60J3H/JbIDztdPWNWjffph/ziND8O3byiaroruJWUo0JYqnjHxC1pIFLolCPANAxG8DkpOft6DUPYfGB+55Is3kGFpn157cto6OuU8m2OxQDebtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NhZQaeRE; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NhZQaeRE"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2d590f4c291so2021385ad.0
        for <linux-kselftest@vger.kernel.org>; Mon, 17 Aug 2026 08:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786981132; x=1787585932; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6ttFNIm5J59uLE19rktxqz0bELz7EGhv91DNjHXA4KA=;
        b=NhZQaeREbChotUbiwxnXBRAKdqpmpACrZlXT/8JPyHSU+sew1AZzbLqVwtwDXHejUJ
         41kgKQvpWQMlYc7kCg03LStHBAZWSCk3DfDqU0fTnxByCrMXenqxIHQEdZRUBBzdVf2r
         ER8nYxKbdPO9jP8vhM4j55IE+jw3PLK3Iid46X7Dad2nEHDjI7wNx3gt4OfAA+8kwdIX
         IJSKqfGszlI3Uk2xnf5rjzw0LXAUBjT6sALDsj2KEuKQ5ckkxu4KtOon4cqiDKhL2acv
         FiVOOjk9KS67vuhBiMUlvbCxBR2s+5Pz63p32WoXZcXhe0vHWyYHoTVHRAVXjYZvrU1g
         BaXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786981132; x=1787585932;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6ttFNIm5J59uLE19rktxqz0bELz7EGhv91DNjHXA4KA=;
        b=NUzmSHouKttfRrRiJ32wER+msEJv3KfZFl9RRmkoupjzaSgBqgpmB7xseRuIznLDGp
         4+jkAzg+WAn+4P379tTooZ0T/infBUHMNP/kVaKL+9CRvQ+oiHsUrnqJgT/Mieqlh9xJ
         YRFf8OUTvgPuj9RaCg/47Ju6o0alN4tR6i4eh46grYbOYOtmspWH7ysgrvCaRqgCzOwV
         X+1ykbDn+L8K1sL+D1edtc62y+/tHklTCKfrlRLQD0Ug4KahrvcdXPZaVjMdqWuVkfou
         m5VaZAvUW29483DHlr1ouz4cQ0bxfUAxSgSYjhACxDNu3/zNJcAWPweHYIBPjfesPCIS
         fTRw==
X-Forwarded-Encrypted: i=1; AHgh+Rr8pQVi3vLLv6gS2zaTfPigFI3H/fmqmz6XGAx100Zd3wCP6XXWKAG3WrT4savxWQBsIlyL6aifPkjBE0T4ta8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzT1uCqmau0LR5a53fENozX5obZG5MhzAdV9HDAs+pg9e3KTa6j
	KuZF3o70LnHkTpGwO/3PTL79p0PFlWRq2B8zjcLjOY+Vfo2TtlgiV6Ks
X-Gm-Gg: AR+sD12uLdwE9ZBQMPa6Z16w9VJmV77qTzTgX+iCKWUUZelPlrxZcRS/j++TUbn25HH
	W/aST5hfkXf3CHIoZAfVceMNHef25GxLsAr/I9prqQTgRXLNbmuM2HKADD6PTfr5QymqO1V+6nN
	CuuJKO2zB4S0H4/Feno8Wjk1EQk+cW0FxzViTMyP4/TQcDO8Bwa4LHMsbeRnSthFll6AuSO+wLU
	quGa0AVfsMZn0u/edtC87/NiwThjqjZCzDKRpM+pNH6ziF/FJm7uW/6I2731C/Bp5hCrMIaSD/B
	rsSRNxdjD+IBDFMrc0MBpxFYhXUUQdatzN9oHNjujAAoW0KG8cnCWr+xHVr6pm+yKFyx/9W8VLh
	zbO3uvpsgmU9b5o2ajlb7xDNWFRGkQDW6DjwFCnflvkmq3GiP0KDOnCVOdcdUDuhWTq4pq/5d5B
	cWgBMTDcaIK7R0OT2DdiUeXx43xxBoNXu9HCpMtzsVJIiZWoMfK2SQZ4GXAYq2lgn2of69TOb9i
	Y/O8P55C4hu
X-Received: by 2002:a17:902:e54c:b0:2c9:ed4a:c3a4 with SMTP id d9443c01a7336-2d3b0503575mr184872235ad.0.1786981132291;
        Mon, 17 Aug 2026 08:38:52 -0700 (PDT)
Received: from ?IPV6:::? ([20.24.212.12])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d5c1e54330sm5304955ad.44.2026.08.17.08.38.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 08:38:51 -0700 (PDT)
Message-ID: <6933d09a-4dc1-43f8-a1c5-bc3db2f6ffb7@gmail.com>
Date: Mon, 17 Aug 2026 23:38:41 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] net: hsr: fix packet drops caused by GRO superpackets
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, horms@kernel.org, andrew+netdev@lunn.ch,
 shuah@kernel.org, kees@kernel.org, petr.wozniak@gmail.com,
 qingfang.deng@linux.dev, fmaurer@redhat.com, luka.gejak@linux.dev,
 bigeasy@linutronix.de, xiaoliang.yang_1@nxp.com, skhawaja@google.com,
 liuhangbin@gmail.com, stable@vger.kernel.org, sdf.kernel@gmail.com
References: <20260809121455.1745-1-xiexinet@gmail.com>
 <20260809121455.1745-2-xiexinet@gmail.com>
 <20260813182111.088aee3d@kernel.org>
Content-Language: en-GB
From: Xin Xie <xiexinet@gmail.com>
Autocrypt: addr=xiexinet@gmail.com; keydata=
 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
 sNySbH3veZ/55EtlXA==
In-Reply-To: <20260813182111.088aee3d@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/08/2026 09:21, Jakub Kicinski wrote:
> 1) could you explain in more detail why GRO is breaking things?
> GRO shouldn't merge packets with different L2/L2.5 and packets
> with trailers?
> 
> 2) the code seems inspired by LRO but LRO also has
> NETIF_F_UPPER_DISABLES. This change looks rather incomplete.
> Calling it "best effort" seems like an excuse.
> 
> 3) Clashiko has a number of other comments:
> https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260809121455.1745-1-xiexinet@gmail.com

I am currently on annual leave until the middle of September. I will continue this topic when I return.

-- 
Xin
