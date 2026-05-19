Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADEC63D9DD2
	for <linux-kselftest@vger.kernel.org>; Tue, 19 May 2026 11:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779191013; cv=none; b=nk8683LGub36b7G3Qse2O/fZfT6TaHigNRNPRbBO1S8B6d1kiJYLqzBiI01iKQlLDEFpS8Hy9L9PjNLlX5blcRvqJNA6bjx+7uWbjCxz2sPcASolkDCjNXFm/3P6ejzStL9wsTExgXsoN0KXlzksh6oJXZBR9YilH0PEmgqWyF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779191013; c=relaxed/simple;
	bh=uqnz168Z/NZnWLL+NvwgL7tHVJZg79BGKcxiyfYZqas=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tfCgAfbwFtL9PAtI4xE9+3IB0W9/ZJZZTJzvadrMo+XqZfFLzokX8+njFwrB3L5yriLDJbIfUFrkzM0OiNnxv61jI2Az3b7Il09W4UAE6iVbSQWv+zGP51Yl/VnG8upyW1m0SVR8mpH4Xdg69Nya7vgF2dc7CR/g46dqw7LkoPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CA5LbG1C; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CA5LbG1C"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-44e1ebb3122so2002825f8f.2
        for <linux-kselftest@vger.kernel.org>; Tue, 19 May 2026 04:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779191010; x=1779795810; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=830uqqsTMsd/ozJU1fiYeCoziwF9njvd4GwHw/ftDHc=;
        b=CA5LbG1Ctk7i1t9L2quu16aCEVkbnhAZ8gP5ZZcUdRvrGjM3IxL6yWjZ0IIyT+OIs9
         TdaAVtspbfIB+WyrJ1k5TjuFgtl4R2kAlcLeWylPXquuVQA43HSevO1c89U3KwGCXQzP
         cL8plifMWgQKDof6HO4cGWUzxidYasBCQJTi4vbfRJSiFnJc3oaX7+uzvPhkd+uUE5Dx
         EAF1S+eC3Lc85bNYjFHsigOLvOCEFUZhbR43vqZjRj06cofFlV1lKvbT5s1ZzQFqBZlj
         nUQRZUJ1MoDXnSrFvH3P5VfNybtH/QbPctLspAOj8RRkk6b85e8+FokgarE3kU1W1HZJ
         ObPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779191010; x=1779795810;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=830uqqsTMsd/ozJU1fiYeCoziwF9njvd4GwHw/ftDHc=;
        b=q0YlyPH4cMeDSBFXNO9VtfjWlPnyUbf0WGc5XIxVCADLdwNltYNM/Q+iKKqLzOGVeM
         8CncDpABw/aVjw00ojvtYi4VEBNMhqwi91/mLuOkvfVpnoTTpxcRTgI689wNxjTRrbKE
         +l3BVM65+SRwavvcBqWW422/TKasvsufQPtrJkli2FAkBB7tPMz6TD0edoy1xBEgSE6y
         krEVY8IKmk+ngoxl893JdJ9ygO/otbYCiYQHx6Lq6Wa7ggcFq/+vSjiEedicWj9xs/Vn
         PawaBDfVjZEPP793EVzJeFgQ0I2i+4Vf6jK9bC/SdGROe3rSzQbSsdZ8KkoqGhOJ0xhD
         A8NA==
X-Forwarded-Encrypted: i=1; AFNElJ8ZhinYsdnxMDixZH0JmLSLdNh9+t/Uv0yKS+h8cjmPaa0CTn7+0bNxUhIBAWLW60JXqBgpYZhocTA7rArqQlw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQW5ocCGKAI+RUlHgHUq9yhR/GCSmhqATPZmy973x8SfktTRC4
	+9PtBagTdSBIUUFVMLyq3+m+fGdFlV/Kdv4VCYipwWUX9AKPXpNffNYW
X-Gm-Gg: Acq92OE5gZH+3AoNq/Pse7Z9skIgiHqsXM4zx3JoFk27ETe5UKunTz0aiqJSqN4zHBM
	k28KQ+uu9MQmrqXkQRUVQ1d4HZpgq/VM0ks8Gcot1sjig8KzwJXBDQ1CQGX+x62hGsTf6/bHCH4
	qXA+9rJFaBoP3DAdyw/5nyfz8Ds75CsrXRekOl3uf+SIVD7AGsK19o++R0H8rnE3zEJ04rGl6qI
	uDs0E26HgCKD2utsya5h8jA+48D8hmPMeoqlPk9fpb+3G+U6lvO9kwrxR+b9w9EciUcAEKiTWJN
	Jdo+CSw3uMbLqO/SY+Kmidb7vZ3syxMlpYvOQM8uT5PTG6clr7V0LnNikSnKhR25tqCPFCTg27q
	ede3ahohKpAW16TONAF+eIbYfp5ChBtGnh25x6RUThjnVFyiAUW8PcZOqO30OHniEewkEiKKH5s
	sYPEmt8UWHMUU/kktfdA+BFcaufRVvn6GSj+65fUN/1fry7IZcLTusqomUmAnjxhFm10PAXmCh1
	lYb6MrEkbTOxnB4hVyQqYc1hak4yDvGZsSnPi+txflUgb7GDguli8iZPJZdNrPuv61fxAlZTb3f
	cQ==
X-Received: by 2002:a05:6000:2087:b0:441:36b7:7262 with SMTP id ffacd0b85a97d-45e5c36735emr30499432f8f.13.1779191010036;
        Tue, 19 May 2026 04:43:30 -0700 (PDT)
Received: from ?IPV6:2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c? ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9ed30110sm49237372f8f.13.2026.05.19.04.43.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 04:43:29 -0700 (PDT)
Message-ID: <260923ea-7871-420d-a822-cde2f4c105ad@gmail.com>
Date: Tue, 19 May 2026 12:43:26 +0100
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/6] io_uring/zcrx: add CQE based notifications and
 stats reporting
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@meta.com>,
 io-uring@vger.kernel.org, Jens Axboe <axboe@kernel.dk>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, netdev@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Vishwanath Seshagiri <vishs@fb.com>
References: <20260518153532.2835502-1-cleger@meta.com>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <20260518153532.2835502-1-cleger@meta.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/18/26 16:35, Clément Léger wrote:
> The zcrx path can encounter various conditions that lead to internal
> fallbacks or errors. These errors can have a large impact on performance
> and functionality but are not yet not being reported to the user which
> is then unable to take action.> 
> This series addresses this problem by adding a new notification system
> paired with a statistics structure. The notification system currently
> report out of buffer and packets that fallback to copy. The statistics
> structure report the number and total size of packets that were copied
> rather than received via the zero-copy path.
> 
> The out of buffer notification allows the user to actually adjust the
> buffer sizing when registering zcrx support for the ifq. Some future
> work could allow the user to add more memory on the fly to the pool so
> the page allocator doesn't run out of memory.

Looks good, I'm going to take the first 4 and send out with other
zcrx patches.

-- 
Pavel Begunkov

