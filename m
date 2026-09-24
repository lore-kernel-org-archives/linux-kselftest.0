Received: from mail-yx2-f42.google.com (mail-yx2-f42.google.com [74.125.224.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BBB53AF676
	for <linux-kselftest@vger.kernel.org>; Thu, 24 Sep 2026 11:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790249754; cv=pass; b=Tc0/2lWxepZ8CLPijO+mV9YbllBfiK1F4DkLB485Zs5WqwjBKYQOXjSCOPzCtmMqy7dLkFu+UMjM1/aoYq08sR2/+a4VmXIx/rNb0X0r366yWqENfP/FyIkt1k+LH3ByJ6ethii/MT8wIxbrvkzqK6WdOEd6/ghLr0vGAA0U1AQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790249754; c=relaxed/simple;
	bh=/ooIk1nkmMMbkU9zp/iQ51lU88j12gCHTiDNrvNK39M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aNGTGa4aQsc6q/R+551JW37cg1EjOV8/K+f8d+de26hF4hbmE1eJCapVpYR/dieZGGdIx4MBomUbI2dWV3nOUWjBytFeciIVFP0eMuHKb+efBbwZ89QIRC84HBemQwhrY4ynG/2FcL9ACc5QSmvvPRYfBVp3xABC6qSX4sAmvq8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com; spf=none smtp.mailfrom=mojatatu.com; dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.b=xK4h+BEG; arc=pass smtp.client-ip=74.125.224.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.b="xK4h+BEG"
Received: by mail-yx2-f42.google.com with SMTP id 956f58d0204a3-672f90fc533so276664d50.0
        for <linux-kselftest@vger.kernel.org>; Thu, 24 Sep 2026 04:35:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790249746; cv=none;
        d=google.com; s=arc-20260327;
        b=PJMhcyErVhR2OhprHgGL84UcNDP0uRVFY1UFX7JohATSh6qcyvGkLcgdYWj9fdHKp4
         hNIK2hrejSQ3B740t3AVNU+w1ngwgZtBeTjdiEkY9gG6lMJHx2f6D+jolSjSjd2v9Nul
         4dw4/LPckDxIYVkLTgeufCUK1VieFZGSwCj+k212bJpadGcrxdNRdjbG7qBX5T8DRGoG
         G+HoNn/l4CnhmsbQ1jE3NB7A2WLaSXwztD1rq2vPYK+sw1Nj8ne7wP1N+2RW5kGcgBqE
         Vt32LGWBtLig4TBKbeAKLeaK+Mqq160NTZ7XLfT2LakrNV7tDR7VsGio5tTA0y3IEG1n
         Q0zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/ooIk1nkmMMbkU9zp/iQ51lU88j12gCHTiDNrvNK39M=;
        fh=QVIhQCC7/6VY8oichJITP35vNgLXbRRsnn7VvYfojVU=;
        b=IcReMG32w7pQqKjRsIeH7aRaUtY88a++N7/bVdh5nRtall+mvAAiH1OmuVIppDyXRp
         CL45Oe5fh0hyA9XrJVZv8hv1c1N4UwQc2hAYEH8Ze5j4NapEObx2uy3Qsppc15+3Ug91
         rzEBOnRdbM9wzlhIKxKT2/Bax5ABTKC+Lkud8EwEm/PSu81frM52GOs4DIuqiO97XLKa
         EXLj0n3zAxsyvN23bdaBCvdgS6Sd+9qAyttQ+8o3jnyDBkfYjdGYkyywM6S6yfi6k79G
         hCX8Op+wHYkGhjd1w7EL6Cwzl6MHjHSHQvNNYmdp7XRvsmpi/0tr5EGryd8WJc76W6cd
         Ij9w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1790249746; x=1790854546; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/ooIk1nkmMMbkU9zp/iQ51lU88j12gCHTiDNrvNK39M=;
        b=xK4h+BEGyL+E90xx9DgrNVsR6LX4UDsARJwaIBG2gY5vy4ER/CTK/f3S2qfBGCrrfe
         O38Od+Enb4Ma6/sVWoNVe2Sn992OWTCj1IgISGm1Q49BdmaRg+7GoeXgSaQt17sK3WBq
         I6Ytmj24dDQ9lXRtVNHbbyyPBGu2jEbqBscKU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790249746; x=1790854546;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/ooIk1nkmMMbkU9zp/iQ51lU88j12gCHTiDNrvNK39M=;
        b=a1LqHGbS2NxwuP/SszRv+d2V9GCBw7rJd1s2KJkO6bztlckoV2YnNs5SaJnnveO5hD
         b5YhB7Aaslf3Km6aDYxgF0915tuv3yYbM2Qw5Xpuai1w8vmJnrmbaKbMBH6VK2cAm5hS
         T+vX4YEa/djpfBdiUMpK1xo+z6gWr3Mz4OKUcnvzO8ubnarEL7TYtROCKOhlBBHOntBz
         +TbD1MSFCkU2gcSvBzobRrHAR8+Z8tSlP2q7+MUZQruvKtVTXvIar9drFrFF6lW+wel8
         j0n9zT+iuaMYHkbs77PNS36JwxNIRU/uLzcGz3sI4v7B28YoaPPq7uVJpwNNY9NhnEoK
         mLSQ==
X-Forwarded-Encrypted: i=1; AKwUvBz+bZ5WuK7l0qD6ygQZI62epuyTI9vC9sVZTNyOOwAcEwoNgAiJxY7aazzAtlRNg5kQdSLx2dG+PYe+TTtM6JM=@vger.kernel.org
X-Gm-Message-State: AFuF++llzOsP/h0vUz4PuSU0w1swSNI4DKoVa/p8mTK6Q3Ucd6OAhpY0
	thP+pPVERZUApsMjOzXpCa2b4MopxDEfAlwF1uF8qBurYNuPttfUKCIyoouuVNMvbev7WLGsEzg
	XdIXjYNBtFghziHl7K84s78TBI+Q5R6v2NsHb5iQX
X-Gm-Gg: AYBFou2cVtva5ao7Yf75mtftZicdFlTnAASjm3lv0ybaa/jzzeTdoMTFTqHtHmpt4Qo
	AJO33f8/06SspXECP6yZJJXsRbWqbaYalrPTbg0w/jP4OsmhgX08hll5gT2PHLTdeEvNIqjL5Im
	1n1mLkn1QgkURy3jlmWKS2z1VPo9aAFhvt0PJ5wAnGuQxfiUE8GXHRP+CplEqVYNHUNjpDazCCP
	wogw5UNnnMIPJt9TDxiMiJJBHcQhetUDbVkfrCwZyu5FVHkUEw+12sKTACL7fa6e7prFe6O5E9s
	JEeTqewNrSDMapuDsMvTFaQIcyJY+IEMU3Sc7zcIULXte0n3NKhLEhXfBiYhoa2aBTtmnQ==
X-Received: by 2002:a05:690e:d44:b0:66f:c1be:318d with SMTP id
 956f58d0204a3-672ed4db1a4mr713251d50.100.1790249746028; Thu, 24 Sep 2026
 04:35:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260922180458.5c54ebb8@kernel.org> <20260923040136.13432-1-hemendranaik@gmail.com>
 <20260923195323.5413f128@kernel.org>
In-Reply-To: <20260923195323.5413f128@kernel.org>
From: Victor Nogueira <victor@mojatatu.com>
Date: Thu, 24 Sep 2026 08:35:34 -0300
X-Gm-Features: AclHuK8W5cypXoOg5YOqWG1817rRnO3Ny_pZWJxth2uHtxKh-dQ0MfUQJ9PpABo
Message-ID: <CA+NMeC9CWgt9=0=_HjNH=Fsg7igmFqDS=VnqWh6tZBr98ZkPgQ@mail.gmail.com>
Subject: Re: [PATCH net-next v6 0/3] net/sched: sch_fq_pie: add per-flow class statistics
To: Jakub Kicinski <kuba@kernel.org>
Cc: "Hemendra M. Naik" <hemendranaik@gmail.com>, davem@davemloft.net, edumazet@google.com, 
	horms@kernel.org, jhs@mojatatu.com, jiri@resnulli.us, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	netdev@vger.kernel.org, pabeni@redhat.com, shuah@kernel.org, 
	tahiliani@nitk.edu.in, vishy0777@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 11:53=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> w=
rote:
>
> On Wed, 23 Sep 2026 09:31:36 +0530 Hemendra M. Naik wrote:
> > Hi Jakub,
> >
> > We have vendored the temporary UAPI header changes into the GitHub
> > development branch (https://github.com/H-N41K/iproute2-next/tree/fq_pie=
_class_stats/)
> > as requested, so it should now build standalone in your CI pipeline.
> >
> > Please note that this header sync commit is not present in the official
> > iproute2 patch submitted to the mailing list
> > (https://lore.kernel.org/netdev/20260922211139.38570-1-hemendranaik@gma=
il.com/).
> > It was added to the GitHub branch strictly for validation and testing p=
urposes.
>
> Thanks!
>
> Victor, could you pull this into tdc as well?

Done, it's in tdc.

cheers,
Victor
