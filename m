Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D4A842B72F;
	Thu, 30 Apr 2026 14:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777560029; cv=none; b=PiipTAnPkA/aTTmYNQr4/gXIpDL0hi7pXCJCyz1YyUlIgjTfoi9T/djWXIuEeRP2dKPoAkdg0IDdtY6ZRSS3k2RGd+1aLZg5vjGcy97MpR5wS/m2A9j0DZRTxz2KJvIkjRsgYe6Z6doNevJ+rAKHDqtfN4Vy3S1GzUIl3XWvk3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777560029; c=relaxed/simple;
	bh=XKr3lZG1iyqrvPGZ2xciOEGAQlna/FCIh6yCzGzS88o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b++3jReVI3g4T+rnQ4Lx4GtKd+4Emnvg6anYHPfpGsmIKK+ZEw3JtLJae5p+W4VEGyeqg/eJMYQ0sAsOACj/uLiu3mXGuRWQSKbqaTJj4nsZ+ni1bM7aHQxMTmQhz6wEjRHu7UmzeIFtC7YRZR7yr6U9jLdtwMH1fWdqwXA3hzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u+3KYR8S; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u+3KYR8S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 655A6C2BCB3;
	Thu, 30 Apr 2026 14:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777560029;
	bh=XKr3lZG1iyqrvPGZ2xciOEGAQlna/FCIh6yCzGzS88o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u+3KYR8SnHIO5zELtpnVCFVcwED2pW5qrrV06lytWGscluwY8GK3+RtNlmufP6Aph
	 uyhWOULLNvo/SL+/dW9OMWIUvUpof9RYb6Am3+fiy6hQo4RJpxJFyaNcC86V+3C/0l
	 AnfeC+cAGh41Ls/4O1eWSbMqo9miPr9LvZbuJoxWB2BKkdtMjhXUc17+JpMHhEtLzJ
	 izR7IO97QqX5JqoINHXUmi/WHWbsTAGIzk7AOUM1/H92d98yd9XL4lBy2b+SpyxdPP
	 /1M4tcj8yl407t5zGER6BgWU1BRrpxlYG5dngUPwPdWrV3f8eAXDCMThJT7XlsJ7J2
	 jLn4LckghSiZA==
Date: Thu, 30 Apr 2026 16:40:04 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Luiz Capitulino <luizcap@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Barry Song <baohua@kernel.org>, Dev Jain <dev.jain@arm.com>,
	Donet Tom <donettom@linux.ibm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
	John Hubbard <jhubbard@nvidia.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lance Yang <lance.yang@linux.dev>,
	Leon Romanovsky <leon@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
	Mark Brown <broonie@kernel.org>, Michal Hocko <mhocko@suse.com>,
	Nico Pache <npache@redhat.com>, Peter Xu <peterx@redhat.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Sarthak Sharma <sarthak.sharma@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@kernel.org>, Zi Yan <ziy@nvidia.com>,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH v3 04/54] selftests/mm: migration: properly cleanup
 fork()ed processes
Message-ID: <afNpxNsylkUUC0-Z@kernel.org>
References: <20260428204240.1924129-1-rppt@kernel.org>
 <20260428204240.1924129-5-rppt@kernel.org>
 <6b12453b-2683-41cc-bb4c-602eda6bf9d8@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6b12453b-2683-41cc-bb4c-602eda6bf9d8@redhat.com>

On Thu, Apr 30, 2026 at 09:37:43AM -0400, Luiz Capitulino wrote:
> On 2026-04-28 16:41, Mike Rapoport wrote:
> > From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> > 
> > Several migration test use fork() to create worker processes. These
> > processes are later killed, but nothing collects their exit status and they
> > remain as zombies in the system.
> > 
> > Add a helper function that kills the worker processes, waitpid()s for
> > them and verifies the exit status.
> > 
> > Replace the loops that call kill() for each process with a call to that
> > helper.
> > 
> > The addition of waitpid() calls also makes sure the migrating process never
> > exits before the processes accessing the memory, so it's possible to drop
> > the call to prctl(PR_SET_PDEATHSIG, SIGHUP).
> > 
> > Reported-by: Luiz Capitulino <luizcap@redhat.com>
> > Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> > ---
> >   tools/testing/selftests/mm/migration.c | 54 +++++++++++++-------------
> >   1 file changed, 27 insertions(+), 27 deletions(-)
> > 
> > diff --git a/tools/testing/selftests/mm/migration.c b/tools/testing/selftests/mm/migration.c
> > index 3630f2fb0800..76e380b74658 100644
> > --- a/tools/testing/selftests/mm/migration.c
> > +++ b/tools/testing/selftests/mm/migration.c
> > @@ -67,6 +67,24 @@ FIXTURE_TEARDOWN(migration)
> >   	free(self->pids);
> >   }
> > +static bool kill_children(FIXTURE_DATA(migration) * self)
> > +{
> > +	int i, status;
> > +	pid_t pid;
> > +
> > +	for (i = 0; i < self->nthreads; i++) {
> > +		pid = self->pids[i];
> > +		if (kill(pid, SIGTERM))
> > +			return false;
> > +		if (pid != waitpid(pid, &status, 0))
> > +			return false;
> > +		if (!WIFSIGNALED(status) || WTERMSIG(status) != SIGTERM)
> > +			return false;
> > +	}
> 
> Why do we stop at the first error? Wouldn't it be better to kill &
> collect all of them and then return false if at least one fails?

Yep, makes sense.
 
> > +
> > +	return true;
> > +}
> > +
> >   int migrate(uint64_t *ptr, int n1, int n2)
> >   {
> >   	int ret, tmp;
> > @@ -160,20 +178,14 @@ TEST_F_TIMEOUT(migration, shared_anon, 2*RUNTIME)
> >   	memset(ptr, 0xde, TWOMEG);
> >   	for (i = 0; i < self->nthreads; i++) {
> >   		pid = fork();
> > -		if (!pid) {
> > -			prctl(PR_SET_PDEATHSIG, SIGHUP);
> > -			/* Parent may have died before prctl so check now. */
> > -			if (getppid() == 1)
> > -				kill(getpid(), SIGHUP);
> 
> This goes beyond this series, but I wonder if we should have this check
> in access_mem() in case the parent dies in migrate().

With added kill() + waitpid() this should not happen.

-- 
Sincerely yours,
Mike.
