Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3A4F36829D
	for <linux-kselftest@vger.kernel.org>; Mon, 14 Sep 2026 16:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789401894; cv=none; b=kvESncCwqYREf3l4rP0dOoHN6A06fVQjIE2bcXgpXkGL/LOpTro965L88f9BjTkws8LbhzXdua1eIzs1KHPeg3ozc+RPnXKaPUqbqyfJCB5z4zEjJUozj3zvSzXzQ05BtJDeIvOZgkYN3HMHE4CbYJTZ62aRIip0k2P1ABRlUWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789401894; c=relaxed/simple;
	bh=Sgn87V/ffdQ0Mw2u0QtttnnD5720T1tTrgEBiXpaGcA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r3v21gFuRCnsRg6nYLdK1YYPJH276mI8FaT/b0oeoop+kpZoEq/Gn0dvr8Uf9YYlXNkI7WuFAIeYM1pAJotXlJTaUcddYnSv/XHMbcS1p6zYI+GcoJwvNBgOghjyu1h0MkPQLPvNzBsLTwF2TKBX8yKGTKVuvBR1xg7AnuRuG7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com; spf=pass smtp.mailfrom=6wind.com; dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.b=XzkbyW0i; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=6wind.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.b="XzkbyW0i"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7c6dbc60so455195e9.3
        for <linux-kselftest@vger.kernel.org>; Mon, 14 Sep 2026 09:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=6wind.com; s=google; t=1789401891; x=1790006691; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=c2e/oQkBlRuHGocwCZrcUxkwTAc0GxvFf1MGdOjknyk=;
        b=XzkbyW0iKKz9d9PcJHOTcSIob/MlbyKvGe+ZoDPvMtkwwmacU2JdDY9recjcpaOQ7h
         5pu6SGEDKVamOzoyR+0xkW8N66anfEntWbVcxiYwkM8tyJf36EwXrnJ+fqg3j1IlWu5T
         hHSyEymKM7mtizy6MSXOoBchAloasbUMrncWHzaxx5cz/+EAzDz6CHJwS9VmgKdcmKAO
         uLEqCPdAUabWxhA8fZ0JP3PxaN4Nll/7kth5HYohg+oVIlEeJ5UsmpuIWQ9sGXC3xIkL
         0dRzB1nPv4OX5eRhHsWkLbmh8YEryB41Yweu4EbesKuEwR60pHr2R9Og9BDskNmB7si3
         jAVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789401891; x=1790006691;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=c2e/oQkBlRuHGocwCZrcUxkwTAc0GxvFf1MGdOjknyk=;
        b=Dtwrpm0hKWMlPjcSRZ7EA/PUNBLauY6VZqmrTfc6vLjutQ6M04vJoUOOOOvNlBSxEX
         D4ggx0IHWJaeXTbC+pJSPhCpC7ydWKmcyPQ0WbG4QNtBjmQlToLBYZqe6B/44WTtgq4V
         4WB46p1rlHLuGsWQWeQwUplkSsVGL4kRuoPNmhL6NCyS3JJUyDy4pQYXXQ+ySMos/CpI
         eU+X6woh5Nf2KXmbxQAB12kf2zeBjWzTQmZlUHfDViNF7DiVnfYrOAeAZF38eEeCbQg+
         Csw4hCuSZr4iop9Nzj7aeN+EjgbUjaRs9g6IyaSN9RKTfxfaqL0duGL77ZKULkXfFXIy
         J5Vw==
X-Forwarded-Encrypted: i=1; AKwUvBzQIyF944ipXkKxzsy9FqR1vpW4du2OKG2iG62WLsSQI7tz1yjvnLwDNJc7PQYYIdXL6C621UIBoBAsTJfjJEA=@vger.kernel.org
X-Gm-Message-State: AFuF++nIAvxAsZKyu7RGKocS/KPl8uiYdH5oMI9y3arPhkjCw70dAZ2T
	UZfyPZnXLqaYDxiPq8XUL3x8I7Bq4LNngjZucuG4+cJANtr3ii+ELECMeUN3+cdVbaY=
X-Gm-Gg: AYBFou1YUXA59s/HOaLNc6K/+0DLFJQ8C+eNo5MvILIwboV/X7i1WdzSZcnpreVtBbW
	0OlT4CovxnLe4VGZRLDbMgP8xvxADcdxVJwPoTho20bqtb7O7kbPgZMa7kVBS7cQSKJD7rZQFYU
	k2khvrUb0REWPPaj+B0cqIhISwPXmKAU2zZUI9Xc9AJ3pAy8M6hF9RshQYKb8CyRJNXdwTT2Hia
	huHX1zQkUa6cxqMVohOaVmYlbpMP0Nht5JIwHq9J+IzqAfyIb5a3x/hV0JExBMlx2kKm5xaFx+7
	v93VcdEhcHKNfinzCbpVG8bg6n4WfmhhLurYoDkFBHIX5eI675VGeA246CFJ3y2yQ68jh28NDFi
	BuspAoIbfjSqvM5snxI2su5UY0+rveTVqbmAu+Ttd7uJksoxKSbfOGZ1T3r6upvV9Socx+b5w0e
	gEfTJtGObOe85ATYKi5InTaDUw477XiX1DdwdtpS19MfwIdzCLwhVRDC73NUdYsuh/hl+T9sokH
	2VMFEPKP/hO1mFFgoBwREebrjPLPr5To59oMJiyPm+su72hGn7Q
X-Received: by 2002:a05:600c:19cf:b0:49d:1da4:511b with SMTP id 5b1f17b1804b1-49e7a6859e1mr35897685e9.1.1789401891025;
        Mon, 14 Sep 2026 09:04:51 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:ab7:2110:6a1d:efff:fe52:1959? ([2a01:e0a:ab7:2110:6a1d:efff:fe52:1959])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb35bed0sm28874405f8f.32.2026.09.14.09.04.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 09:04:50 -0700 (PDT)
Message-ID: <29afa1c3-b1db-4e98-9640-104251cdfa2e@6wind.com>
Date: Mon, 14 Sep 2026 18:04:49 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: nicolas.dichtel@6wind.com
Subject: Re: [PATCH net-next v5 4/4] selftests: net: test AF_PACKET multicast
 dumps
To: Yuyang Huang <sigefriedhyy@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, David Ahern <dsahern@kernel.org>,
 Donald Hunter <donald.hunter@gmail.com>, Eric Dumazet <edumazet@google.com>,
 Ido Schimmel <idosch@nvidia.com>, Jacob Keller <jacob.e.keller@intel.com>,
 Jakub Kicinski <kuba@kernel.org>, Kuniyuki Iwashima <kuniyu@google.com>,
 Nikolaos Gkarlis <nickgarlis@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 Sabrina Dubroca <sd@queasysnail.net>, Shuah Khan <shuah@kernel.org>,
 Simon Horman <horms@kernel.org>, Stanislav Fomichev <sdf.kernel@gmail.com>,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 netdev@vger.kernel.org
References: <20260914014539.5015-1-sigefriedhyy@gmail.com>
 <20260914014539.5015-5-sigefriedhyy@gmail.com>
From: Nicolas Dichtel <nicolas.dichtel@6wind.com>
Content-Language: en-US
Organization: 6WIND
In-Reply-To: <20260914014539.5015-5-sigefriedhyy@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Le 14/09/2026 à 03:45, Yuyang Huang a écrit :
> Dump the link-layer multicast addresses of a dummy device and verify
> that ifa_index restricts the dump to that device, that the all-hosts
> address joined on link up is listed without IFA_F_GLOBAL, that an
> address added with SIOCADDMULTI is listed with IFA_F_GLOBAL and
> IFA_MC_USERS, and that IFA_TARGET_NETNSID dumps another netns. Skip
> when the kernel does not support AF_PACKET dumps.
> 
> Signed-off-by: Yuyang Huang <sigefriedhyy@gmail.com>
Reviewed-by: Nicolas Dichtel <nicolas.dichtel@6wind.com>
