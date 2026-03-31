Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8E04450918
	for <linux-kselftest@vger.kernel.org>; Tue, 31 Mar 2026 22:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774994945; cv=none; b=ZJLPPIFX0MdfnXsPRYccc5EVg7MUgMr8lViHfgW1wAkxXeeg1SY4JQFWzh8AbX2eOVP7jcRkpJwxFmqcPqS5Wknpzz23jnyXAJZhgzbex+JVMKhZuJReAdFtMsqvZdxLazp6WNetJ8Gc0rC46q98Avi5C6EUHAGo0oQTB0TGPdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774994945; c=relaxed/simple;
	bh=0P6YwlDftNBZKweYOQFKVXfrIDgkHQ2o46OXIvPqIHY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=SnlracXXiVLbH5Zlq7mchV87oOAPB7cQD+D7WVs4ddAJicaFubEyHvWCYJWkvDstSOYpFNhMysRhKUOCqJcLz85voGiWgbijuDFhkOmfP2VHLaFx36eNZ4qyG1wKifSP+Ra32sVZSlOnsiViNasybfOKoJBBuOtvV2jz1hoi5jI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=X8CqkvVz; arc=none smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="X8CqkvVz"
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-4670bcc40d7so2117090b6e.2
        for <linux-kselftest@vger.kernel.org>; Tue, 31 Mar 2026 15:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1774994943; x=1775599743; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+HgFYWOKuVEf7tKpN8cnyqfj+WndBFQM274FuOpeczc=;
        b=X8CqkvVz3beNG/hMDdai42Rs1MCoUx7LF/Zk0Jq/IsCy3fdpjFKPZFkMzCtvSW+xfr
         qjAJfIKfDk0ALZigjyuFTUVu804O6B/MBIpTUoFyQZ7bqyxhexqnxhqQm+xyyEFkPvxU
         laCy+f62Zsapp4i3prciIPjyfK9VpLe8jo72o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774994943; x=1775599743;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+HgFYWOKuVEf7tKpN8cnyqfj+WndBFQM274FuOpeczc=;
        b=ZoHuZvpcHszRCgbaY6RvUmTFOGidApAMxZVWwfj5iv+g9/rMMPjGfUqdKVoZeCBe7m
         3sg6LC8OYOF4JnYD5N/b6U9fpIG8yVCtoUOwHHiTHxXO3AFsBGkCQYuD2VNy6zbg2dbX
         UhWGh6lDcdp+09J/KYhdz+ekJz3sGszMUvVLqjcXz5WOfdPPlp7QggZIJyQgBKKNZaNh
         8XYWIos+czvQIzHKydka6vLzTlPv38ZAvaaPm9bvmq5whZvHAXWeT8VoIUMvN7ccqvsk
         BbB13JXTlZHu6p+mzHhlviFe5c5GTjwDYtlfj1+H92H61uZPhsKegk1l+g0Q+T6k+Bhk
         venQ==
X-Forwarded-Encrypted: i=1; AJvYcCVlrJbhqp4WTnVCZXBQCID/jNggrCz33wjKb/VOp3Tk3sqHZ4HxfcvDIjx84pKTnjh9LdLMQ24ZChT5lPi8dwk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHByxZpvEtXEf5Ig/FITIY3tYHRfb0JyVjwMZhEBEhkwjlIABl
	zDVck15E5j1bXyj/uYX9cOG8RkbjvnebPvxPf2QUwLkSaQ4L5CmHIrZubWBNqtjeG8x0MF6tWdx
	0OJlvBh4=
X-Gm-Gg: ATEYQzzEH0jdrdJJADPEbOTNJv8Kzj73X4vIhktztRHEE2my2ZfLQVGCD4UwngRgOnH
	ryNiAhnW/N2Jy393y6op0oGUIrU3Ho/Wy+vR6eoSidsfy4OKhGPIwUf1mVSDpmccsO77Z4Px5E/
	+pG1AQQCAhzpjGwjEl3tl8m5Jzz54+cme5hjb8dIn7WJ192nhrGFpNUnWsx9T5yigAjbW5Rklzl
	sd4T7Grc3N5HkrrbZ2l7B2SJnH50sKOC8osmcZeOLK1F09pzcp3BgBRO+Y5wQexiOlgK55LljF4
	BGMfFT2862BWz324heACueSGw3WbhQRhviVnYkygqLCvGrFmCRHL8/BYW54F5XozrD5+gueffd5
	nP6Wv5StH1i7qVbIVusgmq95AYbPWwyuZDhyuYIi7fWpMEsNM3LhT7GUBtigfYmJfEqOTtAOpPr
	XtH5Q/ukBmyqwb48WYhKt8WtCFlBvcPq/kwQY=
X-Received: by 2002:a05:6808:6703:b0:467:2926:123d with SMTP id 5614622812f47-46ae01af0c5mr600965b6e.47.1774994942740;
        Tue, 31 Mar 2026 15:09:02 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.187.108])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-46aa03e4acesm7551638b6e.17.2026.03.31.15.09.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 15:09:02 -0700 (PDT)
Message-ID: <f3424f7e-9e76-4eaf-ac33-53b8d2e0bd8d@linuxfoundation.org>
Date: Tue, 31 Mar 2026 16:09:01 -0600
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/cpu-hotplug: Fix check for cpu hotplug not
 supported
To: Dmytro Maluka <dmaluka@chromium.org>, Shuah Khan <shuah@kernel.org>,
 Jihed Chaibi <jihed.chaibi.dev@gmail.com>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20260319153825.2813576-1-dmaluka@chromium.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20260319153825.2813576-1-dmaluka@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/19/26 09:38, Dmytro Maluka wrote:
> If CONFIG_HOTPLUG_CPU is disabled, /sys/devices/system/cpu/cpu*
> directories are still populated, so the test fails to correctly detect
> that CPU hotplug is not supported.
> 
> Fix this by checking for the presence of 'online' files in those
> directories instead. The 'online' node is created for the given CPU if
> and only if this CPU supports hotplug. So if none of the CPUs have
> 'online' nodes, it means CPU hotplug is not supported.
> 
> Signed-off-by: Dmytro Maluka <dmaluka@chromium.org>
> ---

Applied to linux_kselftest next for Linux 7.1-rc1.

thanks,
-- Shuah
