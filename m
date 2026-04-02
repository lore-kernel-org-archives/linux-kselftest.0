Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF3213B776D
	for <linux-kselftest@vger.kernel.org>; Thu,  2 Apr 2026 21:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775165842; cv=none; b=iBTZ3VUKWPDoZ+Kn0dhRsDyFAqG0ULHMrb2hFkQaUTW5Cl+24beokr+txhseh4WUx64lM85g6hd/nWdg81S1wsEtsyP4LTPxYNKAMyMwDGz9YMhSKccYvwNrrKj4J78Qi7zZ5mb800j5HLI7qdYW2ZKvlphm4JeRovpUbNroL94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775165842; c=relaxed/simple;
	bh=W3scN7dzNt1e15M5oNBsPnC7KIKxRsloBy39yk58Ja0=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 Mime-Version:Content-Type; b=E+HeXp7tNY22gV6JYSFQOVd0gXim6siiqFggYS523tKxZ1v74j/Hbm2ylXCjV9KIzG2tAhjD4G+P2fq8+JTWO0Xc43wg/ICM8a+WHNs7hS79EouIEtpUV2Y8LazRVetYmbppuAJSpvnBoC+UhtVxZ1wfzWISdk7P2gu/GhmlCDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mTMT7GUT; arc=none smtp.client-ip=74.125.224.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mTMT7GUT"
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-6501cbb52e5so1537950d50.2
        for <linux-kselftest@vger.kernel.org>; Thu, 02 Apr 2026 14:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775165840; x=1775770640; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A7TuW0G8B0XaMIfsGGJiYSCTzDLrTNNDB5kSjHsf114=;
        b=mTMT7GUTpGpPoYrudzEtF2EL9iUEQGIsG9I/qg8ishfZwFKPhZNblqqaFvJOfG77dZ
         d2zIRHRqD/r00Nh4oV+qpAJi8iyjy7bUj6Esi8PZ0XFjTQ6NVverkVGFCPQVuEf2ZEDD
         uiVg1ioO2dWepco/opJFPbP5VBcOgtst5ut1ANMYycqcH/JIO6i4NwZx6AwhC5Ateelr
         QkR6C07mhQXju20le9EGgSPPYj1HF1AGTIzsO6z0lIS7MslW8Bcv31C3MT1rcnb+AMA3
         OfFH8QgHeYcpqG/aXVCfMMB6v1zKVr/1DhMZMk2EaV66AiAWRXN7O9GcEEIMmy5pCjPZ
         97yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775165840; x=1775770640;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A7TuW0G8B0XaMIfsGGJiYSCTzDLrTNNDB5kSjHsf114=;
        b=WVwJnD7QIRwir5RxBmIN2pj5h3YCBATlMdJp8mN7i7fs1u3nL1/78BcxJl9dTYs1zZ
         iGSnL//oCAeURL1Ff9RlWW5DQEYEZKLnEuzTemz42r842fOleBSJC+aIEXLUldpVr3Rr
         AMOS1jAGvhiBDs6udOBuWrUH4CkyHNOYQV1Msh7OGxtye9mOFtM8+IkbzYNOB5X0TENt
         oELfe1wW6SIzges/2IezlCpxf0YVR8IVtQVmSloQZZQI+D2c7AJWUr/PVpmmtJGps4Jt
         cQ6TCV4tBHguV8HmWsYuuvJyzSyNDF3YPw1rg+l3S9tg/AxCtUhRYstajj3GMFf08Pvl
         wXMw==
X-Forwarded-Encrypted: i=1; AJvYcCXLGQMiPfeK+X8yyOmcrlKlEie4A6phXHut/2pKWs+4uBw2BZLLXpLf3ILXclJLqXKTwr10Q7aGyRADZY2O/nc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHVdjODPtfsA8IBxXc+K5HzAWiexPoCmHo+sc8FWqQZ3tjZY9Y
	jRIKVj370qYrMHzOmcwu2VD6fn7T1DTkFeMv1ciP4oapLO9xe9tJLkk6
X-Gm-Gg: AeBDietHNso6LBv9+yJNM8ymtnlETV/zTyHWPGx+106aJJzOBImKa6GGleT2WmS/wE6
	e03pMAq6TkTN/8kq4K6UwKzFzNB3PpgjD9LgmNlc+xu2YIOlbVKxwh8w7fWCJ6hpl0rcGszfpts
	Rw2WyxPK5/KyzCJwSt0xiREVbG8D9xo+EPH9EzlP7ged7RHPgvbElKp07aPRt6pNmB8duai26IK
	Z5BKKlYiRjpZX2j3Gi9zCzTtXIG24iorHQG2lWKs44mMa7sc/tDzbxN6k4MzDSETCktlRhluVZV
	PIOtJgGzOWqixA/Az7LSeLnK6qI0KUZGD1I+LMmmWDxdHdLLb86JvQoHwBrEdOE4QRFbLBtbPjt
	iEz6SAgnI0Kx618R9CEicxzDbKuD7r/L3Y/UqH92xPG2GcTxrCYTP8vu8XbRPDyce8YgUpZ1nQ1
	bUCfkx/dW/5i/uwzUeUB1MGmtfjhe/kThyyjN9V64aqLjf/XUCXK196SCMQ4ZhSWINuCpUjnN+g
	glJ
X-Received: by 2002:a05:690c:110:b0:7a3:3192:386e with SMTP id 00721157ae682-7a4d68304a8mr10511047b3.53.1775165839769;
        Thu, 02 Apr 2026 14:37:19 -0700 (PDT)
Received: from gmail.com (180.134.85.34.bc.googleusercontent.com. [34.85.134.180])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7a36ea27d19sm15135357b3.20.2026.04.02.14.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 14:37:19 -0700 (PDT)
Date: Thu, 02 Apr 2026 17:37:18 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>, 
 davem@davemloft.net
Cc: netdev@vger.kernel.org, 
 edumazet@google.com, 
 pabeni@redhat.com, 
 andrew+netdev@lunn.ch, 
 horms@kernel.org, 
 shuah@kernel.org, 
 willemb@google.com, 
 petrm@nvidia.com, 
 anubhavsinggh@google.com, 
 richardbgobert@gmail.com, 
 linux-kselftest@vger.kernel.org, 
 Jakub Kicinski <kuba@kernel.org>
Message-ID: <willemdebruijn.kernel.1b7e7cef1d1b6@gmail.com>
In-Reply-To: <20260402210000.1512696-1-kuba@kernel.org>
References: <20260402210000.1512696-1-kuba@kernel.org>
Subject: Re: [PATCH net-next v2 0/8] selftests: drv-net: gro: more test cases
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Jakub Kicinski wrote:
> Add a few more test cases for GRO.
> 
> First 4 patches are unchanged from v1.
> 
> Patches 5 and 6 are new. Willem pointed out that the defines are
> duplicated and all these imprecise defines have been annoying me
> for a while so I decided to clean them up.
> 
> With the defines cleaned up and now more precise patch 7 (was 5)
> no longer has to play any games with the MTU for ip6ip6.
> 
> The last patch now sends 3 segments as requested.
> 
> v1: https://lore.kernel.org/20260401182625.372605-1-kuba@kernel.org
> 
> Jakub Kicinski (8):
>   selftests: drv-net: gro: add data burst test case
>   selftests: drv-net: gro: add 1 byte payload test
>   selftests: drv-net: gro: always wait for FIN in the capacity test
>   selftests: drv-net: gro: prepare for ip6ip6 support
>   selftests: drv-net: gro: remove TOTAL_HDR_LEN
>   selftests: drv-net: gro: make large packet math more precise
>   selftests: drv-net: gro: test ip6ip6
>   selftests: drv-net: gro: add a test for bad IPv4 csum
> 
>  tools/testing/selftests/net/lib/gro.c      | 207 +++++++++++++++------
>  tools/testing/selftests/drivers/net/gro.py |   7 +-
>  2 files changed, 157 insertions(+), 57 deletions(-)

For the series:

Reviewed-by: Willem de Bruijn <willemb@google.com>
