Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 269C836B059
	for <linux-kselftest@vger.kernel.org>; Fri, 12 Jun 2026 17:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781285350; cv=none; b=tIENQ84plCjPpYNX0cuptafMQdqkpP+oueMtTzGORCobz7mW5BQ94VKwhqBJeGaunk4bUIsDLQjLfoJbnz/BMHEbOh0jfHJlIp0SAy5NgRDo5Mou3E8tCPs3jbCBCDiJJ2ScwD1Wb5ssr585YFwEgO+ksBkbObD4OECnI27S5DU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781285350; c=relaxed/simple;
	bh=gH3FIVCDrAGV0izBe38P2bPsc0eUstU+ANKMIFL2JCY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O/yywJLDE31rAqpsyFXWQ3gsAOEkIGoUJbZTgReBzNLG5l+bnCIqkgtf77qPgXq0DbZxMw/Db0XcMIgDg9mib5LpKcJzb6ued0zaZJrKOZxQG4HdIEmDMqbWGlDyjFLxAplmWzEr1vszg10e3L2atwLgUZLHTET5f4g1HkZftYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MPQTIjok; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MPQTIjok"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2c0b1a48855so5435ad.0
        for <linux-kselftest@vger.kernel.org>; Fri, 12 Jun 2026 10:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781285348; x=1781890148; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=loLLkK8YFj2RX3MISH+YVtNr5164MIZqNzHdzscYBKE=;
        b=MPQTIjokndlnC51FLbrWXZC1nO3KRMcJFaWy3wieWU2SIkLKtVIefhiprGAwLWtmLu
         BGLEYJmhkbEp6IMfq2oVHzvrZdBGQQUMZr5q9UPqQDVtxTLgT4wEqfss38k78IIUww0s
         NIt+l+sU65BKEB4SoMyb9sdsNNBgccS1/KFG5HrivodnOkjH2Rkw5nLZfC5BZwGeJIbi
         enfjYKpWeB+Fw3HCc2jvi3mqDP+qoG7m36vGy3pla8nHtqk7M5E0WthrRwqW3hKjY5J5
         COW5lJ2zNpnTkAVfnXsUOqGY9AeEN+0BGQ/9yUr09WYMxPO5WJNUmnQK5BDI+kxtLWfx
         A10Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781285348; x=1781890148;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=loLLkK8YFj2RX3MISH+YVtNr5164MIZqNzHdzscYBKE=;
        b=gv3XH44FWV617k36Bz7fM+M+b+bGw4XtUrMrnJhAr91hc+S5dPXMhPF+z5P0MOAoLC
         flto21t3B0mf6pcMb0l0nysu581tLx5GZzKvt7l24V0HTtGhOttG1yfRzOmTb7N1S97Q
         ck76Dzxr8az4y93Y4QlA1AsSFaM9qdKTTIqKdIKMGHS1ocOuJK7PzWJZFma7BWQu93m2
         UHa5pij8C1AhKjZx+hHBeu/4FGZKL+RTIDG224HLZ+0L4KshcXV39Nl/gS/CAfaYK+EF
         JcUXIQ3vb7GmIughLZxrIBfT/kFrlfDEucALS07OmH7yws9e2qb0XpWOUCxaY9jk3DLd
         Azsw==
X-Forwarded-Encrypted: i=1; AFNElJ9lyJXux/uOfHo5JgochTCSI47oJMuroAzc89+SqSuA0EmcRSfYbi5w7hgAchjcnvRs0ccmSD7ML0Q58UxL7mI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxmBoTG3HbiJMpoDl824b9BMcgyjdU4gFscWqPmpeYGf+4lRQ0J
	b27mfEzMmTnTMtDLHH4i4BIBaZo57fuyPKQ/ey3c9vYgSWErsPz20Se5lX/FPEBjxQ==
X-Gm-Gg: Acq92OHotrV1WoWveuHW5Ydgb0F9lrlQkRd+gc8Ii2nczozZpG59U0zfCCmV5gWGZXs
	H4rfWpk1vmAo03OJnismK2KXAQIzREtKPFDVmVuQc1rrM++yFbQ9ZK/qKntoXG8KtGcL9up+pMW
	hLdJpYgAws1ioX3e75MBA5IZ6z0bxQMTx8HsMAl7S31e+ALDqO79DTsu70DdjdfdQ1ZpFyTD9JE
	kaR0fkCSzWSbY9ou0EV1E36+6lb9kkRgCuFHG2YDGimUHtexBy1TADbEl860RmQFC0fx0SVBWJC
	SOR5xdXuUtR9EOKsvjD1NnJMW+DbuGFFXcKBUVvIvDRKXke5AnVgXEv3t9QGrACNk4TJZg5XLkd
	w+3SLIGcUuAOjc4V0JsqjCsTe207JKmm+Fx3Jdq7TaDBi/fMCDTRXPLnxJfMIsCuDZzmFBrNPKg
	xsaUd+1HvTQHqEDhIOKcPTX0ho3JZn4UVdaPk91CfUlvKqkLyw2LmYDWKV1w==
X-Received: by 2002:a17:903:4b4f:b0:2c1:ee6e:be1c with SMTP id d9443c01a7336-2c665136d6fmr88905ad.26.1781285348004;
        Fri, 12 Jun 2026 10:29:08 -0700 (PDT)
Received: from google.com (60.89.247.35.bc.googleusercontent.com. [35.247.89.60])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434afc8a90sm2766871b3a.28.2026.06.12.10.29.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 10:29:07 -0700 (PDT)
Date: Fri, 12 Jun 2026 10:29:02 -0700
From: Vipin Sharma <vipinsh@google.com>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: rppt@kernel.org, pratyush@kernel.org, tarunsahu@google.com, 
	skhawaja@google.com, shuah@kernel.org, dmatlack@google.com, 
	linux-kernel@vger.kernel.org, kexec@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2 1/2] selftests/liveupdate: Move luo_test_utils.* into
 a reusable library
Message-ID: <20260612172349.GA40404.vipinsh@google.com>
References: <20260610230909.876546-1-vipinsh@google.com>
 <20260610230909.876546-2-vipinsh@google.com>
 <178123377286.908199.18067987861441109485.b4-review@b4>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178123377286.908199.18067987861441109485.b4-review@b4>

On Fri, Jun 12, 2026 at 03:09:32AM +0000, Pasha Tatashin wrote:
> On Wed, 10 Jun 2026 16:09:07 -0700, Vipin Sharma <vipinsh@google.com> wrote:
> > diff --git a/tools/testing/selftests/liveupdate/lib/libliveupdate.mk b/tools/testing/selftests/liveupdate/lib/libliveupdate.mk
> > new file mode 100644
> > index 000000000000..0fb738c02330
> > --- /dev/null
> > +++ b/tools/testing/selftests/liveupdate/lib/libliveupdate.mk
> > @@ -0,0 +1,20 @@
> > [ ... skip 14 lines ... ]
> > +	$(Q)mkdir -p $@
> > +
> > +$(LIBLIVEUPDATE_O): $(LIBLIVEUPDATE_OUTPUT)/%.o : $(LIBLIVEUPDATE_SRCDIR)/%.c | $(LIBLIVEUPDATE_OUTPUT)
> > +	$(CC) $(CFLAGS) $(CPPFLAGS) $(TARGET_ARCH) -c $< -o $@
> > +
> > +EXTRA_CLEAN += $(LIBLIVEUPDATE_OUTPUT)
> 
> since this file contains utility functions (luo_open_device, luo_test, 
> etc.), naming it liveupdate.c makes it sound like the main 
> implementation rather than a test helper library. Using something 
> distinct like lu_utils.c would make more sense.

Okay, I will rename the new file to lu_utils.[ch]

> 
> >
> > diff --git a/tools/testing/selftests/liveupdate/luo_test_utils.c b/tools/testing/selftests/liveupdate/lib/liveupdate.c
> > similarity index 99%
> > rename from tools/testing/selftests/liveupdate/luo_test_utils.c
> > rename to tools/testing/selftests/liveupdate/lib/liveupdate.c
> > index 333a3530051b..897c200f3845 100644
> > --- a/tools/testing/selftests/liveupdate/luo_test_utils.c
> > +++ b/tools/testing/selftests/liveupdate/lib/liveupdate.c
> > @@ -22,7 +22,7 @@
> >  #include <errno.h>
> >  #include <stdarg.h>
> >  
> > -#include "luo_test_utils.h"
> > +#include <libliveupdate.h>
> 
> Linux kernel coding style generally prefers block headers to be sorted 
> alphabetically.
> 

Okay, I will reoder them here and in the other files.

Thanks!

