Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B44DE64;
	Mon, 13 Jul 2026 12:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783947167; cv=none; b=aexgt2tepSRvG06EWQ4WfBZARMob9UsueXgbUh9qcFpxJLtt9AXjNtBKhxaFS5Wa7lDEAlLKBwr93g2134lSFXR4foba+HbD0Vfn7g79i31+qaxsgFPg6hqbGa+MPk4bUsOpxVq8guZobDXp7Nsw2/q2+ATqk/4/PSMfIYAc8Sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783947167; c=relaxed/simple;
	bh=psDtcMF4RACVLBGpGMWhRFvNBY9GPFrSUIKPslu73Yo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DJF2sgD7kC3mnSPnCrbxSxiSEYAh8GLfD303lsm+buBWrEBlKvQBwU2J2fCS76i4svJMD2DzCxlgjVKE6VrjtO0YlFzPftJmOCkBwPvvFSijrpG4XS+kRuvQMc5EISihDZBAoVDZa5afrIqHRmUeX/RaUYLxNGN+I1w/CJAn43s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=Qk7WOcen; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="Qk7WOcen"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=KrzBFQL/kup5HSstLlQrUOdaDnkU3DG0GMPE0mQF9Ek=; b=Qk7WOcenP8TnPsWFDAQmOgcZLQ
	20+qqf/63rlyGlpxez39tkeLyKC8Z+wQFtQiXEQZPjL1rEXLLanNK9TMtv7ZiUK46cLKfaWa7NoUm
	SxITnK2q6daJpcsN2uzpU8OxbcXz+Y8Csn+011MGei1PKdpc9it+eUuDpGvR3sN7M7CtejltAvEPs
	DyF+KzSI2FzcXaqc+rwqn0gOeabrl2YDKSjru0ZK6lbxbb5TN1DWqZf+o0fheBDTzlGCeNb5MI+sC
	CiNtpB1cCDH4UAmBtiUTtMEzCwNdsamqcdY1C/Qj3r409qPnFITZujeIMHbQVLmivixjNdtiKK8ye
	X5RPWREQ==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wjG99-001VpD-2l;
	Mon, 13 Jul 2026 12:52:32 +0000
Date: Mon, 13 Jul 2026 05:52:26 -0700
From: Breno Leitao <leitao@debian.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH 1/4] mm: kmemleak: confirm suspected leaks with a second
 scan
Message-ID: <alTeK7ffI8_Yy_Dp@gmail.com>
References: <20260713-catalin_pto-v1-0-5b93b1131089@debian.org>
 <20260713-catalin_pto-v1-1-5b93b1131089@debian.org>
 <CAMuHMdWBQ-Vn4XzbrfV31adY7cEjLvmGuwu5_x7rn1NBkEC5mA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWBQ-Vn4XzbrfV31adY7cEjLvmGuwu5_x7rn1NBkEC5mA@mail.gmail.com>
X-Debian-User: leitao

hello Geert,

On Mon, Jul 13, 2026 at 02:36:30PM +0200, Geert Uytterhoeven wrote:
> On Mon, 13 Jul 2026 at 13:48, Breno Leitao <leitao@debian.org> wrote:
> > From: Catalin Marinas <catalin.marinas@arm.com>
> >
> > The kmemleak marking phase is not atomic. While the object graph is
> > traversed, the kernel can modify pointers, free objects or allocate new
> > ones. If a reference to an object is moved from one location to another,
> > kmemleak scanning may miss it. We have explicit annotations like
> > kmemleak_transient_leak() but identifying and maintaining them is not
> > trivial.
> >
> > Given that such transient leaks are short-lived, rather than just
> > reporting such objects as leaks, do another scan to confirm the
> > suspected objects. If no new leaks are found during the first scan, skip
> > the confirmation one.
> >
> > Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
> > Assisted-by: Claude:claude-opus-4-8
> > Signed-off-by: Breno Leitao <leitao@debian.org>
> > Cc: Andrew Morton <akpm@linux-foundation.org>
> 
> Thanks for your patch!
> 
> For how long does this postpone the reporting of a real leak?

No, it doesn't postpone leak reporting by default. The default behavior
remains unchanged.

This patchset introduces two features. The first (patch 1) performs an
immediate rescan within each scan cycle when potential leaks are
detected, filtering out transient leaks.

Each scan takes slightly longer, but a single scan cycle now detects and
reports leaks with fewer false positives.

The second feature adds 'min_unref_scans' (defaulting to 1), which only
reports a leak after it appears unreferenced across min_unref_scans
consecutive scans.

With the default configuration (min_unref_scans=1), a single scan will
still report your leak.

if you change it to 2, then, the leak will only be reported if the
leak is detected by two scans

--breno
