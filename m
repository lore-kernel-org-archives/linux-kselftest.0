Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C345B192B90
	for <linux-kselftest@vger.kernel.org>; Thu,  2 Apr 2026 00:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775089165; cv=none; b=hZUNh2GJPgXje5gUVJZjGZiDmn35nOvZbNhKgWIMhsy/skgL72OdUq0u0HIBJoP0liubQ6sdP/K/MOpGenq87I4XTKigL0x3poG0U4uUKXihS91Z0G+BFxyCSN2UOxyYhjuKa8VMpyDziUq+jX2e9/IvhEK/+B+8932cR1tySvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775089165; c=relaxed/simple;
	bh=Kd5VrKrqKfsc/qf74ox6gpaM91NNsEfHy80sDZyUCjk=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 Mime-Version:Content-Type; b=fX987jLqEs1SE21GF0jGFF3/witWvLossv0ZfeyGCgm86ntQGf+XbbDuyqOvQZyFCUS86CFPmRy+Fff3W9TViUqoCqCh1gt6khUznJHR0JUcvfjOwK1wrt1qQXOWjuCsWDdRVOlp0wrx5whH5AgToQjNDU2HpE3oK5jQI7PQH0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hx2u7NVm; arc=none smtp.client-ip=74.125.224.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hx2u7NVm"
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-650152687c8so349808d50.1
        for <linux-kselftest@vger.kernel.org>; Wed, 01 Apr 2026 17:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775089164; x=1775693964; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bbrVAn2IFF+vVLDH+Ic8CmXdw5gi/Gp09v2+/WfQEWI=;
        b=Hx2u7NVm5paGdKQM+4VWTNzm8Pf6cOEugMOdSaekyUx0L9IV6hhenciMcnaQgdDeGu
         bcBy6+jtMtisXyBnD5ndTQOXM7O8FUGUHTxC16Dr65B3MoyIve28XUuhX+lcAmwX8Ijl
         BtCm5yxLB8uaer1O/QcycjKPdusTl2uTmd52xlel9wnQhYqQrN2/8rwTUZpDZrMoCJO2
         N0c5zdu4j2LbxSypbYrx2zDLE5nrL5yhySB6jSj3OJLFfUEeb/phnWW8QNvKy8OURWVT
         keLYwZj1wx3a0L7TlP8bZQgLUI0dyDMHm3jdXA/QDTp9ZbbiPSHUXC9c1Z9mcg31YrH2
         XF2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775089164; x=1775693964;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bbrVAn2IFF+vVLDH+Ic8CmXdw5gi/Gp09v2+/WfQEWI=;
        b=b+tP3Vadj1xoKnQV/fwp2o9VsnX6gfND5U3wvovz9CjyL9wUgofxFyyZU+JIWop3+5
         oGJfjFdmHQrSYwR0V19QZ0ui37wQcdNFha8mkrGJVF/OFIStjW3kWz6ZolDrH1dGMlYc
         KpOH+M0+5mTWTDxGpVM3LqZJ7ghWUA4N1fGVdnD5NLnSavs9oLC6eUxdUQi2Ng4j9bg+
         EGH8BQxHlzX3uTvzE+wfKCl1OAWQ1eHCmLh6Qf29htXJW/gcAMjc+e1QfKH5pL5cmXJO
         8E72k6qxyH0b1a/Q+4+6GIQciNoCXDWj83/Pgn7wicQLlk9lCw77iU+LSW+IQ7ivTXjG
         09yw==
X-Forwarded-Encrypted: i=1; AJvYcCUv98n8mIFPTCbTuh8vCMLQif2wxJxy+Cksv9lbBcUm4RQ/FxSGN0aaJAin9bbuyPKaDWBGE8EMPpCB2uV3pdc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMs7xRdRkKVy7qZdUb78cxVgwzKEapl9ezuxiu9uPkhTQLSBrO
	AKsa0hNh0KBV7RtjVznRpg/TDMmt7wfkRAODHMKqtQO1SBRNUsEx326Z
X-Gm-Gg: AeBDietcN7ru2pdu44RQRL22veglfJBZJff+W4fZWGYzeZtiq++JwRGDTbgI6Xu6Etm
	aNU2x9f6YqXJiOPHCAwZDeutinbtO/S0O85I6rTN27yaTsSgmMoaVue2K4zyHgQ3n9MHys62j12
	MC+uiRiexxlHRP91lPAKNd5hlcOxH+wKV18WCSupJ0C5hLuoEsgEaX/erii8rThqddI5Iy3cWRe
	IZZvWyMKGAbgPKk1AitRAu3jlwPn8rt9d6IJN7A4uOmKTaibNfuBP6ctHBlO/8jT3Y+7iLCnoWc
	t8P4Qjtw5tf6Lh1vdAAzcqr9VuD+msSyC0QV/pWm/kHyM1VFkHbvClXB78cj/RJ2AhmEp/wgsjT
	9DPKPlTsoDS0ijGXPWafMzqYH6RX7kK5UdSJ3kJCqxor3FwRqXtXUl4zd4CdOglyWWdD3gm0xLt
	sCWL+qcyHcuxbWqdS4C5I/mSUCOBjn6/xP3YwYbA9WrPLYohGEQYj/XZ6ccjYgY0SPcUFhQt1N3
	RUk
X-Received: by 2002:a05:690e:43d6:b0:650:3355:7279 with SMTP id 956f58d0204a3-6503bc1c246mr949324d50.61.1775089163855;
        Wed, 01 Apr 2026 17:19:23 -0700 (PDT)
Received: from gmail.com (180.134.85.34.bc.googleusercontent.com. [34.85.134.180])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6503a73d18fsm583867d50.0.2026.04.01.17.19.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 17:19:23 -0700 (PDT)
Date: Wed, 01 Apr 2026 20:19:22 -0400
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
Message-ID: <willemdebruijn.kernel.2bad50f4f67f6@gmail.com>
In-Reply-To: <20260401182625.372605-1-kuba@kernel.org>
References: <20260401182625.372605-1-kuba@kernel.org>
Subject: Re: [PATCH net-next 0/6] selftests: drv-net: gro: more test cases
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
> Jakub Kicinski (6):
>   selftests: drv-net: gro: add data burst test case
>   selftests: drv-net: gro: add 1 byte payload test
>   selftests: drv-net: gro: always wait for FIN in the capacity test
>   selftests: drv-net: gro: prepare for ip6ip6 support
>   selftests: drv-net: gro: test ip6ip6
>   selftests: drv-net: gro: add a test for bad IPv4 csum
> 
>  tools/testing/selftests/net/lib/gro.c      | 171 +++++++++++++++------
>  tools/testing/selftests/drivers/net/gro.py |  24 ++-
>  2 files changed, 143 insertions(+), 52 deletions(-)

For the series:

Reviewed-by: Willem de Bruijn <willemb@google.com>


