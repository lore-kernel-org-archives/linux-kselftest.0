Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02A913A759D
	for <linux-kselftest@vger.kernel.org>; Fri, 20 Mar 2026 13:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774012328; cv=none; b=dmfR7mjJe2yRfkq38jSo7ozmoswDzLhg9f3vDHHHtXYFhY/C38aWJr+aEKz+9gAycDj6pQaVdLzfN805c9ha8y0yB4ganrkCmEvIK05a5iSm8GWEqSeGg+4LAknVsqlUvgrJwWt6CPJhtC4JzrB+xV/WKJKjEZssrb+EKNBj8AE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774012328; c=relaxed/simple;
	bh=i0a09aXhOP/QlBqzizvEoGUl0WgcS81yzRiwfsaclx4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ilYQ6Y8tLcg/+yn67DP4OIbMYh7orD+olwHnGSoQkTc8XkAxx+A2HxfiHA8hGkuWHJywWHlT7ZdShR0PL63f59bOSAWfgcsrYRSFdUkKUlc6KU3lpzkg4mxSCrT1KTeKXOV3mkWyjizrNpfr9ijTf4QvRDxy7mrLFxn5y0ISKEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=MHQk18xd; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="MHQk18xd"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-486fb439299so14602445e9.0
        for <linux-kselftest@vger.kernel.org>; Fri, 20 Mar 2026 06:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774012325; x=1774617125; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XuiKHSkZ3E5unJ4q4dyvIHV5c5AfIhyVuPpE5qhhaFU=;
        b=MHQk18xddch3LA4u1Cq/Am55SsN1zw+h8A1Kq5NvvDvpg8CNhe9JWX58dZZk+oz/XX
         YoZiJfLPPv+a3veMOjiTwgVBmlVTugxKMa9ULfk0Kd08CvljTlOQSGp2SocShfwCSFCy
         /eLlm+HT4Kt6MFtlqePMIcqy7aJnm+jD6V8dKhvp1fUuzdpXtbehqr2G4+0BZapeLOD6
         bS2KtvHcWSvxgHeXXtPFm2334SBHKR20ztjsfMQY+MxJxyi7Pz+znAaxZWONaFkA9+PP
         Zc0e4PKBFJZVgFIoIBkNRC4iLRph9yRRM4el9OD1uYBZ7i+s3XXhzlanuv5obDdnt1ta
         5vbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774012325; x=1774617125;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XuiKHSkZ3E5unJ4q4dyvIHV5c5AfIhyVuPpE5qhhaFU=;
        b=YyzmnvLyV7v1uCtYOqgGvucvYjjG5gY6gbb9biJcby5SlxasgbQlmj0gbHhOpkAQAl
         apLp2GDbvTmDvNDjT+uUokJGZZDMQQ61WsSRiIs8Bge3VqCM4pgZE0nVm4XLLxqtXBXM
         qhAUZx2X9u52gawfGdlQDq9C7eH9tGIiTik9hE/DiRnuKXw8CcMmlaI6paigaaV48DIl
         gTNdrY064T2bytxhoz8K4Imw/lpmFAH8gOcOBdnTgQWbFgPq4LZ//ho/5saNKoXPUCmy
         Yt20T/hjUsQxjSyt0hz47jQev3z38AJzQXaIqo9/PH/18ww93TRJpcMFq/y+S2E1hZ7n
         GOug==
X-Forwarded-Encrypted: i=1; AJvYcCVneFUHaZdG+VAB3EI8WnW4/jCcErJE/3Z0jS2bTuNEalOSv+WvwpGJsS0Pp7w3NyQHXn4GTOLJv+UajvjPNSE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwghrrPCsdXJu6H8eYz6Cw2mc2XxxtTdYj94veMrK0nqEORnIlI
	Dfm7+7XMepta/bcjdmrF60IMx8YBxbwQ9pkabRMxN01a/cMbPMOpodzctNMl/uzu7Jk=
X-Gm-Gg: ATEYQzzmg6gB9fB/S/CIbe0QEgFcAdq+uOu60iedRmi+6nvKT5FQ8af6fPPd937vvw7
	XhAtc70bY2O2MK65sGEY3mxOWtFoXXPCdveh71k0EJd+MGzEuwgCGhzX/8Hx9IAoCqwiKD75ZBP
	fosoBXMV70A+T+gNdFHmaKm2BOJJB+rsYtQNJykoKM5IUtNnvxJ7SYLic0nG+t/xM7wGN6kBwPj
	45Dt1soKEoSv4grpbV8wXAVAFVkTN8j7vyh9zCv7P3uvUo5sEUL6UEh76dMY+dmYPTk8nHietPf
	CCiPtczbT7s0t2JXsZ5aJHN1iVyUl6OP8HWiUXqKBgT0kS5kFyS/H1wF7/ob8wEjuj1xLxjO5i9
	j0A0ESITc5LMakB1N0IG8hMX/7U4GONYGDSGlqG49Ps5lQ3pnBWTkIup8AtvBB10qlaJ4zNxOSz
	HYTo/QUgwA2Yy3BnoLp+QTt4PphQ==
X-Received: by 2002:a05:600c:3e16:b0:486:fad0:b166 with SMTP id 5b1f17b1804b1-486fee0b74emr47326835e9.17.1774012325282;
        Fri, 20 Mar 2026 06:12:05 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64703c27sm6624281f8f.18.2026.03.20.06.12.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 06:12:04 -0700 (PDT)
Date: Fri, 20 Mar 2026 14:12:03 +0100
From: Petr Mladek <pmladek@suse.com>
To: Marcos Paulo de Souza <mpdesouza@suse.com>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, Jiri Kosina <jikos@kernel.org>,
	Miroslav Benes <mbenes@suse.cz>,
	Joe Lawrence <joe.lawrence@redhat.com>,
	Shuah Khan <shuah@kernel.org>, live-patching@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/8] selftests: livepatch: sysfs: Split tests of replace
 attribute
Message-ID: <ab1Ho0jqOhFu3KZn@pathway.suse.cz>
References: <20260313-lp-tests-old-fixes-v1-0-71ac6dfb3253@suse.com>
 <20260313-lp-tests-old-fixes-v1-5-71ac6dfb3253@suse.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313-lp-tests-old-fixes-v1-5-71ac6dfb3253@suse.com>

On Fri 2026-03-13 17:58:36, Marcos Paulo de Souza wrote:
> In order to run the selftests on older kernels, split the sysfs tests to
> another file, making it able to skip the tests when the attributes
> don't exists.
> 
> No functional changes.
> 
> Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>
> ---
>  tools/testing/selftests/livepatch/Makefile         |  1 +
>  .../selftests/livepatch/test-sysfs-replace-attr.sh | 75 ++++++++++++++++++++++
>  tools/testing/selftests/livepatch/test-sysfs.sh    | 48 --------------
>  3 files changed, 76 insertions(+), 48 deletions(-)
> 
> diff --git a/tools/testing/selftests/livepatch/Makefile b/tools/testing/selftests/livepatch/Makefile
> index a080eb54a215d..b95aa6e78a273 100644
> --- a/tools/testing/selftests/livepatch/Makefile
> +++ b/tools/testing/selftests/livepatch/Makefile
> @@ -10,6 +10,7 @@ TEST_PROGS := \
>  	test-state.sh \
>  	test-ftrace.sh \
>  	test-sysfs.sh \
> +	test-sysfs-replace-attr.sh \
>  	test-syscall.sh \
>  	test-kprobe.sh
>  
> diff --git a/tools/testing/selftests/livepatch/test-sysfs-replace-attr.sh b/tools/testing/selftests/livepatch/test-sysfs-replace-attr.sh
> new file mode 100755
> index 0000000000000..d1051211fe320
> --- /dev/null
> +++ b/tools/testing/selftests/livepatch/test-sysfs-replace-attr.sh
> @@ -0,0 +1,75 @@
> +#!/bin/bash
> +# SPDX-License-Identifier: GPL-2.0
> +# Copyright (C) 2022 Song Liu <song@kernel.org>
> +
> +. $(dirname $0)/functions.sh
> +
> +MOD_LIVEPATCH=test_klp_livepatch
> +
> +setup_config
> +
> +# - load a livepatch and verifies the sysfs replace attribute exists
> +
> +start_test "check sysfs replace attribute"
> +
> +load_lp $MOD_LIVEPATCH
> +
> +check_sysfs_exists "$MOD_LIVEPATCH" "replace"
> +file_exists=$?
> +
> +disable_lp $MOD_LIVEPATCH
> +
> +unload_lp $MOD_LIVEPATCH
> +
> +if [[ "$file_exists" == "0" ]]; then
> +	skip "sysfs attribute doesn't exists."

Nit: I would write "is not supported by this kernel version"
     instead of "doesn't exist".

     I think that it better describes the situation.
     "doesn't exist" sounds more like an error description.

> +fi

This extra code is repeated in 6th and 7th patch as well.
It would be nice to hide it into some helper function
so that we could use here something like:

	check_sysfs_attr_or_skip "replace"

or

	if has_klp_sysfs_attr "replace" ; then
		skip "sysfs \"replace\" attribute is not supported"
	fi

Best Regards,
Petr
