Received: from mta1.formilux.org (mta1.formilux.org [51.159.59.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB14A3AA50B;
	Sun, 18 Oct 2026 04:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.159.59.229
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792298257; cv=none; b=mF9Ido1P2oQxey6fAE3vTh3iNvVv3Z1WwGazj9KEI7z4kHyj/lhbBUdXbGL+OjQDG/74B8PPY7gryprwD/xxTcdvTqoUNusV5gYUWNLS0OYlDcKULFCia9ACyhAqYwWAkq7ALRiDWO+nqWkFGpR9Rn6dxmZU1G1Nj/7sfDTaOGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792298257; c=relaxed/simple;
	bh=autnuPHOUEmK0MCx2tmWqjD0c1QfwKhKEsoSIIPc23k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TaIGRyPXHnS56BOXOhepvTlkbjQuE0v1lppnILuw7hLgb/PPV1ey4E1U+oRp9CbCVjiSfTmxPZCrvYzEmaVswU/Zik3cJBBohIAh5J0XIhHLCxpdtXyD7S59IDdayRNdN5KOPX3XNQ0OtAp3W/q8P1QwlCh1ikDGx/DY3A7HgL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b=uMvyUN+6; arc=none smtp.client-ip=51.159.59.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b="uMvyUN+6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1792298246; bh=uRVHLdJodJ1SLZBxB+Hw4J3fIGyM5Uk23rq28dz8w44=;
	h=From:Message-ID:From;
	b=uMvyUN+6rV+hcbGaJ9Pda4hX8RnvQfoU3fIp6HtKtighRO7jHWu1fq9fqoihK7Ha/
	 wAhqJWFX2St53Nre+bvfGkKBNDpyULRltXx/N/k72z8J2fimy6UsDNkpGMUijyAlUu
	 fnlUJMeaTFk/ltNfT0d0p5uItqBXlN6wVJ58mRqg=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id 5C3C3C093D;
	Sun, 18 Oct 2026 06:37:26 +0200 (CEST)
Date: Sun, 18 Oct 2026 06:37:25 +0200
From: Willy Tarreau <w@1wt.eu>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Shuah Khan <shuah@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>, linux-kselftest@vger.kernel.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] selftests/nolibc: explicitly disable position
 independent executables
Message-ID: <atRNBTorEV-yt6kL@1wt.eu>
References: <20261018-nolibc-unused-arguments-v1-1-6cba71555fe8@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261018-nolibc-unused-arguments-v1-1-6cba71555fe8@weissschuh.net>

Hi Thomas,

On Sun, Oct 18, 2026 at 12:02:18AM +0200, Thomas Weiﬂschuh wrote:
> nolibc does not support position independent executables (PIE).
> However a toolchain might generate these by default depending on various
> circumstances. Recently clang started to do so for hexagon. See LLVM
> commit ab43cb8520c0 ("[Hexagon] Pass -pie to linker when PIE is the
> toolchain default (#189723)").
> 
> As clang can also be configured to create PIE for other architectures by
> default disable it globally. While we are at it also pass the argument
> for GCC to be on the safe side.
> 
> If PIE is disabled already, clang will generate
> -Wunused-command-line-argument warnings. Inhibit those.

Interesting, I didn't know about these options.

> Signed-off-by: Thomas Weiﬂschuh <linux@weissschuh.net>
> ---
> I ran into this when testing the upcoming PR to Linus.
> The referenced LLVM commit was released between when I wrote the hexagon
> support and today. My plan is to fold this patch into the PR.

Sounds good.

Reviewed-by: Willy Tarreau <w@1wt.eu>

Willy

> ---
>  tools/testing/selftests/nolibc/Makefile.include | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tools/testing/selftests/nolibc/Makefile.include b/tools/testing/selftests/nolibc/Makefile.include
> index ea520eac64a6..14e51c821d8a 100644
> --- a/tools/testing/selftests/nolibc/Makefile.include
> +++ b/tools/testing/selftests/nolibc/Makefile.include
> @@ -8,6 +8,7 @@ _CFLAGS_SANITIZER ?= $(call cc-option,-fsanitize=undefined -fsanitize-trap=all)
>  CFLAGS_NOLIBC_TEST  ?= -Os -fno-ident -fno-asynchronous-unwind-tables -std=c89 -ggdb \
>  		-W -Wall -Wextra -Wundef -Wwrite-strings \
>  		$(call cc-option,-fno-stack-protector) $(call cc-option,-Wmissing-prototypes) \
> +	        $(call cc-option,--start-no-unused-arguments) -no-pie $(call cc-option,--end-no-unused-arguments) \
>  		$(_CFLAGS_STACKPROTECTOR) $(_CFLAGS_SANITIZER)
>  
>  NOLIBC_TEST_SOURCES := nolibc-test.c nolibc-test-linkage.c nolibc-test-ignore-errno.c
> 
> ---
> base-commit: f9532b372e415e8198287ce010efa22f337857b5
> change-id: 20261017-nolibc-unused-arguments-b504fc061c46
> 
> Best regards,
> --  
> Thomas Weiﬂschuh <linux@weissschuh.net>
