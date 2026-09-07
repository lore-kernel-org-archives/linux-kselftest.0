Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 392144EE84E;
	Mon,  7 Sep 2026 14:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788789755; cv=none; b=E6WZ6A018X2BwR74/yoymTC3IdrWKJprIkNWgzl2BJQN/eIM24kQPPDHq++cbZ5GXafGBSvfq2IDJBECTC9tEJhQYAdgWlDtQQNDWGUt0xN1VtNcfE9HWdYULi/JP3j1ZL/vsAdl5zBPAIAQxXmAvWvw5DXdE2xMSTQ8aKAm1fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788789755; c=relaxed/simple;
	bh=/72UnhBpx4/jVO/5kCFIFUiJeYKro/3KW0WNnPn1Gcw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ukG1KPY+GfkQ5hnj1NIB6EDu/IFKiLuy98nIj796BYs/IwEqrkwAh9Q9cr4Cxf2qsGnrWO8YF38yj5kU+r/theMSnjG+a/WtLa/uZ0ygyW/GrhWivAWXupDElzSu8ahl0lF4+nncEs5UNZftPC/yRkoc1gj8dPV3WXINqhsa/Pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B8vcSeOp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B8vcSeOp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5F7E1F00A3D;
	Mon,  7 Sep 2026 14:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788789753;
	bh=KL5T1TelDxX9poIIjnYG4VtudEiJeRhwq7HiScDnQV8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=B8vcSeOpnnJxcWfWEVNhPY0Wo//3OoTHVsGmhGUQ9X+o/I95Am0Ekfe0/Rafmi0eT
	 cqupf7BscB4yHQzmMvQzV9GPN+Pdnv0OZ5xGHFQCG9lcHg95OEURdjJNcg1TvF0eRy
	 T8ZX62GYh5xvSqt633tWCkLkEvSUZQF9/FZocMHJWinuG1xZahU5X97RueYOCruOUN
	 BLn+WBWTAw/kE13mBpADUJkXVIm0xd84jpTYHT7KKE1wm3lNg3g/oSQtwEjQQttd3q
	 G66oEAaVXDvO9j0XsjuAOiGppqRGyAC2+pK9tJG4Ce5QDwgB/9X1vhYBLuIzd89xRc
	 hCw8g3TUMKKLA==
Date: Mon, 7 Sep 2026 15:02:28 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Pratyush Mallick <pratmal@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>, 
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] tools/testing/selftests/mm: add missing .gitignore
 entries
Message-ID: <ap7D4m2linUE1B9z@gremlin>
References: <20260831-fix-mm-selftests-gitignore-v1-1-c984bbd4c5e4@kernel.org>
 <CALHaPKcyxUMja5-eCcfWq-SOBXzzu_cPOzZa96gewUW-0Xttqg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALHaPKcyxUMja5-eCcfWq-SOBXzzu_cPOzZa96gewUW-0Xttqg@mail.gmail.com>

On Mon, Aug 31, 2026 at 09:31:06PM -0700, Pratyush Mallick wrote:
> Thanks for the fix and apologies for missing it.

No worries, very easy to miss stuff with these :) thanks for cleaning this up,
it's MUCH better now...

>
> Regards,
> Pratyush
>
>
> On Mon, Aug 31, 2026 at 7:18 AM Lorenzo Stoakes (ARM) <ljs@kernel.org> wrote:
> >
> > Commit 2bee308f3adb ("selftests/mm: use pattern matching in .gitignore")
> > switched to a pattern-matching mechanism to reduce churn in .gitignore.
> >
> > It however accidentally excluded the page_frag test's-generated module
> > intermediate C file with .mod.c extension, and also the local_config.h
> > header generated if liburing is available locally.
> >
> > Explicitly fix both the issues, fixing the module-generated C file as a
> > general pattern as these are always intermediate files that should be
> > ignored.
> >
> > Since this is a trivial .gitignore change it doesn't seem necessary to
> > treat it as a hotfix.
> >
> > Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> > ---
> >  tools/testing/selftests/mm/.gitignore | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/tools/testing/selftests/mm/.gitignore b/tools/testing/selftests/mm/.gitignore
> > index fcd892ed21e3..a306d7754786 100644
> > --- a/tools/testing/selftests/mm/.gitignore
> > +++ b/tools/testing/selftests/mm/.gitignore
> > @@ -2,7 +2,9 @@
> >  *
> >  !/**/
> >  !*.c
> > +*.mod.c
> >  !*.h
> > +local_config.h
> >  !*.sh
> >  !.gitignore
> >  !Makefile
> >
> > ---
> > base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
> > change-id: 20260831-fix-mm-selftests-gitignore-dd389da72760
> >
> > Cheers,
> > --
> > Lorenzo Stoakes (ARM) <ljs@kernel.org>
> >

--
Cheers, Lorenzo
