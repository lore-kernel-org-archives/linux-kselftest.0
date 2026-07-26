Received: from mta1.formilux.org (mta1.formilux.org [51.159.59.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2BFC3BB687;
	Sun, 26 Jul 2026 16:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.159.59.229
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785081684; cv=none; b=ZSugmos0l67VQWHh6RA/baWQoUOuNfhSAQW10Meulwf8x6327A1LSWRtcGT4WxB14JpocnqMlm64ogYI8zZojukzJIvOglqmmvo34McL2FbAHpDx48e04gC6p8T3UqcN2RSpn2F4PEKcWQMmltTxDW+PHH4orxNzN8CjLenSm2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785081684; c=relaxed/simple;
	bh=qc8TI7coDHDMk6rrvcGxqI4PK/ClhXefLf/6sg/ahJw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JtVuTzWYwdm9NVR9zx8qjLS1j1PHNfpHh6DfB0UjhPmOmpUspUkXsxLfAuLTU/aGzYg0YzP+KYvWZ0+aueOB1APEYv4CCD4RC/cmayJ41I/aYuTgj1DeORbLx7ujVHFeSEOOGnPaEBFX5Mpd+M5GRBrILju9AU1z3RRVAd0W6+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b=RcqlGY0a; arc=none smtp.client-ip=51.159.59.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b="RcqlGY0a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1785081672; bh=FjX+HZlxW+WsZ2V2ep3yP0QJydoexSzmKp0lKAEIC/4=;
	h=From:Message-ID:From;
	b=RcqlGY0aok5ZCGzOZcodOlpFs8c3UU6srA9sF7UB/uQmZycm8Ruxr/62oiF70kV9I
	 7KmhruYAofFx93JyYTAqD6+ah+8gAocaB3WRmDfzG/d4hy7SNOTLaWQjjvqYV/GYSI
	 YPfrYq6zmb9+D1KNrLkvjFbsaACgVVWsZN11ni1M=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id 730DBC0A72;
	Sun, 26 Jul 2026 18:01:12 +0200 (CEST)
Date: Sun, 26 Jul 2026 18:01:11 +0200
From: Willy Tarreau <w@1wt.eu>
To: David Laight <david.laight.linux@gmail.com>
Cc: Ammar Faizi <ammarfaizi2@openresty.com>,
        Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kselftest Mailing List <linux-kselftest@vger.kernel.org>,
        LLVM Mailing List <llvm@lists.linux.dev>,
        Yichun Zhang <yichun@openresty.com>,
        Alviro Iskandar Setiawan <alviro.iskandar@gnuweeb.org>,
        Shuah Khan <shuah@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>, gwml@gnuweeb.org
Subject: Re: [PATCH 2/4] tools/nolibc: stdlib: avoid signed overflow in abs()
 and friends
Message-ID: <amYvRyLKZzEsFyq9@1wt.eu>
References: <20260726101306.3772237-1-ammarfaizi2@openresty.com>
 <20260726101306.3772237-3-ammarfaizi2@openresty.com>
 <20260726151334.4c1ec6f1@pumpkin>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260726151334.4c1ec6f1@pumpkin>

On Sun, Jul 26, 2026 at 03:13:34PM +0100, David Laight wrote:
> On Sun, 26 Jul 2026 17:13:03 +0700
> Ammar Faizi <ammarfaizi2@openresty.com> wrote:
> 
> > Negating the smallest negative value of a signed type overflows, which
> > is undefined behavior. The selftests are built with:
> > 
> >     -fsanitize=undefined -fsanitize-trap=all
> > 
> > so a caller passing INT_MIN does not merely get an unspecified answer,
> > it dies (on both x86-64 and i386):
> > 
> >     A simple test program:
> > 
> >       printf("x = %d\n", abs(INT_MIN));
> > 
> >     $ ./ab
> >     Illegal instruction (core dumped)
> > 
> >     (gdb) bt
> >     #0  0x0000000000401009 in main ()
> >     (gdb) x/6i main
> >        0x401000 <main>:     mov    $0x80000000,%eax
> >        0x401005 <main+5>:   neg    %eax
> >        0x401007 <main+7>:   jno    0x40100b <main+11>
> >     => 0x401009 <main+9>:   ud2  
> >        0x40100b <main+11>:  push   %rax
> >        0x40100c <main+12>:  mov    $0x80000000,%esi
> > 
> > Negate in the corresponding unsigned type instead. The value still
> > cannot be represented in the result type, so the minimum is returned
> > unchanged.
> > 
> > Cc: Yichun Zhang <yichun@openresty.com>
> > Cc: Alviro Iskandar Setiawan <alviro.iskandar@gnuweeb.org>
> > Fixes: bf5e8a78bede ("tools/nolibc: add abs() and friends")
> > Signed-off-by: Ammar Faizi <ammarfaizi2@openresty.com>
> > ---
> >  tools/include/nolibc/stdlib.h | 12 +++++++++---
> >  1 file changed, 9 insertions(+), 3 deletions(-)
> > 
> > diff --git a/tools/include/nolibc/stdlib.h b/tools/include/nolibc/stdlib.h
> > index 1816c2368b68..8d86044f759f 100644
> > --- a/tools/include/nolibc/stdlib.h
> > +++ b/tools/include/nolibc/stdlib.h
> > @@ -32,22 +32,28 @@ static __attribute__((unused)) char itoa_buffer[21];
> >   * As much as possible, please keep functions alphabetically sorted.
> >   */
> >  
> > +/*
> > + * The absolute value of the smallest negative value is not representable in
> > + * the result type. Negate in the unsigned type so that the overflow is
> > + * defined and return it unchanged, like the other libcs do.
> > + */
> > +
> >  static __inline__
> >  int abs(int j)
> >  {
> > -	return j >= 0 ? j : -j;
> > +	return j >= 0 ? j : (int)-(unsigned int)j;
> 
> An alternative expression is -(j + 1) - 1
> gcc (and I think clang) optimise it to just -j.

This one would give -j -2, but ~(j - 1) would work, just like
(~j + 1). However here the benefit of the casts in Ammar's
version is that it's obvious that it's only playing with same
size casts with no extra operation.

Willy
