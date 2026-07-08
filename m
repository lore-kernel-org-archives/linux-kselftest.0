Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 883A030DECB
	for <linux-kselftest@vger.kernel.org>; Wed,  8 Jul 2026 03:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783482247; cv=none; b=a4bM/Ld6PTrcBDWXMCDqSDGd5L7cuzLYs+5QTA45+yzYLcA4jj+y9bMAxDipXJEEDlb+o2GsmGz5Vxfo1HfUAreQm09D01YWlMMc9ZANZCIspjRuKkFcUV6ln8ifwwwrGVyq5W4Xdeagt8vz9Io6BBcGOsz64YZX2yUA7Eu7rn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783482247; c=relaxed/simple;
	bh=/WMeyrerE5cL1QCtj4taIKg6SkBZEW5mZrgQ+55ZIE4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CmcRiqdtgJ9pPVrVT1ikyMNA2vQDHswteQmR/7e6EJ5/Ko3GRtYrRqh84GJFYsxMLlrTLhw4d6rHzhLb+CkTpEzbc5YoK7I3rsBwzonIq4Zaw3UDcmbBYGFJ4meTnAmXJOmjd4cWsr0870fGW/MTrfouWl4iz59L5UVNd40iFzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NzjS43sh; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NzjS43sh"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2c6b67d5fa1so2782475ad.2
        for <linux-kselftest@vger.kernel.org>; Tue, 07 Jul 2026 20:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783482245; x=1784087045; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iUWQaN+2EVC/jZffLqqqs+XDZn8gAzqVwRQLHNJBzN8=;
        b=NzjS43shX30tQJflfgWWx+M/rT9tb/VZ8F91q6R/ox5sZ+rvWVmpKGoCpIrpp8E7Za
         ZcU//Qwdp6niIC6zxSoVbQ/sqcicamsekfnvUNHicLfr8XdGf44I5iY3BzyRdpPR9FeR
         qszinoSrfSHxYIVKzyF3DgEE8cGlqaDl7xijdKfaaHmEPP9x13LWasIoEgZzr47Ah3Wv
         qJJc+5O7RTh96Rph/6wVAOjEzqaNFhG3tMYRrGXp30VurlAAwvPGjzw5C6OblCkPveFj
         O/NSHhd35MkN7tYz5XWbY0SN53rONvHgbv2Db7Qu/9DENTn/tGc53gSCZoYVPmEGlxYW
         4NWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783482245; x=1784087045;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iUWQaN+2EVC/jZffLqqqs+XDZn8gAzqVwRQLHNJBzN8=;
        b=o5tMw9kmnX691WK/UvII4IBYdBJnqzpJUBXzoq+dcxlV7oriuaiW0ah4KnhIzJmR4i
         70u5A2xqY3NWYbb+AoDBVV8XSOMPzqu5IAjXRV3QItTrdbFb6UHrPYk7Q2wDTIw6oUuZ
         omd+S0r8JnINHmD/yXGDJ8/oqC87uQPjOlifFpIUnLQhhE0LU9B+7+ADqB0NE2LOPujW
         QgZrVD6Aw1Ed+vZ/ScKgmVvBhSQTD/gOhv+eLzhzXwLZI8oYKlngYGbzD1vfHR1l2w9f
         968CA62qLLSkM/9Zq22osMW2IqapenpnBCzyx5MJ4+fHL40a8oX0pLHhyvrkZ5XUhBvt
         h81Q==
X-Forwarded-Encrypted: i=1; AHgh+RrZWQrg5IDsLL+M4L0YN+yuHVjZxm6rFDCKRt3SZDJ8ScFYqBADuATzxNADAk2X1fICceoUrTaPyTJ397EZ9bo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBIBLuTUtTqRXkM/Oo5WAMHWiKkx2Da0dBbg0UOEAZn6nGK31a
	wxV/RkxpRXpzWY1pB/BeXT563LgMsSXxkGM4VywNYB4LSIH1CUzd738TLs45iER1Y6k=
X-Gm-Gg: AfdE7cldeznr2Gn+1x+jQeisfi26eJJc6/S9ioylQLb/wUAtYGEXQX8155tsrILQy/j
	CaSDNEySyhCPAZPhX13ffin3zK+U/5YG8hYJ0GjpUAk997s8f/1IoWgeX9erQ1TtzxD45/Z1pqW
	lK62X60MTJAhgaOGE8ieQRG6vR+L/czHwXXnOoqm+Cnlw46Tw9XOg4cGPKWcr20XjFeLaZ8lGGS
	vm/ZCx3bTv7FzkclYEH+tULezPix42n1C6U7cZ4KjHRt3HlpSHtLZa0RTN6+iRQy7i00jgxsl6W
	9g2DMH2LpJndJVONMskZZXFg8gibvHaOCG78XAhRZCjJRL0vT2Jf2I7ArwZI9xSBye8FAgGo9lc
	nIP2tptiKNNMC++8ZGAbfbgiYTyZ+ML9ktsY2YViksYIuAhqM/wfDHskXAOLf+R3A1FyvwY5xfq
	8sHoaoFfBhu4F0
X-Received: by 2002:a05:6a21:485:b0:3bf:aa1a:d2f4 with SMTP id adf61e73a8af0-3c0bd0fa17dmr601869637.49.1783482244627;
        Tue, 07 Jul 2026 20:44:04 -0700 (PDT)
Received: from localhost ([122.172.82.94])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659c8572sm14158284c88.9.2026.07.07.20.44.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 20:44:03 -0700 (PDT)
Date: Wed, 8 Jul 2026 09:14:00 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Yiwei Lin <s921975628@gmail.com>
Cc: rafael@kernel.org, shuah@kernel.org, linux-pm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] kselftest: cpufreq: Backup and restore governor for
 sptests
Message-ID: <wh5m5ymcadonlywszmepriuxagc3jf4mictlvf3id6hezdpj7l@y25j7iqdg6qd>
References: <20260707163647.6646-1-s921975628@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260707163647.6646-1-s921975628@gmail.com>

On 08-07-26, 00:36, Yiwei Lin wrote:
> After executing cpufreq sptest, the system governor
> will be overwritten with the governor switched
> during the test. Restore this setting to maintain
> consistency before and after the test.
> 
> Signed-off-by: Yiwei Lin <s921975628@gmail.com>
> 
> ---
> Change-Logs in V2:
> - Wait for all background processes to finish before restoring governors
>   in sptest4
> 
> ---
>  tools/testing/selftests/cpufreq/governor.sh   | 21 +++++++++++++++++++
>  .../selftests/cpufreq/special-tests.sh        | 14 +++++++++++++
>  2 files changed, 35 insertions(+)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
