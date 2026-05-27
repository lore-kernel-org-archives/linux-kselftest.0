Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFFF7236453;
	Wed, 27 May 2026 16:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779899028; cv=none; b=oKz6+zz1KswL5qhC3n85W/61SAvn8dGWpbAD/T/DULc9s30cUgMWS2x2r6G5a7lnlTa6mi/n4kksn9gnW+iNj5nKSRmcVLqARimOR4sfoSQgU0KAl2XOw7+GlqVzwetYs4V0oa8YJ/oR6D7bFVNcGdNGYMVNWhxhqCfXnh7pSr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779899028; c=relaxed/simple;
	bh=0XEngy+dyp8Nm47SaO1Ppr08ryWHkXCg/V8H9zrPtFo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OiyViVi/7A0UaFMYWYvFuQNepz6jxlfo3M60DGwVtvIxQJIFf37ttQaNWDQAA70QXoFqrEOWGgs0cKH2hC0XoAjYbX6niHidYm9iEGzkZXmhtsQTvJHI8kbhBS4Yrc35xbzRQF4r5qseZMo1w8eDcJMwcMOy0rOd6w9SHLCRmyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ium4RJoh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ium4RJoh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E394E1F000E9;
	Wed, 27 May 2026 16:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779899020;
	bh=2fjHk22xqi35uz8KDrNOCGFG2idycCs1iTRro0+9cA8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ium4RJohFQpVVzJBfFdSMT8am35jCMhIy8CaKvFwIEqV0X3F9REdbNHs5r8329kWW
	 r7HTAMY47kROuwO+1w+9VuQNJ6b2/0fHQEnKhFLwGdA6KEC3t+1djDsdq6vy4+4EoC
	 +ZmFXueXXmOk/PtV3xMFD6LpNsYprUhS+asr9+eIMWY8Ry8oz0YtMsx1yvF82xfDBs
	 LkjYHh43Gl5k9hM96+RuygpWjpd8kXLrjIAeUDX556xNKM63M5SoBtB4pxuVKV4Q/x
	 kCk4p8ciWvdL3s0oAzIJu0AUE8Vwa7lznlfNmYQlN4OFpfxVlIs7xnrKBWxo2j96M4
	 ZEJ6N0yf402pw==
Date: Wed, 27 May 2026 17:23:33 +0100
From: Lorenzo Stoakes <ljs@kernel.org>
To: Chris Gellermann <christian.gellermann@codasip.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, brauner@kernel.org, 
	shuah@kernel.org, david@kernel.org, liam@infradead.org, vbabka@kernel.org, 
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH] selftest: Fix UB of getline due to missing var init
Message-ID: <ahcaVoRh_Ona6EWm@lucifer>
References: <20260526113848.530105-1-christian.gellermann@codasip.com>
 <20260526113409.ea65314eb1da831de7c90ca6@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260526113409.ea65314eb1da831de7c90ca6@linux-foundation.org>

On Tue, May 26, 2026 at 11:34:09AM -0700, Andrew Morton wrote:
> On Tue, 26 May 2026 13:38:48 +0200 Chris Gellermann <christian.gellermann@codasip.com> wrote:
>
> > Subject: [PATCH] selftest: Fix UB of getline due to missing var init
>
> hm, what's "UB".  Please expand the acronym.
>
> > Clone3_set_tid uses getline(&line, &len, f) in a loop to read the
> > child's process status. The code expects that getline allocates the
> > buffer for the line on the first loop iteration. For this, glibc[1]
> > requires char *line to be set to NULL:
> >
> > > ssize_t getline(char **restrict lineptr, ...)
> > > If *lineptr is set to NULL before the call, then getline() will
> > > allocate a buffer for storing the line.
> >
> > However, char *line is only declared, leading to an undefined
> > initialization value. Fix this by properly initializing it to NULL.
>
> Does the test crash?  If not, how come?  Luck?
>
> > Same issue fixed in mlock-random-test.
> >
> > [1] https://man7.org/linux/man-pages/man3/getline.3.html
>
> The two affected files are testing significantly different parts of the
> kernel.
>
> > Fixes: 41585bbeeef9 ("selftests: add tests for clone3() with *set_tid")
> > Fixes: 26b4224d9961 ("selftests: expanding more mlock selftest")
>
> And these were separated by three years.
>
> So can you please split this into a two-patch series?  And I suggest
> you add "Cc: <stable@vger.kernel.org>" to each one.  Please retain David's
> ack on both.

Since this looks fine (I also wondered about the fixes too of course), feel free
to add my tag to this too:

Reviewed-by: Lorenzo Stoakes <ljs@kernel.org>

>
> Thanks.

Cheers, Lorenzo
