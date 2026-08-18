Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDBDF1C2AA;
	Tue, 18 Aug 2026 14:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787063814; cv=none; b=Oh3TS0tnCN5KGkDPu/gr5Q5GNciTBiAYjZ539VZ4hy0kypHPm9Jfb25L5/LKf0m5bj9TjkZBftraiE29/ZLH+mLm3qpVQd+SrcKImeZirNZ5YDs7zrgc4i5BiqJJWbmhi42UhlHBxxm2HeLrsXBpMB7KmmGISDj5IiIFrsrvOzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787063814; c=relaxed/simple;
	bh=V6pPxlb4G0EImYHTU10UncJFVqhppg1IduJQKYrcA48=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FRlBhGUErLKYfjf7AKJ0BYW0tQ8P96DyGwX5hawQBEe0+VyQHFoQ57ZlfRPDeicofmnu7jbA0IQr+6xUbQTi6394wU9jMHbi/ugGX9zTTCjQv29WT3Vmle23PmY5aVs8oF5Z2C4UPSEOigSXnxvy8nFCnouXuahC2FE6cfDKKqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VR2gv2nW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VR2gv2nW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30CC21F000E9;
	Tue, 18 Aug 2026 14:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787063812;
	bh=60twq3g0/3SYb+PgS98qhwmg54jHzIFTrtGVBxpkqRk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VR2gv2nW1I8vd3Wyw7hGGg47Gtkh8+h/bhMWu+nQUwdWttAJnA5s6k+HJYkbd3dn7
	 +kw9f/aSqBstcTeOtUxPpUwPp+d1h6QQX8UKtmOMwYRMRs0+25oDsvznSjc8hk1mqR
	 ooOZUEDPQIVEcGhx2a4N1GA27HINqUMhHUgbHe2qR9+OVp6QOGncgfGKX28n0CYx00
	 eIpmLE3omBYAy7RfZVthvweBsEvsHQuyCAcgteITyjxNvwHyVhOEQ0GSTDumdv+cc9
	 7ziZ/T69rPqsq676Xw9NuWNsFCnd4Pt+6I4PmZS2DekuBFfFbwGteSjUC6wbafOS8X
	 CtzuYbyChldaw==
Date: Tue, 18 Aug 2026 15:36:32 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Hemanth Selam <hemanth.selam@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>, 
	Yury Khrustalev <yury.khrustalev@arm.com>, Kevin Brodsky <kevin.brodsky@arm.com>, 
	"Liam R . Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/mm: remove the local PKEY_UNRESTRICTED fallback
Message-ID: <aoRto6bT3Fv0jm7k@lucifer>
References: <20260818114945.1312987-1-hemanth.selam@gmail.com>
 <9e533fcd-c80f-42df-847c-c15c4e3a1a70@kernel.org>
 <aoRcdLGWaNhUFIPU@lucifer>
 <277db0f6-6161-4ff1-9540-7b1eb5f7924b@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <277db0f6-6161-4ff1-9540-7b1eb5f7924b@kernel.org>

On Tue, Aug 18, 2026 at 04:18:47PM +0200, David Hildenbrand (Arm) wrote:
> On 8/18/26 15:29, Lorenzo Stoakes (ARM) wrote:
> > On Tue, Aug 18, 2026 at 03:11:50PM +0200, David Hildenbrand (Arm) wrote:
> >> On 8/18/26 13:49, Hemanth Selam wrote:
> >>> pkey-helpers.h defines PKEY_UNRESTRICTED itself when the macro is not
> >>> already known, a stopgap from when the generic definition was still
> >>> under review.  It has been merged since, commit 6d61527d931b ("mm/pkey:
> >>> Add PKEY_UNRESTRICTED macro"), and pkey-helpers.h already includes
> >>> <linux/mman.h>, so the guard is never taken.  Honour the FIXME and drop
> >>> it.
> >>>
> >>> The mm selftests build against the headers of the kernel source, see
> >>> Documentation/dev-tools/kselftest.rst.  Building them without "make
> >
> > This is incorrect. We explicitly do not have this requirement in mm selftests,
> > and they're often built without having to do this step and tooling has been
> > provided _explicitly_ to allow for that, which is why this kind of thing exists
> > right now.
> >
> >>> headers", against system headers predating the macro, now fails to
> >>> compile instead of quietly falling back.
> >>>
> >>> No functional change intended.
> >>>
> >>> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
> >>> ---
> >>>  tools/testing/selftests/mm/pkey-helpers.h | 7 -------
> >>>  1 file changed, 7 deletions(-)
> >>>
> >>> diff --git a/tools/testing/selftests/mm/pkey-helpers.h b/tools/testing/selftests/mm/pkey-helpers.h
> >>> index 2c377f4e9df1..626c2e1655dc 100644
> >>> --- a/tools/testing/selftests/mm/pkey-helpers.h
> >>> +++ b/tools/testing/selftests/mm/pkey-helpers.h
> >>> @@ -112,13 +112,6 @@ void record_pkey_malloc(void *ptr, long size, int prot);
> >>>  #define PKEY_MASK	(PKEY_DISABLE_ACCESS | PKEY_DISABLE_WRITE)
> >>>  #endif
> >>>
> >>> -/*
> >>> - * FIXME: Remove once the generic PKEY_UNRESTRICTED definition is merged.
> >>> - */
> >>> -#ifndef PKEY_UNRESTRICTED
> >>> -#define PKEY_UNRESTRICTED 0x0
> >>> -#endif
> >>> -
> >>>  #ifndef set_pkey_bits
> >>>  static inline u64 set_pkey_bits(u64 reg, int pkey, u64 flags)
> >>>  {
> >>
> >> tools/include/uapi/asm-generic/mman-common.h:#define PKEY_UNRESTRICTED  0x0
> >>
> >> So that looks good.
> >>
> >> But we seem to have the same ifdef also in
> >> tools/testing/selftests/powerpc/include/pkeys.h.
> >>
> >> So likely that should be removed as well (after making sure that it compiles?)
> >
> > It will break people right now :) it might compile on one system but not
> > another.
>
> I thought once we have stuff in tools/include/uapi/asm-generic/ headers that it
> should work?
>
> The dependency on "make headers" was the problematic bit IIUC.
>
> But this stuff is always confusing me ...

Yeah I did go check over there :) but for a lot of stuff we don't have that and
it's not really the right place (that's more providing userland stubs, etc.)

Yeah it's confusing and a pain and sometimes we break these things but in
general I don't think the #ifndef/#define's are too problematic to keep.

But it might be worth checking in this case to see whether the problem here
is in fact that we need PKEY_UNRESTRICTED defined over there?

Hemanth - could you check please?

>
> --
> Cheers,
>
> David

--
Cheers, Lorenzo
