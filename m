Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B08CE3E9583
	for <linux-kselftest@vger.kernel.org>; Tue, 31 Mar 2026 21:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774991002; cv=none; b=mlLIsmxxVvK7e5IdwiwNJNgKEZw+cgGJguZqge9h2SD6dZOHivOmnr31dV/AQYCDLoerQKqEthLjiSRSIzr6WTvrpIy8QZHDy9nyTuE04nHJ2au/PJYxe0Ea6PI6xNEF442iP4B1YUe5mlJ8Ny2s3WS4oEy+pBPnO/Px0SYDT0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774991002; c=relaxed/simple;
	bh=Gt3u96Z/RHWT4uSpKJTe+1AoRa/kukWjUHnXg95ZC44=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s5UbnyaxIb88rghXEiLQSa6QzEnScTTIbkqgstQ0N38I/7Kvgc2I3DfMuQ0QS7TjjfmJnZlateugrIZ2W9d7ajWH/VZGRoLouWp7hm/kyQvvPkKKFySxEPM+FtyIYgsdjrb3bRQHluQWl+M+NfCQLl+NR8UsOgmg14SyDCQyx6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=LQXq8Cf0; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="LQXq8Cf0"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7d9c98e437cso5113122a34.0
        for <linux-kselftest@vger.kernel.org>; Tue, 31 Mar 2026 14:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1774990999; x=1775595799; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d1ynKJA2ZMz+n9z+laV/KWasvwjgNqFlNU3zkpu9Lp8=;
        b=LQXq8Cf0o00ceLn+KhlYJuoQKNomXwMZlpaNyT1a5kr04yAs1ojNUz4Ix7ndT1exW3
         DSeLgdM+jBgEsMBxJHpt0jveGjtSVVFv2YuJmDQD4S8+FJJlFuGbxlOLRDV3u7XO/J0J
         gpp7z7gkb7Y2anhLCogPVzyqBpmUuX8uSUxW4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774990999; x=1775595799;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d1ynKJA2ZMz+n9z+laV/KWasvwjgNqFlNU3zkpu9Lp8=;
        b=PRBycLmoR/b9V7n/zofJ6Sn37p+MOwN+KCNlQ/5SMuf3oekWIu3xOtZttFU8LEBLA8
         PDfdrWAhKsWn8QSE29v4F+FvKEAgUWDOMVSAaIOjkgEKjSyHRVRP5PxGDevVhvGZpQ2D
         WZZegb3ue6vFBRz4Z5YsZ+MWnOs68cO9M30g/0p3MPrKoJ8yNVBulKm6Y12lIVRvZKr2
         Rk4vv1x8+tdKaQl0ugFsqyP17SKmUNuRhciuM3DAe+0xl3KQuisfeohwcdP3eZFhYrSm
         auauNT6tYyCj46ZJiui1o+cM3zFNMqQ5q4STXO+qe8/xwwPyfi07nq0LPdYarH+4shkK
         FG8A==
X-Forwarded-Encrypted: i=1; AJvYcCVaSC4aD0T5ub9WXDfWbAhJpPQumc7LmQusg9j61kUUVzhiO2jFgDTjyQpqs0d7AEbU8Sc6LeqU26Svt/qrljk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxk0V8yeeRYZwyr97El6/NF8o9fApVOBVxAOffcwcgcRtfy7tAD
	VwK8r4w02Q/vQ7NMGcLB0wXNybgaoa6dODJCHQ2EGHJMOX5pDCeQKOiGRgDf8/EyA+Q=
X-Gm-Gg: ATEYQzyzW2sU/qZKfKo9bEA5XAdYRy+HBiAqfQ+a4gqribW7246yCIYIqsU4ATw2Cge
	cG6+oeTeVCWo6jpHipaREyjrHQSU7DocnlwnzJdPBoYAwDDIPt3DDT4h/jq/5sWcGib/RiEJG9W
	pPhweaiDlZbDhe1vtecHb7OlmwccCXLsUU3NgAiiQET1fWd46Vh8Yg0qKOWF0VTRWeJ6zw+Fl5Q
	tlNIsxrWCcA8bUHVoMlt2SZ74BUjDzTzKEsJqEd5zRJbVkqEcdiIfzaQtaPwZSa4G/p8DTeS9ao
	wd5R1kZ5Gr0QoBz77arpzpX/6DAnGz0nl4LAWV/CbD/hEeI1J1J7f0dtsbWQHr4fz9Up1hz1OK+
	pG/AQ8nYZwk3qPhrhFG3t+nkFPcvc+ewN4uisoIe23CB45mnnDypBoARyivgBAo9LyK8nD1haWr
	D/bd5lhaqC13QJ95LmjcYGFMUw9TePLqSFM+g=
X-Received: by 2002:a05:6830:67f6:b0:7d7:fba1:c767 with SMTP id 46e09a7af769-7db9942cec5mr900953a34.32.1774990999564;
        Tue, 31 Mar 2026 14:03:19 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.187.108])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7da0a7b45basm9162649a34.17.2026.03.31.14.03.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 14:03:19 -0700 (PDT)
Message-ID: <0bcaa85a-7b7d-4295-9b48-afd983e7641a@linuxfoundation.org>
Date: Tue, 31 Mar 2026 15:03:17 -0600
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/mqueue: Fix incorrectly named file
To: Simon Liebold <simonlie@amazon.de>, Shuah Khan <shuah@kernel.org>,
 Simon Liebold <lieboldsimonpaul@gmail.com>, Kees Cook <kees@kernel.org>,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 SeongJae Park <sj@kernel.org>
Cc: stable@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20260312140200.2224850-1-simonlie@amazon.de>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20260312140200.2224850-1-simonlie@amazon.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/12/26 08:02, Simon Liebold wrote:
> Commit 85506aca2eb4 ("selftests/mqueue: Set timeout to 180 seconds")
> intended to increase the timeout for mq_perf_tests from the default
> kselftest limit of 45 seconds to 180 seconds.
> 
> Unfortunately, the file storing this information was incorrectly named
> `setting` instead of `settings`, causing the kselftest runner not to
> pick up the limit and keep using the default 45 seconds limit.
> 
> Fix this by renaming it to `settings` to ensure that the kselftest
> runner uses the increased timeout of 180 seconds for this test.
> 
> Fixes: 85506aca2eb4 ("selftests/mqueue: Set timeout to 180 seconds")
> Cc: <stable@vger.kernel.org> # 5.10.y
> Signed-off-by: Simon Liebold <simonlie@amazon.de>
> ---
>   tools/testing/selftests/mqueue/{setting => settings} | 0
>   1 file changed, 0 insertions(+), 0 deletions(-)
>   rename tools/testing/selftests/mqueue/{setting => settings} (100%)
> 
> diff --git a/tools/testing/selftests/mqueue/setting b/tools/testing/selftests/mqueue/settings
> similarity index 100%
> rename from tools/testing/selftests/mqueue/setting
> rename to tools/testing/selftests/mqueue/settings
> 
> base-commit: 5ee8dbf54602dc340d6235b1d6aa17c0f283f48c

Applied to linux-kseftest next for Linux 7.1-rc1

thanks,
-- Shuah
