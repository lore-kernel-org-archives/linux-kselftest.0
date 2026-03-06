Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE6B4339878
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Mar 2026 20:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772829930; cv=none; b=H/wejP+2wya7IkWbQKVIY2vFDjwnuI4GzGmNspRHYWs16XAOVV7p4o+gI0pTFdpmUznqxfzuLSlZSGZT9avtUaSbU07czLhgZY8pWzgtNB9voiaqcrzpP1nvQiyjBToUH30K85i3lQIRvIbx+xYyfP8ArdeZVsLJXD/J4wToZMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772829930; c=relaxed/simple;
	bh=EMQuZg22Ccqc5Et8LvgfkIhgliD/Wsj4ouioOWWTM1M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dN0pBq6AkW74PmZxsELd8Ng/ASi14EYxy/4qcyixUDkgyxG4bdJ0ROO4CdA/UI5qyGHh2mW4o91T9l2va78N0CYE1rEuUoi8jWMdkwfzARRHtHI1qOv+p+vAhZ0q/Shj8opcdX3bsALNr0GrbpOBjMuma4F2krtLjjzHONDs2xI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=gEozLPjA; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="gEozLPjA"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7d4c7d04890so8216143a34.3
        for <linux-kselftest@vger.kernel.org>; Fri, 06 Mar 2026 12:45:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1772829928; x=1773434728; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MCjgHZy0XWZ1mhZzYSpCsBPhtkt0p2Vjdc/pTPolxOg=;
        b=gEozLPjAaZ0cExYOJDmCGR2Y2aV+1o7a8Yxt49e5GQLVupxWlUGFrZAqV22OH2AjsA
         0hh7Kmf5hDd7wxmZc9oABZLt7kvAzxlehs5W1GV1YuhZVjFRawdZHFoToF1i4jfBu/W8
         RIgSYA9JD79z4tp90e1bkXCRJHM7nJ5oFBook=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772829928; x=1773434728;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MCjgHZy0XWZ1mhZzYSpCsBPhtkt0p2Vjdc/pTPolxOg=;
        b=Iv76TlIcPad4tYuX5iOLJnDWdp2CW/v6V0mdsYTrVs8Xxj8ed78vwDhW9fNE3efHpw
         tFT5d/7d+AdNuOUinvfNLjOV4o6ZFB7cDmXRdQYyEMEfBmuWizJhVOSm/xTxAcxiH0J4
         lsWoaasf0MKvInsuBP2st5vXbvaKFndQ9r/0qNxbvtQvVR0A/M5LNHia4Jqx+rzAvcxA
         qYAxtCfknLHTMqZKBnmEPMDyqQyGvbu57qBCXrOXd7VUUG9hRzZn3RRn3T4OvYRjIcda
         nW4Hu0l9SsdE9xhkDbQxw+fhN2xHCGgQVT1xxQ3AQOugJhBi8o8LVsiqpmO18Hxde/wT
         yAyw==
X-Forwarded-Encrypted: i=1; AJvYcCUYCqbZymlbmPWloJeq4AAYIlUeA+6V0Zs729NJWRTkB0gu1hmhocjtswcwzK3B/M+sRThZMqIXgczGw9FatMY=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywg1EVebrcqjYwGofgnYIY/j9OuJY6VGVNLGA1xK2gxOptORoE6
	MVk6t0UN63DaQeQ/rVYBj5ssDKI+I2ZfMGx2GHqnXH8TxrftN8ck0AoJQctMGSLTU5L1YZcVNae
	n0XKag/k=
X-Gm-Gg: ATEYQzzEGUu1xLP/6egnbpDJTBLfcY7hl18lJwqRBKIztVvIMt3cAFK4DpaLaFimlKD
	Qc/aUjllz52d57mnviZPYj5e+aGEI9RjbSZbY9QTbnPGwBEJF99DiP01/1P0SSLXXZ9C0heINuu
	S52kZZGHW+xKj+5CWIKdxjnCP2XXr0n/5DnMuIR/QsQmrgjs65RL+E7ViHtOFT7yunTkke0q90S
	nL7d9SFd9KxwBxR+ijIjqd8A3gAxOb9KUDZMZm4plorhd+55ILgZEFMyu5nmwLCp3VCXRtXC8Wp
	tvoGVwc5vDvlPPk9Enb5SsAZwB/LuGb4ijWOD6fvRmCANtMpW83PsFaibC1tuyLwVixuBjYI2PG
	SUkcAOxC+pAdZJ+hda3ZzLCSS5Og2nPrV34bkhA1ZyOsy09yyItn/P2cIl3ln3KQTGjNEKXI8LR
	8mCUivAuoVvpxrV7kG4Qs7Ji89x/8K5sw52cN2ggN0i374rg==
X-Received: by 2002:a05:6830:25c2:b0:7c7:2c63:f2d6 with SMTP id 46e09a7af769-7d726f15d04mr2308886a34.11.1772829927784;
        Fri, 06 Mar 2026 12:45:27 -0800 (PST)
Received: from [192.168.1.14] ([38.175.187.108])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d728d2e9dcsm1610995a34.23.2026.03.06.12.45.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2026 12:45:27 -0800 (PST)
Message-ID: <eead5e82-02c5-4bef-b248-5e6c1e97a0ed@linuxfoundation.org>
Date: Fri, 6 Mar 2026 13:45:26 -0700
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] kunit fixes update for Linux 7.0-rc3
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: shuah <shuah@kernel.org>, david@davidgow.net,
 Brendan Higgins <brendan.higgins@linux.dev>, Rae Moar <raemoar63@gmail.com>,
 Christian Brauner <brauner@kernel.org>, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <ed050fc0-bc06-4e8e-afc0-86c770848f93@linuxfoundation.org>
 <CAHk-=whR5vYchKJHyfzcEgyW-ThktX=RUKNBgwqBxyO-VFPajQ@mail.gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <CAHk-=whR5vYchKJHyfzcEgyW-ThktX=RUKNBgwqBxyO-VFPajQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/6/26 13:41, Linus Torvalds wrote:
> On Fri, 6 Mar 2026 at 12:30, Shuah Khan <skhan@linuxfoundation.org> wrote:
>>
>> Passed my repo sanity testing. x64_64 tests crash on mainline
>> and my repo because of a known issue - fix is in next-20260302?
>>
>> Hope it gets into mainline soon.
>>
>> - https://lore.kernel.org/all/20260226-ungeziefer-erzfeind-13425179c7b2@brauner/
> 
> Already merged as commit 28aaa9c39945 ("kthread: consolidate kthread
> exit paths to prevent use-after-free")
> 


Thank you.

-- Shuah
