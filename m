Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EC8431A7E4
	for <linux-kselftest@vger.kernel.org>; Tue,  5 May 2026 18:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778006521; cv=none; b=tS0Xk0qrZ+ciiWKmHrr1PKiwZIibDNcO9zsWnr9CI+9UtHgLeu9wLFY/bDsKnpjKZLISGvnSnR0DyI2Uyl26hQsrb0AksgjXmix+UBfVYI7gYacZfosnubIjVm6RxIAECBSN0VhzTtJ3bX2mAKIC0kSw5huayehOilZ/gswnNn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778006521; c=relaxed/simple;
	bh=PxhdK7gj2zjUC6Zs48u/3dPbyPUC8JEb6+TGJXFmU9Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HVBa1Kxb8LkXOhHoTKur6BwxiHOjhHSYwOewMilHnsCZSRTvPucvFGFnqJTfDICuJ6EUb8cf2mxDWd038gjVC5rbAadsucS8mgyBamw1ongqIMagsZWwH7CfRu9XldLDqAk51QkstYIuT8DPRaESjomYb4R8if6XikyHwnzUjRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=FkE2pe3J; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="FkE2pe3J"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7dbec19732eso4277140a34.3
        for <linux-kselftest@vger.kernel.org>; Tue, 05 May 2026 11:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1778006518; x=1778611318; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Me8gsx2QO5esJCBY5A9GXybByVneJGu1Qo6HjDO3dyA=;
        b=FkE2pe3JMgqpGnc37SluJvmHwfhTNhqIsqQLKRiP9Hf/jMQpVM14UXxQZ7ovfmS7EQ
         QbU1mD2Li+CHg/FQHAyEqPZNSxgJdE5HwW0FTQfPkb+YzKS8QJ8B+Szaqg75MH5fingM
         8ivfXUZaiPlqUvD5wZh1lslWwataEO0kATYw0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778006518; x=1778611318;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Me8gsx2QO5esJCBY5A9GXybByVneJGu1Qo6HjDO3dyA=;
        b=IGEyMVo9B1GHPRYOmppgzoGRUDnghi2krxAWykXOgT7fJM2H3kSoB/ssN407jdRabx
         Quk2XOAssOgnaPxdj1NlyE9DMAy+Mf3A0DuUX9dOEiJ3MWwK6Xfo8w7jYzcTczTzJ7Ra
         JYr8xE2iXo1whyUjCnJ6okBV4ficCBUAaypdhMz76oNg8Ac3j7/g/Nb8ZlQOLv6npOOr
         mP1W5un/n5FSOE9riSMbilSfDwlX/SEAP7nGC5dSGnqQYY/TcGsgcXsAA4IpZu8s7CI9
         BLv4+75n22EgXJ/Nj5fN1SmIWCyYRghe+KC8lIxQsRdfLknefVNkcbfPnuhJYzbm3dIF
         Bqnw==
X-Forwarded-Encrypted: i=1; AFNElJ8DjzyhW2LgMO6inER5E6WcJhcj9tzyqQRuQ/Jnj426UoBkpMzvUwjD/EVpfR8DtGg0U+/a4VTqQ8L9dUFeMJw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+m0OMp9Pgg2gT5cIyrZr3HAAiirLitIf+eDF/WElxdd38Zfp3
	YbCXAznSWm/vbgfQVpss1BFhHS3GiSbsFub8F5eWP9P58b2noEGemsulLvAtc6W3Mew=
X-Gm-Gg: AeBDiescJ6ud9q150Q8AlqEKrD604RP57gxiBaC0NQwEda3V/78ZDcStsPfvI2wgjzG
	iJn2xzaTfTAzel9USNdSkh3zvfpc9Pr4xOYKMVpzIF57UdnPY3sf2WU8oz81LDPE2PvMNeKX8I2
	UQy7BX+LPQclWreJ2q9BV1kC+AmPQDleoGQAvmkgeWRxJpnbQfQYajD1G4MbAzkdeO6CBFRu3V/
	D/MRZIcQlxEV55q9Qm1oRYELt67paL5IYNqNzG1i4Su6nbsQaoEvtXmsVdq8rd00StUNQjBzVf0
	6Qq0EbSsahYiHvBDMP70Cmh/YJlHTIa8H8e6Glw3DkQusuwi6ReJLT/yXQDf2EDLh5zEJFP0IAB
	rkQm21cIpHHTgUXGrd53LEPoLdLJ38pdj8WjtEirvUck4ElbH3M7aEii8yP6bah4AYX5YWfSq2a
	GQBRsTQLiV/6mxIEQcpXfNtOKAt3IBFuJQlrXuXs8P0Q==
X-Received: by 2002:a05:6830:82e3:b0:7d7:d510:4bf9 with SMTP id 46e09a7af769-7dee12e360cmr9447027a34.12.1778006518012;
        Tue, 05 May 2026 11:41:58 -0700 (PDT)
Received: from [192.168.1.14] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7decac8ef53sm10778237a34.21.2026.05.05.11.41.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 11:41:57 -0700 (PDT)
Message-ID: <8bf165df-faca-4765-9492-613dff06e43d@linuxfoundation.org>
Date: Tue, 5 May 2026 12:41:56 -0600
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kselftest: fix doc for ksft_test_result_report()
To: Woradorn Laodhanadhaworn <woradorn.laon@gmail.com>, shuah@kernel.org
Cc: broonie@kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20260505182213.22924-1-woradorn.laon@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20260505182213.22924-1-woradorn.laon@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/5/26 12:22, Woradorn Laodhanadhaworn wrote:
> Fix documentation to reference ksft_test_result_report() instead of
> ksft_test_result().
> 
> Signed-off-by: Woradorn Laodhanadhaworn <woradorn.laon@gmail.com>
> ---
>   tools/testing/selftests/kselftest.h | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/testing/selftests/kselftest.h b/tools/testing/selftests/kselftest.h
> index 6d809f08ab7b..b50a8478d4d3 100644
> --- a/tools/testing/selftests/kselftest.h
> +++ b/tools/testing/selftests/kselftest.h
> @@ -346,9 +346,9 @@ void ksft_test_result_code(int exit_code, const char *test_name,
>   }
>   
>   /**
> - * ksft_test_result() - Report test success based on truth of condition
> + * ksft_test_result_report() - Report test result based on a kselftest exit code
>    *
> - * @condition: if true, report test success, otherwise failure.
> + * @result: a kselftest exit code
>    */
>   #define ksft_test_result_report(result, fmt, ...) do {		\
>   	switch (result) {					\

Applied to linx_kselftest next branch for Linux 7.2-rc1

thanks,
-- Shuah
