Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A93B38B14E
	for <linux-kselftest@vger.kernel.org>; Mon,  4 May 2026 22:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777935255; cv=none; b=Xr5QRp2JQr2plQSmQTtB+g9N09pc2oZmPkkGx08TBVVByfNOUeZd1/1B8o9Rb7lbHscu/LjpHiUkeegNw1T5K+yfsEb5hIKwDSWnoFedy71NtMmQSssVIdNhUK5L0li46cqvs1qKE29inAZR45C1U2BIHFAFhYrq8NssMrUEKi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777935255; c=relaxed/simple;
	bh=GJA5seVahYpViKnGZOh3rNiBjtA0B+KD0LRZTUEpgoI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E/y7zIldk7UN4SallQwCduuYQKzWitj7UQzpORODcwFFiayhSBMby3cMGwhmkD1DWpcoNj31621zfz3OmkQlFrd/yV9EiknajM7jDRjBjsD4uLpC/A1iAVSuTBpReMKGC9RqwbJqOHCBQpKAdmgcsP3vozLBfkrtMZVFZdQOpFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DZV+R6HH; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DZV+R6HH"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-36536771300so1094414a91.1
        for <linux-kselftest@vger.kernel.org>; Mon, 04 May 2026 15:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777935253; x=1778540053; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9ugfH2lM7nQgOC3+hZY16zqoQboC9qbhlDerkTWHT2Q=;
        b=DZV+R6HHRl2Ey2t3N3yv3xwGuB30C/kzGN7Tq/IPskIxfiKxxF0RXYE5d19hJeWkh7
         M3eceaUMnvjnz2yu5bKALKMVbo5tTJ0zSQOEwetuBV7Y1jQFJipQ8SV1H7OSIHHoVA59
         HIsPgRuPqqHCtqWkKqzRugFIbu/QbGOHWLl6QKrCi4zCBp1GurcsCSxu8O6fyKaMfNam
         +OFzRzwSGViW00TaV2NafVAphvxP34SKk4SB7j3MiJdW1avgzQRsNLxknPA6tMS/l/oL
         ssl6edK1TGxxm4uJR09O8l1RmfZyC5o+fr+xYWhEuJQzE4rtGSTmuxt6faHImSwEY+Ry
         raWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777935253; x=1778540053;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9ugfH2lM7nQgOC3+hZY16zqoQboC9qbhlDerkTWHT2Q=;
        b=GP2qul0lyZD/Ed0Hy/7EM5tn3Ogj9QT/fct9OGI4v3v4depdWDyejEbbEwidosEF/1
         LuRuDSPaVSHI0UQ3g1Ad6JzNjnmc8ocyETdzY5WGQ+0kUFrXcinMZQ/8jBL5t8lHu2a+
         MqZzmQTQpqtrGP+YvclnndfrWRHy5JtHdSqPmCKQPdKegM6yoS0X/88hqasUKIlRcSBG
         ddoioL0qhAD74hmsdeNzPTkYmoRU9DJzoze5fFJKB/ybbboMVqoHVCsRpgCOLzhTebwJ
         wQYw0s4kcpxSq1YmmorLBdGWGMktgyDX4TsEWu17a1NEs2MTRxWjMY1TlTzlkzdbTvDy
         dsow==
X-Forwarded-Encrypted: i=1; AFNElJ+RGt5KKu1wKGWNx/UCK/MHkmN3Pt+GrNwc7nxc2ioiZSXfYkO4LyyS9KxE3cVqF8dE52IZ5AVhesm7++MWJv0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHX+kps7oHIe2kdeOLwVEOjPqG1QPOYcesibLXNtfG7zww364l
	sVIRp1zs7sHgGYv/2C0jXw3Q0lddhPGiqyQtNjISaXFAZmU46Yx9donlsswE+14AWA==
X-Gm-Gg: AeBDiesw639yVr3bME512A6aAtmoQW3RPqGZX9UH/xPgdhZZ7dH2g9npPHfnhy9q+3w
	fPeqx9aE1OAfoF6nymn9bBfFAm4PLRc9t2vRinU+LyXNTfD4OrbLCN768GNz+cdaF7GNzC0I5gk
	yvzyQv/JCmiusdcHUxOPbhsqxzZES8rsPu4mBfvAf5hgTP99VaD8B2KKuQdMQKUt/9NnXOMfVT1
	0MQ24sY2te1vEwpaEnq1tuhoqGwhLAe0aNDKPTXSDX3InyfhM0ATorkhyqLwLRcqyRYUBMSfhtJ
	Tt/pH5z0snr3nbjCnmKyp2HOC5foyHI/C3yMrycB8hMahNxNSUHdv+bJFIbLDLisAY2zv6LBV7Z
	cA7RA8a4i1/j5IOK/Pmka5yFreMrsQM9cT3EdLPSjm7s9tNBkFggUymcUwvg+Z8DISTo/XDdBj1
	nb3zFVpxYN/bBAJjbUzHOH2mL1GZiFyS8kAMVAuDveg1P0S/1hZXRSHcR1kO6fF24Upc7rVupsG
	ef5TA==
X-Received: by 2002:a17:90b:2e85:b0:364:a497:db8f with SMTP id 98e67ed59e1d1-365727322f8mr956720a91.9.1777935252914;
        Mon, 04 May 2026 15:54:12 -0700 (PDT)
Received: from google.com (76.9.127.34.bc.googleusercontent.com. [34.127.9.76])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9f0b21c4bsm88242915ad.29.2026.05.04.15.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 15:54:12 -0700 (PDT)
Date: Mon, 4 May 2026 22:54:08 +0000
From: David Matlack <dmatlack@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alex Williamson <alex@shazbot.org>, kvm@vger.kernel.org,
	Leon Romanovsky <leon@kernel.org>, linux-kselftest@vger.kernel.org,
	linux-rdma@vger.kernel.org, Mark Bloch <mbloch@nvidia.com>,
	netdev@vger.kernel.org, Saeed Mahameed <saeedm@nvidia.com>,
	Shuah Khan <shuah@kernel.org>, Tariq Toukan <tariqt@nvidia.com>,
	patches@lists.linux.dev, Josh Hilke <jrhilke@google.com>
Subject: Re: [PATCH 00/11] mlx5 support for VFIO self test
Message-ID: <afkjkBq8B-4KjhS_@google.com>
References: <0-v1-dc5fa250ca1d+3213-mlx5st_jgg@nvidia.com>
 <CALzav=ci8bi3=sY+F3HJTB5sOQ_pJ8Lm+kz0CDBBWVXry5P98w@mail.gmail.com>
 <20260501164314.GA1381708@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260501164314.GA1381708@nvidia.com>

On 2026-05-01 01:43 PM, Jason Gunthorpe wrote:
> On Fri, May 01, 2026 at 09:11:11AM -0700, David Matlack wrote:
> > On Thu, Apr 30, 2026 at 5:08 PM Jason Gunthorpe <jgg@nvidia.com> wrote:
> > >
> > > Add an mlx5 driver to VFIO self test. This is largely a remix of the
> > > existing VFIO mlx5 driver in rdma-core. It uses an RDMA loopback QP
> > > to issue RDMA WRITE operations which effectively perform memory
> > > copies using DMA. Since mlx5 has a stable programming ABI this
> > > should work on devices from CX5 to current HW. The device FW must
> > > support the QP loopback configuration.
> > 
> > > This entire series was coded by Claude Code in about 4 days.
> > 
> > Very exciting. Josh Hilke from Google is also working on using AI to
> > create a selftest driver for Intel IGB NICs so VFIO selftests can run
> > in QEMU [1]. So it's encouraging to see you were able to do it with
> > mlx5.
> > 
> > [1] https://www.qemu.org/docs/master/system/devices/igb.html
> 
> Yes! I would feed DPDK in as well in this case? Combined with the
> kernel driver it should be doable. It is much easier if you understand
> how the NIC works, of course. This worked out significantly because I
> guided it through sufficiently small steps and knew where to find all
> the quality reference material..
> 
> > >  - Make it work on a PF too (this is surprisingly hard!).
> > 
> > Can it work on CX VFs? We're interested in continuously performing
> > memory copies across a Live Update using a VF via selftests to
> > demonstrate SR-IOV preservation (when we eventually get there).
> 
> Yes, I started with VF because it is simpler.

Makes sense. I tested it out and was able to get vfio_pci_driver_test
passing with a CX7 VF.

> The PF support flow requires a bunch more complicated stuff.

Do you think it's worth supporting PFs? If anyone with a CX NIC can
enable SR-IOV and run selftests on a VF then we can keep the driver
somewhat simpler.
