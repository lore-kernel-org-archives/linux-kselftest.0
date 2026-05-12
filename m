Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0F2C4C6F18
	for <linux-kselftest@vger.kernel.org>; Tue, 12 May 2026 10:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778580799; cv=pass; b=XumQNP04Nha4JWaxcHymGdUciuLCH6QUbORdLv8F/+9/nC19A6z1cJeV9oJll/JV+dIkVBMXLobKI/Sd3WN6WnT309hQV2FMOVimIzqMEfl+M7lxutrXM8HtgBB/cLP6KGILDdHRag6Jzm3JnpUk2OSoOf3zILIJCjHU3kTHewk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778580799; c=relaxed/simple;
	bh=3JXviSsNS05f6c95fuXgojlVZygBTpvh0eQQs8WkfiI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LRrM+S/9JT0VTrC0lMK/tczoI+BYQ/dpgJTikvIHCEo+zDr9PHYrwIhFhty4w6RLqKd8nG+T4HKyfR86BQuhsHriVlH0M/4NjsYhb8TYSAYIQkyyq38y/VbsUcl0R0uTQS2JkP5/a5j/vyYAp0xyTXDZhEQ7ULGVmXGCeT627NQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d0rJXY1q; arc=pass smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d0rJXY1q"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-7bdaa68cf81so52490587b3.3
        for <linux-kselftest@vger.kernel.org>; Tue, 12 May 2026 03:13:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778580796; cv=none;
        d=google.com; s=arc-20240605;
        b=DWixYPFqfvnvSzeA3tDMzH/LVHw8cZXEva6JDv4LP+q1FOOSqkR4vs/jxvLysXpIi8
         2y8FvspeEITFFWD1ni3lQQUFt6Xzxc8uTq4vXmxVPkHVwW66/6h7LAWwK1KP9IDyJpJ3
         q8tm3JRDEj5kgxNV8Bvq1IflmEjnSDMrtQVe2wGg3aCqHYrj7mgmMa6JVZ5QMstfXZRP
         UKzDPdBSWiiWI7mdIPjaM1naFWqJhucF5V4ijju/iUM0aN1JZMsT9HrRdJq2msqVD8fy
         3edY17BGl2eSD3C1WH5ZNyyf5X7h8yMiQUaJMH9ImtJHbfKlT6vb2+umM8Kr6oSRNNxQ
         Gj5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5BSZqOS+TrqkUHbWv/C2v4w7E8GCl6EcU8pMI4+NnO4=;
        fh=HYqZmkV8oohEMw/OrUDL6jBoR3X0py0A6gWQ050HeO4=;
        b=N2rYRb9V5wFHJ/CABFxeSFNBm4XcadZFLSPRd/w2wAdF8E6q32LRNWyzQlhqxb3j7A
         s1PwZlDBAeqdT02nYyp3L6S3aJDpMd+iFYGtwE+48lEF+mOzSl9/iR8B2C9UfbwaTdN7
         whGPLWLRHh/l+erzLa/9OmtbgvxnHd4FwcvVM1eUBga7I9wUdC6NUL2g/3L6H2S0eT5T
         FK8WgCmqUkrAlG0WDQTAaSvGhfGmE7D9ShJ4CACF1P8sj2Th9abQgQDieuJf9XCmu6cF
         jxc86NRTGrnlhavrDVk/BXNJwnEMGIbYvnPK1Zupux9FRvcHZZdcpbsZ8tmNIfkLdZqW
         6hcQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778580796; x=1779185596; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5BSZqOS+TrqkUHbWv/C2v4w7E8GCl6EcU8pMI4+NnO4=;
        b=d0rJXY1qXMP+qdjzen+4W6TpacmYAQEw1wV2s+GTrt8gWLhaOamJ0SPOZyHHUyI6f5
         pGy7+islksyKuw3htw8inCJEMv377G1cdqt30AWubqQR+VNeFcpGYq9PTw+77P729oPQ
         BhHhTyzsscS7zRStrDAUCYOiYXa9bEIV4CNQ9QyhlLWDz6nNIrhT/PKgxnstJzyvvGzq
         5HK0JDSZ6uRWQde04yROY9f4wabk1pFgG/kYNK3bnOdWGkgKMxP3gPmk95l8+dGqlLq5
         Eje4Xc4GMQ0Xws+gVHb9SrdWjUgrTiDU8bOrkXwfhTjpvyRxdL4o6p0gm49zKtXOrgcm
         lOhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778580796; x=1779185596;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5BSZqOS+TrqkUHbWv/C2v4w7E8GCl6EcU8pMI4+NnO4=;
        b=T4fStYze3CNupX7U6Pkup0NQ23H6xNHIEjxdgVp7RXgYK69RZwMWjxplbov9cuoxhC
         GcYG17jQXiPKCTWC8bGAzdOu2X/JJc7ln1jKEmTQpEVjREjTsTGtI1IAhm/qTf4EB5Or
         CBC4Ed5irajb0Lb+PjJos8xtUCwc2m15Irk6gQAD2gCFKN2F+rKA5T+tdNOm3vtoPadq
         OKdyZ4lT0bW1XUDM2Tb5LB8tsBk1pz7vc1mpAsnKGxGXX5o9BN+Qyq3TQBq94/vKfgCt
         7jryWcMDTBjGXsxWUDxAXExN/nJZXp1GD9glc0Zzjf7BKA5aatd8MbE5ouEPvuOzlLnS
         KUDw==
X-Forwarded-Encrypted: i=1; AFNElJ/MO+BGwPJHaQCLT2bnzyqyPbOw+yy+OZFFC/rtmRn6j114IA/cv9bXxRJDxgmsY6H+7zf4kzV6HFEn3+vigqg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmojSLms00Br2hc/IPKGYu/PNJyBm7IPleHddWtnic/jeEPMJX
	vGLcP3KG8x3GwobxagoHQ1CvEgyz25nd9gtIwgaAG4lQJkgg24VlDAYWzsD4HAs9i8QW2lXrR7N
	VgvxS1omFLJ/43yLrSptq8roU+El/jD0=
X-Gm-Gg: Acq92OGL3q8BEzi6ILlrAYNigqYp4UCrMJY5kEoA2FIu+YJGLAq8Ul/xHllJvLSOiCe
	/XE9dIFCsYdb7Dne1QsGTwBYA15PQ1tiMQWYBUbIcaAMEaoT3RFEtiEYxF2hc/t9sgDu2iqtzXS
	oVee91GElYVXv8d8l3U/r7d82fOgohijfl85wWYA+IDsAsIL+bKrMaNRbmo/B6Vn6NVAfayYQGF
	/uATG5+ZiFdB0lT0MKRnDyRo6xqRtoanX1CSOpp0rRwlGF7OXslP0nQxddQ+ajGUvDLc+k1uEkC
	TL8=
X-Received: by 2002:a05:690c:4d47:b0:7b6:f4f:f057 with SMTP id
 00721157ae682-7bdf5e9c436mr289758407b3.24.1778580796530; Tue, 12 May 2026
 03:13:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260504-dd-cleanups-2-v1-0-6fdd24040642@gmail.com> <20260508190121.3461706b01f6079bbacdd167@linux-foundation.org>
In-Reply-To: <20260508190121.3461706b01f6079bbacdd167@linux-foundation.org>
From: jim.cromie@gmail.com
Date: Tue, 12 May 2026 04:12:50 -0600
X-Gm-Features: AVHnY4JV_Kad_CzJVZ6-hA21hwnqEtvGFXmvgfMclci-oTVYzeG4JisLmLwYre0
Message-ID: <CAJfuBxz7t08qiAxrDuUkF6_6pkjG-nK_3tn82w+Kbt+y=XZxug@mail.gmail.com>
Subject: Re: [PATCH 00/17] dynamic-debug cleanups refactors maintenance
To: Andrew Morton <akpm@linux-foundation.org>, 
	Linux Documentation List <linux-doc@vger.kernel.org>
Cc: Jason Baron <jbaron@akamai.com>, Luis Chamberlain <mcgrof@kernel.org>, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>, 
	Shuah Khan <shuah@kernel.org>, Louis Chauvet <louis.chauvet@bootlin.com>, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, =?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 8, 2026 at 8:01=E2=80=AFPM Andrew Morton <akpm@linux-foundation=
.org> wrote:
>
> On Mon, 04 May 2026 14:45:06 -0600 Jim Cromie <jim.cromie@gmail.com> wrot=
e:
>
> > This series is nearly all maintenance: it refactors/splits functions,
> > The user visible change to /proc/dynamic_debug/control is s/class
> > unknown/class:_UNKNOWN_/, which is a more visible/greppable indication
> > of incomplete class definitions.
>
> Wait.  We can't make userspace-visible changes?
>

- the code has been marked BROKEN for its 1st, intended user: DRM,
so there are no users affected by this change
- UNKNOWN is an error condition, an incomplete/incorrect classmap definitio=
n,
and is expected to be caught in implementation or review.
- phase 2 of the patch set has improved compile-time and modprobe-time
validation,
they would catch this coding error.
- I will drop this patch if these reasons are insufficient.


> > Coder visible change is to drop the enum ddebug_class_map_type's
> > unused vals - namely: DD_CLASS_TYPE_DISJOINT_NAMES
> > & DD_CLASS_TYPE_LEVEL_NAMES
> >
> > These allowed more symbolic named inputs:
> >   echo +DRM_UT_CORE > /sys/module/drm/parameters/debug
> >
> > But theyre unused 3 years later, and probably not worth keeping.
> > With a removal commit in the log, its easy enough to restore them later=
.
> >
> > ...
> >
> >  MAINTAINERS                                        |   1 +
> >  include/linux/dynamic_debug.h                      | 106 ++---
> >  kernel/module/main.c                               |  12 +-
> >  lib/dynamic_debug.c                                | 504 ++++++++++---=
--------
> >  lib/test_dynamic_debug.c                           |  28 +-
> >  tools/testing/selftests/Makefile                   |   1 +
> >  tools/testing/selftests/dynamic_debug/Makefile     |   9 +
> >  tools/testing/selftests/dynamic_debug/config       |   7 +
> >  .../selftests/dynamic_debug/dyndbg_selftest.sh     | 257 +++++++++++
> >  9 files changed, 582 insertions(+), 343 deletions(-)
>
> No Documentation/ updates?

I have 2 doc-only updates I peeled off and sent to @Linux Documentation Lis=
t
Otherwise, there are no behavioral changes here to write about.
Phase 2 has API changes needed to actually fix classmaps for DRM, and
docs to go with it.

I split out phase-1 to lower the barrier to review and apply.
By your response, it seems to have helped.

wrt sashiko review, Ive made several adjustments, Im reviewing,
working the others.

Thanks
Jim
