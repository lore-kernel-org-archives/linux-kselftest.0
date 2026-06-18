Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8AE11E32CF
	for <linux-kselftest@vger.kernel.org>; Thu, 18 Jun 2026 01:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781744636; cv=none; b=OTZPPuSF5xmyCgYA8dtCBxckXHMQnCkaoWLuukhB0Yl2/Uk0cNIym1qYdk4F9t0rRMJk2FTWxCgDrNZg3ms4sDQB8Qdlcw59hTX0dtPDf7ThMgUxXodhDskBIiLZc4V4zPfcW1iRV+hdA6wMoa5s6rwnpZbg0qCCr2J7VsBumdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781744636; c=relaxed/simple;
	bh=8NG3M8I4loVexSJCQaUiVxHzwDgUQ0oCpnJY31CbjX8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qSLiMXEZxwGmHC3vHHObhalmuMHCfuKIX7chooksytjqxoZyryvNs0lGWD3CcHA9jFxYJsfz9eg1sjlHBjtLoz+KAQrHj021UDKsFy4w/nbqQIoEwi1Bwhjq8+GWKJx3nOPVV77x2zM9Bxjymi4yWSVw4tzPZ3/5T209Lv68xlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ByrPnjsw; arc=none smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ByrPnjsw"
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-48673dc56a8so289333b6e.3
        for <linux-kselftest@vger.kernel.org>; Wed, 17 Jun 2026 18:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1781744634; x=1782349434; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ARCAUgzsaxMbVd4A9yETRNbCU+OcaCiHeBSY4FFlaX8=;
        b=ByrPnjswI/KdaHJ4AmAnXOecUmb8YX2x046zj++jbpV5iM2+hthJ8hIONqpJha56nx
         WIGacQhyIPUWLOiWMsjJgRk4thu0J9CFCHAkC3Foy+gjeTU4O5fVPQSGdSZoxMTyWnMV
         fDxrrPuLzYIYuqT2Pxu2kU3cSwpWiKacnmh50=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781744634; x=1782349434;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ARCAUgzsaxMbVd4A9yETRNbCU+OcaCiHeBSY4FFlaX8=;
        b=rEyEWK2iJrxB141HcvrI5BiEu0ctAfKoFVs3gFbiW7NZ5ZeQELWAJ5+HKj+suDTx1L
         pGRwIJJxJ7MMNjWFnkHLgkogoB6iGHvznHqVfCO+AEEN0I8wD4/4bYrCdEachI89MVWz
         fjVIrFG5VY7e7CH53+kBm6pnqA98b+6ymVXYjLd+F4FLQt7pOXrLIrNidd3Xzy75BOAo
         gD2QfvRA7kMBL3TVCvOvvIz44cbcQJdu8V6hldjLhlCD8u+w676eN+ULtPE0TzY+CxWW
         23G26Tcn2c+r13ml5A8mKu6URAf6ial+aJ1S9NndIyFBzz/JjgQ031H4LnUw3FJnld+9
         minw==
X-Gm-Message-State: AOJu0YzSCIpsa+FNScS9hjDyhi43Dfbu4mOmJSrzfutv+jCRYEX2bQrw
	p5aBknDoiPa/IaWyuLHkhWplINYy19AfM2SLZH+uqf5CypTwj7mt34tsclO4qtrS9Gc=
X-Gm-Gg: Acq92OFc7emLAVwPqMLRxxdYnxFJGJmlrPAUUrQ0bxtiMuDOkmIneA4tp90EFGvU7fT
	JsXjOHO/phJm2Sapx0pTEQD7Iin0htxyRCGdadPAG7a6jxK8lnW6oeuGXdhWaixwbSIfNzkbhQT
	m5EmlU/AK7+ZIIYK4IcqP3Ot40doXB/qfuB1JoDPz5Hlvxdp9Gus8znKzliT+D/DOwg0+yHQxT7
	HAalFM9az7UylOKa1oEZaWr11jn+f3jEwoWJT7H3WYz7lNHGTwerPkUXuHe2W0N3KylMlVa/iW4
	RTOGo9hIAdAtSS+03JpoLLkUwb2qspc4gUP7cvsUMxCs3AShk40j514gwzhG/3ksBF+cfx4cgYT
	tWToCeFTdyMLLHJZX1Lmw+kTknANaJS+jEzoFEPBBN8joHTjcJbBfHTUP9GbRj3/cxhHoF+YK9X
	2E/68miNLtf3rtOR7anmfz
X-Received: by 2002:a05:6808:1797:b0:45c:8fa8:7497 with SMTP id 5614622812f47-489429eea8fmr5398284b6e.34.1781744633722;
        Wed, 17 Jun 2026 18:03:53 -0700 (PDT)
Received: from [192.168.1.14] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4875dfadd66sm7366835b6e.14.2026.06.17.18.03.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 18:03:52 -0700 (PDT)
Message-ID: <865def83-a07e-4eba-b795-7da66e0e2d69@linuxfoundation.org>
Date: Wed, 17 Jun 2026 19:03:51 -0600
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kselftest docs: remove reference to obsolete/archived
 wiki
To: Rafael Passos <rafael@rcpassos.me>, shuah@kernel.org, corbet@lwn.net
Cc: linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20260617235740.74029-1-rafael@rcpassos.me>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20260617235740.74029-1-rafael@rcpassos.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/17/26 17:57, Rafael Passos wrote:
> This link in the docs point to a wiki that is no longer active.
> 
> The wiki was moved to archive.kernel.org, and there is a warning:
> "OBSOLETE CONTENT This wiki has been archived and the content is
> no longer updated."
> 
> Signed-off-by: Rafael Passos <rafael@rcpassos.me>
> ---
> 
>   Documentation/dev-tools/kselftest.rst | 5 -----
>   1 file changed, 5 deletions(-)
> 
> diff --git a/Documentation/dev-tools/kselftest.rst b/Documentation/dev-tools/kselftest.rst
> index d7bfe320338c..64c0ec7428a2 100644
> --- a/Documentation/dev-tools/kselftest.rst
> +++ b/Documentation/dev-tools/kselftest.rst
> @@ -15,11 +15,6 @@ able to run that test on an older kernel. Hence, it is important to keep
>   code that can still test an older kernel and make sure it skips the test
>   gracefully on newer releases.
>   
> -You can find additional information on Kselftest framework, how to
> -write new tests using the framework on Kselftest wiki:
> -
> -https://kselftest.wiki.kernel.org/
> -
>   On some systems, hot-plug tests could hang forever waiting for cpu and
>   memory to be ready to be offlined. A special hot-plug target is created
>   to run the full range of hot-plug tests. In default mode, hot-plug tests run


Looks good to me.

Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah
