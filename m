Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6770121146C;
	Wed,  1 Jul 2026 02:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782874153; cv=none; b=gLyE+faMqSFCl5RVx3rb9gZ2cqxMg45P277O3HYV5q9Kad+EHws0mbhBXiE0xzCEk8kc4/EKODcXuzP6ow4ugws3i4uVGnFU2fkkUOGMU8muiC8KEkikALgZblFlIXJKyLRqmGwWBYtinybiPrand6CME17qWHXT9Q1sSqcdm/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782874153; c=relaxed/simple;
	bh=UPRkFFDIytKhiAo4YASS+5yY57jT9Fyvkgwy99npinM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QznQ0+YvWwCP0UiYwotVSSFKaQVeG0ij19/6yM2TGiN850AEn21rrriGf0yYIifVDiwEgrxC2MmUrb1rKXn+UkpgJPp8Wo2ISaE8XQPFXJ69ZuOST4cRlmhxRi6xr2fH8KUeBK+Z8guM/8HsRdD5at1A9Q22X6b0LWvESQdNJXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GeXTDBai; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GeXTDBai"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E1F31F000E9;
	Wed,  1 Jul 2026 02:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782874152;
	bh=ss0B2dfeVCya1fIk06h1t5EC9bgfqqu92uWC2x2lxqo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GeXTDBaiwutHbMxdlutTqQqfhchXsdzViQ3JRfQV9fLZdPx/wpiVcoH3SpvDd72Fy
	 +8Oh360vApiUjuavz4nNKeKthabzzTgGiubg9IIpX59sHa6XJIPt/a49wOb8gWQ+0p
	 j++z1Q2aoqcpm/GPR7HO29Cm5ESxd2EZSGX8VqHHJOCdWrvskmS23CSopCc9Dh3gPy
	 ejMjHEwm2NiLni6Jjwdzn2tuuBsouFyWCJvH9ODbmpU1HSiZBp626Got/oCzOl3H2r
	 V/gbHn+U6/ly4pwwWqqGfQkmXaL5TEFxEqAv2cEnqbesaTlICPUCgWD8LoM5QkZjWH
	 vHjavtIyKk2zA==
Date: Tue, 30 Jun 2026 19:49:06 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Alex Williamson <alex@shazbot.org>
Cc: David Matlack <dmatlack@google.com>, Kees Cook <kees@kernel.org>,
	Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, llvm@lists.linux.dev,
	Andy Lutomirski <luto@amacapital.net>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Vipin Sharma <vipinsh@google.com>, Will Drewry <wad@chromium.org>,
	Aaron Lewis <aaronlewis@google.com>
Subject: Re: [PATCH] selftests: harness: Mark test fixture objects
 __maybe_unused
Message-ID: <20260701024906.GA3960633@ax162>
References: <20260630213341.1664345-1-dmatlack@google.com>
 <20260630165244.0d013bbc@shazbot.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260630165244.0d013bbc@shazbot.org>

On Tue, Jun 30, 2026 at 04:52:44PM -0600, Alex Williamson wrote:
> On Tue, 30 Jun 2026 21:33:41 +0000
> David Matlack <dmatlack@google.com> wrote:
> 
> > Mark test fixture objects __maybe_unused since they will not be used
> > when there are fixture variants (the variants will be used instead).
> > 
> > This fixes the VFIO selftest build with clang and -Werror:
> > 
> > vfio_dma_mapping_mmio_test.c:106:1: error: variable '_vfio_dma_mapping_mmio_test_map_full_bar_object' set but not used [-Werror,-Wunused-but-set-global]
> >   106 | TEST_F(vfio_dma_mapping_mmio_test, map_full_bar)
> >       | ^
> > ./../kselftest_harness.h:398:2: note: expanded from macro 'TEST_F'
> >   398 |         __TEST_F_IMPL(fixture_name, test_name, -1, TEST_TIMEOUT_DEFAULT)
> >       |         ^
> > ./../kselftest_harness.h:470:33: note: expanded from macro '__TEST_F_IMPL'
> >   470 |         static struct __test_metadata *_##fixture_name##_##test_name##_object; \
> >       |
> > 
> > Fixes: ff556bd98348 ("vfio: selftests: Add -Wall and -Werror to the Makefile")
> > Reported-by: Aaron Lewis <aaronlewis@google.com>
> > Signed-off-by: David Matlack <dmatlack@google.com>
> > ---
> >  tools/testing/selftests/kselftest_harness.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/tools/testing/selftests/kselftest_harness.h b/tools/testing/selftests/kselftest_harness.h
> > index 261e4df94d9d..29a19bc87084 100644
> > --- a/tools/testing/selftests/kselftest_harness.h
> > +++ b/tools/testing/selftests/kselftest_harness.h
> > @@ -467,7 +467,7 @@ static inline void __kselftest_memset_safe(void *s, int c, size_t n)
> >  				!__atomic_test_and_set(_metadata->no_teardown, __ATOMIC_RELAXED)) \
> >  			fixture_name##_teardown(_metadata, self, variant); \
> >  	} \
> > -	static struct __test_metadata *_##fixture_name##_##test_name##_object; \
> > +	static struct __test_metadata *_##fixture_name##_##test_name##_object __maybe_unused; \
> >  	static void __attribute__((constructor(KSELFTEST_PRIO_TEST))) \
> >  			_register_##fixture_name##_##test_name(void) \
> >  	{ \
> > 
> > base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
> 
> Reviewed-by: Alex Williamson <alex@shazbot.org>
> 
> Kees/Shuah, I can take this through the vfio tree if you prefer, it
> fixes a commit that entered through vfio selftests.  Thanks,

Not that it is a big deal or matters all too much but I do not think
this fixes tag is entirely accurate. The blamed commit may have
introduced the build warning/error in the VFIO code but that same
warning could occur in any selftest code, as evidenced by the exact same
patch submitted a month ago:

  https://lore.kernel.org/20260530054722.271157-1-kuniyu@google.com/

clang made a change to -Wunused-but-set-variable (split out into its own
subwarning, -Wunused-but-set-global) that exposes this. Personally, I
find that change explains the problem better but this one makes it clear
that it can become fatal with -Werror.

-- 
Cheers,
Nathan
