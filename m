Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795592968;
	b=h+XX55Qdje2lO8QWeHLuVXDaw+dZiorTbR0N/dynoMjW+g8v8rsdpU/olU6s3BHcvjVS
	 2D0ehjkBB3Bf77yOMaeMs95vIMenz3y7pVk/sZFZ5F0fYFIhYs5PtMGGMv/p2hrjmxzAF
	 r1evff5v1VOv7KczzNHRsaD1qTgEDb7chcCnF8Pqy5XIln4PGwLWoPm+MT/GfXxc6Va4a
	 GMTDqIgzXXC6GwTlvEmCViMZ5evOJph83aYjL1Hkvn1JNBht/fW4Qgg0ivpjuz0DZE2GR
	 qjolXi8xZtN3T4p16+R/z3V38ecZUk5PA9uohsULnD0eRmVe664Tu8zHh59nMnZ2J3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795592968;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=XbkWYxcnakfZmA9T1+I7Na0TVwpp2fb1Ta7OHaIvM0I=;
	b=VrzZSJ/Dlt5NVFDZV57Kh7xsMDw+L6+66lFanNgxiWfkWGxJeNTWZQcwXvb83BJH5N04
	 mxFqq+e7Cb0b5GYggBGdmyUtxeWrMnhp2ZO6lsInJdI/wQurEAjtwoJqPWiv5VipKHeVg
	 d6ACbAjFfIBjGhZcAQ64O2iYTNU0RIvmB4UtSyzysjX730m0T+8dQi10zLmZcs8oeUEhM
	 YhD/IMnJ70vC5qZ4oetEnFfRBHj6BcPmtk2coB0GFnzZeOJ4gnM4mAD5LBdltH7dJzt3e
	 HpU0kPVtm59E1maKO0v1eQaNDAskc99FN5w0zt4udXzPSu5ZsDHbT+t7Hd9pZg28RZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f+0gcdtW;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 909B0606A336
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 07:49:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 909B0606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f+0gcdtW
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-38431138772so7016982eec.1
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Nov 2026 23:49:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795592967; x=1796197767; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XbkWYxcnakfZmA9T1+I7Na0TVwpp2fb1Ta7OHaIvM0I=;
        b=f+0gcdtWduOA98ocpZ4P6otkLCvczzq5SVzcJN944awqW2BkygzVvyoH8NnFAjOdDC
         NFW3hqkG7IECoi+jABlU55SYHKQ0pftH3nyRlALERlmFS0q7Pu2GY6ZD5BXZPCVMD9ed
         q0jgKCuk0GykdiPKK7dnysrp0HvR2Swlt+fyJgW75NECl5gRN/AtsBF/bwm/0UcFIfQC
         ZAOyEyQaUjbAYgykQJQ0PlmIoKy6xGeE7TxnRPiMhbVa/O95oNWm+3JF4qWA0xa/u8Cn
         SEwrM1F88/TeZZg0W+0lbdPsFFwi66oEcGXUJ34dVnaG0VjVHwH5oX5HNKyO83uAcnCS
         95bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795592967; x=1796197767;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XbkWYxcnakfZmA9T1+I7Na0TVwpp2fb1Ta7OHaIvM0I=;
        b=J3Iv9dPX0Bwq809idepeFWZS+y/VDwDoQ6F1TMFy5Xtcv6afKvqKjLSAOwog+9faKe
         nPCP9px4LkrkGftq1izQGp24nKgORPMhMobSmhAnY9O6lzB8q+TJwpE//OHWmMJih7T4
         q70lwbwBCKZ0UW2GWMOKxeKiBwEV3w1Re0AjGKzULiAknpeoMK/RHvAkGsCAcXyYhjzG
         QOd1hEkzKxHBk81zZPG7O5tSRN2CY4PDvtFJAolzPpDLUrhhackDYEXt1ywizBQLA8ey
         PHq2LWS0wJAyzzK3qQVEzWGPp9XlCUurDgbLvUwDrTV6+gPztIphZQQx99mYecMXpp64
         uL2A==
X-Forwarded-Encrypted: i=1; AL+hErFZMo4R2J702GhcBhw4spySXnYgJ9W99dT2DJEWQEoHw/OpnbAr4LdQfADcQ6r2hQdN4Et/0SVw2fYSWZTtdp4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Z4O1AQfZyanIcb3hoHOyaP1Cr7sWc7D3yLeN0/sNisp+7cfNz
	i1tdjcULanXQtTDbiV059hGUBkFPo93/JEUYwSMuP5y+iNcEFa+6Opln
X-Gm-Gg: AZFdTZf79DT14Eny1+Lwmm1t5VS+E3cSuxIuD/z5IJbOQHFbQtz18fwBWeVncKy3lWu
	OciKvcme0gDGRqvCnec33x5/OulmL8Suj+fSOpMulo8VC8hzlKED2eY5kxZnU96LPwFG05SlhSM
	YkAVTLgLm+xmG+wnVs1+SnH1tgB5sX1uaj0/tdzQBXjnRq2EEFBDG5zA1KdbZ4rNmrqyvqWaHLU
	dOJdSstBbzl1dattFBfkIbdx1AAjhbxwD2bYCpW6fwOXAA+E2L/03TX02SKnpEXwVGKyoMDx72Z
	ugG4Lrrj4p7g0rahSsD27oktYUdYtSwYmfK2OqYxemFeZ+7YDCsINzlQ9YExr7x6VMdzuy3asEQ
	If8Qiqj4GxmZPY9vjwKA9io9ztj+Ncx9feb5PMc2eqK/PUyBskvqifYbDh8JhaAQ/06GFs9+zfE
	j6u2jWU1NDS5IbVOCs+enwXRywTTsFcWXHsUvs8Cp6DMawErTcEZkpzdLgVaP6Isj0D2xqDTkJb
	GJQlx8YCA1KyH+WQP8+U8IRNqEiZEh0tmVdUNSVVwDeRvZ4yx4RFfVT8pzuhxOGdguD8PsIAzhZ
	M+XdPfWvm2tppsBDZ7pyLs+7AAw7qz/aUajJTV/H/CcR5wSIPdU=
X-Received: by 2002:a05:7301:dd8b:b0:372:32a1:b384 with SMTP id 5a478bee46e88-38571510675mr19309829eec.33.1795592966558;
        Tue, 24 Nov 2026 23:49:26 -0800 (PST)
Received: from gmail.com ([2a03:2880:9ff:40::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386c7c62a91sm9502217eec.17.2026.11.24.23.49.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 23:49:26 -0800 (PST)
Date: Tue, 24 Nov 2026 23:48:56 -0800
From: Narcisa Vasile <narcisav.kernel@gmail.com>
To: Joe Damato <joe@dama.to>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>, edumazet@google.com,
	horms@kernel.org, narcisav.kernel@gmail.com,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next 1/2] selftests: drv-net: uso: check datagram
 sizes at the receiver
Message-ID: <awaS6Koc55ducrm6@gmail.com>
References: <20261125013838.3823834-1-joe@dama.to>
 <20261125013838.3823834-2-joe@dama.to>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261125013838.3823834-2-joe@dama.to>

On Tue, Nov 24, 2026 at 05:38:35PM -0800, Joe Damato wrote:
> The receiver only checks the total number of bytes received, which is
> the same whether the peer gets one datagram per segment or a single
> unsegmented datagram.
> 
> Run socat with -v, which logs the length of each datagram received,
> and check that the peer received one datagram per segment with the
> expected sizes.
> 
> Signed-off-by: Joe Damato <joe@dama.to>
> Suggested-by: Jakub Kicinski <kuba@kernel.org>
> ---
>  tools/testing/selftests/drivers/net/hw/uso.py | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)

Reviewed-by: Narcisa Vasile <narcisav.kernel@gmail.com>
