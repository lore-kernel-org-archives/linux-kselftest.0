Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CEF948382E;
	Tue, 25 Aug 2026 14:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787668606; cv=none; b=MHcB+xw+ueSZ28RYXc1XarQq/cfOvu9WcqZNyGmIwLLQ9NefmSxUKavWhqx6fZts5ZKNHii8EYxmhGgUXIpHP0j9pUHdhf06j0mXzHafNFg0SZlQQzWYPWW3Mpxnf5r/5QGemN5TFwnNFNMb+4IAP9XMXg4Cb6l2ZjRSJGtxZvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787668606; c=relaxed/simple;
	bh=daTvEI3w16S4Hoe+sTbrlNY9G3xXNkhwUlIkMV62TrI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BhcnPwZqg2w9aeBnwdTwbBapZD4UI4TC9UI3yqOnzuQyDlKd4is/31HvSgUkbtrl/6FRS/4PJwpv2NESv0Rm1Ra6JuHhSzJ5mOgENQc18SquW6OAZ3LZDk7R/l/MAZAuzaD9kh/WtNznbjLreCYt4h+YNyDAarLODGF1H1V/pys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gTRA32Q5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gTRA32Q5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78D741F000E9;
	Tue, 25 Aug 2026 14:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787668603;
	bh=56YtQtCs4zY1Wo9MhksdOnGNlbwVQ7SwtCBKJSpWzvM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gTRA32Q5GYrO5A8+2tFR3r8n2+xAzntdO0OL4s63HWDSQ1YRvQtq667c0LmTyJ4Ck
	 LJYx4U11I1FaviXL7N0rjsGjd7PfQxvsnFBGBUr3aYXmU+49SyhrlmgLs0DW9WDX1D
	 JreqrK3Z8FxI+OhyYMRu3JhIpaZxZ9rCfhrRKFvSVWIpQmyeREegEj3L4D0M7Tm9+l
	 nmCeLZaSepdTgBNUn9iED5P7vicLnw7KHIJdS3m/nUawW6ck3QD1MVCuFUayPE32SX
	 w6LlvB4vxXlSTE/RTe67RP9YP8ED+nrC9fg/otHaX2KojfLsjiRMyPxhnf0EmP+WEh
	 enxsjMYqCL+sg==
Date: Tue, 25 Aug 2026 15:36:36 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Hemanth Selam <hemanth.selam@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>, 
	Yury Khrustalev <yury.khrustalev@arm.com>, Kevin Brodsky <kevin.brodsky@arm.com>, 
	"Liam R . Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] selftests/mm: remove the local PKEY_UNRESTRICTED
 fallback
Message-ID: <ao2nFqGevXIa3l4c@gremlin>
References: <20260818114945.1312987-1-hemanth.selam@gmail.com>
 <20260819074717.1345749-1-hemanth.selam@gmail.com>
 <fd193070-af97-497d-82dc-1f0fa1172fd7@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fd193070-af97-497d-82dc-1f0fa1172fd7@kernel.org>

On Wed, Aug 19, 2026 at 04:15:04PM +0200, David Hildenbrand (Arm) wrote:
> On 8/19/26 09:47, Hemanth Selam wrote:
> > pkey-helpers.h defines PKEY_UNRESTRICTED itself when the macro is not
> > already known, a stopgap from when the generic definition was still
> > under review.  It has been merged since, commit 6d61527d931b ("mm/pkey:
> > Add PKEY_UNRESTRICTED macro"), so the guard is never taken and the FIXME
> > can be honoured.
> >
> > The definition comes from tools/include/uapi/asm-generic/mman-common.h
> > via TOOLS_INCLUDES, which commit e076eaca5906 ("selftests: break the
> > dependency upon local header files") added so that the mm selftests
> > build without "make headers".  It is reached through the
> > <asm-generic/mman.h> that the system <asm/mman.h> includes.  Building
> > the pkey tests with KHDR_INCLUDES pointing at an empty directory
> > confirms that; emptying TOOLS_INCLUDES as well is what makes the macro
> > go missing.
> >
> > No functional change intended.
> >
> > Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>

Since you said load-bearing in the last email - I do have to ask if AI was
involved with this.

If so please adhere to kernel guidelines:

https://docs.kernel.org/process/coding-assistants.html
https://docs.kernel.org/process/generated-content.html

I.e. add an Assisted-by tag.

Anyway given your explanation in the other sub-thread seems ok so:

Acked-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

>
> Hi,
>
> please prefer not sending new revisions in reply to old revisions the next time.

Yup. Please send respins as an entirely separate main not in-reply to
anything, thanks!

Also add a revision history under the --- with links to prior revisions,
and if >1 patch send a cover letter that has the revisions and all patch
emails are in-reply-to.

>
> [...]
>
> >  tools/testing/selftests/mm/pkey-helpers.h | 7 -------
> >  1 file changed, 7 deletions(-)
> >
> > diff --git a/tools/testing/selftests/mm/pkey-helpers.h b/tools/testing/selftests/mm/pkey-helpers.h
> > index 2c377f4e9df1..626c2e1655dc 100644
> > --- a/tools/testing/selftests/mm/pkey-helpers.h
> > +++ b/tools/testing/selftests/mm/pkey-helpers.h
> > @@ -112,13 +112,6 @@ void record_pkey_malloc(void *ptr, long size, int prot);
> >  #define PKEY_MASK	(PKEY_DISABLE_ACCESS | PKEY_DISABLE_WRITE)
> >  #endif
> >
> > -/*
> > - * FIXME: Remove once the generic PKEY_UNRESTRICTED definition is merged.
> > - */
> > -#ifndef PKEY_UNRESTRICTED
> > -#define PKEY_UNRESTRICTED 0x0
> > -#endif
> > -
> >  #ifndef set_pkey_bits
> >  static inline u64 set_pkey_bits(u64 reg, int pkey, u64 flags)
> >  {
>
> Hoping this indeed compiles ;)
>
> Acked-by: David Hildenbrand (Arm) <david@kernel.org>
>
> --
> Cheers,
>
> David

--
Cheers, Lorenzo
