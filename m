Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE70823507E
	for <linux-kselftest@vger.kernel.org>; Wed,  9 Jul 2025 18:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=163.172.96.212
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752086698; cv=none; b=a73wnzk4fs7t28WFqNHXW7SiOChyD8Aldt86BJb4gf+1OnRIczgJ4f1sXIvH+dNnRjKRr6Q5jlVGIUU5pvrQwh4r6HpJ3inquw9u1H1BbiFNPGmHW2LwUOlBCW4fRZMMJ5Vy3kwDagcG0l71UcurA6mdlJXQwnFRzvmKc421H5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752086698; c=relaxed/simple;
	bh=MaBU60EWv6YgshQW3LdD0fTKFTIT+pcNKDBcyKTdDUg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pnZ3xFvzm8BW5E7f2rsTxrTnzxtUNTA4qA4xRu/6Fk1pUrv23cbWVcRVrDqTINaE37sMxlwBhZaXxRmTwiW+pusJoP3hM2i0I7La+D89L1h1bG0OtHnLIVlWOTpdoiDqklomUVO5/ttf7dPD2uIt5viJjabYvGmMwc4IXNRpFys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; arc=none smtp.client-ip=163.172.96.212
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Received: (from willy@localhost)
	by pcw.home.local (8.15.2/8.15.2/Submit) id 569IihYW015957;
	Wed, 9 Jul 2025 20:44:43 +0200
Date: Wed, 9 Jul 2025 20:44:43 +0200
From: Willy Tarreau <w@1wt.eu>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Benjamin Berg <benjamin@sipsolutions.net>, linux-kselftest@vger.kernel.org,
        Benjamin Berg <benjamin.berg@intel.com>
Subject: Re: [PATCH 2/3] tools/nolibc: add more generic BITSET_* macros for
 FD_*
Message-ID: <20250709184443.GA15954@1wt.eu>
References: <20250709155512.971080-1-benjamin@sipsolutions.net>
 <20250709155512.971080-3-benjamin@sipsolutions.net>
 <1f927eac-15b4-41f2-843a-5226015da96b@t-8ch.de>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1f927eac-15b4-41f2-843a-5226015da96b@t-8ch.de>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Thomas,

On Wed, Jul 09, 2025 at 08:36:49PM +0200, Thomas Weißschuh wrote:
> > +#define FD_CLR(fd, set) BITSET_CLR(fd, (set)->fds)
> > +#define FD_SET(fd, set) BITSET_SET(fd, (set)->fds)
> > +#define FD_ISSET(fd, set) BITSET_ISSET(fd, (set)->fds)
> > +#define FD_ZERO(set) BITSET_ZERO((set)->fds)
> 
> These could be inline function I think.

It's better not do, because man says they are macros, and I've seen
programs using ifdef on them (not to mean that it's common but it's
supposed to be possible according to the man).

Cheers,
Willy
