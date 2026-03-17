Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0693434403D
	for <linux-kselftest@vger.kernel.org>; Tue, 17 Mar 2026 06:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773730113; cv=none; b=SOWTTAbnghU4fHTolTD9YHNt2zRy7bpHfpZeW7xX9HbOVoCktDViC+iwNrid3cyJRxo8DN53NwonEoChaeYqfwpz9lqSqsQE/LHkB//LkDZHFreGwrWvV27+0eBGEPXyL97exju6HBY52TIAU9ykNyXN5vxyPlxicdOSKCKDAqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773730113; c=relaxed/simple;
	bh=7mDT2KegbjhvcGVQ7Ky//j6ZPW6Zd2p+RwPpKzFXQmA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AW8snUs/WLRD6YZ8HOLiY4OzthNUsDNpQ4BXxJSc9qE4mJBURLoik3FZGNl6RAexQIfs7prnPexZ9r7YNOXSJ+kuu4eJrXcnj0PAWezNOOKj1lAxNf4NrTVjx9yQm+IgJQszxr0JMdzXjh8pSpuOnpvyDlXrnhPdc3biS86cMOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jl6lM7Ok; arc=none smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jl6lM7Ok"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1271257ae53so7277773c88.1
        for <linux-kselftest@vger.kernel.org>; Mon, 16 Mar 2026 23:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773730111; x=1774334911; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a/uOq+b65vcKRbPJG2b/xfb9wjJT/epco+iRGrxkHWQ=;
        b=Jl6lM7OkYWMjal9cJ2c4wfuIsWki21sMKWMw91Es/DWIEtNnSpm3sgg9i8bcrXbGD3
         2QzOotwbrY0CTKbPoa5t4wiVXbXMXhcTVEOUx6AfPqQNhY0dHG1Y97+Vvv1oT86QwYDa
         HYitxSqwXpsPE9nU/uROOxPtyxTdDbFv+5nTztDsVbx7nT3Cj7ydZLO91xrxsjnz6TGS
         fUILnpgEQPvglN1rA22Lp2aK4M26f6nNuoleWF/7C1Gz/+Xc84SUeWmLMP2Bl7Vtwf87
         3bQh1/juoy/+SebiPlYN4whYButH+zk+0ejhAxQZjFjqzBdbm6ynf2bdLnHf3y1TUukI
         6x7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773730111; x=1774334911;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a/uOq+b65vcKRbPJG2b/xfb9wjJT/epco+iRGrxkHWQ=;
        b=HskJaV/j1Isp3QtXAYqCVlRXZGXVER2Y4rasjnKeUfoqq9Fn641N9NyIjQRBInIYR/
         cUY7XEyHlVXxSyhllaEfHeFcJ9eejtT9QOmBHoV32kQfZjkmcGy3VmrqTTvKEFzijOXo
         UQ4YoIRyM5OFyhQBt8KlOH9ZckTleKwlg/meC/ceGG6+0YvR8O7hEnv5yOWFWn5ucHAb
         HW0HHb397fUXcmD8H3FYB+XpjML8TKDiksM6Mq3o+u0uiDQYOZYrwHn/YGCHl4Z4LDvp
         Ss8vKrifzs04KmQ5RDgQ+8zYfF6JoY30A2vB+UD1a1RZimBVFSj34p7FKxxkg65EcuVk
         nQMg==
X-Forwarded-Encrypted: i=1; AJvYcCVIhXb+Fi8C8Ood0nnqLYbzwU2hZEUUd+dh+/KTtwGh8CbMbCZwh3r1WffwfAaEvY6hqmqPSs9eL19QTCj/s5o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1kMWOrj74MUF56qgVbflT99n3CTMyoyYZdD5kIr9c52EWpu6G
	q1G0jnnOPj10wulFQvDERmM+sx7fsu9k41MS0kIX9K4pCp0/543jePod
X-Gm-Gg: ATEYQzzStZn+HAKOS0TPXl99Qyti4go4zy/WS5U+87VYNX9bDRD1O+BTDIR55qlCzqK
	3XXTc5HSFlti30OUHuy7BHVKZe6FsK/EQx5uT2NjmlOKlsA0LKTwnyI30DEpI8xtCPPMXlVivXv
	IYzir8keh7xI14Evfs9iL3RLoIV+UUfwjkOK81wq2r7tWKFe2ZDGdpA/8Myc+SLJTIdROaYgpZo
	YDNEBpuDb8FW4PZuwkqkNqaMeV6rv0lGFTjS3NeGuKyp+A6QZa4/dNiXnAFMwG8PxUWGIHJSVb9
	lqUYzDU0C72FU1tiUW0BBHBMyseHZxAzzf1Cae+IiRcssJSHWUnDVQg74KoLk+tnCesHxFipREI
	v0kh4RUrYXID7RB6X1SlUH4ASU5erx5pvBOB8NUoomhK+b6IcmZ5TfBY+ZtR9RlF/izYG79/uZT
	yW1hibJuqbeHkXsoaHoiZEzHsVqjlRinhLDIlU4zJ8K/r8HTYNZewtIUcV3EVKvkdc8lHiGFCXd
	aGEp4x6+gDfNQAfemlp/w==
X-Received: by 2002:a05:701a:c96e:b0:123:3500:b688 with SMTP id a92af1059eb24-128f3d45b05mr6349426c88.19.1773730111003;
        Mon, 16 Mar 2026 23:48:31 -0700 (PDT)
Received: from ?IPV6:2601:646:8f01:ac80:1833:81b1:8dd:ec21? ([2601:646:8f01:ac80:1833:81b1:8dd:ec21])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2beab526f9asm23132416eec.19.2026.03.16.23.48.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 23:48:30 -0700 (PDT)
Message-ID: <f790d4e9-7f17-4878-860f-8d21c4c9c307@gmail.com>
Date: Mon, 16 Mar 2026 23:48:27 -0700
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v4 5/6] selftests: net: move common xdp.py
 functions into lib
To: Chris J Arges <carges@cloudflare.com>, Joe Damato <joe@dama.to>,
 Jakub Kicinski <kuba@kernel.org>, Andy Gospodarek <gospo@broadcom.com>,
 Michael Chan <michael.chan@broadcom.com>,
 Pavan Chebbi <pavan.chebbi@broadcom.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>,
 Stanislav Fomichev <sdf@fomichev.me>, Shuah Khan <shuah@kernel.org>,
 Simon Horman <horms@kernel.org>, Willem de Bruijn <willemb@google.com>,
 David Wei <dw@davidwei.uk>, Daniel Zahka <daniel.zahka@gmail.com>,
 Carolina Jubran <cjubran@nvidia.com>,
 Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>,
 Nimrod Oren <noren@nvidia.com>, Gal Pressman <gal@nvidia.com>
Cc: Petr Machata <petrm@nvidia.com>, Cosmin Ratiu <cratiu@nvidia.com>,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, bpf@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20260313223029.454755-1-carges@cloudflare.com>
 <20260313223029.454755-6-carges@cloudflare.com>
Content-Language: en-US
From: Mohsin Bashir <mohsin.bashr@gmail.com>
In-Reply-To: <20260313223029.454755-6-carges@cloudflare.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


> -            _set_xdp_map("map_xdp_setup",
> +            bpf_map_set("map_xdp_setup",
>                        TestConfig.ADJST_OFFSET.value,
>                        offset)
> -            _set_xdp_map("map_xdp_setup", TestConfig.ADJST_TAG.value, int(tag, 16))
> -            _set_xdp_map("map_xdp_setup", TestConfig.ADJST_OFFSET.value, offset)
> +            bpf_map_set("map_xdp_setup", TestConfig.ADJST_TAG.value, int(tag, 16))
> +            bpf_map_set("map_xdp_setup", TestConfig.ADJST_OFFSET.value, offset)

Looks like a duplicate call to adjust the offset?

> +def format_hex_bytes(value):
> +    """
> +    Helper function that converts an integer into a formatted hexadecimal byte string.
> +
> +    Args:
> +        value: An integer representing the number to be converted.
> +
> +    Returns:
> +        A string representing hexadecimal equivalent of value, with bytes separated by spaces.
> +    """
> +    hex_str = value.to_bytes(4, byteorder='little', signed=True)
> +    return ' '.join(f'{byte:02x}' for byte in hex_str)
> +
> +

Since format_hex_bytes is not exported in __init__.py, Should it be 
prefixed with _ to indicate it is private?
