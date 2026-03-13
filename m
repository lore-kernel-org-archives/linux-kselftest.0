Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C85538E12B
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Mar 2026 10:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773399187; cv=none; b=Zujk1yOO3a5ILN/PxTA+WRfVGoFMBkSbA/D5V+HHBiYMGYst5atW/grBj6mcD/05whfsJA9c0rJpp4uPe0cioJkZaK/6hnDha7Ten4KTiWhq4brStTlkPtLEEzL4GuUqYhHWKnhDWjw3q3QQdZ+jZcpB6ZQe2ot3bKl/xJ6a8zY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773399187; c=relaxed/simple;
	bh=2Xm0BRu2Cs2z3oeU+RWd6oUeKYAmIS1aqz1IYM1B3rM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BNjjZDGVO2DqePibAj3aTod9Bt4/DXDYDnqIE124t13azQtOUB0PoSXzxyKEQ4dP/b9DKbRBD5Wuemkp9yu0Tiwyqf16xKn8zbAoi4mVSbAHmd3fjKr9EuqCJQSK016Ze3f2ORTD8iZiVwq3SxQZOLZlZ7OwCjga1WRD37AwtBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=openvpn.net; spf=pass smtp.mailfrom=openvpn.com; dkim=pass (2048-bit key) header.d=openvpn.net header.i=@openvpn.net header.b=Qgxrxi3Z; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=openvpn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openvpn.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=openvpn.net header.i=@openvpn.net header.b="Qgxrxi3Z"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4853f2826f7so19652775e9.1
        for <linux-kselftest@vger.kernel.org>; Fri, 13 Mar 2026 03:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openvpn.net; s=google; t=1773399182; x=1774003982; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DNZyinWuxfhj/HMKnN0a7zD6/loa3Iui4nBmpRal/7w=;
        b=Qgxrxi3Z1pmqTpEf2hOuwp1v9wxDcikS6dCTFPGb3AFgX+a2Vt9wEVsBKJd0m7BkQc
         rVmyshwWIlb85fo2wCPq3haizlv/iZmN/FTXhp7YCuJtfC3r3WjWxd9m/CRkqcWWmVw/
         vA6dJgzohJTWTrE4zvFz9ChPdtx/xdv2KnbmoBV4HEHpxcy4ATZxTwYBJFY67qEM1mhE
         m1VNFyf/5E+f9uGykeoAuCTlREUM6PRvuhsbUf8oj8XuRscNpn4wdoMM+EaFLPg+d4Il
         bA6H4rXfQm4nbtZGtf/4DM7sETGx9yvo1KPeTn3A4kDvNc42gqR3s3nA2egT2B+9xpqi
         esUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773399182; x=1774003982;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DNZyinWuxfhj/HMKnN0a7zD6/loa3Iui4nBmpRal/7w=;
        b=kVx7AYvOzKvuoWn3rZjBfmiuJZd+gZ5LMqL5wsp0LaN7Rkypzt6N4SiA+4VjQTGy/j
         WccJClnZOm6oHFQhORpLMSrpqav6ImFbGGyce0LfV4Y4EQ60nAoz97hxGEOxiLn9UDqc
         d0eCXQT2zF8OrLe0to3izm/ukXSdZfkbgqydnlQgCVLv8wXYj8z/4V8RMd+mPToY1ZXy
         kDFnWsLpMiabD4u/8ww5//hW5HyhCCoVKxpURyIDlR0FqwvSmNTosBDwAyCgV7+x00nY
         gwJ1AIV1y5mTo70IHv9ke4KZVcPvl/r9/HIsGOxUcVkbc4KPRTzQWlXRnrKfG8u6efIg
         k06g==
X-Forwarded-Encrypted: i=1; AJvYcCV4UqSOkM1d+AUzbocDBEmUJwfAMkEV5rgtdhaH+DDNKKCxdmm0gViv3mAUPfVViSyGogEjkYT/7JZX+jxRSrY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2qjWlQpJplKJ4y2gAemRnkdnAAPmw5eYM8mcN3Kz88f3WKqEV
	qKZ124joZjcZpIZ5BUi9+m3fi/KN1FHqJLoWY/wSbyxhZ/skkuTWvZyX88xwTjjBUl9+AUVSO1J
	B2ROvXsXR0107qVHxbZnKMVb9uTUT92lzC6swS+5LbLZfzTxQIB9bNNJNGjBvt9k=
X-Gm-Gg: ATEYQzyHecCgWJv/Sh031ozu1EZf9JRqgfhxitNdn3m6abk2252lHtOgfRsYMH2vZ59
	yMBR9ulP6L5CpaKzKCBDy/2suY122Re5xUuBCK1T7YXg4tx2MMp1QpjiB8GtzTMGeeJstGbhelC
	pUX2hq/Tvqu3Q+bhssUaQf5hdstNNPmf7xNzwMkxGSFwR7dwwMp/1SWga4MAx6mZoTBlH2i1LGC
	xZ/eu6Gokciz/Ax0ZITCB/994GunWMQHiPSKFk368R08cxanYKdFIih+hTg52TN9ipCsAwpmbyW
	uirw7YaNrBr5q0Dy3ocB1uxtpk3HutOL1KzcP1qlAU+gsN3tgFllDRlSD+0Aofd9QyYD7E5tWE6
	BWnGRsHIvhaFfNYDt4r3PF6Jtas5ZN3z8Yk/nElgWk/P0SEix7jHm2nKqNdywmoATLjbkCpOHj9
	S3j0c3cWVzgqDaG0A2fKOAR83IHEPkic3q2z8ukuRjsI0C/cvRsm9RsxgsNFN9kw==
X-Received: by 2002:a05:600c:1f8d:b0:485:4278:24fb with SMTP id 5b1f17b1804b1-48556711dfcmr40023815e9.32.1773399182370;
        Fri, 13 Mar 2026 03:53:02 -0700 (PDT)
Received: from ?IPV6:2001:67c:2fbc:1:5172:7646:5893:2ac6? ([2001:67c:2fbc:1:5172:7646:5893:2ac6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4855778d268sm24283095e9.8.2026.03.13.03.52.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 03:53:01 -0700 (PDT)
Message-ID: <a2724a9d-4f03-431e-934d-b6aa64d1ad45@openvpn.net>
Date: Fri, 13 Mar 2026 11:52:59 +0100
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 5/9] selftests: ovpn: add notification parsing
 and matching
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, Ralf Lici <ralf@mandelbit.com>,
 Sabrina Dubroca <sd@queasysnail.net>, Paolo Abeni <pabeni@redhat.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 linux-kselftest@vger.kernel.org, shuah@kernel.org, horms@kernel.org
References: <20260310145006.30858-1-antonio@openvpn.net>
 <20260310145006.30858-6-antonio@openvpn.net>
 <20260311201738.20d816bd@kernel.org>
Content-Language: en-US
From: Antonio Quartulli <antonio@openvpn.net>
Autocrypt: addr=antonio@openvpn.net; keydata=
 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
Organization: OpenVPN Inc.
In-Reply-To: <20260311201738.20d816bd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 12/03/2026 04:17, Jakub Kicinski wrote:
> On Tue, 10 Mar 2026 15:50:02 +0100 Antonio Quartulli wrote:
>> -TEST_FILES = common.sh
>> +TEST_FILES = \
>> +	common.sh \
>> +	data64.key \
>> +	tcp_peers.txt \
>> +	udp_peers.txt \
>> +	../../../../net/ynl/pyynl/cli.py \
>> +	json
>> +# end of TEST_FILES
> 
> needs alphabetical sorting

Dang.

> 
> Please do use/steal the script from NIPA that validates the format of
> Makefiles, cause it's really easy to make a mistake on these
> https://github.com/linux-netdev/nipa/tree/main/tests/patch/check_selftest

Thanks a lot! We were looking exactly for those.

Regards,


-- 
Antonio Quartulli
OpenVPN Inc.

