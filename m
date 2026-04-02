Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED86817BA6
	for <linux-kselftest@vger.kernel.org>; Thu,  2 Apr 2026 00:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775089213; cv=none; b=PUJYFTYKcP4elocKmkjHZzmrfhRWVAdc8CHJMOiCrrZjD+Yg93HI85iDCLlMoy3CX6jENCNwWsx7z9cofmo5jbeuOMuw9g61KirqEZcfiz3C0zbz82BNH0f7V54uObSF9iZBRt2CWfN/Uu9h+Gp/jWX/N4YNc1ECGUCphnDCvV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775089213; c=relaxed/simple;
	bh=8hUVXnaRIpo4Ykg4m4ff98IfHNLZs9BsG9DsIiYtg2k=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 Mime-Version:Content-Type; b=ciBxAHlUqu7P7BczrWfHyLgovo5Jl1+nLULOLZUVSbVVPNNfGi8rYmhceUAYg8fEcWEveOCefgwqTqyHAaswkLJ/reG6j/DRXsQPViFZ2/8d+7+6AAkxMmgbiPT390P5EGyMl9HjPXwyyqw2KcnrQ+e6C8a5z7lY+XTfA7ypHbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oPTjtjxU; arc=none smtp.client-ip=74.125.224.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oPTjtjxU"
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-6501d242e2fso315886d50.3
        for <linux-kselftest@vger.kernel.org>; Wed, 01 Apr 2026 17:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775089211; x=1775694011; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fGQ4G1CjcmvuU29zY2NXv+44QXIA6kMAHI99Qiwbhn0=;
        b=oPTjtjxUe7jjTHZaXspA3sVSCkC/d6tiUqC4ILsHRzkwnxPOf52v1yCkudWE64n34x
         /VaO0QlNWK32LEscUhoA4+RMQwrGOXrRN2/5JezhwWujeNd57KSg1lxel8Befpq+Mlc7
         JU6bMC5csjjq7Fcx+gYiYnmUYzM7bdf/Xu/oOGHteRe9ZsVPpPfUc+I9qtXAAFTEPKdh
         KtXvDglAtpu5ihPOM48cvQCZytJ/9h5i8CNeXXfAy+3NojkTWRqwosGnxoQC/nU+tFvy
         NQZY+FLFrbtVmgKLFRBpfTz+vYCmATxkcErGPbho0tGYImeY+/oaOKv7bKZ6J60lzmpc
         sssw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775089211; x=1775694011;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fGQ4G1CjcmvuU29zY2NXv+44QXIA6kMAHI99Qiwbhn0=;
        b=m+WmHiRYvZi7IfefTk2dcgRGbe4m2o28D2ftfY71+ld1k57GMP8L3Wt6ptkxkh/IPR
         9z1R6zaEo+IzzsxivHSLoD6mdBmwDHMrJOklrdHOfRRLPkgTCTDsxfEMhZMCUj15TyTv
         Ju7HxWpAuBSClvMw2ZCIRuhe1i/1qwV4V1/fYdE/rLQ4xCBIgCNaXlkiQH9n9jlfb2wa
         qYbZgskW578SIFYogYgU3bekqkJ7KgBRiwbHVYgwcsKIBTUdUlASkzCTdMmyqDNIrZfS
         xaSUzc46SeKYCKv75veGZmFmR1t5v/Y6/zKmlgUyS2Z71Hn6vvT96D7vO+i/GpbiFsB0
         AHRA==
X-Forwarded-Encrypted: i=1; AJvYcCU/r74pzG0ET5VoXfF9qscAJcX3S47f97svJFBQzTOUFK63YCK9S2hmiWLkT2PySUY0NH3v57PlhFvmUbFssAU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2++urBuLJQ7HagTsn/clstVDskVi9bQYvYfr6O5sEooQLeZP2
	Y7+Mkzn3jYis2rvG+/1hcvI9gZnzH8u9B4isVptxNonFPUDl87a2OkKr
X-Gm-Gg: AeBDiesrw9m/9Rp+XoR3jW7etItUqUeShzKTnf0Bs4SC7SE/elrMB5Lkx/MolavVtH1
	ClKAw1nemdmUapXJx0C6FkUMgJ78OwGkay0Z8H+LnIiVJFE3mSQwFqAoyYDGySJXEAt8d7HYeeQ
	snIKJ/hyuJ0WntMnVVZHkxJucjIxwmsbFcNqLmZDjoL/IcymvMb9D0yrxbDh/Sn01Y8nFoD8fU/
	ri6SHynSMLcnf9p/IV39Z3DDBggHZEV3voaElcX6Kcm7PVvkP1rcZplNg9pYgCwxExYy/fD0wOo
	lW4H6Qp+4CIYuThrCuMneh0UxewBYK+rG6Oy+bTzH+cF5pKmPbqbkSEYgR1hR28wrMT1IjkSdto
	lYM5hZRp6lDv6+nELF/DukUT2JiNV/UiqswQ4wnFNzz2YAoOPaLHN4NQhR/zkHvzzMjQUosIHMN
	iWvZ3E9l7tYx2czVc+b3gxOZpW8ZJ+2amGQKlRn1O3dGeXCmmCp5uVy0hVy71nLu5Q7evtUXIch
	3LP
X-Received: by 2002:a05:690e:d83:b0:64e:e53a:abb4 with SMTP id 956f58d0204a3-6503ba7e60cmr1195519d50.0.1775089210805;
        Wed, 01 Apr 2026 17:20:10 -0700 (PDT)
Received: from gmail.com (180.134.85.34.bc.googleusercontent.com. [34.85.134.180])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6503a824d30sm583815d50.1.2026.04.01.17.20.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 17:20:10 -0700 (PDT)
Date: Wed, 01 Apr 2026 20:20:09 -0400
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
Message-ID: <willemdebruijn.kernel.39650fe9b7b33@gmail.com>
In-Reply-To: <20260401182625.372605-6-kuba@kernel.org>
References: <20260401182625.372605-1-kuba@kernel.org>
 <20260401182625.372605-6-kuba@kernel.org>
Subject: Re: [PATCH net-next 5/6] selftests: drv-net: gro: test ip6ip6
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
> We explicitly test ipip encap. Let's add ip6ip6, too. Having
> just ipip seems like favoring IPv4 which we should not do :)
> Testing all combinations is left for future work, not sure
> it's actually worth it.
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---
>  tools/testing/selftests/net/lib/gro.c      | 29 ++++++++++++++++------
>  tools/testing/selftests/drivers/net/gro.py | 19 ++++++++------
>  2 files changed, 34 insertions(+), 14 deletions(-)
> 
> diff --git a/tools/testing/selftests/net/lib/gro.c b/tools/testing/selftests/net/lib/gro.c
> index 57080ecc3df8..762e88932ed2 100644
> --- a/tools/testing/selftests/net/lib/gro.c
> +++ b/tools/testing/selftests/net/lib/gro.c
> @@ -94,11 +94,14 @@
>  #define START_SEQ 100
>  #define START_ACK 100
>  #define ETH_P_NONE 0
> -#define TOTAL_HDR_LEN (ETH_HLEN + sizeof(struct ipv6hdr) + sizeof(struct tcphdr))
> +#define TOTAL_HDR_LEN \
> +	(ETH_HLEN + sizeof(struct ipv6hdr) * 2 + sizeof(struct tcphdr))
>  #define MSS (4096 - sizeof(struct tcphdr) - sizeof(struct ipv6hdr))
> -#define MAX_PAYLOAD (IP_MAXPACKET - sizeof(struct tcphdr) - sizeof(struct ipv6hdr))
> +#define MAX_PAYLOAD \
> +	(IP_MAXPACKET - sizeof(struct tcphdr) - sizeof(struct ipv6hdr))
>  #define NUM_LARGE_PKT (MAX_PAYLOAD / MSS)
> -#define MAX_HDR_LEN (ETH_HLEN + sizeof(struct ipv6hdr) + sizeof(struct tcphdr))
> +#define MAX_HDR_LEN \
> +	(ETH_HLEN + sizeof(struct ipv6hdr) * 2 + sizeof(struct tcphdr))

Not something that needs to be addressed here (or at all), but
TOTAL_HDR_LEN and MAX_HDR_LEN seem to be the same.
