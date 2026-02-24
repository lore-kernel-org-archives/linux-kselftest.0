Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 004CB395DB6
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Feb 2026 13:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771939312; cv=none; b=AJ97WvJWEz5l9OtDUxn1CfMcnzQMCHjcXN1Nq+gRPGI0hQUmgHDZcfSIwq/2kA1orp18fVZ6mAT/u9kMpNUAE4Kwn0x6EVpLcg2wFT1R374mG09oiF/mCtlJk1lma1KWAQQ2LRbEtO0POhps2pEVjhCJqG7OK8zqVcEWXp/Yy7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771939312; c=relaxed/simple;
	bh=KdFMNqHQC0OZGucm4zJmZCgBBYcLdHV0SzSRNUCwqN4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gkefjv1k3+FdIc2aC8ac9kCeyegATYoYinVbripMqwaNXK+jUXxc9Sah+61BR5bO6WwRRyn3HKzDm5/FkdvLVGbPGBmF/HiDCnAdVW5QdhVmTP1N1jFIuf8xIkzTO+01qQx7t934bGbKAiNBS1AAx5vawvKXHBxqHV1f8xdAaG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eaPIvB6Y; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eaPIvB6Y"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8220bd582ddso2513235b3a.2
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Feb 2026 05:21:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771939310; x=1772544110; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4DBQxTCdml7S+itQTZYwXfqu7v90m5fsL9enZcs6YS8=;
        b=eaPIvB6YkP39abDnLKdEavBvegdKPDFge4lbX5NUsvE2eOLIjcJrz1WoauILO8FXTM
         arVUDuORiqB5jRkigAyJq9+MenGqERBgRk61KNInHeKLpBKt7pVfdiMbj/B7wktL68PU
         8dVB8/ozgC0SNrv60jwqPq3ypxKtyjU3Bn9uCbRmL1Cd0/P+hKVkGthm3Vg35qql3GYO
         ridB0gZcWCdfKsuTQrjU7RGLvtw+D6e3sQ585Oz1rRkGZ3Bb9LHLvTUt31DkzwInbO48
         EsNMBjFpfetMZxryknmoWEKMmSdQuSuT+ltcoXxg0XqWMAJqML5y9IqDbNYwOUAoN/u4
         xnuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771939310; x=1772544110;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4DBQxTCdml7S+itQTZYwXfqu7v90m5fsL9enZcs6YS8=;
        b=RNg1vPUhh3s5PV/lNawrUCHntkoYDCmUO/tCeWfB4AMoQ3QPzWe4faiD361Mt+9yJS
         r6fylTiuVZ+3/a6Zghks7O7IKtC8cMMMFxJYzHdHLwm3x1Pvlx62PWWy1amm0XcM9/yq
         P/5UaD5m5IJpgaTjoFDHLI3LJjzpGmhhG05yFLTFcLjGlXOjpN2AhcaPe2kiqBaUvHs7
         xohv1AYnq0LMfXxfLXLk11sas/PeJ/UjokKcrABuDC9UbT3cqsZp3sbt+gHFgptSkocG
         Q2B48G+ag/Rbo9VZ8R8ZSdYzAiEst5cUVubY4ufz7ZHFRaq2q8VqJ66l7wfMeW1heIri
         /ZEg==
X-Gm-Message-State: AOJu0Yy3dvJm8X3CQuzn6dTOCxATBMNZYr0sTOu//0r5MuHW7qdFdI8z
	JEaVhCAXuYPSs8fhHzaYNByLWJ5WhOoVEJTF92pJFJPTEcK3Yu5LIn9WE5248kCy
X-Gm-Gg: AZuq6aJLmmKG9jAZwffZTpH23JD7RnV3d2Na/AxjGTbzhfPkcdRdUGBvfqjZ2qWGEKS
	5IP7Gi8Ou2qdOYErC5c8uTEtikKb6RxDmlIdyYmUjsvP1+EvZL6FSeWNGY1UHKo4+0xfn4rr3WE
	Sxb1YRuBSqyJqcG1PWW77q7GR3BqJP3iOmVFci6Jd0mpTfRPRfOuNGK2xkJLNJhk+hkkVdtRoKU
	bPxlaYh4qJw0kRKj3XrcfLA7cfZc6Or3eXyR2i5gF/8EU4OV9d6N1Ee+IBiW4nM9LhRosGeWaX2
	TqWSiiaV3MM+MjnnJBEYRpE1V0kbdKMdfZ2eKxOyKvm6Hov6z+1srCfkbHaqCZbvw9MuDuUVMg+
	l2nqDxmofZxa8nfBLhQIPszAXmpud2p/p4O2pE2JlCD1TR9x9ogd/s3nLpJ6WA5t7Q/qQpdpoUk
	o4H2oSPIzYlKJkr0qt7/Z9R/5xN8g=
X-Received: by 2002:a05:6a21:a03:b0:38b:d95e:69a9 with SMTP id adf61e73a8af0-39545ebb962mr10908349637.16.1771939310267;
        Tue, 24 Feb 2026 05:21:50 -0800 (PST)
Received: from fedora ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-358f5f7457csm883925a91.16.2026.02.24.05.21.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 05:21:49 -0800 (PST)
Date: Tue, 24 Feb 2026 13:21:45 +0000
From: Hangbin Liu <liuhangbin@gmail.com>
To: Brendan Jackman <jackmanb@google.com>
Cc: linux-kselftest@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
	netdev@vger.kernel.org
Subject: Re: [PATCHv2] selftests: Use ktap helpers for runner.sh
Message-ID: <aZ2l6dN2fZapf4eP@fedora>
References: <20260224041048.6570-1-liuhangbin@gmail.com>
 <DGN5V6ZKYQ3A.1F5DK46XY82YB@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DGN5V6ZKYQ3A.1F5DK46XY82YB@google.com>

On Tue, Feb 24, 2026 at 11:38:34AM +0000, Brendan Jackman wrote:
> Cool thanks sorry I did not really review the code before but now I'm
> taking a closer look.
> 
> I don't parse KTAP but I did check that this doesn't break my usecase
> [0] so:
> 
> Tested-By: Brendan Jackman <jackmanb@google.com>
> 
> [0]: https://github.com/bjackman/limmat-kernel-nix/blob/master/ktests.nix

Thanks for the testing.

> >  run_in_netns()
> >  {
> > -	local netns=$(mktemp -u ${BASENAME_TEST}-XXXXXX)
> >  	local tmplog="/tmp/$(mktemp -u ${BASENAME_TEST}-XXXXXX)"
> > +	local netns=$(mktemp -u ${BASENAME_TEST}-XXXXXX)
> 
> Nit (no need to respin just for this, but if you're already respinning):
> Diff noise here.

This is to make the variables in reverse Christmas tree based on kernel code
style.

> 
> > +	local rc
> > +
> >  	ip netns add $netns
> >  	if [ $? -ne 0 ]; then
> > -		echo "# Warning: Create namespace failed for $BASENAME_TEST"
> > -		echo "not ok $test_num selftests: $DIR: $BASENAME_TEST # Create NS failed"
> > +		ktap_print_msg "Warning: Create namespace failed for $BASENAME_TEST"
> > +		ktap_test_fail "$test_num selftests: $DIR: $BASENAME_TEST # Create NS failed"
> >  	fi
> >  	ip -n $netns link set lo up
> > +
> >  	in_netns $netns &> $tmplog
> > +	rc=$?
> > +
> >  	ip netns del $netns &> /dev/null
> > +	# Cat the log at once to avoid parallel netns logs.
> >  	cat $tmplog
> >  	rm -f $tmplog
> > +	return $rc
> >  }
> >  
> >  run_many()
> >  {
> > -	echo "TAP version 13"
> >  	DIR="${PWD#${BASE_DIR}/}"
> >  	test_num=0
> > -	total=$(echo "$@" | wc -w)
> > -	echo "1..$total"
> > +	local rc
> > +	pids=()
> > +
> >  	for TEST in "$@"; do
> >  		BASENAME_TEST=$(basename $TEST)
> >  		test_num=$(( test_num + 1 ))
> > @@ -194,10 +200,20 @@ run_many()
> >  		fi
> >  		if [ -n "$RUN_IN_NETNS" ]; then
> >  			run_in_netns &
> > +			pids+=($!)
> >  		else
> >  			run_one "$DIR" "$TEST" "$test_num"
> >  		fi
> >  	done
> >  
> > -	wait
> > +	# These variables are outputs of ktap_helpers.sh but since we've
> > +	# run the test in a subprocess we need to update them manually
> > +	for pid in "${pids[@]}"; do
> > +		wait "$pid"
> > +		rc=$?
> > +		[ "$rc" -eq "$KSFT_PASS" ] && KTAP_CNT_PASS=$((KTAP_CNT_PASS+1))
> > +		[ "$rc" -eq "$KSFT_FAIL" ] && KTAP_CNT_FAIL=$((KTAP_CNT_FAIL+1))
> > +		[ "$rc" -eq "$KSFT_SKIP" ] && KTAP_CNT_SKIP=$((KTAP_CNT_SKIP+1))
> > +		[ "$rc" -eq "$KSFT_XFAIL" ] && KTAP_CNT_XFAIL=$((KTAP_CNT_XFAIL+1))
> > +	done
> 
> Can we please be consistent about how we do these two big conditional
> blocks? Also should they use `case`? Also please add something to not

Ah, yes, we can use case here. Let me update the patch.

> fail silently if $rc has a garbage value (I guess just log a warning).

A log here may break the KTAP output. While run_in_netns() calls run_one()
in the end, which will print the exit value if it's a garbage value. i.e.

    ktap_test_fail "$test_num $TEST_HDR_MSG # exit=$rc"

> 
> FWIW I still think this is very yucky but, it seems switching to the
> helper library is a worthwhile cleanup (plus, this patch drops a level
> of subshell nesting in the tap_timeout pipeline, which seems like a step
> in the right direction!) so I think it would be irrational to block that
> cleanup just coz of this yuckiness.

Thanks
Hangbin
