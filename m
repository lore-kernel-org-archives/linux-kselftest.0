Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 389C834F255
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Mar 2026 13:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772802360; cv=none; b=qF1hefG0PaEB8FP76pvffn6oF5tsUi04EOqLlLQEknWycrXWWFuptBdS2cdtw8RMjHHvvUdXzTfiGZOK3kqXQzN6r/wugKJ7ssYOFtu074hHP1ejJJo+tH7EXkaFdoiavpAzf66SGAQk37WFctX1OmQwnEPbuiuyhJnl3rTaKec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772802360; c=relaxed/simple;
	bh=quvLNFx0dzRo4ProJ/vdHwIGUIiV542xDUw1+ZsSqNQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NHmRl6p1mu/aeNO22k5M9dV74VDD84rF9dji8VnPuA86r3zhUT5gWoRYFcCCccPAeEP4gJv+KQfwMhejA6bt3yMGvZc1EK0Ae2PFvlDVMhEt2BjkGTEqPxj9RSRxtQAnN0NXocNHiZFOuC4N9LjBZ9tWBwBeJESqeZfaeaoy/Hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=openvpn.net; spf=pass smtp.mailfrom=openvpn.com; dkim=pass (2048-bit key) header.d=openvpn.net header.i=@openvpn.net header.b=NUMrv+YK; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=openvpn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openvpn.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=openvpn.net header.i=@openvpn.net header.b="NUMrv+YK"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-482f454be5bso94390925e9.0
        for <linux-kselftest@vger.kernel.org>; Fri, 06 Mar 2026 05:05:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openvpn.net; s=google; t=1772802356; x=1773407156; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3sFlLcLIiWA3KVD8eDJmdII6jxrEQxk04g4842tHVZo=;
        b=NUMrv+YKyhbuLThWZPADGGkKHfQ0SyNJqreN9vhYJLO/OsB8/b9yngFT/R+UW/dU3W
         W2nDsfk/RAvJl0VpNvPFg2zHDgA/cggtw9sB9v3vQ1fLwYZ72tEUxbhaRqGI48EZGOEl
         6FoHOupzyJTc7klPr3J0ZzUrkJwxtbiRtfEJj8ddAPE0xzsyzrSAj2kilEsU2iUtYS+/
         OYHyQZgy3pnHkB98FlcES5ufXaZZ61d0K2rvcS7n1BiEDH1Dyl+JN/5o5Rbre5GbmgG2
         xq+TRDjPpmODJ2twnAf8DsyHiBuJfdqoTlTF2zeT8yKYLpFcKb33Cmm+5gH4+O/0TqcA
         G/xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772802356; x=1773407156;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3sFlLcLIiWA3KVD8eDJmdII6jxrEQxk04g4842tHVZo=;
        b=NwdA/4a/Gc1+KQdhxOi2QXZsowGLgdw0LTm2WmA+eMkL8+zbugWi9Uq1cdRUvRJDj0
         vF055MoAHuwzQ96+LOS4d1fkVSx/0TWXg5IrOQb9BnR+OY05J8M7oYM1hPSmgu1vJuXJ
         obe+pPby6QMiusy5Qu5V9OSJmEK8P1GrRGDvoi38zOr9lKodKXmQOA3Y40w2awxLRU06
         Qitqd2TtDz0IMz1D3IKtpS80UoNRZOTMQJg8CGTj09+nUy6bUORsHTvWv6L9OQQ+8PYx
         JFgmNesbFVSWWpNKxa24qiK2mLZkzg2c7+n+cYtlO0og5EuwkmmfyMwPMqtTGKisjcMD
         c8jQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8Fl4ipuXkh0iQraKscJQqTyVhAsDlXLM57Y8VdVYXcV2ffvLGCtPyxdvGoNw303RHD7IPRVn591uCXJtRXFQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzb18SHqBSlXlAZl8CTCZZR2xRoUTVoKLcbCGKIKAq203QNcI9J
	M5QL9r0iXnvshmNHvz/gMKEfqBzGLAwnwftosbPkSmAAZ0v+rILbm+WC1+p81z5146CrsOm3nzK
	iY2LACJkwaA/PsX4lNTzUWKOEdD8JFkf5BWUV/4G7FOkYcxAZ0RXX+uygkCs5Rt8=
X-Gm-Gg: ATEYQzzO97Lc2e5IjLZJOqKV64rYcLGcg71m31YjLboT0UbyksXKE/SCnlvRJROTSZQ
	LOXvVdxxtQaMMUIcpIW4E3iiWkPGd9LUiQvORigadAwbbNJnJoosF2z1nknq12sV8itxTKX6T/v
	YuJHpH8oYROK1kmTn57VsR1DcfKfhmiBs2WEeC23PUybS7/IHS4xHJvj+V6xqEvmYZHrBHOLcYm
	13LfKDGgkVlt1Auptxk24CFnqeJXAO7sWjhjc16hmKx4nEQx1LDcV1e7/g+RYX+KerstCxcxAIS
	Hie48iGpl+3JBMhWQRVGKbuH02JoP6sXGAe7dTOtXVkl6lFyOa1rVGl6Svg3qbtiNFaQRqqHugf
	Rx1gghNfbgqhmsb/RkXV8/x5I1f/csXl1WB6utwW5JsXRWE4JRwfQAMKZN9ififjtjLxqKxEyV4
	k6yLENCv1/8mlQpttCedz9pNtsV2fGAUI4HODV0yb6CY7PVQjiIRYj7A+xFmkk9w==
X-Received: by 2002:a05:600c:3e10:b0:480:4a90:1afd with SMTP id 5b1f17b1804b1-485264e7588mr32493645e9.0.1772802356375;
        Fri, 06 Mar 2026 05:05:56 -0800 (PST)
Received: from ?IPV6:2001:67c:2fbc:1:e1e0:441c:b462:d279? ([2001:67c:2fbc:1:e1e0:441c:b462:d279])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48527681e2bsm36651985e9.5.2026.03.06.05.05.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2026 05:05:55 -0800 (PST)
Message-ID: <b3197cdc-83db-4739-966c-018f8570070d@openvpn.net>
Date: Fri, 6 Mar 2026 14:05:53 +0100
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
References: <20260304230643.1014-1-antonio@openvpn.net>
 <20260304230643.1014-6-antonio@openvpn.net>
 <20260305191732.2bbc386b@kernel.org>
Content-Language: en-US
From: Antonio Quartulli <antonio@openvpn.net>
Autocrypt: addr=antonio@openvpn.net; keydata=
 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
Organization: OpenVPN Inc.
In-Reply-To: <20260305191732.2bbc386b@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/03/2026 04:17, Jakub Kicinski wrote:
> On Thu,  5 Mar 2026 00:06:23 +0100 Antonio Quartulli wrote:
>>   .../selftests/net/ovpn/check_requirements.py  | 47 +++++++++++++++++++
> 
> this file is not included in the Makefile, it should probably be under
> TEST_FILES ? otherwise when tests are installed with make install this
> file won't be copied

Right, will do.

> 
>> +if has_listener_requirements; then
>> +	for p in $(seq 0 ${NUM_PEERS}); do
>> +		setup_listener ${p}
>> +	done
>> +fi
> 
> There should probably be an else branch which prints some kind of
>   echo "SKIP - requirements missing"
> 
> Your requirements.py script prints stuff but the output needs to
> contain the word SKIP

If "has_listener_requirements" is false, the test script still goes on, 
but it won't check the received netlink notification content.

So we're not really skipping the whole test, just one specific check 
that requires extra tooling (which is normally found on all standard 
distros).


Do you think we should rather SKIP the whole test so that we can easily 
spot that something is missing?


Regards,


-- 
Antonio Quartulli
OpenVPN Inc.

