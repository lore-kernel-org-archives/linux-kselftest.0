Received: from mta1.formilux.org (mta1.formilux.org [51.159.59.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39EFC379C47;
	Mon, 27 Jul 2026 03:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.159.59.229
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785123779; cv=none; b=s4EdrGITODSNZQyvXR+xsvclqqUt/fxqUkIp3oJJMHck3/ZgqZ2VGIgo4fDwb/yb2CJZYs3WfeI9gatng9pd+Zk9fMNjLZXfCM1zevyuCikXh1bSyFK5jP9G6kY1zSHs7FsyrhcGPm/aO+vh+qSxb5uiiv2BYJ8GXFiqK3erBNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785123779; c=relaxed/simple;
	bh=XOKB/bnp/NgC/7tBxBpT/ASFcKxvfCUjnOfNrOu8ZxM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E7Kx/4dPw9YkhJFafLtstO/1RnIx2YqiYLLIfAOMGDcwKlOJ1NNX0kJ2UQW0SuYnaNOsxCXc4SfjYO9Jp7krkpKlI7P9Jz1VUGIOxs3ESgEbUJTcSB7li+1EiikjBZDM6QJUNxvqDlVTvwbmBCl68vRPart0d4kyi7UJlEuvsSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b=UjxlzCvl; arc=none smtp.client-ip=51.159.59.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b="UjxlzCvl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1785123775; bh=kZd37MsQOqgmjeqvv1f4EfGYwFgMPzGEExTIeEBcvhM=;
	h=From:Message-ID:From;
	b=UjxlzCvlsjH46GP0jB1c2yNqZgo3V8c0qEFsj9AaQdJD1RTftnm0Cay8e6WRfIEyR
	 I19sF2k2Z2xa0KXEL5XXAEn6GFyWFUizOo55ETgsJ3f0wpGU2glFVliwtUd6rJmpZ9
	 hIlB4nsl4/i3VPyxWs68XF4asbq2SbgfujeYqS7o=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id E5138C0A6E;
	Mon, 27 Jul 2026 05:42:54 +0200 (CEST)
Date: Mon, 27 Jul 2026 05:42:54 +0200
From: Willy Tarreau <w@1wt.eu>
To: Ammar Faizi <ammarfaizi2@openresty.com>
Cc: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kselftest Mailing List <linux-kselftest@vger.kernel.org>,
        LLVM Mailing List <llvm@lists.linux.dev>,
        Yichun Zhang <yichun@openresty.com>,
        Alviro Iskandar Setiawan <alviro.iskandar@gnuweeb.org>,
        Shuah Khan <shuah@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>, gwml@gnuweeb.org
Subject: Re: [PATCH 1/4] tools/nolibc: evaluate syscall() arguments before
 the arch macros
Message-ID: <ambTvkneo9sf0lij@1wt.eu>
References: <20260726101306.3772237-1-ammarfaizi2@openresty.com>
 <20260726101306.3772237-2-ammarfaizi2@openresty.com>
 <dca5a72c-3186-4f94-bd94-aab127dec64e@t-8ch.de>
 <CA+KFgX76tbg_LTh6-PO-zrmhWtrjP4y3u47s1wximVFUQKq=uA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+KFgX76tbg_LTh6-PO-zrmhWtrjP4y3u47s1wximVFUQKq=uA@mail.gmail.com>

On Mon, Jul 27, 2026 at 08:21:45AM +0700, Ammar Faizi wrote:
> On Mon, Jul 27, 2026 at 3:16 AM Thomas Weißschuh wrote:
> > __auto_type is only supported from GCC 4.9. I think this is old enough,
> > but it should be mentioned at least.
> > We really should have a documented policy for that.
> 
> I suggest using the Linux kernel's minimal requirements. It's GCC 8.1
> or Clang 17.0.1. Ref: https://docs.kernel.org/process/changes.html
> 
> What do you think?

Since it's userland (i.e. not building with the kernel's compiler), and
often used for ease of porting boot-time tools in headless or embedded
environments, I'd really like that we keep compatibility for as long as
possible with oldest compilers that continue to work. Last time I checked,
it was still working fine with gcc-4.4. I still have my 4.7.4-based
toolchains that I regularly use for troublehooting and compatibility
checks (and faster builds), I can recheck. We should not require that to
be verified by contributors (too painful), however, noting "still known
to build fine with version X" is helpful. And the day we discover that
this promise has been broken for a year or so, we know we can safely
update it. I can recheck ASAP.

> Should this be documented in nolibc.h as a comment?

It can indeed be sufficient to add a line to the first comment block.
However I'm thinking that we would benefit from adding a larger README
in the sub-dir for contributors that explains some of the traps we often
have to mention.

thanks,
Willy
