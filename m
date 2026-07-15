Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90D1F2ED870;
	Wed, 15 Jul 2026 16:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784131392; cv=none; b=Zoet7HM1wIDIdMF6VsMAayoB6EA2LShLHxcueYLtx029rPacbBUtF/KFeTyRGCbgh+y2aeuibA0vsC6Qd2KHrRDZ4C0djxfl+chO6G9z3nA2zLEo5nB9X6wFnfIzjWd35dB0wqod0NLW5h7Ikv7j9yPx5WVuSaWD1Jc7pX62HAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784131392; c=relaxed/simple;
	bh=8b7qsmXxnW91dNcuGNzXlqxsWLCWfqu2R3Anp8PZC7s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XKQ2Sf4yUUR86OgNnC6tB6+zxtqTT1B38Vs8b0fawuWKVqN3VV2LGGNf2QqYKQz8apQTeDTIi7+Q2FQeyBTmozAwNRfMV68OoznHq8dDavaYrYjs2fhpGv4miGSF6HpKsz9TwJoOdbQjlMHAIcpN9fTfLoapGPXG4Pp8OOSUg1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jLIBzgLE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jLIBzgLE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A8931F000E9;
	Wed, 15 Jul 2026 16:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784131391;
	bh=ZHRySce1DX+MQ4tELLMpD5Y/ibRTeQsmyUSPCPd64Kg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jLIBzgLElQfSK8tCiIynsgCXvR+lTL2RG9w11+UjXajcRddrvp2W14wF0z8O+8WbT
	 JCwR1x11SN1JpWnhIWzQQ92Q608ClvEMjcS6o+2F5UEW1aKYL5HQ9fIhWKQGdOlK+U
	 u6oJJiC4fRNtRnFcJquXI12tEnINkWBoxUgzvng1bt9DmuNm5NOUzqvL7NUg7TagJZ
	 bM4uH727xKLbZheSQNKuW+Ij5/5xUwbK7TJXRFXZOvAvDeyOfNJROXknblc0h2CMkd
	 FT0H2CvNvGbuq0i04N5IuzvAA1eNayA2t9O3dyNdWjCZ65aaUcRPdL3Me6dkzmHOuM
	 tl5PWNTUP8E8w==
Date: Wed, 15 Jul 2026 09:03:10 -0700
From: Kees Cook <kees@kernel.org>
To: David Matlack <dmatlack@google.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	llvm@lists.linux.dev, Andy Lutomirski <luto@amacapital.net>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	=?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Shuah Khan <shuah@kernel.org>, Will Drewry <wad@chromium.org>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Aaron Lewis <aaronlewis@google.com>,
	Alex Williamson <alex@shazbot.org>
Subject: Re: [PATCH v3] selftests: harness: Mark test fixture objects
 __maybe_unused
Message-ID: <202607150902.F17F8DE5@keescook>
References: <20260706183154.2660394-1-dmatlack@google.com>
 <CALzav=f3KaNQd2NgCTxU=VSXWujV+qjyQuNJp_hy1-U36RMPpg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALzav=f3KaNQd2NgCTxU=VSXWujV+qjyQuNJp_hy1-U36RMPpg@mail.gmail.com>

On Tue, Jul 14, 2026 at 09:24:36AM -0700, David Matlack wrote:
> On Mon, Jul 6, 2026 at 11:32 AM David Matlack <dmatlack@google.com> wrote:
> >
> > Mark _##fixture_name##_##test_name##_object __maybe_unused since it may
> > not ever be read. This pointer is only read in XFAIL_ADD(), which tests
> > are not required to use.
> >
> > clang made a change to -Wunused-but-set-variable (split out into its own
> > subwarning, -Wunused-but-set-global) that causes this warning to be
> > emitted for various selftests and can be upgraded to an error in
> > selftest that set -Werror.
> >
> > VFIO selftests have been broken since commit ff556bd98348 ("vfio:
> > selftests: Add -Wall and -Werror to the Makefile"), and the net
> > selftests builds have been noisy due to -Wall.
> >
> > Fixes: 24cf65a62266 ("selftests/harness: Share _metadata between forked processes")
> > Reported-by: Kuniyuki Iwashima <kuniyu@google.com>
> > Reported-by: Aaron Lewis <aaronlewis@google.com>
> > Reviewed-by: Alex Williamson <alex@shazbot.org>
> > Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
> > Signed-off-by: David Matlack <dmatlack@google.com>
> 
> Kees and Shuah, is it ok if Alex takes this through the VFIO tree? [1]
> This fixes a bug exposed by recent VFIO selftests commit ff556bd98348
> ("vfio: selftests: Add -Wall and -Werror to the Makefile").
> 
> [1] https://lore.kernel.org/linux-kselftest/20260630165244.0d013bbc@shazbot.org/

Yeah, please do. This has ample review. :)

-- 
Kees Cook
