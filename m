Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 032013C76BD;
	Thu, 28 May 2026 11:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779966698; cv=none; b=oIptwmJ+avn0L944JOBSoEgcehTk97OygsRlufmSFVEW5qYq1cYsWz0AKm6EWvZvJzH7Rj5CpVtTl69FPir9jtxJRxdptjfB6qgPv8IueYE87avk6yobtDHKYYy8D2NOf4J+F6ooK6ut/kd3cH2LIRApTWEFCzj4Iv39WjKYuac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779966698; c=relaxed/simple;
	bh=Np+XE4VlvB8HiVHMu6V4MWE9VE2xfoaUY+TCdA2YTMs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nuZs9VcFYwhNNh2gifUVtMC7cSaLMoGBj/bWUJPWT+FpPDarD7knAoaKG40G/epXOyB/NfCfWG4lquwGh4+May7yasG5IuwQ8x9pl+l9/Bneji8x7NHT2ZmOAZ4Izg0aHnVSPF1378VctaDe8vmaC0mFbqG9kdJRfnqT0vDzraI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JOtIqTs7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JOtIqTs7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A5561F000E9;
	Thu, 28 May 2026 11:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779966696;
	bh=ne5ApovZMbkOettABh46HNsZEAWwxelReJI++i/88Ow=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JOtIqTs7UeLBWdtsSWzM+GSBfqiIy4adGPClaPp0l0XYKtsM5StuRWFTvq7iveF/P
	 vvxmfRPg/ti2kC0n1H1QPtrSlOl4pINysNuWq8kX8F5crno1c0DlFVt1OeZcUtY7pJ
	 2z0elgZKMvESunPSiCZipFA/FJjzq4XbPEM0858XbZhS6U0kesX5V62bqmCZZg6HbS
	 lmaBqjjEP8vcAVjm0ceN8givCPZJhHepqCy3K6r9wCvc97IdsjwXUAL6PEa0nmHbAi
	 yZ+h+NZrRlKzZ0JgO2vMEm5u4Is1e3NwP7f/ADZSDgSlOfgERPekDe20moqvKDZXnR
	 UiscGPtsPQJrw==
Date: Thu, 28 May 2026 14:11:28 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Hongfu Li <lihongfu@kylinos.cn>
Cc: akpm@linux-foundation.org, david@kernel.org, liam@infradead.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org, ljs@kernel.org, mhocko@suse.com,
	shuah@kernel.org, surenb@google.com, vbabka@kernel.org
Subject: Re: [PATCH v3 1/2] selftests/mm: refactor pkey test helpers and
 unify assertions
Message-ID: <ahgi4I3_hHZK4HdY@kernel.org>
References: <ahbWZJ2BbR8mmDd_@kernel.org>
 <20260528091300.2082967-1-lihongfu@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260528091300.2082967-1-lihongfu@kylinos.cn>

On Thu, May 28, 2026 at 05:13:00PM +0800, Hongfu Li wrote:
> Hi Mike,
> Thanks for the review comments.
> 
> > > Move shared tracing and assertion helpers to a common file, then
> > > convert the sighandler test to use pkey_assert() for consistent
> > > diagnostic output, and add per-test tracing around test execution.
> > 
> > This sounds like three patches to me.
> 
> Got it, should I split this into three individual patches?

Yes please.
 
> Best regards,
> Hongfu

-- 
Sincerely yours,
Mike.
