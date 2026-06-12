Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 709AE3290BD
	for <linux-kselftest@vger.kernel.org>; Fri, 12 Jun 2026 17:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781285679; cv=none; b=UzsXCAfrxEu4uDA45ei+ZkLuWxeFIHmrWVOs3gWtHNh2ngqdA0faXEQACqDnoMaQGNNXgLELfa1/ymS04QSwCXnwh4pcw7l0ShISbtoX81BIM1zHh8lBEveskRCCo+LMjHzkN87P9/PdPGUT2zLe6+ciwgSaglpxnjH3hjkx21k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781285679; c=relaxed/simple;
	bh=2vXTYwKAqE8zGS6G1ooSD5BTmzZfSEZFKULV8+Xply8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fryNhHh7NTk6ntKPh9x7dGf0k54Ynw5+HY4BgY8MFj+quW3LluQwYZFhtb/C5V1muUmIm0c7Nl2wHUbILyc4nsJcuFa+942HWe3IVxKGCdR3UFcOnH3T0YBul62sFMJ8hcHJfLlL44FAwXzcA4OT5j/NJ9ie/aEHOrIu92oT9wM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Qkr48IH0; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Qkr48IH0"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2bf2d865383so3915ad.1
        for <linux-kselftest@vger.kernel.org>; Fri, 12 Jun 2026 10:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781285678; x=1781890478; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0ifKMUC6sFpR43pSlkSu8t/hrhXmnCH8Plz+P3dkdA8=;
        b=Qkr48IH045JrHBYA2janwFJVYNUw0o+Jp0lglXWwwPODV3mQrfVgnvpa9xOFrJmpP0
         6PpoY5HkwwNNYag2jBzmDiJJqQ18jTPiEIeJJBdjPEesAp90EhWdLJspEq8lir/PcpVy
         3LJO5XtvqbHFsCt10VXQbEFVQ3DiufvpiGIezW77koOgC5VYACyi3vJExzVggVayjhjv
         iEkRnIqsIOjoOhhZyEpDpmSOTQDZyiUOPbP6+xK0f4CAkMAH0LP/3dQOm7NuOg1bM1+o
         BE57CslrMSVjFvDHgccLT2dYPYSVFu7vtFEXgl16tV4CxPNajv1rTmfhgFYU/vjnPzyP
         KBVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781285678; x=1781890478;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0ifKMUC6sFpR43pSlkSu8t/hrhXmnCH8Plz+P3dkdA8=;
        b=BIe+pxKzlI8Z8XnXn+D/s6CUxzX3LQ8sMKtejHJ+hdo/05pBShyzeSgTrIOx2p9w2q
         r8G6P+FJnVKonMgDPYncBars5jUhDqqN1iKl1hNFOcKdh2o41ePco0LWQWgjLVFq+CDt
         Q/e9NRbnXdD92BOs5sUxZNqmyzlaKOzzLw2Fpxc8vgFhRZ1hdbnX2Zvy0ISLiFEXtR9K
         5Z+c55FwfMkcpc7wS+NEpDA+UmpNciMXx5i0DwqvQK3egBrTKJc7rxMVLg9gnS0bO4zC
         sQMPxPUvGnntTdZb7xtjjNnoaRVX/hUYdT6Moy5y3NgRetMbCMA65HCR5azUwL6tBN6x
         TayQ==
X-Forwarded-Encrypted: i=1; AFNElJ+NuMTr5q0LQ5EjJVPzW3NG+4GalBnDxy8+jD4PIIwGSs/GUvlsva6nL9O+t/6aSFCYlGVqG/lX/yYytMQaC8E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2btAcEnCnaO7Oabj/P8g3dL5yPX8aLvPP93bTrsK+wFhUKwmr
	s5qL+YYHU07TbCswFJw3exX5/Mn3o687p3s2HDBV7KsEijSDycvTEwsJ8g0nrNGMwpnLAXBuJUi
	TYU/Irw==
X-Gm-Gg: Acq92OH/TNlE6RX0GRtI/VkBe4qgimNKS4i/c0/8AsVyhJngWP+4xEjMmztwZHgG136
	qYEiAZXCb1B2/MMEHkAUgiqS1O5n22fVnQwK7yecB51JpX/vZ6ltP9QJmirrYuCX3PmVKCu2s1Y
	aojMMLTAw4XP/1VHYBL+++AXusTUA7RbTdZEbXEhpuUEyXq2DmHCIcmywaHMqi6Y/WS/b/erTAU
	/n7D1Un4RDTEfQHW6bifxtVP+Jo1N5SPkEjp/wAEwtrsq4a0B0mVw9boN536U61Il5s884F3U3p
	U3cbta9WaAGHthjMMWXBE/plzif7x5sGTZRytl+zKpf2qchPEbn5Z5ZOM5XUloBvbSk+jTb/aMl
	FGtDNcXI3Xd+h8syHbpfOCxYy0pgxzmIS5OU746q14x8Ya/Ky0S0dSt9rbUv6QPnxogFuzXeRTi
	xdkzsbLVxY58rsSIYfIG3xz3zzWho9FBsvxKypiksphT7dHnX0g8XCP+4LQOvZ
X-Received: by 2002:a17:902:ea0d:b0:2bd:63cb:c5be with SMTP id d9443c01a7336-2c665175772mr102415ad.5.1781285677239;
        Fri, 12 Jun 2026 10:34:37 -0700 (PDT)
Received: from google.com (176.13.105.34.bc.googleusercontent.com. [34.105.13.176])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42fbb5411sm27322505ad.32.2026.06.12.10.34.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 10:34:36 -0700 (PDT)
Date: Fri, 12 Jun 2026 10:34:32 -0700
From: Vipin Sharma <vipinsh@google.com>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: rppt@kernel.org, pratyush@kernel.org, tarunsahu@google.com, 
	skhawaja@google.com, shuah@kernel.org, dmatlack@google.com, 
	linux-kernel@vger.kernel.org, kexec@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2 2/2] selftests/liveupdate: Add helpers to
 preserve/retrieve FDs
Message-ID: <20260612173145.GB40404.vipinsh@google.com>
References: <20260610230909.876546-1-vipinsh@google.com>
 <20260610230909.876546-3-vipinsh@google.com>
 <178123377287.908199.15268768789704684712.b4-review@b4>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178123377287.908199.15268768789704684712.b4-review@b4>

On Fri, Jun 12, 2026 at 03:09:32AM +0000, Pasha Tatashin wrote:
> On Wed, 10 Jun 2026 16:09:08 -0700, Vipin Sharma <vipinsh@google.com> wrote:
> > diff --git a/tools/testing/selftests/liveupdate/lib/liveupdate.c b/tools/testing/selftests/liveupdate/lib/liveupdate.c
> > index 897c200f3845..961a732b541d 100644
> > --- a/tools/testing/selftests/liveupdate/lib/liveupdate.c
> > +++ b/tools/testing/selftests/liveupdate/lib/liveupdate.c
> > @@ -78,9 +78,35 @@ int luo_retrieve_session(int luo_fd, const char *name)
> >  	return arg.fd;
> >  }
> >  
> > +int luo_session_preserve_fd(int session_fd, int fd, __u64 token)
> > +{
> > +	struct liveupdate_session_preserve_fd arg = {
> > +		.size = sizeof(arg),
> > +		.fd = fd,
> > +		.token = token,
> > +	};
> > +
> > +	if (ioctl(session_fd, LIVEUPDATE_SESSION_PRESERVE_FD, &arg) < 0)
> > +		return -errno;
> 
> We do not return positive values on success either, so !ioctl() would 
> be a tighter check, but < 0 is also acceptable.
> 
> Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>

I have to send v3 for other feedbacks, I will address this also in that
version.

Thanks!

