Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794314532;
	b=Yf1WbkxpdFprwrZd3k02n5RjJUfC9qK9Jx+87dPv++wqTOKHIG4/L2UuKmGj8cot8AeP
	 yTnfTZblLq6mIOvOn3jt6ZuYcuAXdEwD0wQa20MR95dXL5e3I3aBFWZ5F6CAE5+MfNUhn
	 SkcAEYQQ8bIWjfteSbgzTIKxuOSZdt8oNhuZOHM1owcM1A44fevzYtC9sk0gR4IW4RcPH
	 TuIwOxjKTCjH6+FdJdicYwb4cIc3Yf65kl/3KZy6cLRzo2HkfD+X+3BX+dKTaiFIrizXh
	 9uGaSt3UxKN42luaQ2luINbKtJAwS6dtQxsZz0wh7KJP6xECotlLLvSwK+ITE+BFkpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794314532;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=aRoErpQ0qdoUbWw0nfuYgIwgrTUDpslGsShVaP/Z9BQ=;
	b=DN2G4GDIoTbYSfky36WHDDWnXiyZmGCx12YEUnVDYOooxbKI92Pryg8llAztuZM2fqme
	 oxvjdoobROgIjIeYOMOZfRSmcadrVF6a60vyZ/3wBkyyQbZib8dbjfx3W3K0CritaIVo9
	 L7386b49hr8jEvkjABjpOY/6/nPvXj2l4OZ4XPJUeFfPRj+X/SF6GJRDJqGTUc8ueRRRh
	 DeuP6/aP8zauKX2HvVFqqluaz59WWobjnW2mC2q/B/5kQ3fxBsjArxiVneH8IySZowe3j
	 3K+au+xW0o6v+ilp7kzzQSMwHOYfbrM486jkuNohAPW544qZ0dUkUkMAwNr/2DeDySg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jQK63Jsz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB909606A336;
	Tue, 10 Nov 2026 12:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jQK63Jsz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A5EA1F0089F;
	Tue, 10 Nov 2026 12:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794314531;
	bh=aRoErpQ0qdoUbWw0nfuYgIwgrTUDpslGsShVaP/Z9BQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jQK63JszJQWuuVVPMn7wOCpBAp5Qjsn9Ao4CS45p6vrYYXjwgXnuIlZAzNDlVU65t
	 BAqNUAcIdkjZ3eYq2E8M5JSgJg665YMLxoUirn3QjqWZkwiuKHn8Zcadz5vRbE89/9
	 X+vUwfAFfU5ajWYQ9DiDb7Dy1l4pIH9BFt5lc/MiLDCog2WGfxMqNDwNk5RzPWE+ad
	 w3G0qVRmhefIXgDRJx/pCFFU/LtKpBMJ4EyaUIzuUd3nBwoHUE+zQ7eKfGLkCWCXMS
	 DVmUOjRxd2gkSjyRefp8Jf3vJUewpZtJS4PgiWZb/GjiJvluv85aVpcRvjJqoPlaH5
	 oBGgfF4Wfv8lQ==
Date: Tue, 10 Nov 2026 12:42:04 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: "Xu Xin (vivo)" <xu.xin@linux.dev>
Cc: akpm@linux-foundation.org, chengming.zhou@linux.dev, corbet@lwn.net, 
	david@kernel.org, link@vivo.com, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	odys.yuan@gmail.com, rppt@kernel.org, surenb@google.com, tujinjiang@huawei.com, 
	vbabka@kernel.org, xiao.wang@vivo.com
Subject: Re: [PATCH 2/4] ksm: skip rmap_item allocation for non-zero pages
 under only_merge_zero_pages
Message-ID: <avMKhCLDv-ybpmIZ@gremlin>
References: <20261110074312.219847-1-xu.xin@linux.dev>
 <20261110074451.220524-1-xu.xin@linux.dev>
 <20261110074451.220524-2-xu.xin@linux.dev>
 <avLrHrnpP3tuXXPZ@gremlin>
 <avL+Xj5/Md58Gc98@dgvxl46587.localhost.localdomain>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <avL+Xj5/Md58Gc98@dgvxl46587.localhost.localdomain>

On Tue, Nov 10, 2026 at 07:22:06PM +0800, Xu Xin (vivo) wrote:
> On Tue, Nov 10, 2026 at 10:05:20AM +0000, Lorenzo Stoakes (ARM) wrote:
> > On Tue, Nov 10, 2026 at 03:44:49PM +0800, Xu Xin (vivo) wrote:
> > > When only_merge_zero_pages is enabled, ksmd only ever merges empty
> > > (zeroed) anonymous pages with the kernel zero page. A page that carries
> > > data can never be merged, yet the current code still allocates an
> > > rmap_item for it in scan_get_next_rmap_item() before cmp_and_merge_page()
> > > decides to skip it.
> > >
> > > On workloads with a large amount of non-mergeable anonymous memory this
> > > is a real cost: every scanned non-zero page pays for an rmap_item
> > > allocation, and the rmap_items accumulate in the per-mm pending list.
> > > For example, a MySQL instance with hundreds of gigabytes of anonymous
> > > memory (mostly buffer pool pages that cannot be merged) ends up with
> > > ksmd creating rmap_item metadata for each candidate page; the metadata
> > > overhead can wipe out any gain from the zero-page merging and even turn
> > > the net benefit negative.
> > >
> > > Add should_skip_non_zero_page(), called in scan_get_next_rmap_item() before
> > > get_next_rmap_item(), which, when only_merge_zero_pages is enabled,
> > > checks whether the candidate page is all zeros. A non-zero page is
> > > skipped entirely: no rmap_item is allocated for it, and any stale
> > > pending rmap_items below it are freed (as get_next_rmap_item() would).
> > > The page is reported back to ksm_do_scan() as ERR_PTR(-EAGAIN), which
> > > counts it as scanned and continues, so the pages_to_scan budget is
> > > preserved.
> > >
> > > The all-zero check (pages_identical() against the kernel zero page) reads
> > > the whole page. For a non-zero page this is a net win: the extra page read
> > > is cheaper than the rmap_item allocation and the stable/unstable tree
> > > operations it would otherwise trigger.
> > >
> > > A page that is zero now but is written before cmp_and_merge_page() runs
> > > is still handled correctly, because the checksum-based decision in
> > > cmp_and_merge_page() (added by the previous patch) is the authoritative
> > > one.
> > >
> >
> > Please re-write this in your own words.
> >
> > It's rambling on and never gets to the point of _what this patch does and
> > why_.
> >
> > I'm not interested in reading a novel to understand the code :)
> >
> > It seems very LLM generated, LLMs are _terrible_ at writing commit messages
> > and commits, please re-write all of that.
>
> Indeed, the description was generated by LLM, but I thought that was clear enough
> to present what this patch do and why. Aparrently, you don't like that style, I'll
> rewrite that by handd.

In general we never want LLM-generated commit messages/comments.

I do however obviously appreciate and empathise with using it to assist
non-native speakers. So that's fine, but ideally you would write it up yourself
and then have the LLM do simply a polishing layer, keeping the length as small
as possible, which should give us the best of both worlds. Thanks :)

>
> The goal is only to avoid rmap_item allocation for pages that can never merge
> under only_merge_zero_pages. The implementation is simple.
>
> I'll send a v3 with those changes.

Well let's wait on David's POV on this series for this cycle before a respin
first thanks!

>
> >
> > > Signed-off-by: Xu Xin (vivo) <xu.xin@linux.dev>
> > > Co-developed-by: Jinjiang Tu <tujinjiang@huawei.com>
> > > Signed-off-by: Jinjiang Tu <tujinjiang@huawei.com>
> >
> > Why are this and the other patches in-reply-to 1/4? That's not how you send
> > a series in mm.
>
> That was my mistake

Ack, sure I've made all sorts of mistakes like that myself :)

> >
> > > ---
> > >  mm/ksm.c | 82 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
> > >  1 file changed, 82 insertions(+)
> > >
> > > diff --git a/mm/ksm.c b/mm/ksm.c
> > > index 49f3728a3d03..e641c37ee096 100644
> > > --- a/mm/ksm.c
> > > +++ b/mm/ksm.c
> > > @@ -2535,6 +2535,69 @@ static bool should_skip_rmap_item(struct folio *folio,
> > >  	return true;
> > >  }
> > >
> > > +/*
> > > + * Determines whether a candidate page should be skipped entirely when
> > > + * only_merge_zero_pages is enabled, before an rmap_item is allocated for
> > > + * it.
> > > + *
> > > + * A page that is not all zeros carries data and can never be merged with
> > > + * the kernel zero page, so there is no point in allocating an rmap_item
> > > + * for it. Skipping it here avoids the rmap_item metadata cost that full
> > > + * KSM would otherwise pay for every non-mergeable page.
> > > + *
> > > + * @rmap_list: head of the per-mm pending rmap_item list
> > > + * @addr:      address of the candidate page
> > > + * @folio:     folio containing the candidate page
> > > + * @page:      the candidate page
> > > + *
> > > + * Returns true if the page should be skipped (and any stale pending
> > > + * rmap_items below @addr are freed), false if it should be processed.
> > > + */
> >
> > This is a really weird mix of kdoc style + not kdoc style while not being a
> > kdoc, for a static function?
> >
>
> Will simplify it.

Thanks.

>
> > > +static bool should_skip_non_zero_page(struct ksm_rmap_item **rmap_list,
> > > +			     unsigned long addr, struct folio *folio,
> > > +			     struct page *page)
> > > +{
> > > +	struct ksm_rmap_item *rmap_item;
> > > +
> > > +	if (!ksm_only_merge_zero_pages)
> > > +		return false;
> > > +
> > > +	/*
> > > +	 * Pages already merged by KSM are handled by cmp_and_merge_page();
> > > +	 * do not skip them here.
> > > +	 */
> > > +	if (folio_test_ksm(folio))
> > > +		return false;
> > > +
> > > +	/*
> > > +	 * An all-zero page is exactly what we want to merge with the kernel
> > > +	 * zero page; process it.
> > > +	 */
> > > +	if (pages_identical(page, ZERO_PAGE(0)))
> > > +		return false;
> > > +
> > > +	/*
> > > +	 * The page carries data: free any pending rmap_items that are below
> > > +	 * it (they are stale, as get_next_rmap_item() would), and skip it so
> > > +	 * no rmap_item is allocated for it.
> > > +	 *
> > > +	 * Compare the masked address, unlike get_next_rmap_item() which
> > > +	 * compares the raw rmap_item->address (which may carry the
> > > +	 * UNSTABLE/STABLE_FLAG bits). That is intentional: a pending
> > > +	 * rmap_item at the same address as a non-zero page is stale and must
> > > +	 * be freed here, not returned for processing.
> > > +	 */
> >
> > We don't need a prose version of the code, and it reads like AI slop, we
> > don't want AI slop comments, thanks.
>
> Sorry, this is to clarify the difference between get_next_rmap_item() and here.
> Maybe too verbose to you ? I can simplify those words.

It is too verbose yes, and effectively writes out the code in comment form, this
is not helpful.

>
> >
> > > +	while (*rmap_list) {
> > > +		rmap_item = *rmap_list;
> >
> > Why is rmap_item function-scoped when it could be block-scoped here...
>
> You are right. Will fix it.

Thanks!

>
> >
> > > +		if ((rmap_item->address & PAGE_MASK) > addr)
> > > +			break;
> > > +		*rmap_list = rmap_item->rmap_list;
> > > +		remove_rmap_item_from_tree(rmap_item);
> > > +		free_rmap_item(rmap_item);
> > > +	}
> >
> > This code is very ugly.
> >
> > Newline...

In general I'd prefer a rethink though to make it cleaner.

> >
> > > +	return true;
> >
> >
> > > +}
> > > +
> > >  struct ksm_next_page_arg {
> > >  	struct folio *folio;
> > >  	struct page *page;
> > > @@ -2737,6 +2800,16 @@ static struct ksm_rmap_item *scan_get_next_rmap_item(struct page **page)
> > >  			if (tmp_page) {
> > >  				flush_anon_page(vma, tmp_page, ksm_scan.address);
> > >  				flush_dcache_page(tmp_page);
> > > +
> > > +				if (should_skip_non_zero_page(ksm_scan.rmap_list,
> > > +						     ksm_scan.address, folio,
> > > +						     tmp_page)) {
> > > +					folio_put(folio);
> > > +					ksm_scan.address += PAGE_SIZE;
> > > +					mmap_read_unlock(mm);
> > > +					return ERR_PTR(-EAGAIN);
> > > +				}
> > > +
> >
> > I don't love just shoving more logic into an already massive function. No
> > to this.
> >
> > At some point technical debt has to be paid, clean up this code first please.
>
> Emmm... I agree scan_get_next_rmap_item() is already too large and needs cleanup.
>
> But it is the main KSM scan path, and a refactor there is high-risk. The cleanup
> deserves a separate series with careful review and testing.

Completely disagree. By this logic we'd never improve anything, and even if it
were true, it's valid to say there should be a feature freeze until that's fixed.

Anyway, let's work through this a bit.

At 50,000 ft:

static struct ksm_rmap_item *scan_get_next_rmap_item(struct page **page)
{
	...

	if (mm_slot == &ksm_mm_head) {
		... huge block ...
next_mm:
		... of course, nasty non-linear goto logic ...
	}

	for_each_vma(vmi, vma) {
		...
		while (ksm_scan.address < vma->vm_end) {
			...
			if (tmp_page) {
				... <-- you propose to add open-coded logic in
				        the most nested bit.
			}
			...
		}
		...
	}
	... huge amounts of other code ...
}

Now very clearly you can separate out these blocks into static functions with
no risk at all and eliminate most of this indentation.

Digging into your proposal:

			if (tmp_page) {
				flush_anon_page(vma, tmp_page, ksm_scan.address);
				flush_dcache_page(tmp_page);
+				if (should_skip_non_zero_page(ksm_scan.rmap_list,
+						     ksm_scan.address, folio,
+						     tmp_page)) {
+					folio_put(folio);
+					ksm_scan.address += PAGE_SIZE;
+					mmap_read_unlock(mm);
+					return ERR_PTR(-EAGAIN);
+				}
				rmap_item = get_next_rmap_item(mm_slot,
					ksm_scan.rmap_list, ksm_scan.address);
				if (rmap_item) {
					ksm_scan.rmap_list =
							&rmap_item->rmap_list;

					if (should_skip_rmap_item(folio, rmap_item)) {
						folio_put(folio);
						goto next_page;
					}

					ksm_scan.address += PAGE_SIZE;
					*page = tmp_page;
				} else {
					folio_put(folio);
				}
				mmap_read_unlock(mm);
				return rmap_item;
			}

Firstly, in context, this is:

			...
			if (tmp_page) {
				...
			}
next_page:
			ksm_scan.address += PAGE_SIZE;
			cond_resched();

Right?

So this could be:

			if (!tmp_page)
				goto next_page;

			... logic in block above ...


With zero risk and immediately you remove one level of indentation.

Since you're returning rmap_item anyway you could do:

			if (should_skip_non_zero_page(ksm_scan.rmap_list,
				ksm_scan.address, folio, tmp_page)) {
				ksm_scan.address += PAGE_SIZE;
				rmap_item = ERR_PTR(-EAGAIN);
			} else {
				rmap_item = get_next_rmap_item(mm_slot,
					ksm_scan.rmap_list, ksm_scan.address);
			}

Then:
			if (!IS_ERR_OR_NULL(rmap_item)) {
				...
			} else {
				folio_put(folio);
			}
			mmap_read_unlock(mm);
			return rmap_item;

Which does the mmap_read_unlock(), address update and return for you.

IMO none of this is risky, and this isn't even getting into bigger
refactorings you could do.

Adding a few of these kinds of things as patches early in the series really
isn't that hard and improves things for everybody.

I'd love for this to be an instinctive thing people did when adding new
functionality to stuff like this. That way we pay down technical debt as we
go :)

--
Cheers, Lorenzo
