Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A1E3310763
	for <linux-kselftest@vger.kernel.org>; Tue,  3 Mar 2026 01:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772502255; cv=none; b=IcBQUYVNc7cgd7yPdR/mXhKdMAhJmszf6gQCeR9JLN/7sdegkph+wkJuoJKy0gEknsvJ7GumZ2Bw612UHDsOdQxblMj7TEfeJhZ8HLHiUj4azVnxc6zK3dm5PKS4oVDFLSb5+ON1pBKm/Y4eEnK/7Uf9nzGlDMjYv0UFuWDeNZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772502255; c=relaxed/simple;
	bh=h46P7kVUyNdq5URjNM7EixZSnrIt8YE4XHi7HyMCXnQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=saW/5v9C6ZitGK3YMIeMTZNsRpKO9YpOV7whAcPsOc3GqQ//u2YuROEROIjLFAF0KeOvhERMSBD0j3Qq2hlFQxm/LhFWsDdp5m7031nInEg7Uu3ba5ovquOGHorpM6rutqVp8mTZkZovG4nxyUkOdNJpQjjxaz9sjKeQeFyYj+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=davidwei.uk; spf=none smtp.mailfrom=davidwei.uk; dkim=pass (2048-bit key) header.d=davidwei-uk.20230601.gappssmtp.com header.i=@davidwei-uk.20230601.gappssmtp.com header.b=E0FCl9Cw; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=davidwei.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=davidwei.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=davidwei-uk.20230601.gappssmtp.com header.i=@davidwei-uk.20230601.gappssmtp.com header.b="E0FCl9Cw"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-8cb20bcff5aso501165585a.3
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Mar 2026 17:44:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=davidwei-uk.20230601.gappssmtp.com; s=20230601; t=1772502253; x=1773107053; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d/ou1XtFi0XNZ0AZfXj8pwsiuakW+AHiGBQcTnvVDfo=;
        b=E0FCl9CwILuog3RkjUFNZm+jufvwAiXS46HmRHwT3bteM0zc7JtykMuswjf36aRYSM
         D4mzTpfbeOGr8WTtlKShpE6nvhVqnolymZwpkqUrTD2Yor8R4Po4MuhvMH+qYQvZNmET
         wlOTw/o1J1bh5wE6qh9wP6Lb56M4I1ATDsIhji462hXtAW42H0Dmbh5CQp6IthAT3KS2
         FMLchPAg8/yyIPcdkitTM4AhH9rYZ7dB2Xvo3hNtgSpFpkbcIQWF4eKHfSSyP8lzBUUO
         ux2nmRRrSQ0v9MvuTUjPn6FASsPsnFsoJhW18mGyLI3azHOvZQGrzJGaMrH5q/ZBw0ed
         atjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772502253; x=1773107053;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d/ou1XtFi0XNZ0AZfXj8pwsiuakW+AHiGBQcTnvVDfo=;
        b=t7zyO0BlJOHqpC1VVUFQBrqfD9j6G+9Y5/DzmFES/4hAo4D2y2J1XtlEEfD5eAm/le
         fuWKBLa1sfgCiT49t/U14nFvg8RlajZygWq+0D/SNIkNB6krIYyCYqRrpZiovWPf1ujx
         Cy/rXa8iVPKOveT2xNotowpaqd3vbksPEnIYUs1DlRDcmkv4vQiajtI477Pr1b4YyKfo
         1oghxelNIyTSOQUvM76tGQlcdzCiK5pjIbVlFT7k7w++7wTH+LVDqj0Iedk14jUPbree
         3C8IgyD1PQtUr01MhQ0hoXPtlxk6cclVI//OzVq2SfFzEz8Y83zWMsUXWIViKz7aEtmu
         e7Cw==
X-Forwarded-Encrypted: i=1; AJvYcCUpUY78W+67NzvoiTyRC2A9/0VPU50skq9CWJgJRWS0Du+5ig9Tq2TjKM/nyUQspbb9kJITZ2pQ0abDcbHy3uc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHsY9fCgvaK0+yOpZNSW9X78gvcpVbAAMfOZq5DSYy663Ibg/c
	/lIxJfTdEfAr/lvbrWfHtSDacTOL8wypeQaHSHdK/EKv4hmfyPC4JBRklwWVBDfLZyY=
X-Gm-Gg: ATEYQzzmcmAJNiJbdtBW1u7FSClHIpTDk2RoX2ImBjbZjDEQmOgxDDJ+8relIfyaVWZ
	tHRNagh76K7k9WkaqzF/yPPZhpDELYSlxOE9N56q9VKaheU6wEYPzIzSeNOoKBmQmvMQiCYb0Ge
	BR1NCDL0Qf6tbjXFf0GwX01eIZsdITnN0CT4XbWbkx0yNnR242YuwjcOcpxQkJKKODuVqRcKuk1
	cacPfFXmj+c6L2ctxMmwY5VLWswBpcjYmS51eaHta5zvBefcNOXEf14y1qhw81SmYLgO7rgEtSM
	WOO+1PFXoxWbSxJebjSCTVnl2KjJrAImEw4KTRy3o9sYqcnnAYZefQkOCoVm7LT49IsONQi+ZY6
	zaHQpKHJb3jlmOW5EELIyFNzlrz8Xi3Q/Bgg0zfWFAjDRw46K+FOPMfa1eowYywyKEZY3yLlyjR
	iC1JuXFkhKNg9K3AkiCF9krFDVGjo2OQ+6lAotPiPleL/6CovTxazhUGJyEu5a/QFNCQ==
X-Received: by 2002:a05:620a:1905:b0:8b2:f191:2b3a with SMTP id af79cd13be357-8cbc8e03cf8mr1850497285a.53.1772502253009;
        Mon, 02 Mar 2026 17:44:13 -0800 (PST)
Received: from [192.168.86.87] ([136.27.45.11])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cbbf6541f1sm1260110085a.3.2026.03.02.17.44.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 17:44:12 -0800 (PST)
Message-ID: <0bc2e2a0-b11c-487c-b663-ea62535e3f78@davidwei.uk>
Date: Mon, 2 Mar 2026 17:44:11 -0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 2/3] selftests: drv-net: iou-zcrx: rework large
 chunks test to use common setup
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
 pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org,
 asml.silence@gmail.com, io-uring@vger.kernel.org, shuah@kernel.org,
 linux-kselftest@vger.kernel.org
References: <20260227171305.2848240-1-kuba@kernel.org>
 <20260227171305.2848240-3-kuba@kernel.org>
 <90cfcf06-e987-4817-acba-2037a436a744@davidwei.uk>
 <20260302164816.1df2e32c@kernel.org>
Content-Language: en-US
From: David Wei <dw@davidwei.uk>
In-Reply-To: <20260302164816.1df2e32c@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2026-03-02 16:48, Jakub Kicinski wrote:
> On Mon, 2 Mar 2026 07:54:28 -0800 David Wei wrote:
>> Let's use ksft_variants() with both single() and rss()?
> 
> Woohai? I intentionally chose to only test one, buffer configuration
> and flow steering are quite orthogonal. What extra coverage do you have
> in mind by asking for both?

Mostly paranoia, in case there are any unexpected differences with RSS
vs single queue. Someone wrote the lovely ksft_variants code, why not
use it? :P

I should send the patch that actually adds pthreads to the iou-zcrx.c
test binary...

(I don't feel strongly either way. Whatever you prefer.)
