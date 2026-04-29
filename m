Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com [209.85.210.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 090493FADF2
	for <linux-kselftest@vger.kernel.org>; Wed, 29 Apr 2026 16:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777478894; cv=none; b=tGtzpnAOiBmOSRZFOxkWum7083v9fv53sslzpZ7pIpU+8ccXRFmjlMNA3SrrGyz+PLRl0EG+VW26t9fhPzMZNk63BL7GBg9nSIgxySsJLnKCnj4oA5aoNU91faE/1tnQJ5gJU/ZqOJ+e+gG2PxY9d3JGJn6Ov0x+3sXHwtI1HTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777478894; c=relaxed/simple;
	bh=CkV3UIcJhdoUQamAo7wSXIPkMsnfCDQLRf9Rws7yZ5o=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=dLz176S0LnSLA4gIuiUy1st4T3D24PpZkSXXehRqBf/IfPPF/atcNiXGb6FEDQD2Q4+21aC8omQJhRpQQrc0bzlhqeQtdTr9OFirANjqRmqxol7U3lw5yx2C1DaPoSHATyeCHb/tSOKRhA3zxHtZFFkPHdPBd+LchFaURtljHOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ovn.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ovn.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f65.google.com with SMTP id 46e09a7af769-7dcc9b506d9so8845045a34.1
        for <linux-kselftest@vger.kernel.org>; Wed, 29 Apr 2026 09:08:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777478885; x=1778083685;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:cc:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uW0sQP+sekma1N2hzMiGd7HMv+vP1und5+yCAqWbZsE=;
        b=o+3kvACGyqOvq4zOdycKL4eXw+044YgWHOzmEOmi6fi5Wcqa3OV+1NcbiGvhgDg6je
         95k/Tf621iX1x/vJov0hn6nXNovqoXPo1KGBEPD6B7bVqCc5FYP5rzIta3cFrkUIvdxP
         YC+mqmrYS9Z/SfiiUpLkxzHpixX5zBN6LAbWkgx+Ic1uhQ+O+ZQiC5qXf7+cucoTIkKv
         6RpG14kW/G/6/ykZQj+UImbyh4O/YgE/5o6NmiycDt5KKxlLRgeG3YMPlFiWDXVzzK/C
         hNillW0LjTmh4JrkO4CHtWp2Y7VJf1QXsb6wjzyJy/92TSrVZ+LP9F/heZP1ovsfK4fn
         kT3w==
X-Forwarded-Encrypted: i=1; AFNElJ9v6RfpV94ljc0ZgwDqSZjLNCKrIwBaq6fye2xHUie92YfA7M9b768VMeVESs4v/Vp4jpFTExShsVQqFBTfWn4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjwusvmEWGsEbLSrZcuRb2MsIVX2lR7EZPYmlGsGvqVZt+IUvf
	WGwP2h8qzA/2pXIX3vLkBIwM1PnC6ucguDKoG3jAtYJFU1Etv8XcIIIYImIM0jl+H3g=
X-Gm-Gg: AeBDietYOGjbOuAGZJHtm/aJgpuJlzggHrPpzDdDumck8PXHuKk07/5BElwEADIE0Vg
	PhoTMgfN4u+rDd9gOt88rdWI8nMWQwV7O52rwT+lekeZb05ZByIAcDRx+AFyJfi4at89FG/s8Ho
	2nAsZRjR2lVNXN2XH01Fu1Vx7ZfomxYJE9WJ12zUmqdQse6LW5CS87K0AFQ0qh2hscfDaxSQIzA
	CvpcXakk+K9OH64pwLckUyCXMs7r72ylEJEfZswYA+TXL27buaI0w7pg+CSmC0i/AMPcrzF/H6M
	OBRoh7NlZFgRC1Layez3CQopx+GZLx3Uhe5ZkHCRtyAwE9siqFproDyeagZCaFOkFQCd2ex//So
	KtNHJq7j/CS+8zT7G+5d0V3Pvbys35resywYjmtke9L2Co5I7IxiIkZJ2cWGzNQcf5bV8oLf2yv
	WR3dL65nQwLA05tN3o+iND8rZSZDusA3wTQzJV229fDc/KtrcQCLjBnHjbgHy3V8fsZg==
X-Received: by 2002:a05:6830:67cc:b0:7d7:e045:b489 with SMTP id 46e09a7af769-7dea66700f1mr2896745a34.12.1777478885133;
        Wed, 29 Apr 2026 09:08:05 -0700 (PDT)
Received: from [192.168.88.241] (89-24-32-159.nat.epc.tmcz.cz. [89.24.32.159])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b3ef6faf6asm27819856d6.5.2026.04.29.09.08.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 09:08:04 -0700 (PDT)
Message-ID: <9e8f5742-d607-4c48-a280-7fc0e425a521@ovn.org>
Date: Wed, 29 Apr 2026 18:08:00 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: i.maximets@ovn.org, Aaron Conole <aconole@redhat.com>,
 Eelco Chaudron <echaudro@redhat.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
 Yuan Tan <tanyuan98@outlook.com>, Yang Yang <n05ec@lzu.edu.cn>,
 dev@openvswitch.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net 2/2] selftests: openvswitch: add tests for tunnel
 vport refcounting
To: netdev@vger.kernel.org
References: <20260429151756.4157670-1-i.maximets@ovn.org>
 <20260429151756.4157670-3-i.maximets@ovn.org>
Content-Language: en-US
From: Ilya Maximets <i.maximets@ovn.org>
Autocrypt: addr=i.maximets@ovn.org; keydata=
 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
In-Reply-To: <20260429151756.4157670-3-i.maximets@ovn.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/29/26 5:16 PM, Ilya Maximets wrote:
> There were a few issues found with the tunnel vport types around the
> vport destruction code.  Add some basic tests, so at least we know that
> they can be properly added and removed without obvious issues.
> 
> The test creates OVS datapath, adds a non-LWT tunnel port, makes sure
> they are created, and then removes the datapath and waits for all the
> ports to be gone.
> 
> The dpctl script had a few bugs in the none-lwt tunnel creation code,
> so fixing them as well to make the testing possible:
> - The type of the --lwt option changed in order to properly disable it.
> - Removed byte order conversion for the port numbers, as the value
>   supposed to be in the host order.

Hrm, forgot to remove the import for socket library that is now unused.
Can send a v2 with that once I get some reviews on the set.

Best regards, Ilya Maximets.
