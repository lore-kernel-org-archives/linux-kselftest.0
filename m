Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55BDF501286
	for <linux-kselftest@vger.kernel.org>; Wed, 30 Sep 2026 14:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790777360; cv=none; b=V33mNhTm3N1HILU+WpMWokKmrjm7NDIJWs9A5xOuixsSRpk6fDVZ7v41ad8Nk45z/UzjrWbJUNrbz8Cnu0y1eYpR/lqM5w8m508Uk63W61YRrZ3/2bau3DvQ2qpz/lWcccJO8JgmNc6iBp17x2374moeAbDRn8XrR3D2dBi7kek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790777360; c=relaxed/simple;
	bh=BN8qNZrn5KUe47KrPph76MRZuWYXHDzUb9aSvc4F6Tw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LP6lE5KTKGZ4FnI6HG4bKlEII6rQyQCdlieEPrt92tmD1j0Qz1wWnCYcquKz48XqLyCH2eUrXoN2ESNE+TIN8LpsoEyRK3dO7yKWoL57YnpVBMJu4S/5WouYjFfr9Ept7A4dGCUZ1jo9pPQDCvGT83SDRDoHk6qeYZwofKl0ifc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com; spf=pass smtp.mailfrom=6wind.com; dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.b=BusD2SQM; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=6wind.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.b="BusD2SQM"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49fe8beb8adso2421285e9.2
        for <linux-kselftest@vger.kernel.org>; Wed, 30 Sep 2026 07:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=6wind.com; s=google; t=1790777339; x=1791382139; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tdG34iKbPg/dwz5nj8mIvaNch6v4ZkxNF8npErR5dgw=;
        b=BusD2SQMeNc9qIwPavPHiOm5OZWZJV90oDDI/3iC5w1Nd0OUfddlgAhdKoB/0O3aHL
         geVMedIw7bU58L8CMt54+jF7iW8pqbUcmTxvrXDrGMFBb16mEGtxG4teFELoOapcFfLp
         bMxVW2Mg8N/M+t2vcQybJEhlIqus9xRCQKJVr0bu9qgZPY0uc+5ZQ8jO2h4AWGVDUPE7
         8iBVT/CCxZ9Th8+YeiFUZJufc27/PvZR6oq51kmJl5f3ez0lnDor1UmOlPsh4hHW2Ly5
         IhZ127CjZqiUc5xhm8xHrN2nvS4bmyoy8RO+C0HNRBXuxim08CVrZ8nunlzddNnGbfxH
         jYSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790777339; x=1791382139;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tdG34iKbPg/dwz5nj8mIvaNch6v4ZkxNF8npErR5dgw=;
        b=P65Id1eWQE1r3vYHyJGyWcLOECcVcNGKh3v+JfeETfcL0CUfgLG8Ek3asBR4o5TW+3
         GPYluuzcdmqElJucPImZxcthKV7t1cT6TlSAXkL08CmvFBjLT3Ddz/NLbCburHTaCcJq
         EBbR1ZIK6A47c9Zt8gUp/WA2/mBvpxgWYBXfPODff6wiWsKxuudm0CXWzF7ODO6FG4dV
         wFSqo/CFd5zeGIZ0jXrauzCBSeHcCmPHO+QyWGOwGwxN/Fmc2BdhRAGEd/nNkLZXxpeD
         tdJdZtz9KLYc2n1Ro5vy+goT57cRhgiyIZBzIaEHtMB9dQeIbMUV+LvmrniQZlgE5iA/
         jo8A==
X-Forwarded-Encrypted: i=1; AKwUvBykRFTp7K0EZGf8/5GQ1fOfzEAGIchv6NpB6nK36AaMWHIoiAXQ168LCUcwnS0nsNy0CqUy6f+Az0sJEjqOdlc=@vger.kernel.org
X-Gm-Message-State: AFuF++nbvSRnHRZbMgCwqzBH0un4af5NqQzGZjMD+T1zuh+aP8x8YYgV
	LF+bWdGU6zYPitddOSH+WRfkt55PUE3+y6Fbq3c4gRlJ0pNE9rQ4Wbq5JN+4Z5A7BVg=
X-Gm-Gg: AYBFou0y1uAHULp1fx/SqW6s2Z3VBzYzGhFnt4JL6p6tD5sI9PHzkyL0UuRLANNl8yX
	oOHS5I/RG0mwh13IdFS/SnRYIZCN3t/T+0A1fxCDXQsjhRM3KYr1tKBSJUJ6GuWUsa8dtzzCSIp
	7AePPkjymip592/E41wwuVD0ygcYO2e2IOQmFFokoLqCRD0FXPivhlCkDhwz9wpyxcSb6maUHxt
	aj1ZHwe8PtxkoDEKtbDImcn60N8tT1h2KggJ8JP0yJfSzA2j5eFBzCsCmOy2R+FsR1NZz/NP1m3
	nVjPn1wAfSS/BUYqjdd328pq42VFcoSzjoYOmj54gb/sXKTtvG+u3rjQ0w1jR3SgbJm7un75oiL
	Tpwzy/aSEbMvVEaZsmjpEekSuVBdIrw7w71EhpilCOrFHFLMOPXSHiBXMGAP5ce5APD50ixT2Uo
	go+y2N7ng3nUxN0z6fpk066vZQIyln+V5YAt2dbwKuYvqXbK35OuHJBdovCE52dVMTkBR8JB0kQ
	anEt0M8TTVIVyhDU+IMK8qSDzXK0SmrW5UZZpoY1WRaNZEL8Ag=
X-Received: by 2002:a05:600c:628b:b0:49e:6683:d227 with SMTP id 5b1f17b1804b1-4a01ab4dde1mr25863645e9.0.1790777339323;
        Wed, 30 Sep 2026 07:08:59 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:ab7:2110:6a1d:efff:fe52:1959? ([2a01:e0a:ab7:2110:6a1d:efff:fe52:1959])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01e64c322sm2327035e9.4.2026.09.30.07.08.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 07:08:58 -0700 (PDT)
Message-ID: <7d8f1378-d5a6-4a87-82cd-98eb794f85f2@6wind.com>
Date: Wed, 30 Sep 2026 16:08:57 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: nicolas.dichtel@6wind.com
Subject: Re: [PATCH net-next v9 2/6] net: change netdev_hw_addr_list count
 through helpers
To: Yuyang Huang <sigefriedhyy@gmail.com>
Cc: Ajay Singh <ajay.kathat@microchip.com>,
 Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 "David S. Miller" <davem@davemloft.net>, David Ahern <dsahern@kernel.org>,
 Donald Hunter <donald.hunter@gmail.com>, Eric Dumazet <edumazet@google.com>,
 Ido Schimmel <idosch@nvidia.com>, Jacob Keller <jacob.e.keller@intel.com>,
 Jakub Kicinski <kuba@kernel.org>, Johannes Berg <johannes@sipsolutions.net>,
 Kees Cook <kees@kernel.org>, Kory Maincent <kory.maincent@bootlin.com>,
 Kuniyuki Iwashima <kuniyu@google.com>,
 Nikolaos Gkarlis <nickgarlis@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 Sabrina Dubroca <sd@queasysnail.net>, Shuah Khan <shuah@kernel.org>,
 Simon Horman <horms@kernel.org>, Stanislav Fomichev <sdf.kernel@gmail.com>,
 Vadim Fedorenko <vadim.fedorenko@linux.dev>,
 Willem de Bruijn <willemb@google.com>, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org
References: <20260930112842.21323-1-sigefriedhyy@gmail.com>
 <20260930112842.21323-3-sigefriedhyy@gmail.com>
 <235a33c2-7138-4815-820d-793568757d95@6wind.com>
 <CA+7S2v+VaVYksOpuUKzo+DoWZ97M_XKvnMr8cCcgwTkrOxsvEw@mail.gmail.com>
From: Nicolas Dichtel <nicolas.dichtel@6wind.com>
Content-Language: en-US
Organization: 6WIND
In-Reply-To: <CA+7S2v+VaVYksOpuUKzo+DoWZ97M_XKvnMr8cCcgwTkrOxsvEw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Le 30/09/2026 à 15:43, Yuyang Huang a écrit :
>> If you respin a version, you can use netdev_hw_addr_list_count() in
>> __hw_addr_list_snapshot() also.
> 
> Thanks, will do if there is a v10.
Thanks. FYI, please don't top post:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst#n336
