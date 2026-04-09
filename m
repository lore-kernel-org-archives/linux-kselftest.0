Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81686386C3D;
	Thu,  9 Apr 2026 08:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775721842; cv=none; b=efWTUAINMe19dmNgw54PkcmVo5yiqpr4iZyLdhfZJlfkqYti8wv3cXI8FSHtAkhNXzJ9pKUoTaO0VthLhj/Ub1wJkVTXaqaST/9i4vgrPHYX9U/24Fuma419iXiepAZn1GE07wp/Ab2rbPJPwC806WmqHZK13DFu2/kDzX2bMQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775721842; c=relaxed/simple;
	bh=G2ZJR48gQHdHGhWfbPFbOSyHC6zZ1l0MoaQGw2C7Oak=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kyLbNfYlMRUbCNcJ/g0q38+ntSycOAHB1iI43D9gNr3ojP8n6ZN1XM/AyuEP6egpqAzmYOyFmrjqshkIdftSUHnLFYFCpZ+70tc6s+T+iBb6LXhnKxduyQbha+ISRp1fL8MIEbeRAJ0G985RF78hOVKkgsqCOYH/ZDENOx2Q1uE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bgytiDwt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bgytiDwt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9B89C4CEF7;
	Thu,  9 Apr 2026 08:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775721842;
	bh=G2ZJR48gQHdHGhWfbPFbOSyHC6zZ1l0MoaQGw2C7Oak=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bgytiDwtrQUnhP+4RBfPsfweYkSoLJlcqMjWZgQvft1H8bo/ZuURAdBynkBlivQ79
	 x23fW4+brpjAHzYdS8JKxxvv0UNwldnu40j4PiOCgg7joz4IGCDUQSZ+Jp3B6L+Wqh
	 swYO/kw47QdR5k0RR9QaTT+DeUwWeGz6QxfurRhkHbROtUAA0b1Q5ZDJmVUlO3MPfh
	 Sox2kWgoupLwfcZRwczznLzd6H2CIPCTtAM65+TXwhYDCuQYjHBI6KOZLzQE5A27Fe
	 Vw8SYH/1cEdJHTB2xipw7YeZm5R+AXamw6HHzwPB7/bl3+ehguRguJbmfz5stHABCl
	 HLvhFnIDAT/Tg==
Date: Thu, 9 Apr 2026 09:03:56 +0100
From: Lorenzo Stoakes <ljs@kernel.org>
To: anthony.yznaga@oracle.com
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, david@kernel.org, 
	Liam.Howlett@oracle.com, vbabka@kernel.org, rppt@kernel.org, surenb@google.com, 
	mhocko@suse.com, jannh@google.com, pfalcato@suse.de, Jason@zx2c4.com, 
	shuah@kernel.org
Subject: Re: [PATCH v2 2/2] selftests/mm: verify droppable mappings cannot be
 locked
Message-ID: <adddNM1yDJ6tWXsR@lucifer>
References: <20260402235933.10588-1-anthony.yznaga@oracle.com>
 <20260402235933.10588-3-anthony.yznaga@oracle.com>
 <20260403123120.82cb5becb19e1b572d474394@linux-foundation.org>
 <83b56ffb-6e2e-4c9b-b0cf-9f04b61ebe7f@oracle.com>
 <20260408140251.6158aa7a56f71128471f327e@linux-foundation.org>
 <ee802934-0be0-4c33-b3d6-38ef713e6bf4@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ee802934-0be0-4c33-b3d6-38ef713e6bf4@oracle.com>

On Wed, Apr 08, 2026 at 03:26:14PM -0700, anthony.yznaga@oracle.com wrote:
>
> On 4/8/26 2:02 PM, Andrew Morton wrote:
> > On Wed, 8 Apr 2026 13:35:42 -0700 anthony.yznaga@oracle.com wrote:
> >
> > > On 4/3/26 12:31 PM, Andrew Morton wrote:
> > > > On Thu,  2 Apr 2026 16:59:33 -0700 Anthony Yznaga <anthony.yznaga@oracle.com> wrote:
> > > >
> > > > > For configs that support MAP_DROPPABLE verify that a mapping created
> > > > > with MAP_DROPPABLE cannot be locked via mlock(), and that it will not
> > > > > be locked if it's created after mlockall(MCL_FUTURE).
> > > > There are a few queries from the AI reviewbot;
> > > > 	https://sashiko.dev/#/patchset/20260402235933.10588-1-anthony.yznaga@oracle.com
> > > Interesting. Of the two issues, one is certainly legit. I need to add an
> > > munlockall() on early return from test_mlockall_future_droppable().
> > Cool.
> >
> > > For the other, the question posed was whether the tests should handle
> > > possibly being run on an older kernel that doesn't implement
> > > MAP_DROPPABLE. It seems to me to that a selftest should not be expected
> > > to work (or even necessarily compile) on kernels older than when the
> > > selftest was introduced, but I don't want to assume.
> > I don't know that there's any policy on that.  My attitude is that
> > selftests are not intended to be forward- or backward-compatible.
> > That's why we ship them with the kernel source!
> >
> > If we get a selftests fixup then I do like to backport that into
> > earlier kernels if appropriate, to keep those in good shape.  And that
> > has the effect of reducing people's motivation to run a later kernel's
> > selftests on their current kernel.
> >
> That makes sense. It's trivial to skip the tests if MAP_DROPPABLE is not
> defined so I'll do that.
>
>

Yeah in general, I think we best-effort try to keep them working for older
kernels (but no guarantees IMO), so checking if something's implemented is
cheap-and-easy.

Cheers, Lorenzo
