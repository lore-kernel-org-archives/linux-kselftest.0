Received: from mail-dl1-f73.google.com (mail-dl1-f73.google.com [74.125.82.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77A521A239A
	for <linux-kselftest@vger.kernel.org>; Fri, 10 Apr 2026 23:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775864647; cv=none; b=bcgW/s+C3rmu22/SOlOGKx7Mb4eJw0bn0F4rUF0VdpUAt4JTOnAwcF1MwIQeWz1MVfa56n7knDVXr5Wkkt03cKdOr1wcW8WT3JWWg78KFpvl1lPCvxoKZbKSFhJ0BJczizstXyXEyuHYFirfa/jExAk/Uxl2CyXnGacd+oyy3xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775864647; c=relaxed/simple;
	bh=TuoX4UUn1svtSDoTUW94lOrrf/nbyVbwYZEk9/zCC0M=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=cYhzKq2LE/amKD+lhF5hNggjcbkFeMcURlhUQsraBsTpNCVA9ElRYk3Em6h4jEnFLG+lUgTHgdCN9U6d1zonBwCWq7FtMjriWF5V77kE7zLZeGNbTiYarIke4MoXGL9RD+SFR05Z8Sci5Yyas3xp60zr0LHv1aTrU9/m998bgbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aniketgattani.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Df80k5st; arc=none smtp.client-ip=74.125.82.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aniketgattani.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Df80k5st"
Received: by mail-dl1-f73.google.com with SMTP id a92af1059eb24-12c282d6d32so756052c88.0
        for <linux-kselftest@vger.kernel.org>; Fri, 10 Apr 2026 16:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775864645; x=1776469445; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=/+zEPOEcxwMCXl/WuAuJNYOgj5gkLpMjEn8JbUeS1Zw=;
        b=Df80k5st15EPJ/dol5tsXUGQVNEEkeZw+9Kqj6A8F2SQegMPrVy6Qf1A1mTMruQ656
         22xuPBNeI5oJZcT61Yw51m/aGTd4J6N0fjfPscqhonVYG3rwJWn4IXig51r+t3Osa29q
         asQqTDB+hHRYd0icCnr9jYRbfLmoJ1XXlq90UFIuD3UyqRLFIFK6aykv071RTFAQQCP+
         UMvTB5fdM3a9QfQzP0b/WEI3Roa8a7+b+/+rv28WFDDO7FdUsOVMbb5ANklM2GyJ4fnK
         xEF4UpY6iNv9Ac+1brZoKd51IBc/444mBYgAqHC4Lfp6Ej9Cg7pcBrOstlwTlmpjz6MH
         yDJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775864645; x=1776469445;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/+zEPOEcxwMCXl/WuAuJNYOgj5gkLpMjEn8JbUeS1Zw=;
        b=oL277H7p589/XjfcgF1lyWg9GpbqGVN97TzL/7FyQQw6/0o8LfhIQw50KCsXNdfNKd
         siQYJ4TvxN/zpuTv5RbnoBLTyFW1qWg3d007kqnjWGP/UltjO0AsONY1q7ue7BnFne/+
         xxvcFwxh8m6F4N1rG0jaBS1OJ7mSvzDqPUQW6s4/PiArVhDqxyqKA6g7jfxVqig+sNWw
         DUhLI1G+IeMuBW6xXjMf8/Xh+3d+0K9PUYSnR/4V/bhz2HQIfgFsN6h/TMQz6+s5WUof
         9+jpOVJt+lSW+0WR32enCk/gxW8su5k1DYzpeHm9Ffl2LhfLq5TxoJahjrbkrMRiQnTF
         ogYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfkEfjFc8zMHUSbzyuQWfWfLMV2ucAQcIpj73KuF4Opfgc/pbbxWRaIFmmEAnD6omB6p+qaho/WrQLJXEDfkg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxj0wXRyRC8Ruz8y8yb54v7Oa4GR8yRGa5+bbirVdFkhK94Xqq+
	WsRexcSnGEGxaZ/nlwoE9SDmIk1E8uOM4r0ITUacTReZq+x5JNNvk1MWsMzNkRp+9382n7fi1rg
	fpwXLR7AAWlsi2RWr8G/lgjsqTzjVirOHtA==
X-Received: from dyke40.prod.google.com ([2002:a05:7300:4728:b0:2cb:5486:3ae3])
 (user=aniketgattani job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7300:1495:b0:2d3:4252:b146 with SMTP id 5a478bee46e88-2d589aa4049mr3071765eec.21.1775864645309;
 Fri, 10 Apr 2026 16:44:05 -0700 (PDT)
Date: Fri, 10 Apr 2026 23:44:04 +0000
In-Reply-To: <addfe6a5-f773-46e8-b0f8-1699034720eb@efficios.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <addfe6a5-f773-46e8-b0f8-1699034720eb@efficios.com>
X-Mailer: git-send-email 2.54.0.rc0.605.g598a273b03-goog
Message-ID: <20260410234404.2984751-1-aniketgattani@google.com>
Subject: Re: [PATCH 1/2] sched/membarrier: Use per-CPU mutexes for targeted commands
From: Aniket Gattani <aniketgattani@google.com>
To: mathieu.desnoyers@efficios.com
Cc: aniketgattani@google.com, bsegall@google.com, joshdon@google.com, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	mingo@redhat.com, paulmck@kernel.org, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 10 Apr 2026 08:48:35 -0400, Mathieu Desnoyers <mathieu.desnoyers@efficios.com> wrote:
> On 2026-04-09 17:22, Aniket Gattani wrote:
> [...] >   static DEFINE_MUTEX(membarrier_ipi_mutex);
> > -#define SERIALIZE_IPI() guard(mutex)(&membarrier_ipi_mutex)
> > +static DEFINE_PER_CPU(struct mutex, membarrier_cpu_mutexes);
> > + I'd prefer:
> 
> SERIALIZE_IPI() -> global
> 
> SERIALIZE_IPI_CPU(cpu) -> per-cpu mutex
> 
> Rather than the -1 trick.
> 
> Thanks,
> 
> Mathieu

Thanks for the review.
Agreed. I will fix this in v2 and will wait a couple of business days for anyone else to respond.
