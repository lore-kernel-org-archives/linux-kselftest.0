Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A02353EDA
	for <linux-kselftest@vger.kernel.org>; Thu, 22 Jan 2026 17:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769104288; cv=none; b=NR+8M3njPdXUe8gVSA+5saCX0CR+ajh2wL1wCirGOqzHUyixxZk+9iz8FivAKE84w77+MIszvIxpixfN/b0FieLRTy8nmOoRGfgRkTaJkok8p0kRvAewRjqyJaM0Xe/v8hSUdiN2xVivol8wENBE3OtJFNJh5GalZ2kJaPnT6ME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769104288; c=relaxed/simple;
	bh=pRIQIWRrRQgnj3ezXQTQ3jrO9DmpI9kPBw6zPbHb67g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eXP3F2Vvq3ofOl0oMXdAraHjUbdiYjLarrR4ne1hHYDaDKlp2ojBND6GaoZxebhnSvtLNr5OuJzjQds1nToitVUvr55TcUlUKIXqyRQvRyPsHyRRsXzCaw5q+iWUDrCagaz+GCwpv0ixVVqK20AEQzIItrzPNrB8fx9ZhDtQE/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qfrrln7P; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qfrrln7P"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-47d6a1f08bbso6684655e9.2
        for <linux-kselftest@vger.kernel.org>; Thu, 22 Jan 2026 09:51:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769104281; x=1769709081; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AS4wzg3mx3qj2Nf8DZyjeBJuZsttBAvemF6BKgHNWis=;
        b=Qfrrln7PGNuizmBYrmItUNneoU+j9SrxNhbg3FpmRoJVInXIVwkel16lbsF0Qt+pnT
         w3vieA8V4U/6skgBZGvdomGnuAJbEnBFAZT4CPubR5NCsEQikcNScQ7wQfOcEm+Px2SC
         FjnPkPAqLJlQyuxPdv6idUOsDTtb/fweZGGF51l6FbqN5OSSLD0qxA9B4SwGV+XFFxrp
         URbQ/cLhVUXDckzAVaC1OP6hW1nOmQ6fDSAA855wy/Rn5afbll+nvNcPuPchkZL5GRfC
         32mPUORqpo5NnRg2UvEkQMMO3264B2AscJrXvSzfoq//elRxn3As++HZwwrITX6vaNpI
         Rlgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769104281; x=1769709081;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AS4wzg3mx3qj2Nf8DZyjeBJuZsttBAvemF6BKgHNWis=;
        b=QzvTvE8XUt+lj+cLW0kF5JkCfP52tl/bqMHaluXBuGP9vaaho/hdKOhN94seys/r8q
         Tp5oOCR5JFckh7efcBqdHcjndKPbUpW4ApwvE2oNZcTZvQ0KjoGE4XdV6jEssXYemRO8
         bLB+5Hdbc2oY9rY3+KDUotr8rvswuMpNrCJMdAG+BKAx5gcjuGwewNx9TiYOh6VHkaQ1
         MqsDt/Ozi9F1F05rg5zhUghpIsSLnny6n/2t40flKAOL4mWL4Ng4MV3ziqxQQ2ilGrmP
         A4zn72XCEuYq4RG8zOQYg2U1Ac6Pch8EQ7m0lExjUlqynDLOr+KGOxddvgtzNPcChfNa
         XB7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUbrhs1aWj9rsFe/BGTneAAxgaBSpkBDBnGvt2JeVxOLB/+gH4vrHM/2zK/loaX6vi0ESSZVFnzVENSqlnSwso=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqcO6lmnZKA/cv6AFvT2H/uKbcdFQ852/zYWFJCoJC4S77HChO
	P7dOYZlB3ZMR/Raauj1SHDJcodugEs2EDpdQuMJxBFR/V4noy4e08NHE
X-Gm-Gg: AZuq6aLthFllYF+mOEXAupWGCF/ZtfRcIHNrgu2TEejzj8wFXjZKpZsTlQMbOA6OYfP
	thO0OzQGA9s+Soe0MGDB6KRaL51KWQhLJh4YDLcqQqr6353/Ozw7Fi+9DPc3Wf5q5egyrYgrVTS
	fEzvH6wGUtgY9ilWUskIGX1X28xZK9SthlYVaEn466SQRLHHVT/8TGXRi2u8+nMCp0U4kPEHy1z
	DNWKtZu7fwx5XOssW00QbJ+i551I965/4qAUrn6OTuqoc3LUgYO6qx296J4nQ6tc/bAIGin1ubt
	tfh1/P7ujllvZVXqf3WsOam2XQ1e1qrTQVsFIdKX1wwbSancR8GCXWN3U917YPuxbbcheXwe9Kq
	KlOdavYvhkAiehK2dUGAzsm/Vvs2k03atU8KTZV/xVHsc4xJvIe7EAouEam0qVqysDSu4pIXnpw
	aorHgwGA/2KvOSad51
X-Received: by 2002:a05:600c:1552:b0:47e:dc64:f1c6 with SMTP id 5b1f17b1804b1-4804c9456e1mr7701325e9.6.1769104280996;
        Thu, 22 Jan 2026 09:51:20 -0800 (PST)
Received: from archlinux ([143.58.192.3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48046fb7eaasm83645505e9.0.2026.01.22.09.51.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 09:51:20 -0800 (PST)
Date: Thu, 22 Jan 2026 17:51:18 +0000
From: Andre Carvalho <asantostc@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Breno Leitao <leitao@debian.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>, Simon Horman <horms@kernel.org>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next v11 7/7] selftests: netconsole: validate target
 resume
Message-ID: <aXJikx-Tt7XjHpl3@archlinux>
References: <20260118-netcons-retrigger-v11-0-4de36aebcf48@gmail.com>
 <20260118-netcons-retrigger-v11-7-4de36aebcf48@gmail.com>
 <20260120172057.6600eefe@kernel.org>
 <aXFIk1L8G_dHF6od@archlinux>
 <20260121174505.5e710b0b@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260121174505.5e710b0b@kernel.org>

On Wed, Jan 21, 2026 at 05:45:05PM -0800, Jakub Kicinski wrote:
> My main point is that even if we fix the HW setups to do the right thing
> in systemd policies - the tests are running against netdevsim, not the
> precious HW present on those setups.

This makes total sense. I got too carried away trying to make sense of why this
was failing (I might still submit a follow up to make the test more resilient).

> I don't remember the history, it's quite possible that Breno wanted to
> have a separate target for netcons from the start and I pushed back.
> I think we reached the point where we want to create a target.

Sounds good. I had a chat with Breno and I'll look into moving netconsole tests
to a standalone target.

Thanks for the patience and reviewing this series!

-- 
Andre Carvalho
