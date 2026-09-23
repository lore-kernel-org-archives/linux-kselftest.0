Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6296053D9F7
	for <linux-kselftest@vger.kernel.org>; Wed, 23 Sep 2026 14:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790174663; cv=none; b=dHwH4IxE9BoF3hXcjEdXhvdwZnL4c0WPnvOZggdG7JAqJEIvumDFfT2syTEgjBLBLStNWYE8cA/2FGWxVAx9JbRGbtndoZx6t+mgxETWXdBUmyug1vYYXA2Gvzu0hCex7DAxYuuNVpD7NnWShYSu8JYYSUDip0dZWQS0QLgVk+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790174663; c=relaxed/simple;
	bh=j03Liecp+aphFEidddPTQRqnkjH1q+gzEpbLO3AiDjY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T2s3oY5XnmyAW44JBBSjQ5ySFQWeihUTuEuwjiRzxt3qbMxk9/hggnmnbL2Zo4EzkccG8e1LWf94cTDBAeB4vi3JzdXfmKlhhqlpKTE5vaYb5rNYkA9n2fqNuq1R4KDSmPTqVWPufpCDeDWnLv1BGIL8uhpDNdKSxwjo4So9TP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=Xa7B0gM1; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="Xa7B0gM1"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-5306abbdccbso9061071cf.1
        for <linux-kselftest@vger.kernel.org>; Wed, 23 Sep 2026 07:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1790174660; x=1790779460; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ida2noRUeQ9O57M8GX64707eMt/ciX4GKxu6FkxXbAo=;
        b=Xa7B0gM1lXBF28BTHA1je4Ix0MqQvvU3A+OPhs8KsJ7JQGZEBu1nY/BsTvJO9NQYBT
         iNnHPGimCfW7RzRK/0mN4nzIkFxZGXFo3j2/UyLn2ZOD11UK41bfG/WL1Pis7zxQ0L2R
         vJ7cKjbFkI5/sShFH9RPWM4N91p3lJ7oIBrFbT/AusK2dLs95kQT4zUYhj0PK55KIWfs
         lJzRmgZHIlMHNC1QkdVmFI7d9Z4YM4IQMGnW4gcgL2P7AhvNvMPERdsKvYpiArDEqMAf
         jHQvbPkHwN3l+yBF7QMA1WNzKGNvbRvktlvAIby33UyXvWtAXWTCQblQ0N2jk5GjPRB8
         3diw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790174660; x=1790779460;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ida2noRUeQ9O57M8GX64707eMt/ciX4GKxu6FkxXbAo=;
        b=MVuvLz3svyGpjY9AURKcB31YK0Wrm5lU7c394rS7D9vLaNT3/uP8cJ0iT5aUITe9fy
         NKfRFowzxmbfUD7e1VnnDa6NayG9oktGUV36pl/TT5B/fGScIdGptn/HkXK7HQqk/0rg
         Q1RTUO8ZctAaQ/JcF7G3lrtYLLsszoMPzNXSHvibPZEQIxixGcldf4ZPd6VHVMoz515t
         iLJepWd9EasGaAADDa6G5xkH9sOIXVCE/IZkPj8c/qZ2MMUHM91+uTrOqAjTe+rf6hIb
         34pkKCsk2v2F+kBZBiON7kaWanA8BUGR8wlpC6C7J+gSyhGrXSnLXQLGDgNI+cjT2I7M
         N1sw==
X-Forwarded-Encrypted: i=1; AKwUvBxzo9PqiXNxqbzJ0XG7ZgR/SV7t5ELNTZmTMyqosY1rOt60DQmPl6haH108mjTl2MrOyIE6DfYLCzAaa80s+h4=@vger.kernel.org
X-Gm-Message-State: AFuF++nN77HnhjxxLfF781tE1EKaK/eaKDucHuppDbKbBaof++tdSbhf
	dXFN5RRagsQM8Oq3HMqfLhmYN+13+65FT+r6N7ZD3cVm1yzQ6d46pgnYR3FkHIbCWU4=
X-Gm-Gg: AYBFou1ttZl5ZXxOqdy1M1UrA2DckJdhC6nM+Wvd7WCk4FPgQ+tKDWkxQN7+UYxhwcL
	VSTdMFpk0iZV2hEuu+BnCnOy7VgQ/UepmFBOOP0r4kpjT9NxDemvi/qfCe7DdKCQPhdBzGbj8eg
	vXq40qAExe/e/KqBXq0s7LkTIAP+qFIM9hlZ4VLPYXuRjWVVhA+dHNx3wgj15N7JXht3iMD50xC
	V2+r90OYVQ67Hfq6Mf5YR64nUJ7ZYXA9BiBJs+Q0SfDpDlcYD6J4hKmO82fzbwi8zJwoMM3Tesu
	+eu3NkPnOHdmWRuLpCxSgIAZt2AZ5wYb+R7izgY9RZhr3cBdH4S3A5ZG6rE8pJP3bLaZ5Ph+JAM
	cfZTybZgV+cbMbwgyshvePuZ7FTpV9I0YpOROjzsUyUtwk9h33HB6BhQEmSyx+etCLvjTfKIrI+
	meuF6u5baeuK5k7VjPI/7ul4sH1M8+Q3X6CkQe5IzMg6+284dPywHxkVnUcGUa0avZIVqSt6DKS
	ZMPYNTqhiMUrvigg+C48f2x9hudQskUQ1hjIIuZgrnwSpeEAR9Prd6w
X-Received: by 2002:a05:622a:86:b0:531:2eb:be76 with SMTP id d75a77b69052e-532db85279cmr96539711cf.22.1790174660094;
        Wed, 23 Sep 2026 07:44:20 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532eaec185esm21362971cf.3.2026.09.23.07.44.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 07:44:19 -0700 (PDT)
Date: Wed, 23 Sep 2026 10:44:17 -0400
From: Gregory Price <gourry@gourry.net>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kernel-team@meta.com, akpm@linux-foundation.org, 
	liam@infradead.org, david@kernel.org, vbabka@kernel.org, jannh@google.com, 
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, shuah@kernel.org
Subject: Re: [PATCH 01/10] selftests/mm: exercise MADV_COLD and MADV_PAGEOUT
Message-ID: <arPjwPwVxdvdR5S0@gourry-fedora-PF4VCD3F>
References: <20260922235830.2350770-1-gourry@gourry.net>
 <20260922235830.2350770-2-gourry@gourry.net>
 <arPgwegm8XgbEUrO@gremlin>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arPgwegm8XgbEUrO@gremlin>

On Wed, Sep 23, 2026 at 03:26:05PM +0100, Lorenzo Stoakes (ARM) wrote:
> 
> I think in general we want to avoid putting stress tests as part of the
> selftests in general? Or at least if they might take a long time to run or
> excessive memory usage, etc.
> 
> Though that might be benchmarks, as we have the THP stress tests so maybe it's
> OK?
> 
> >
> > Assisted-by: LLM
> > Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
> 
> In any case I really do think this should be split out into smaller parts, this
> is a _gigantic_ change :)
>

Absolutely, but alas my poor email hosting throttles me if i send too
many emails - and sending a 38-part series where the important part is
the endpoint of the refactor moreso than the individual tests...
instant 24-hour timeout.

I'm working on a solution.  Need better hosting.

> Since you list a whole bunch of different test areas and you're exercising
> different things you should be able to split this out logically across those I
> think?

As mentioned, this was originally ~28 patches split out, but i think
ultimately only the contractual tests should be shipped.

Maybe there's an argument for keeping some of the implementation
details - they're fairly easy to find in the code below for individual
inspection.

Examples

contractual: These tests won't change behavior based on implementation
 - authorized file PAGEOUT evicts a clean file page;
 - unauthorized shared-file PAGEOUT leaves the page resident; and
 - private-file PAGEOUT reclaims a COW page but preserves a file page.

implementation detail: behavior can change without breaking a contract
 - full and partial MADV_COLD on a PTE-mapped THP

~Gregory
