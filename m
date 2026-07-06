Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E19E134F24C;
	Mon,  6 Jul 2026 21:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783373780; cv=none; b=orwTeXSW+RKVSlSf2G+ntQdXe2gFXy8bKi7RpI3zEum96s0v4iC34YxNJl/OxtT9QMiJqz5Pt2xMTNBfemqdPhCXUA9offT60V5suX8DIAhuZT03L3A4LAXFWv6WhXfVMjOdae5pasEjEi/mRX40vqJ4lziv5EGlCI7vqSgr+w8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783373780; c=relaxed/simple;
	bh=/IcrSD/ek0eAeDaqE5BNLWo7Wkp0E3UNcLVAny8pAAM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sbj7lrubp5Gvw/bxurKJ7jxtAba9+OQY743PJQb+c6GzryW/ccJXYpXvp8urCi8JSrET0utR0SAP5tzopv5cQEBUb55syeilHSc7r0LnNmRmvREDFXO34tHfMb4TubTias8mE/fJOJVp5Gk4qlUIbZIMHYku5Y+Y800aQQk4kco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gua0NXjk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gua0NXjk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 742181F000E9;
	Mon,  6 Jul 2026 21:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783373778;
	bh=zV3k7sAirvaHvSIPIJ9S4XBKV3Qy8N2QHfWEDaaFzVA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gua0NXjkRRSbGB3ZVjf6QVRPgzLIMo54OtTNat8nb4/kVmCPf3UFu9t7+ejUMDKpD
	 0ByCdHm2IfgX0ZmJ/emMW7bSzD8jFuyiFOjDrtES2frfldijf9mdentWU4feauhSRO
	 SiusBm52bkvkcnnOsiQxxICuVL7R/DBIl3GvU/PKGz8HrXG4/2DO2KN75FOmkzF1RZ
	 s9DxUX7ST0VXzDSemKFqYFpOLReZd6y+Hs22Tsu6zdaJPtGzEmohR1V6cwY/Rx43S/
	 Hnm4kALA+xAKxwKNKD1SvZecNMW/a1VCewpQJsrvJgm6Kw3SokviDbtilL6fY7Kz7u
	 SEZIprr+mUJ4A==
Date: Mon, 6 Jul 2026 14:36:13 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: David Matlack <dmatlack@google.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	llvm@lists.linux.dev, Andy Lutomirski <luto@amacapital.net>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>,
	=?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Shuah Khan <shuah@kernel.org>, Will Drewry <wad@chromium.org>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Aaron Lewis <aaronlewis@google.com>,
	Alex Williamson <alex@shazbot.org>
Subject: Re: [PATCH v3] selftests: harness: Mark test fixture objects
 __maybe_unused
Message-ID: <20260706213613.GC73349@ax162>
References: <20260706183154.2660394-1-dmatlack@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260706183154.2660394-1-dmatlack@google.com>

On Mon, Jul 06, 2026 at 06:31:54PM +0000, David Matlack wrote:
> Mark _##fixture_name##_##test_name##_object __maybe_unused since it may
> not ever be read. This pointer is only read in XFAIL_ADD(), which tests
> are not required to use.
> 
> clang made a change to -Wunused-but-set-variable (split out into its own
> subwarning, -Wunused-but-set-global) that causes this warning to be
> emitted for various selftests and can be upgraded to an error in
> selftest that set -Werror.
> 
> VFIO selftests have been broken since commit ff556bd98348 ("vfio:
> selftests: Add -Wall and -Werror to the Makefile"), and the net
> selftests builds have been noisy due to -Wall.
> 
> Fixes: 24cf65a62266 ("selftests/harness: Share _metadata between forked processes")
> Reported-by: Kuniyuki Iwashima <kuniyu@google.com>
> Reported-by: Aaron Lewis <aaronlewis@google.com>
> Reviewed-by: Alex Williamson <alex@shazbot.org>
> Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
> Signed-off-by: David Matlack <dmatlack@google.com>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
> v3:
>  - Pick up Kuniyuki's Reviewed-by tag.
>  - Pick up Alex's Reviewed-by tag from v1.
>  - Fix commit description accuracy (Kuniyuki)
> 
> v2: https://lore.kernel.org/linux-kselftest/20260706175228.2468730-1-dmatlack@google.com/
> 
> v1: https://lore.kernel.org/linux-kselftest/20260630213341.1664345-1-dmatlack@google.com/
> 
> Note: The fixes tag is commit 24cf65a62266 ("selftests/harness: Share
> _metadata between forked processes"), which refactored TEST_F to share
> test metadata across processes using mmap and convereted the test
> fixture object from a static struct to a static pointer. Prior to commit
> 24cf65a62266 the static struct was always used once (the address of it
> was taken and passed to __register_test()), but after the static pointer
> was always assigned but potentially never read.
> 
> Cc: Nathan Chancellor <nathan@kernel.org>
> 
>  tools/testing/selftests/kselftest_harness.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/kselftest_harness.h b/tools/testing/selftests/kselftest_harness.h
> index 261e4df94d9d..29a19bc87084 100644
> --- a/tools/testing/selftests/kselftest_harness.h
> +++ b/tools/testing/selftests/kselftest_harness.h
> @@ -467,7 +467,7 @@ static inline void __kselftest_memset_safe(void *s, int c, size_t n)
>  				!__atomic_test_and_set(_metadata->no_teardown, __ATOMIC_RELAXED)) \
>  			fixture_name##_teardown(_metadata, self, variant); \
>  	} \
> -	static struct __test_metadata *_##fixture_name##_##test_name##_object; \
> +	static struct __test_metadata *_##fixture_name##_##test_name##_object __maybe_unused; \
>  	static void __attribute__((constructor(KSELFTEST_PRIO_TEST))) \
>  			_register_##fixture_name##_##test_name(void) \
>  	{ \
> 
> base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
> -- 
> 2.55.0.rc2.803.g1fd1e6609c-goog
> 

-- 
Cheers,
Nathan
