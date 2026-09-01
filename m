Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11026436BEA
	for <linux-kselftest@vger.kernel.org>; Tue,  1 Sep 2026 15:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788276915; cv=none; b=pSrVHdrTvIGAKUxl6k3FQ70p8HxclmhEL2jODsU2NSqbMDuQdeJLdcCo1q+JLCMS58z297YuZD3ti0HWsUNQJMRO8PPrIVt79LHg9v3oJNsbr2Zu7RCR8NLJrqE+IehOEOZVZeMmdtfalT58oYkzZMIQTeyPE+51Qn58hYz0rOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788276915; c=relaxed/simple;
	bh=kdgQj/mUkyRR8HBLGn0DxLiyjpequvkCMjczfVTXcyU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fIFUAZFVdrINzlNro8G1cNA3CKt3HSGTgi7JEilXfoWzdLRE68XUnH5D7PtZch5v3dgrT0+yAV1zKwjyOJPXDi3XAe7fAA0z14+CqWIAWudVoyDOatA+zexEfvf3hWbXUC22pv6RoIE815K20GAbyhOZmVn0XBgMjQz5KhHf3jI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b=klP96dwS; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b="klP96dwS"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2d71d1cc8b2so44593995ad.1
        for <linux-kselftest@vger.kernel.org>; Tue, 01 Sep 2026 08:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1788276913; x=1788881713; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QmL927KZZiS/GQHjvKa5Xv6rRMC1cROJujnvo4Vr8Qs=;
        b=klP96dwS0uIPkrJjasBemYGuWusxkZAAyTZx6gAFr1a9dkqIUUUaLj4OBsLZItR4zq
         BqfyxeO2zJrP+Y/8WAJDVIz1m7PiwCGInklJVO6CE6kKX1Zu33bCXuUtFTTSvjKpgnI8
         rEjhIp7LCupkscSLLL+E/4yUv6hklfFu2SANSOXl+oa4qIRBOYvJxJ4RbTQYuLT84mtF
         mxhsxKPAJV72RDDoomuZmkJfCG3r+DHDQQDaasHJwSEfrCpZcO7qQyy/vBPn430DjtaG
         fYNgJiEcIlTc/YsuLgX6cDyExV+yciy1oE7T/1FMkSu2KhzYfsE5smoa4oS7xBTQSGcJ
         +GQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788276913; x=1788881713;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QmL927KZZiS/GQHjvKa5Xv6rRMC1cROJujnvo4Vr8Qs=;
        b=jEATjGKdnCWIW+BbATxNWGGMAGvB6BFvk7nrY9Ai8I0Ft9n4FtL+TtnBiZqzV/u7MS
         kgOX0RCX/hsCCFmgMXjUf/fvFRr4Jv829ls3AOjeclj9c7K4rLrooEpEAsYNFZNlunnp
         IosAxylZaAP7b48D3AHdQOs0kGqr8yPWNYu+RAvOpXwT1IBeZcrkKiQfYOU2ScIVWWsx
         Y+4IIYhVAKXpKYNbTdtZVFqhUsC1Y9vbC3VkTBH/Uqlf8Plwx1yYzai3HG8EUyTKOvVd
         KaUrxrdnvNU8vHqm9rGLCYJ7HBTRlcKmKIMXR2GhpSjsYea2GEEENKNGE/iV1ARHzUBk
         fzIQ==
X-Forwarded-Encrypted: i=1; AKwUvByBrbi4WWogscmEDQbTzTdd3dBrDekUGnvnxavC/KhGt4rUR1c+W2MUXWKGHL5fhfjw0QQg8IA65GONFqgmzs4=@vger.kernel.org
X-Gm-Message-State: AFuF++l09tuc75lnE4G5GxG1U2TGgWFY2tehLeNewoEKLudL9C2EOXyG
	BJvcjtuWbJJ4zLMkpM83XbJ4qSyIFfjor2t2iPVU3eeCSAuXB5h1I446EwzDpOi7Q4w=
X-Gm-Gg: AYBFou3UerF35rpPyFT6UKfYD1D8pjDfpKLxX2vytQpvvj2O+eBza/BT6FnDSYJmxs+
	FwpcWqZi2dNt1NpOZo1b5KfCs6wCFDtYZz2ueHIFn9w5hlxCSc9MFZGCA6c7vWVA4bzo5GELNlk
	eWYtOr3H8Vn9WHu78MF0ACSg3x4aI5PSMZWiyKCgGysnXzUPXSvMzN2VyHm41wgpw8ptuszTJy8
	smNo8e1H4uWAG/ra+fYsKiLRru0WBgcVIy3037A1AYFt3fSGDn1sFrKEYROeaDPYLGofSN+7Od1
	Q6ig80t8lTFbwCTcfyjCl7vyk+iykiJzn5k4M+PEFjZkB5UL1fa1pqCzu2q6WUBiFRwX1wDBegN
	R1TtpF+LDfkG89UvldY0Ea4uqG8uAYNB7mYs5Q8qyZ+pTPuy0wl/LO85r7OI/LxO1P3A2O1riTQ
	+KjJ3RaTOrtRXtQqNlnhV5/BHtAxyK2+iqmkilDtpHPg==
X-Received: by 2002:a17:902:efd1:b0:2d6:f988:398f with SMTP id d9443c01a7336-2d74df00b5amr406227165ad.12.1788276912795;
        Tue, 01 Sep 2026 08:35:12 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:57::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dadd386eefsm929635ad.28.2026.09.01.08.35.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 08:35:12 -0700 (PDT)
Date: Tue, 1 Sep 2026 08:35:11 -0700
From: Joe Damato <joe@dama.to>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
	pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org,
	shuah@kernel.org, willemb@google.com, petrm@nvidia.com,
	linux-kselftest@vger.kernel.org, noren@nvidia.com
Subject: Re: [PATCH net-next 3/3] selftests: drv-net: bump the timeout to
 15min
Message-ID: <apbwrx8c3ZMdHI9l@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>,
	Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net,
	netdev@vger.kernel.org, edumazet@google.com, pabeni@redhat.com,
	andrew+netdev@lunn.ch, horms@kernel.org, shuah@kernel.org,
	willemb@google.com, petrm@nvidia.com,
	linux-kselftest@vger.kernel.org, noren@nvidia.com
References: <20260831163734.1121891-1-kuba@kernel.org>
 <20260831163734.1121891-4-kuba@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831163734.1121891-4-kuba@kernel.org>

On Mon, Aug 31, 2026 at 09:37:34AM -0700, Jakub Kicinski wrote:
> The XDP test takes 9m30s on the slowest NIC with debug kernel.
> Let's give ourselves a 50% margin and set the timeout to 15min.
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---
> CC: noren@nvidia.com
> CC: shuah@kernel.org
> CC: linux-kselftest@vger.kernel.org
> ---
>  tools/testing/selftests/drivers/net/settings | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Joe Damato <joe@dama.to>
