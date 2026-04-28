Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85CD342B72C;
	Tue, 28 Apr 2026 12:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777379767; cv=none; b=tuillyD6vsOyCE7DZYN2ZtQR2+k6S9sc2wlJhCRSocEJudIOJHdbfQ07egHt1oCYI1z+9m1S6BcTcSG5B2qot9KNYu5mhULBq+GTSTypoDBrXMpSEEJsZYoU3jknQqhH4OpSX3ZNZgE2CCuQaNS1rt9NUWtnly4G6cPaheY0BgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777379767; c=relaxed/simple;
	bh=C7R/TFzNgNltbcdz0kCDP8gZYI94ZC5pmQp+AMMTtb4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TnKUDksPP0cA3J2BuWq1JgUUa9zxHBDSWzq75LIEkpHoeTNZQ4uctHiweUA4YC627ZdmjP3dRM5AXC3Py/RxoG+dlMpX7X5B8UsM8uodcY+Jki0uNV5ZExKgrK2A+w0Cq29uq8In/gtgxZtnqUeK32MBzQCqKkTnm42o2MVcBx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=alWwTtZx; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="alWwTtZx"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=9+c2UZTVUDrNuvY4woxQE41JPKVjFts4ul8CCsWoP9c=; b=alWwTtZxwwjeYdE/hPw0Tc3hHJ
	HrIupiCanArUA/uoe6Ya9fLraMc+bVzT+a0w5prSl+qsNsXlP/oPPc3Kroq9RAY7ryhzrCFvQekm8
	dSsKffigzYAg6OhbTyvE3fop6Io2+Nlu8hLa4ccuikG/pqULahZAJ4yIjqDbWYAwsugurouWwVjO/
	qnx/dDygdeALJ3O6y21Geqm/2c3OyokDn+hD+8k+RSrgdWdTrt7oBoJeODj96KLWI1hZPLjgwffe1
	u20P+n07IakvuqBviv9NH51bXOhQ4Lq6bilsI3VQPFdvpxKYyQZGbnMNTzcE3Y8zoelAuv8xP9nap
	KROYy4jw==;
Received: from 2001-1c00-8d85-4b00-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl ([2001:1c00:8d85:4b00:266e:96ff:fe07:7dcc] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHhfO-00000003nlw-0v4k;
	Tue, 28 Apr 2026 12:35:54 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 7D27F300BD2; Tue, 28 Apr 2026 14:35:52 +0200 (CEST)
Date: Tue, 28 Apr 2026 14:35:52 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Aniket Gattani <aniketgattani@google.com>
Cc: bsegall@google.com, joshdon@google.com, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, mathieu.desnoyers@efficios.com,
	mingo@redhat.com, paulmck@kernel.org
Subject: Re: [PATCH 1/2] sched/membarrier: Use per-CPU mutexes for targeted
 commands
Message-ID: <20260428123552.GX3102624@noisy.programming.kicks-ass.net>
References: <20260410125655.GB3102624@noisy.programming.kicks-ass.net>
 <20260410235511.2989255-1-aniketgattani@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260410235511.2989255-1-aniketgattani@google.com>

On Fri, Apr 10, 2026 at 11:55:11PM +0000, Aniket Gattani wrote:
> On Fri, 10 Apr 2026 14:56:55 +0200, Peter Zijlstra <peterz@infradead.org> wrote:
> > On Thu, Apr 09, 2026 at 09:22:22PM +0000, Aniket Gattani wrote:
> > > +	if (cpu_id >= 0 && (cpu_id >= nr_cpu_ids || !cpu_possible(cpu_id)))
> > > +		return 0;
> > 
> > Did that want to be:
> > 
> > 	if ((unsigned)cpu_id >= nr_cpu_ids || !cpu_possible(cpu_id))
> > 
> > ?
> 
> Thanks for the review.
> Agreed. I will fix this in v2 and will wait a couple of business days for anyone else to respond.

Was just looking at v2, and this is terribly broken, sorry for the
suggestion.

membarrier_private_expedited() very much has to deal with cpu_id==-1.
