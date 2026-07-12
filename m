Received: from mta1.formilux.org (mta1.formilux.org [51.159.59.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E21133148D8;
	Sun, 12 Jul 2026 09:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.159.59.229
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783849439; cv=none; b=FgWo576Czo6a3YGOv6W7sXUsSj2KVT/rec3TNKYKhyK7hWYODTfU0qG3szOB1feD8rP6z2phUyVGmSnWzFV+hR/lzaNTivso3X1oQRDfDzFWmyRb7HT3PNkpaybZY1SPhtgc1N2Ho1VtYFKUPTZfwo/A15yxjaempv9Y3Y2EJMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783849439; c=relaxed/simple;
	bh=MxoCFw5rMV/jhXspb1VL0pHvwf8Qvv76lJnMPcTAjRk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E5/Iw8tIYThajq4EWVsWiwrlkbOUKGq8/uSw0z0MM5tRTwcw4qEd6GivLuQ2th1ZfSXgyp0D7VYPOabDGqVZIzxB/cjujLi20qLJnqAuiH9VoalHQN6PCqi0Chi5tAnSbt3X3lqf1naVe7S2AFwml/ws5NsQj1xcT9jx1jIM3cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b=ZfttTx9C; arc=none smtp.client-ip=51.159.59.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b="ZfttTx9C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1783849038; bh=iF+hC7W+Ah7WFeVclAGlVeUrk52rQXvAJGy+4B7TOS0=;
	h=From:Message-ID:From;
	b=ZfttTx9CmNNXndRdUcolY5TUqm/RJHuI/HHgTS9bILEE85L4k1gmHamuTBBk6Z5/a
	 yELEFPl4ENWiZNzVBU/B4l0erdgWt5Q0P3a57L5Loqvg4ouLr9E+OnqKmIKztdm2nu
	 lpELemj+vqWlQD4jBmEZAKp7w40m/ZIXmgaCcx88=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id 857A6C0A38;
	Sun, 12 Jul 2026 11:37:18 +0200 (CEST)
Date: Sun, 12 Jul 2026 11:37:18 +0200
From: Willy Tarreau <w@1wt.eu>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/nolibc: add debug information
Message-ID: <alNgTmkDHpYHVCVM@1wt.eu>
References: <20260707-nolibc-debug-v1-1-31619ec94bbd@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260707-nolibc-debug-v1-1-31619ec94bbd@weissschuh.net>

Hi Thomas,

On Tue, Jul 07, 2026 at 06:42:30PM +0200, Thomas Weiﬂschuh wrote:
> When working on nolibc, debug information is very valuable.
> I find myself adding this flag in many patchsets.
> 
> Enable debug information unconditionally, as there is no downside to it.

Indeed, I would have thought we already had it.

> Signed-off-by: Thomas Weiﬂschuh <linux@weissschuh.net>

Acked-by: Willy Tarreau <w@1wt.eu>

Thanks!
Willy

> ---
>  tools/testing/selftests/nolibc/Makefile.include | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/nolibc/Makefile.include b/tools/testing/selftests/nolibc/Makefile.include
> index c30ca3a9ef14..ea520eac64a6 100644
> --- a/tools/testing/selftests/nolibc/Makefile.include
> +++ b/tools/testing/selftests/nolibc/Makefile.include
> @@ -5,7 +5,7 @@ _CFLAGS_STACKPROTECTOR ?= $(call try-run, \
>  	echo 'void foo(void) {}' | $(CC) -x c - -o - -S $(CLANG_CROSS_FLAGS) $(__CFLAGS_STACKPROTECTOR) | grep -q __stack_chk_guard, \
>  	$(__CFLAGS_STACKPROTECTOR))
>  _CFLAGS_SANITIZER ?= $(call cc-option,-fsanitize=undefined -fsanitize-trap=all)
> -CFLAGS_NOLIBC_TEST  ?= -Os -fno-ident -fno-asynchronous-unwind-tables -std=c89 \
> +CFLAGS_NOLIBC_TEST  ?= -Os -fno-ident -fno-asynchronous-unwind-tables -std=c89 -ggdb \
>  		-W -Wall -Wextra -Wundef -Wwrite-strings \
>  		$(call cc-option,-fno-stack-protector) $(call cc-option,-Wmissing-prototypes) \
>  		$(_CFLAGS_STACKPROTECTOR) $(_CFLAGS_SANITIZER)
> 
> ---
> base-commit: a3b2181459a2c74c03ddbad585f884eefc8ff8ff
> change-id: 20260707-nolibc-debug-04c9cedd3eaf
> 
> Best regards,
> --  
> Thomas Weiﬂschuh <linux@weissschuh.net>
