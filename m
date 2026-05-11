Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2013D3C5DB8;
	Mon, 11 May 2026 16:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778517880; cv=none; b=DmBD6tawdr3+2vtylhBBshTvJc7oq9bK31iess6mhAXBlOZ6vie/xoVbFwSyUWwGTo6YI+bA3o4ncKtE2pcIDPbbivbQmgC9AMJtwgkc84Io+Cb2iNpC3Fdi/3RLLFQRj9g+BmhI66mxa9vkfP2FKfDvpObbAVR1O/wybwR5jWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778517880; c=relaxed/simple;
	bh=7pZZP1uERtEHLWxXu+uAGasbabdb7FcMyhWApqq5gZg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R+JtJBoSyXR67RgWBD9QFVbl9vc2khXbDhW4wTb8o+jU3vuK7alnNBxWh5wC7K2i0ryE6e4cw8fYOS/TGtF52QOI54iiW1jHpFFVwe/+D4MRoOkIvlzC1ZxbJNx/Ayvv+bpwBLBAC5rfsQbmh+/RcvaqKKeMR7mauEDfh6fK3/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nEcbygBB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nEcbygBB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B257C2BCB0;
	Mon, 11 May 2026 16:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778517879;
	bh=7pZZP1uERtEHLWxXu+uAGasbabdb7FcMyhWApqq5gZg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nEcbygBBMz4d4LFSejQILqt2ivyT1jfPBw4N5F+SRzMJgG5ddYdYJzH418hkwVAjO
	 75wxjHuKEHQ2JDOhJrHPuTFOmagy/5Hs5W/6itBu7TKQRwusnCSe3/a+I0W0f/IYft
	 uAZe6f4TQif69Ta2p7YE4G2vKD8UbYjLLuZbjGvpNVSQcGnRFSGZTo6Ef/mCbjnqjX
	 BQjECOTsJixun9rGVpL49BgveN8trOMbpmrbjo0qvw8F1wzvDoQ1MqcoNNpPzpwLKd
	 7nlmNguugHMyJmY4Z8B2lX74OsDwN/ngODShb7jXj0NqzP6GqqhalnRhMp2W/ZpfSs
	 id209vbx2lBKA==
Date: Mon, 11 May 2026 19:44:31 +0300
From: Mike Rapoport <rppt@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Hu Song <husong@kylinos.cn>, akpm@linux-foundation.org,
	shuah@kernel.org, linux-kselftest@vger.kernel.org, ljs@kernel.org,
	liam@infradead.org, vbabka@kernel.org, surenb@google.com,
	mhocko@suse.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/mm: handle fork() failure in migration tests
Message-ID: <agIHbwEq7vEl9tFI@kernel.org>
References: <20260511093433.2372985-1-husong@kylinos.cn>
 <dcc6c2ee-6670-42e8-9cd7-6bc999f1bf7f@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dcc6c2ee-6670-42e8-9cd7-6bc999f1bf7f@kernel.org>

On Mon, May 11, 2026 at 02:47:38PM +0200, David Hildenbrand (Arm) wrote:
> On 5/11/26 11:34, Hu Song wrote:
> > From: Song Hu <husong@kylinos.cn>
> > 
> > When fork() fails and returns -1, the code falls into the else branch
> > and stores -1 into self->pids[i]. Later, kill(-1, SIGTERM) is called
> > which sends SIGTERM to every process the user has permission to signal,
> > potentially killing the entire user session.
> > 
> > Add an explicit check for fork() returning -1 (pid < 0). On failure,
> > clean up any already-forked children before failing the test via
> > ASSERT_GE(pid, 0). This fix is applied to all three fork() call sites
> > in shared_anon, shared_anon_thp, and shared_anon_htlb tests.
> > 
> > Signed-off-by: Hu Song <husong@kylinos.cn>
> > ---
> >  tools/testing/selftests/mm/migration.c | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> > 
> > diff --git a/tools/testing/selftests/mm/migration.c b/tools/testing/selftests/mm/migration.c
> > index 60e78bbfc0e3..f433e4f195ad 100644
> > --- a/tools/testing/selftests/mm/migration.c
> > +++ b/tools/testing/selftests/mm/migration.c
> > @@ -163,6 +163,11 @@ TEST_F_TIMEOUT(migration, shared_anon, 2*RUNTIME)
> >  	memset(ptr, 0xde, TWOMEG);
> >  	for (i = 0; i < self->nthreads - 1; i++) {
> >  		pid = fork();
> > +		if (pid < 0) {
> > +			while (--i >= 0)
> > +				kill(self->pids[i], SIGTERM);
> 
> 
> 
> > +			ASSERT_GE(pid, 0);
> > +		}
> >  		if (!pid) {
> 
> I think "else if" reads nicer here.
> 
> But why do we care about cleaning up the other processes? IIUC, we don't do that
> explicitly if e.g.,
> 
> 	ASSERT_EQ(migrate(ptr, self->n1, self->n2), 0);
> 
> fails?

We care about cleaning up all the forked processes because otherwise they
remain zombies :)

But killing some of them if a fork() failed does not help.

I have a more structured fix here:
https://lore.kernel.org/all/20260511162840.375890-5-rppt@kernel.org
 
> 
> -- 
> Cheers,
> 
> David

-- 
Sincerely yours,
Mike.
