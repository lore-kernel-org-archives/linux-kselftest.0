Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C59135A927
	for <linux-kselftest@vger.kernel.org>; Sun, 26 Apr 2026 13:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777210949; cv=none; b=QOWGRQSJAb1QLK1TmSgWDmg+/MtlVZKyJWnf8zig+MN2FcxUvUt7EffVdERkEgBk/98/qXugOOM4P1DjEZ+89Doai0wDJpUr73s/GoM06Pu2zIhfpsMhtFb9KL0+fx8eVmpL/KzSN2j9zmY8jrQ4v/Rx85bt3Bpo5Sie0Ufx1xQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777210949; c=relaxed/simple;
	bh=FhdP40ZNedHqEmlY8s3OTQPdz7LoUhJhpTXV8+ccUeY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DLJrrwCs2BJsbInaMgZGBusILyeisuxgZa2UHbY11xW+ZaL/aAJ2UFKsTLxgXzJeLR34MXpqdylJb2UPQfnqh3282ZWMvwlG08RzJinuaRhALc38rPWhpSXLcA9CtQ8uWD85MFoNCT/r6SbXWf2kbkjn1GexvnFYSDuKLaiKiww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=NDVK9wCG; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="NDVK9wCG"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-5062fc5d86aso77483641cf.1
        for <linux-kselftest@vger.kernel.org>; Sun, 26 Apr 2026 06:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1777210947; x=1777815747; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=etZa6+dwk3PB/o1Yn2oB8jvevYbsEL8oVxXn5echsWc=;
        b=NDVK9wCGz9EYGOfwj4a+B7VlhjB+7bxntO+H2Mhsmfh7HADt2fuEn7Sm0iCM098dI0
         GV6TunZ93LQSKNrxXPxmwg/MJ53dYV8drX54guno0onWf4crbuJa5LbgjWkTNH3Ok30S
         fUtLQMo4W8G5W/1xI6OANVL5kO5J1dKBMTd4sOlO8L1Wn3DE/AnMcGVl81a5IG/xzFmB
         Bsa8p6eX/cVEH26ggcREruOgMbp/xpfytVhND/VStxGcstiEUHvRwxPGvXeYsCf35G07
         sZG+pt3Z2Y9kXqKaMdBDpoELBmE2BcxoVH/niuVgtAIMzjRtCAXMOIV2/qb1QTYJtE2C
         fPfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777210947; x=1777815747;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=etZa6+dwk3PB/o1Yn2oB8jvevYbsEL8oVxXn5echsWc=;
        b=OrhhwktCYwDp/GEFmDbu97oTdBG3XnUn5GWWHVZTnq59wSjqsC/ZthrA/BPjt35Cgr
         1+copAmi6uUysKyyTOfhsf9b/A2bUiDjepqClrsu3P/Pde2YbgXAAGN4qxA+8fi+u4QC
         7j1u9UtUKIrv0OU/ChSQreeNxixU7RRBg+tuke1ho+AxvehBlx5sMrPzAmcEAeZJgbno
         DnCldmI/SwTO+mrNG9SkmftO/SDqtwcwIXOh0tratCKEuP17bjqY3IibDGyxRcHqQrwm
         e72HZqheqFme/PA+3z9gIt0gnbmLRdQSlcyg29Ngk1FF+WuLfjxNWox+d5/0aMJZ0bVl
         r9GA==
X-Forwarded-Encrypted: i=1; AFNElJ+OrE+XkjJyvohJ8o/r8FcAQrEx+P+lCYK0a8XjoH07rsIrtyeZlyVuM5dmpQRykjGDNbjPnsD1X36gNVNsS50=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx37H+EvKX++8HC2JHDSMqIEudsJ1roJApsfsuISNr6WUStsAV9
	6ACxneDqyIEvKqu0hHZGt/ot4qLWiGuA9CiQU0EtC/lj1TgDky+aMkBCAcc5ykMbhnQ=
X-Gm-Gg: AeBDieuJ6DlI62isIxd7gQ2KAJQD0NBEb1f1zLT4qTl4oEcunkJDvsISzuWTvqvqo4p
	M2V6kDBW7875TsVx4XztRxZLSwcqtqKH/gKqyhTSzi4+OlQTuB5e7CFe5OxbGxabhddamu6Bl6S
	b8ZFbOnbzj2CVG9yhZnP3IV9gLEngfJvkwozu2CJ305kjDK2TtQnro+MK7gLEXyfPbUIWPdZIUL
	L9iDz0131qEQfAkWSHCi4aFg6O0gaADtsNcp/efgUPaqSYPeFI1kC3kW0jCdFZlEbts4zVZZa0a
	SYwbs4+umrt/OpOUcpnLAqtplJ9Xnh9tbnyOfpoq8b4/HVofKZ44/xdcEt+3rqLmw1QpY9kODau
	QZHLNQy9QnkydaXHE1kov2OMtov2eFBGf03Q2s8bO2xQ6ujTrhNGiDfzUkPuy806vM3okT9ywNw
	wAOeQaOiAcs3deswGCeiwKhhb4MMsnICg+FD96aKP6DqXvMIxRwX1ifTVGZyucvnqpUtQ3tCmcH
	tILuMl/ikJO192A
X-Received: by 2002:ac8:7d14:0:b0:50e:df54:c36d with SMTP id d75a77b69052e-50edf54c741mr408613341cf.18.1777210947033;
        Sun, 26 Apr 2026 06:42:27 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50e392c859asm305729281cf.1.2026.04.26.06.42.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 06:42:26 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wGzke-0000000EqhS-4C2t;
	Sun, 26 Apr 2026 10:42:25 -0300
Date: Sun, 26 Apr 2026 10:42:24 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Leon Romanovsky <leon@kernel.org>
Cc: Paul Moore <paul@paul-moore.com>,
	Roberto Sassu <roberto.sassu@huaweicloud.com>,
	KP Singh <kpsingh@kernel.org>,
	Matt Bobrowski <mattbobrowski@google.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	John Fastabend <john.fastabend@gmail.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>, Shuah Khan <shuah@kernel.org>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Itay Avraham <itayavr@nvidia.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>, bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-rdma@vger.kernel.org, Chiara Meiohas <cmeiohas@nvidia.com>,
	Maher Sanalla <msanalla@nvidia.com>,
	linux-security-module@vger.kernel.org
Subject: Re: [PATCH v2 0/4] Firmware LSM hook
Message-ID: <20260426134224.GC3501894@ziepe.ca>
References: <20260413164220.GP3694781@ziepe.ca>
 <CAHC9VhR1Uke9P==CELKavBcogHoNCtMZFfNWUbgm5HYUfomhtw@mail.gmail.com>
 <20260413231920.GS3694781@ziepe.ca>
 <CAHC9VhTLamfe4C81ZNRVT=H32x+KLxSqH3o0eBfrHsWAgAqxCA@mail.gmail.com>
 <20260415134705.GG2577880@ziepe.ca>
 <CAHC9VhSECYihup=tURo_Qk__xUdYYPkHgnz5CWA0BrRAkvwbog@mail.gmail.com>
 <20260417191749.GK2577880@ziepe.ca>
 <20260423140950.GE172828@unreal>
 <20260424141921.GA3611611@ziepe.ca>
 <20260426103957.GH172828@unreal>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260426103957.GH172828@unreal>

On Sun, Apr 26, 2026 at 01:39:57PM +0300, Leon Romanovsky wrote:
> On Fri, Apr 24, 2026 at 11:19:21AM -0300, Jason Gunthorpe wrote:
> > On Thu, Apr 23, 2026 at 05:09:50PM +0300, Leon Romanovsky wrote:
> > 
> > > > > Leon mentioned that different firmware revisions would have different
> > > > > parameters for a given opcode, and that one would need to inspect
> > > > > those parameters to properly filter the command.  Is that not true, or
> > > > > am I misreading or misunderstanding Leon's comments?
> > > > 
> > > > They are ABI stable, so there will be rules about future changes that
> > > > old software can follow to ignore or reject future things it doesn't
> > > > understand.
> > > 
> > > It is wishful thinking and applicable only to mlx5 devices. No one
> > > promises that other devices follow same ABI rules.
> > 
> > Well, I will definately kick them out of fwctl if they don't.
> 
> It is easy to say but harder to follow. The kernel includes many devices that
> exist only in specific hyperscale environments, where the update cycle is
> tightly controlled. They easily can break FW backward compatibility.

Well Linus's rule applies here, if it doesn't bother anyone it didn't
break..

Jason
