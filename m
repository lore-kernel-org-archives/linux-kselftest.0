Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D49E48D87A
	for <linux-kselftest@vger.kernel.org>; Thu, 13 Aug 2026 15:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786635642; cv=none; b=YH2IOAf17aWF/W74cTPdTigrFE35VNd+047ulr8M1/bfVvMKj7XWfa5iyWLtYtcU5NVP+dR21wR4tazc3KFo1dYcIkvZrM8GEKJCVPAXWzoBOgaW0OHg48AVaDWPx+odmPQdr4fNC5Kv8rLYdSworoFvjsZzcu1pvC7jbbSqeGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786635642; c=relaxed/simple;
	bh=WtqsLzrgSjg/xVRfW9WfYBYpQ3bP/9ChUav4NHg7yVg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ih0N7nYyqPliGHoD01YDN8tyaiN44KhlwD4CxjfcGvtCoksnJzcPOHXgputrH1wuybOWWzmslzqYgtlokQbGcgddftQnXRMabhuh5BrIm9MwbUeSSkw3sumkTdIAlzC/K0gPEuOOOo9k4DL2FGIpS/13Le7WLr28znOliT5T6vM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dF8Cx924; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dF8Cx924"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2caced6038eso15229745ad.0
        for <linux-kselftest@vger.kernel.org>; Thu, 13 Aug 2026 08:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786635637; x=1787240437; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AcZvN96x3R8L9Ww6tvDjLJoxtHOJUhdmG67qkMsuoE8=;
        b=dF8Cx924z63s7ot0bcNk24y7I0YPDSgB9NNaJVzHc9+3Yt/JGlCfFcrjl5hDlLMxTt
         4MaEDpK12ekLLATLF+cwf3ufcrM029EuFcouefRhyELSWlu7wH6mDorsVx0fyKzD1NDS
         LGD1Rj5ARKXA0ZtgpswP3jq3CN1QHKO38uyVtYfnr0GHaAlPvgJ11BoL71E1NFVq1LuX
         7Qsi3yfCb3BPFwq+ZvxYOfzLVs6xDhks+uZtJKfEVVGuzn+W/57XaORu3wOspuM2F9cn
         AMKxPhm7UYvvFASH+Wh2uWcq2oT74ZkNKGOAsz22bnmreYWkD7FnSH1W20QMhFCBLUGJ
         x5bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786635637; x=1787240437;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AcZvN96x3R8L9Ww6tvDjLJoxtHOJUhdmG67qkMsuoE8=;
        b=HRaXDXHWgSWsdUm/D43umNo6JgPV/Y9yZISj4aJnL54ez6832Xo0jVOsYinKaAHUHX
         NjV0OjTnQyxdGPz2YN5iupjzrEgsnOXa7FM5jgbVyKm6eahq5MAenrW1PEz6jMgb+hL6
         qHFkM5/W6bg9XzZWOWgw/h3EySTpIeh8SnbFTBcLXTCGopypqssH+Ycqhc8w/xZlcFJx
         jsfG/KwzLqHs5X88e4ecS6CGciqC5YA8kb2FFS6PQ9EPyiUcCla15YXVcrmqVH4mh8Zi
         ibDRLnX/c863TTiVwYVSlo7JubpK0RojGO9y0bXrI0YAgRdnFzQak68AtG8xXbtZZTtX
         gGIw==
X-Forwarded-Encrypted: i=1; AHgh+RrqFgIlVCz7eEFyM70cp1vPwoQ/EFMrwdI/sA48pSrqpEulsTSVmQ+v4gETnnbIV8oGRujjz6BftNT5iWdmqcY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSfPkbeI864ddDxvraXKWO6u8f6E+OKoTjXX8qY5r0mhAiWqMG
	ZZMNa8VP6qnQGmhxzZAI4nUyknf+k0EsEhFlmnlfsQoheP53Y3eksUXsQH/yuJIZ7w==
X-Gm-Gg: AR+sD11Y4u0hE33bNsFOZe53rdjfbgIa88dAYOnldRMsJ5+0Mm4KAbjPhlwF8CS3vg3
	IdRQxZXPr7v0kxxjWrb5oPtsSkY/NnamX2vwEhcWfieNZPvQncmDr/8Nm0UHgEwEHymFUhgRxpg
	MPDPjOlL0RBNbe5440UvyQ4WilQzjO4XbpBSi+YpOvwUBHg4gl8epTINjm2mk2DWqQsONJxxJlQ
	OeMDrP49tB4bjiPIKBAE5v/Yjn2BBscbYktWGfGenOx1u/RbVUFWN+rogM182J/4BXZ96atTfJA
	IgTIxFUhekoMXdNlDvpTrlu1qa4OQoWHOCYNQBGFwg9318GahAc3CNCPsRnN2U3FRYXTd+Ol/98
	pcgk9LBCumqTqvYo3nb9XBKWyiquDPCrlFHoldaI61EaXH3wMLSjcdzPtUPpwsgMQLQTof/cnQK
	cio+tyRFKyDNUGCt2N1T+rwzjcfmHbRswYwBLyrXNvXV/cs0Ny7gcvFjG1LSruu4rYZbGYUsB9a
	AnXW8GbbxHwBN0pVRLyQsenOK7tyZEZ+nGD6+y1
X-Received: by 2002:a17:902:f64e:b0:2cf:70d2:da7c with SMTP id d9443c01a7336-2d37f77fdfemr84524235ad.12.1786635636542;
        Thu, 13 Aug 2026 08:40:36 -0700 (PDT)
Received: from google.com (132.200.185.35.bc.googleusercontent.com. [35.185.200.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d37c2000bbsm12399845ad.7.2026.08.13.08.40.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 08:40:35 -0700 (PDT)
Date: Thu, 13 Aug 2026 15:40:32 +0000
From: David Matlack <dmatlack@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alex Williamson <alex@shazbot.org>, kvm@vger.kernel.org,
	Leon Romanovsky <leon@kernel.org>, linux-kselftest@vger.kernel.org,
	linux-rdma@vger.kernel.org, Mark Bloch <mbloch@nvidia.com>,
	netdev@vger.kernel.org, Saeed Mahameed <saeedm@nvidia.com>,
	Shuah Khan <shuah@kernel.org>, Tariq Toukan <tariqt@nvidia.com>,
	patches@lists.linux.dev
Subject: Re: [PATCH v4 08/10] vfio: selftests: Add mlx5 driver - HW init and
 command interface
Message-ID: <an3lcKmhXbRnDpRL@google.com>
References: <0-v4-021df3fb5a3f+98e-mlx5st_jgg@nvidia.com>
 <8-v4-021df3fb5a3f+98e-mlx5st_jgg@nvidia.com>
 <anzoiALsjiWrsZtl@google.com>
 <20260812233207.GB730363@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260812233207.GB730363@nvidia.com>

On 2026-08-12 08:32 PM, Jason Gunthorpe wrote:
> On Wed, Aug 12, 2026 at 09:41:28PM +0000, David Matlack wrote:
> > On 2026-08-12 11:59 AM, Jason Gunthorpe wrote:
> > > @@ -0,0 +1,108 @@
> > > +/* SPDX-License-Identifier: GPL-2.0 OR Linux-OpenIB */
> > > +/*
> > > + * mlx5 VFIO selftest driver - HW definitions
> > > + *
> > > + * Typed wrappers, constants, and helpers for programming mlx5 hardware
> > > + * via the VFIO selftest framework.  Most HW constants and all MLX5_SET/GET
> > > + * macros come from the kernel headers (mlx5_ifc.h, mlx5_ifc_macros.h).
> > > + */
> > > +#ifndef SELFTESTS_VFIO_MLX5_HW_H
> > > +#define SELFTESTS_VFIO_MLX5_HW_H
> > > +
> > > +#include <linux/io.h>
> > > +#include <linux/build_bug.h>
> > > +#include <vdso/bits.h>
> > > +
> > > +#include "mlx5_ifc.h"
> > > +#include "mlx5_ifc_macros.h"
> > 
> > I'm getting a compiler warning here when building with clang which is
> > getting upgraded to error from -Werror.
> 
> I don't get that. My builds have -Wno-gnu-variable-sized-type-not-at-end
> which comes from here:
> 
> tools/testing/selftests/lib.mk:
> 
> # gcc defaults to silence (off) for the following warnings, but clang defaults
> # to the opposite. The warnings are not useful for the kernel itself, which is
> # why they have remained disabled in gcc for the main kernel build. And it is
> # only due to including kernel data structures in the selftests, that we get the
> # warnings from clang. Therefore, disable the warnings for clang builds.
> CFLAGS += -Wno-address-of-packed-member
> CFLAGS += -Wno-gnu-variable-sized-type-not-at-end
> 
> Why doesn't yours? Are you building it correctly?

Ah I see the problem. I was building with this command:

  make CC=clang -C tools/testing/selftests/vfio

But the correct way to build selftests with clang is to use:

  make LLVM=1 -C tools/testing/selftests/vfio

LLVM=1 triggers the conditional logic to add
-Wno-gnu-variable-sized-type-not-at-end to CFLAGS and the build works.
