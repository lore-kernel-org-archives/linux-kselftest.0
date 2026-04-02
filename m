Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17E273DD50D
	for <linux-kselftest@vger.kernel.org>; Thu,  2 Apr 2026 10:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775124617; cv=none; b=f2Ott8CnUgnjK0TGHyU/S59aBmQfCROZaxLN0YHHMbp8w02qXJ+G9I65O7R/kvLsconrK8hqA4OxjcENRjf2whiwqAQjICkyBEbr37S65dEudAc8ao7D1QFEclnkrHCZLTRF9TIvMiFU0+c26WKR/u4WwYYk3K6u44nuUHfCwfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775124617; c=relaxed/simple;
	bh=zHFrCPHhU82trU3T1Txy7LHnZJ2znMMSxro8pRXdEog=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZaqZk0oy8AzgSmOUdUI4idctDuLHs7zRiCwSj43t+MuboeqNx4cM4iv5xxzYHGOmU+fwMaMKtnjHNlVIQ7zGrpJYXHXuRWQqY+Q+dAygRMPMdypXlfSjY9zbpOxSPcnRuyVKtbkr0cY4mSl294T5++jXgTni4BiAQR3iozD9eu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Fn5RhOQW; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=VYRQfAoC; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Fn5RhOQW";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="VYRQfAoC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775124614;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vI34ad9TZ0aROIv3z6J1CAQ0jr+pvjoqHVYmg8tKBOs=;
	b=Fn5RhOQWYFKdDSAHY6i+BgliUfNONbgeAsmFXRwfe096b2QyO6EZoJ3cdnLFHrdtyD+e6r
	5EcHyBMXVo7BlcVWQif2ZG7Bja26mZ2iBs26PWkew6J41agw9xiD4ZwrFRbkpSUac6nraT
	mRTEIluRBD0/+RS/djyyh5K7FcHGhKU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-122-uhz6P16pOJGq1mn8uLgWsA-1; Thu, 02 Apr 2026 06:10:13 -0400
X-MC-Unique: uhz6P16pOJGq1mn8uLgWsA-1
X-Mimecast-MFC-AGG-ID: uhz6P16pOJGq1mn8uLgWsA_1775124612
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-43d07f0aca0so569731f8f.3
        for <linux-kselftest@vger.kernel.org>; Thu, 02 Apr 2026 03:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1775124611; x=1775729411; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vI34ad9TZ0aROIv3z6J1CAQ0jr+pvjoqHVYmg8tKBOs=;
        b=VYRQfAoCsihuW+YgM7G+OmieWlW7QcB3oYTaylUkuB1qterNJYwfZAjthBBQwsUz4Q
         TllXpn40O/5msTcgCh4mHA8zCSdYmN4O1pQY2xZku/NCbZxt/YaLdoZ1T+MV6ivNVo3z
         mSafhlg1pM185Ainhqj248TyPiNLuYZ1LmNnKUz4f9pM0+4fHQkApWF/lAx55022CP4L
         nXnebY0DU18AKAMC0WWmkYF8eYoMl2OI8Nev8CX582riMHI7QqXwJi+RvuZcAa9wv3ZZ
         Otydikw6yEEJuilWijZhu0w0zbZGG2gokdXAkRWoIe5f0r0+hS/hMvZOm9S1B3w0o/9q
         ooRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775124611; x=1775729411;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vI34ad9TZ0aROIv3z6J1CAQ0jr+pvjoqHVYmg8tKBOs=;
        b=sHcqCZ+RtZJpwjXQy+bUg0gOGbt7Dh+nlf0761edaj7htnwB0eHgt/MMaqUhAJXLDV
         8YMwWddOm1Pc5UJK0dQJES18UzPsdncbfeJT3dBA+0LYg10QWutriZ0zfjs20EgwW8Fx
         xPBhIksy0V9DjbIwAXEgfFje4zb9rsNNwvXqLfS45mdhnbtk0llaNp8AEOuwFw8G1FQK
         EQ7SrmyVcHVbX6/s9eQ49TYTrnfWHBle54FDCwp6Pif0S1q5asgom/jzEBJXII+LH6/a
         IKlFUxW7+OH59JDvAG+g+KE9xVHojA1Lm1SYxMvLoynUHz8kQ7nSB/c+OwCXU/Zur/hx
         9Mgg==
X-Forwarded-Encrypted: i=1; AJvYcCU247+5HkeA38l5A1jAfdINLZwylg8Q2KMMR6lICCK87SgYu8b9ctcDI6NGJXbr8Ju3lkoC0vccagT+Oi/vgGg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxwEoeyV/LeUBfiPdAM0TLc6YNxHY2ev2EZp8nmvKeKXkRh0zh
	xvmQDjjgIVLTU70KkIvelBvIqSKc0XA8Wxd3m46N8Xtadsb4N2wcQytIRAFUZmtNQa25783wW0S
	a5+gsy5tgOkLOxAqZ/NuWcNwYySkANFfi5uISyKaVOYL2HDpWIjrd+U0VKudQr06qRZ1NiiQ/Se
	nRrw==
X-Gm-Gg: ATEYQzz2BcRGr4wP+wH33qKafkqVHaWOLdORPNDNkNkMc5WAoPwQE/M9miglF8dEwPw
	vOqJSAfXCGFZ7tZdPmr5aHZkJJVZ/5KdD9FnhmnumJJvVYCIv4Wj5lbG1VtRTLHiOj0v0vtu/CV
	/hXMgmQ9ZCW7daYLufkVpFpSRyIVV3yngm+U5yh9UDuINx7yThvftMn9tTvrHXETqYnsrSHvN9M
	rPNM9cv4UEiuiHjaPu3L7mPOQe7yEP2vCpX5JYsnJ08bGfHQmz6lAHXzhtBpUDupEivyMQvc2VI
	5Vs8BM43kqaDvqmGZqNkFM9AGtgODZvFR7wcrR9aCJOSLz0HP56mfCkmYMN4s1BSGZ5clJ5ppBq
	HZ6is2bGbeSvk/syUnR7O+omkaQRnKCWQKXxefPdrTA7FuDmZDMb1ASjloQ==
X-Received: by 2002:a05:6000:288c:b0:439:ddf9:a205 with SMTP id ffacd0b85a97d-43d1f1c0348mr4685309f8f.10.1775124611423;
        Thu, 02 Apr 2026 03:10:11 -0700 (PDT)
X-Received: by 2002:a05:6000:288c:b0:439:ddf9:a205 with SMTP id ffacd0b85a97d-43d1f1c0348mr4685243f8f.10.1775124610926;
        Thu, 02 Apr 2026 03:10:10 -0700 (PDT)
Received: from [192.168.88.32] ([212.105.153.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e1fe0b0sm6286938f8f.0.2026.04.02.03.10.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2026 03:10:10 -0700 (PDT)
Message-ID: <5b7faeab-77b5-4a3c-a717-5a80f5e76a31@redhat.com>
Date: Thu, 2 Apr 2026 12:10:09 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v5 7/9] selftests: drivers: hw: move to KTAP
 output
To: Ioana Ciornei <ioana.ciornei@nxp.com>, netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>,
 linux-kernel@vger.kernel.org, petrm@nvidia.com, willemb@google.com,
 linux-kselftest@vger.kernel.org
References: <20260330152933.2195885-1-ioana.ciornei@nxp.com>
 <20260330152933.2195885-8-ioana.ciornei@nxp.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260330152933.2195885-8-ioana.ciornei@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/30/26 5:29 PM, Ioana Ciornei wrote:
> diff --git a/tools/testing/selftests/drivers/net/hw/ethtool_rmon.sh b/tools/testing/selftests/drivers/net/hw/ethtool_rmon.sh
> index f290ce1832f1..ed81bdc33536 100755
> --- a/tools/testing/selftests/drivers/net/hw/ethtool_rmon.sh
> +++ b/tools/testing/selftests/drivers/net/hw/ethtool_rmon.sh
> @@ -11,10 +11,12 @@ ALL_TESTS="
>  NUM_NETIFS=2
>  lib_dir=$(dirname "$0")
>  source "$lib_dir"/../../../net/forwarding/lib.sh
> +source "$lib_dir"/../../../kselftest/ktap_helpers.sh

AI review noted:
---
Will this test work correctly after installation? The test sources
ktap_helpers.sh but the file doesn't appear to be included in the
Makefile's TEST_INCLUDES variable.

Looking at tools/testing/selftests/drivers/net/hw/Makefile, when
'make install' is run, only files listed in TEST_PROGS, TEST_FILES,
and TEST_INCLUDES are copied to the installation directory. Files
referenced via 'source' need to be in TEST_INCLUDES to be available
at runtime.

Without adding '../../../kselftest/ktap_helpers.sh' to TEST_INCLUDES,
the test will fail with 'No such file or directory' when run from an
installed location.
---

IMHO this is better handled with a follow-up as opposed to a repost.
While at that, please also take care of Petr's comment on 2/9.

Thanks,

Paolo

