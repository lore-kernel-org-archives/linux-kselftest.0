Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8EDA371D04
	for <linux-kselftest@vger.kernel.org>; Tue, 31 Mar 2026 19:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774986611; cv=none; b=lp6tEy7xzuNM8SeqqdyjlM+8zS/+o70ZwyJmvmRE1tlji5OEaCbc46EjPSwHTnuG0Xg+DV4CLoYoV3qsw6xC+p8M6CjMfVNYd1xaoVeWfhF71HKjN0SRw5q3mx4DtKly//0Wr3R+2JHmg7HA4oquG2b/2JY/VBcgGPPF/wcpoG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774986611; c=relaxed/simple;
	bh=3R4yA1zUfO+Sm87KeaqFWvMmwUvTrOTH2w1m7Behrk0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B0wuaCW/E+T4US0Djppsdc9nyaAhp9DzK85B7j8LnW/8Rl5CuxRrO4uJSpLw8xynDERDWORAzn02jUEj2zj3mza21qXkUm6fskCZonTxrdllcXQtXidq3c5tv/h/njUXYxvRuMZ48t7ONx5G9+gJK2Dgy9z2UXjgNnit1FPH2Zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=bomqY+gf; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="bomqY+gf"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-7d556c1a79eso6265228a34.3
        for <linux-kselftest@vger.kernel.org>; Tue, 31 Mar 2026 12:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1774986609; x=1775591409; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V3dPLdQohdTWPR2gzU0owdfCQTRKoKdLV10a0T4tVhA=;
        b=bomqY+gfZqvzIh7HNhx047VPrYanuF4D5fKNIPkOXgyPQko8AnumKkZe7lSwB7gJWu
         nkZ7JjSC3xJ9/rEM64TVuS6KBI39/HkGNdfFOHVOwAplCojNM12nHB9lK6Oqpz27jPe/
         eKotMjdbT6IHH+r5nhZJgWvI/wwONx/xPdgl4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774986609; x=1775591409;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V3dPLdQohdTWPR2gzU0owdfCQTRKoKdLV10a0T4tVhA=;
        b=RW97ExmHjFg2Ow1F+3ndY29zwkzcRwgdPUEtgqmtKsyOhytCeu29AMDO4w0HhZx81Z
         7annRTe8dagpnfXAuHrQFZT1aGAD2itDH17o3XWyOGhoHnrvRyKO0/kjrUksaT6w7YAx
         j0G3lrUfyMTQorgC5ZE7z+qzzeY+BfHduhOz2c62+GXXhk2Us+aP8c3ddSYNLt0BMsp4
         PDSJsNPLsWkpPTVPYLxVJgk4hp0/jgnM2S/wxgCPqjwkFgYCLQi76WKONwhmAGpuRdnV
         xV1csWswTH0OJJcSZp2MND/c0BKRohhg8FquH7H3PFWzJ0oirbd4DNFe4fOxicEeA6tl
         eY6g==
X-Gm-Message-State: AOJu0YxCEj1yVz5lGvp9wrbK2n7aAjk1R7J75IXqdrhskI27AuwnsVnJ
	K2c7MoC4XFzhvfD4oPkHwGolINpN2FSg4k189QYn7hXcVD2S5taV0ZS0A82MClOICgo=
X-Gm-Gg: ATEYQzwiw+X0S7OwflH5EyQ4yep29pUSMeoolXxdORrYU5ODkZSApDFbHjvf4IW6xtf
	BrqcVECO6w4ntLcWjbnZ2QxS1DdDhghMJGwUQDMaRj43jBZqX5+M2LP5IlNRnSG+AOQneG6xMQQ
	3MZq95dBIgbhn3q69PSpv8a611CrwkPwxE7Z/ZuygLw3lfQa3zD776xPH0F8xblJ1iRkQ/2CK2Y
	678IJKJjuVHpjDvOCVCzeWHe69KEeGj/sPMCUIigSvmeCL1lim2hDBwGrV7k/MgX3pciJaipqXM
	0eBgsKhrelacpa4tZzzLLIg6SxqEMXUI8U3amT8nUpwx+QEGHgyfPRLQ6T01RkaDLC5xSnKbWzh
	z22upuXUk5Y6mxscDhJ2i7nWZDw2a0xwRbCiGqHUeHFaay/p0HuPm/n96JDJWrma2y4NkiBvTF5
	4yMZ8KUcI+2BAYAro99voLR97iECy75rl4UsT5R/OO5wr8SA==
X-Received: by 2002:a05:6830:368b:b0:7d7:e045:b489 with SMTP id 46e09a7af769-7db9923f3e4mr687777a34.12.1774986608698;
        Tue, 31 Mar 2026 12:50:08 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.187.108])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7da0a3b9bfbsm8822374a34.11.2026.03.31.12.50.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 12:50:08 -0700 (PDT)
Message-ID: <0d513cae-e928-454c-9629-a798fb08e2cd@linuxfoundation.org>
Date: Tue, 31 Mar 2026 13:50:07 -0600
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] selftests: harness: Detect illegal mixing of
 kselftest and harness functionality
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 Shuah Khan <shuah@kernel.org>, Kees Cook <kees@kernel.org>,
 Andy Lutomirski <luto@amacapital.net>, Will Drewry <wad@chromium.org>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 Yuwen Chen <ywen.chen@foxmail.com>, Shuah Khan <skhan@linuxfoundation.org>
References: <20260302-kselftest-harness-v2-0-3143aa41d989@linutronix.de>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20260302-kselftest-harness-v2-0-3143aa41d989@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/2/26 07:13, Thomas Weißschuh wrote:
> Users may accidentally use the kselftest_test_result_*() functions in
> their harness tests. If ksft_finished() is not used, the results
> reported in this way are silently ignored.
> 
> Detect such cases and fail the test.
> 
> This should probably only go in during the next cycle.
> 
Applied to linux-kselftest next for Linux 7.1-rc1

thanks,
-- Shuah
