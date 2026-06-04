Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B5722F7F00
	for <linux-kselftest@vger.kernel.org>; Thu,  4 Jun 2026 22:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780610758; cv=none; b=Vg8btDK7TFmtC4sP4e6oukWW77SxS/i9r3wxTiAhmwDWgC8wLj9HkFSnG74/zGTCvPBiDiNTrbsqBg3ciTCZZee6JtxrnVBGfnQ+HvoRGh+92b4wXYddaGJpbeI5FRDpih3FwmRigpWqIIpdHdpGtLqvPk87OO5/BOyFiJZ4cXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780610758; c=relaxed/simple;
	bh=nXhHh/pGOI9rE0nMJVROQ5vq8c4fkI8n0N/AJuztcZw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rDaGLXhCYzyX4/viPIdYt/7iZ+B/m3hkznU77qPnMpxEz/UYpntw6y3cMBP+OLW+q+qDPYRClQ4Yzah9kos11NdRwywOuSorCMtrC75Wt2F2y2ApCW1oQwKvHbfjLrDsqC9tAIdo2EJ7dOiWvo3zmJcr3GHl7vVjo3MkKrIRK3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l0r70Opl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l0r70Opl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 929761F00893;
	Thu,  4 Jun 2026 22:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780610756;
	bh=Ldsl4/N6RsLmg8QiM9DUc+MdKQHVb1oeZd08FXXFOzw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=l0r70Opl4/BG285G2ge2YZd4Ch7f/M0h0jY45qJxtQCo81OIfXevyXFor7c+TMVo2
	 xBMZxiCLs3iAgIMXJlhZn9wwxE7n7E5cBOUTjgRjqQ4eQ5AxhXFJx71nAM83SuADdv
	 /SVEBmjFkKbaeEJskumvUFiO/fb9m6Z2DjG1XNbtW5Fj+eS+9ZVCXP62mpg4z3dsIm
	 jRl4YwpWYtiLzjxaafI/ttMw7fLrxe64llXi8apkCMcYWh7+CgojmgWbn+g/PNUp/0
	 ejTzlUbjISpK1wAYTOZVcOYjasGqRNdhGmnl/S6PIJ5E47sE2V9nb4RD8ChVQ0mTcz
	 k4GGJ9gp/R1Mg==
Date: Thu, 4 Jun 2026 15:05:53 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Kuniyuki Iwashima <kuniyu@google.com>
Cc: Shuah Khan <shuah@kernel.org>, Kuniyuki Iwashima <kuni1840@gmail.com>,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH kselftest] selftests: harness: Add __maybe_unused to
 _##fixture_name##_##test_name##_object.
Message-ID: <20260604220553.GA3936720@ax162>
References: <20260530054722.271157-1-kuniyu@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260530054722.271157-1-kuniyu@google.com>

On Sat, May 30, 2026 at 05:47:20AM +0000, Kuniyuki Iwashima wrote:
> tools/testing/selftests/net/Makefile adds -Wall to CFLAGS.
> 
> With clang supporting -Wunused-but-set-global, building kselftest
> gets too noisy:
> 
>   bind_timewait.c:76:1: warning: variable '_bind_timewait_1_object' set but not used [-Wunused-but-set-global]
>      76 | TEST_F(bind_timewait, 1)
>         | ^
>   ../kselftest_harness.h:398:2: note: expanded from macro 'TEST_F'
>     398 |         __TEST_F_IMPL(fixture_name, test_name, -1, TEST_TIMEOUT_DEFAULT)
>         |         ^
>   ../kselftest_harness.h:470:33: note: expanded from macro '__TEST_F_IMPL'
>     470 |         static struct __test_metadata *_##fixture_name##_##test_name##_object; \
>         |                                        ^
>   <scratch space>:155:1: note: expanded from here
>     155 | _bind_timewait_1_object
>         | ^
> 
> The global variable _##fixture_name##_##test_name##_object is not
> used if a test does not use XFAIL_ADD().
> 
> Let's add __maybe_unused to it.
> 
> Link: https://github.com/llvm/llvm-project/commit/3e011457055bd3868bd05cf80bc1a4482777809b
> Signed-off-by: Kuniyuki Iwashima <kuniyu@google.com>

Seems reasonable.

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  tools/testing/selftests/kselftest_harness.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/kselftest_harness.h b/tools/testing/selftests/kselftest_harness.h
> index cfdce9cd252e..a2e104f7fb52 100644
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
> -- 
> 2.54.0.823.g6e5bcc1fc9-goog
> 

-- 
Cheers,
Nathan
