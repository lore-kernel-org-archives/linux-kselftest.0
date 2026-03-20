Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2657385522
	for <linux-kselftest@vger.kernel.org>; Fri, 20 Mar 2026 13:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774013169; cv=none; b=QvQBI2weWQxDr20M4QnLgzOPdG6IdVs5TI/0tb03xnB4cDiPTYab+xHSaFV5E0UaoQHS8CToFRSYb5IDOfHbv3fOQ9gklwj5iToqamHNz95HBQMCleGnpgBIOCSF+3TZVu74P5E2QU6f3Buwa4kcIKxTAsLLirgsNhWnXpxnA4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774013169; c=relaxed/simple;
	bh=WPvpeQDdzO+GgprJ21xMbMraGpIYDJe/5WMU9LWDYn4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hrzYQ4d0eKi1XysR3Oha0dNLH1CZdEmZYECLtALwIMA38ly9Utt4eWA8CFdnpVSgS2pxXTKe5q/kvk64H9m+AwDXYuOdBe637zm44VogWd95BrQ9EvSGrz4st6fEaV3wRPisW7JzdcjHfbHHvrFvTI6aD2Zoa038d3z5kZ2OhAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=FPFpdd/+; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="FPFpdd/+"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-439b611274bso989422f8f.3
        for <linux-kselftest@vger.kernel.org>; Fri, 20 Mar 2026 06:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774013165; x=1774617965; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YleuovkqL/mLOY7qyM/w1oS9wpwrcConR5IRWNylFhM=;
        b=FPFpdd/+24PtKRKI+GEuYmgHqugZXgdZj8in0BMxRq9Dg5V3MIeDhNvZcETrEYCjuu
         RVlcV7xZ5ICC743alKJGXL/dCwAGV8iuLF21E6tlBwJO4MH3rP5fFhXikvdQj2ubenzd
         Nc9230xIFC+ihGXMpNvdassrr6ESj13BadreNV0JGAGx1Te6BDlrFnwRVdW1mp+x0ZEE
         zyZ0x79WTOijhlDFENOJtt/Ui7xCvrezI1p9i1LOFvCEb+jupqKvREcNIeCGKW57fCj7
         cXigUyqi/aDl5tw3pcY4A/pWj+Yub6C9B/K2Dhd6tNG34BCOWzfHXSCVHWoxi+tLpb7c
         eZFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774013165; x=1774617965;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YleuovkqL/mLOY7qyM/w1oS9wpwrcConR5IRWNylFhM=;
        b=oOojTr++fETP/07X3D6ANYc4+/p7pGs/+aE0Kc3oava9oFRLPauRYg2IfQ8QSSTaI2
         v5bAsfyeQ36opsTzueTDR7ZhANsrgXJJFnl9oqXE4l5gF21mTTSav0+Gt0UjK95A8HeG
         lzqOsuFI/+0aEgx+jKK/QD+62ihJnTzRMTbVHDk8xeyc7wAyM8Wzsdq/8TMTO0uS87BO
         2KiISipcicNB/qnuAe4OIvGmDf6uMs1/D7BDXk61z/JzSnLJxajq6DSeB3zIxC8Z6mNo
         70LpGP+QNr4mYQAI0keNuplAODIDmYCkb4AU7il33AO4ea5D/Ke3bphX9i66W5i7mQe5
         R6vg==
X-Forwarded-Encrypted: i=1; AJvYcCVcxcI3TKOb1TxReWlM21+jH2xBaYG2a13T2j7a/jAbfXB0t2McUWCm/kAKjTcWU+ZdBi3y6j/Q74phXSiPG0g=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWEv2Zu3EWyD36rheeYgUjc0f6Sv2GHe0KXLB/RjGPAJDtJm5l
	8fBSkW/GxQSiFatWvo5uani2Ujx5DMD0PbJePd7jlcihaPzQIAHESdALQFWSI2eozpE=
X-Gm-Gg: ATEYQzzu5Qkwz5JYT271YzqBmArktCKsnSkaKtA4AEIHGmclrOVimiN3MJ4nI9HV81a
	njSo9nN9slt94E6Irm4/73fTV/YLAJFls0COyQ5lM1KP4neaQVQaq6wRRmVi+6pVMD6uiP1vIyd
	1Ku4PXs2MbdMcS+IU522q3OWW8sJMI+LjsFdDq4DFdTWR1UeOB8xJxzTkC7YdCiv8vBi1PfnGP4
	nK+e+Q/FUL+V9ytin4mqOgmFR7fnb3pyrQhSJWWkceOSXExuIxxl23vExm8VzbQIq8m8UoWUWX7
	Nu5IUze9LDOjsEz/kQlZT9FDNpvv+kcpeQxTzjaoYg5/U/awmJfwGBKsmnSncu9kF2SXm84XNCl
	dlGqGkDjPATs5fJwwD0sOmRfYBXtIHb0ErhoDt/zsc8T6bgJFq31XEsnJuOZDNPXtXBBgAKweNk
	PGQqa+39sOAYdhFKOrHJ/qdbUdlA==
X-Received: by 2002:a05:6000:2f84:b0:43b:464a:28de with SMTP id ffacd0b85a97d-43b64243b0dmr4968964f8f.14.1774013164909;
        Fri, 20 Mar 2026 06:26:04 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b6471a297sm6548523f8f.37.2026.03.20.06.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 06:26:04 -0700 (PDT)
Date: Fri, 20 Mar 2026 14:26:02 +0100
From: Petr Mladek <pmladek@suse.com>
To: Marcos Paulo de Souza <mpdesouza@suse.com>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, Jiri Kosina <jikos@kernel.org>,
	Miroslav Benes <mbenes@suse.cz>,
	Joe Lawrence <joe.lawrence@redhat.com>,
	Shuah Khan <shuah@kernel.org>, live-patching@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 8/8] selftests: livepatch: functions.sh: Extend check for
 taint flag kernel message
Message-ID: <ab1K6oR06sLm9LM_@pathway.suse.cz>
References: <20260313-lp-tests-old-fixes-v1-0-71ac6dfb3253@suse.com>
 <20260313-lp-tests-old-fixes-v1-8-71ac6dfb3253@suse.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313-lp-tests-old-fixes-v1-8-71ac6dfb3253@suse.com>

On Fri 2026-03-13 17:58:39, Marcos Paulo de Souza wrote:
> On SLE kernels there is a warning when a livepatch is disabled:
>   livepatch: attempt to disable live patch test_klp_livepatch, setting
>   NO_SUPPORT taint flag
> 
> Extend lightly the detection of messages when a livepatch is disabled
> to cover this case as well.
> 
> Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>
> ---
>  tools/testing/selftests/livepatch/functions.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/livepatch/functions.sh b/tools/testing/selftests/livepatch/functions.sh
> index 781346d6e94e0..73a1d4e6acaeb 100644
> --- a/tools/testing/selftests/livepatch/functions.sh
> +++ b/tools/testing/selftests/livepatch/functions.sh
> @@ -324,7 +324,7 @@ function check_result {
>  	# - filter out dmesg timestamp prefixes
>  	result=$(dmesg | awk -v last_dmesg="$LAST_DMESG" 'p; $0 == last_dmesg { p=1 }' | \
>  		 grep -e 'livepatch:' -e 'test_klp' | \
> -		 grep -v '\(tainting\|taints\) kernel' | \
> +		 grep -v '\(tainting\|taints\|taint\) \(kernel\|flag\)' | \
>  		 sed 's/^\[[ 0-9.]*\] //' | \
>  		 sed 's/^\[[ ]*[CT][0-9]*\] //')

With the upstream maintainer hat on:

I am afraid that we could not take this. It is needed only because
of another out-of-tree patch. It does not describe the upstream
behavior. It might even hide problems.

We should maintain a SUSE-specific patch against the selftests
as a counter-part for the patch adding the tainting.

Or we could try to upstream the patch which adds the tainting.
Well, we might want to limit the tainting only to livepatches
with callbacks or shadow variables. IMHO, only these features
are source of potential problems.

Best Rerards,
Petr
