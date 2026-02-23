Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB12226299
	for <linux-kselftest@vger.kernel.org>; Mon, 23 Feb 2026 01:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771811878; cv=none; b=ckbS3f4yODfJGFCnf2OfvFY3A1n1zP6e1XVhJKRGiYfMOWrCOmmeTPDXeEE3VwyZpUw05ZJzY5/MVsc5IIGWFZlQDD5Wy17j+ciBxDXg0YvhzyWW/c5S7zPen7rvdyF8uJTGZx3tlMVSdeWDixAjDHWSh7ImRo6jIfFfQ0TUC7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771811878; c=relaxed/simple;
	bh=/4gziutufUrH0OFdOQhNBLXzMCh+IGZVYu9/0hxCRrg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M2/PlkIb3Pb8w2+Xz1len388j5Q3PcufWTcCIDTaEY4jevwFXYnGCIUW/JreNh2+JE1OnaEAYXLyYFDTZs10ZOSPXs3pNstCaUVNNGrw3LC2DwcmOR/OTXfLImkTetLKsrYsr7GQSvTIbtmLHxJfmKLcJpKTagn7P4I0/TpHvbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dRkxqmkz; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dRkxqmkz"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c626bd75628so1304627a12.3
        for <linux-kselftest@vger.kernel.org>; Sun, 22 Feb 2026 17:57:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771811876; x=1772416676; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=llR/CDN0qA6HlMSpdCclQMih6ERIQrWO2TnuYjQc/wc=;
        b=dRkxqmkz4+9D9nN+FHjZ0UWxSnz83ew3lB7ZbJ+lW5/yGaAzTewmsZpLKEDH40MGP2
         8tpu0O1c0ju5UVwPop0ydHVoPZmDGgURzkpfr1x4LpTIlm5RGhq73xveEvUFMhwbzhow
         mXeeXG8QbYJm4QyKrzVzrtl/BtFZbVV/5JJMvi7vFX9PfO9o7ur64GrewoQdw/HzY9mo
         MeaSJq8cirXAdcDOIJTWgV44j/lgX8HEZwU1Pa/fdOoip3CKB6JWbpe98li8eOQnoSL2
         Vl86ArgKgMDx9IjlsL50he5EMKNZpPrulhDGVHsByzMEa9Md+UlJHG/nAdTMSkUPTag9
         9/9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771811876; x=1772416676;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=llR/CDN0qA6HlMSpdCclQMih6ERIQrWO2TnuYjQc/wc=;
        b=spFcji7466sOjN3gkZTXylv3tWZ4YxzumVecwg6rTEhKBaDZFn9cBX2G3Td+V0c82U
         OzaYLtHBwaJreEWVdWFV2qIGEPEBZITSYmi/JbKNVAZy77MIQPcn1ZkBC4QW8ShcMhSo
         vZefdyLmMRkGtx/FaBTYcXPMPdDhG+dYJGA+gVU7h8bIB9Tyfe4grMCey1UyBOBFVf02
         fVwE45qTMlUucKoloen2z/AMtDr2pPwrfFfbztdGR0ksYcXssDSj+bx3xpTVvWSRzimb
         RECd52qc9GfSaxkeunAWnOmlP9qTayB9YO8QjU0RsfFuzRLN7/Cnz9dLqCZ8eA3G1Mq6
         hmTg==
X-Forwarded-Encrypted: i=1; AJvYcCXQVi4JtqEUzlXM2Ue7u2MMBvr6qRQ9QeelQyUqeG2xZMm0U1U49cWcdtGjN2Yp+nscqYqkVA8sQ1LuzluH2nI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6IbwDh8T8rTiiBMr2S9P/X/TKmn4AZH5TCWznYvz+9D0xHARL
	7PIUaLvjjwyZJLm5zKAfUQ48ugTODeX4kVTHv0pFT4iLuynnuy+kf2ehu4RotokN
X-Gm-Gg: AZuq6aIIm3JN3/BbHdwryrKCbHmepeW57s9P0KYoS1SqvH3N9gjBSxNqC37DwaDgkKs
	VCubhOy6mHpITuihaqIJyuGvPizT7iDxPaqbp8v5nZWFwNmcRGBNt3xS+vy38XoPwbkHZjwWueh
	CI9tlVzhPEQD/+mHXAXBAZTp/lJnHKvcIpM2CYatD6gaUzoy3tQBWjUMjgy50CuODQmj0ek04oa
	skbtOGw1WjzcOIw21SI6ONWmW8KViE+z3xIG+Z41sdg4ezScoQnLmvl6QmPII6GNTqwFZL/TOl5
	7sQLG57twCujAgxBXI096Zmzx5h8zY9xaxciBaAkIFW65dN2BLz6zSZhOrxU0qikXmKxP36GPzT
	5NPTG/z0BDCmrf52Pmdhi+y9Ltk1BsAzcvlUGW7Rm7XyAcXBFvMikWEzeNY08w0zlKhGNn7fRmf
	U/4ILbJc/wR73BE0UNDdL95tdQiDQ=
X-Received: by 2002:a17:902:f682:b0:2a8:ac0f:9ae9 with SMTP id d9443c01a7336-2ad7452627amr58120695ad.41.1771811876211;
        Sun, 22 Feb 2026 17:57:56 -0800 (PST)
Received: from fedora ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad74f72497sm53662645ad.38.2026.02.22.17.57.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 17:57:55 -0800 (PST)
Date: Mon, 23 Feb 2026 01:57:50 +0000
From: Hangbin Liu <liuhangbin@gmail.com>
To: Shuah Khan <shuah@kernel.org>, Brendan Jackman <jackmanb@google.com>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH selftests] selftests: Use ktap helpers for runner.sh
Message-ID: <aZu0Hka4QRbrsh4z@fedora>
References: <20260206081704.53215-1-liuhangbin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260206081704.53215-1-liuhangbin@gmail.com>

Hi Shuah, Brendan,

Any feedback for this patch?

Thanks
Hangbin
On Fri, Feb 06, 2026 at 08:17:04AM +0000, Hangbin Liu wrote:
> This has been on my todo list for a long time. We should use ktap
> helpers in runner.sh. I saw Brendan did some work in d9e6269e3303
> ("selftests/run_kselftest.sh: exit with error if tests fail") to make
> run_kselftest.sh exit with the correct return value. But we still use a
> custom solution in runner.sh. Let's convert all the print messages to use
> formal ktap helpers. Here’s what I changed:
> 
>   1. Move TAP header from runner.sh to run_kselftest.sh, since run_kselftest.sh
>      is the only caller of run_many().
>   2. In run_kselftest.sh, call run_many() in main process to count the
>      pass/fail numbers.
>   3. In run_kselftest.sh, do not generate kselftest_failures_file; just
>      use ktap_print_totals to report the result.
>   4. In runner.sh run_one(), get the return value and use ktap helpers for
>      all pass/fail reporting. This allows counting pass/fail numbers in the
>      main process.
>   5. In runner.sh run_in_netns(), also return the correct rc, so we can
>      count results during wait.
> 
> After the change, the printed result looks like:
> 
>   not ok 4 4 selftests: clone3: clone3_cap_checkpoint_restore # exit=1
>   # Totals: pass:3 fail:1 xfail:0 xpass:0 skip:0 error:0
> 
>   ]# echo $?
>   1
> 
> Signed-off-by: Hangbin Liu <liuhangbin@gmail.com>
> ---
>  tools/testing/selftests/kselftest/runner.sh | 83 ++++++++++++---------
>  tools/testing/selftests/run_kselftest.sh    | 21 ++++--
>  2 files changed, 62 insertions(+), 42 deletions(-)
> 
> diff --git a/tools/testing/selftests/kselftest/runner.sh b/tools/testing/selftests/kselftest/runner.sh
> index 3a62039fa621..f3307f2d1f48 100644
> --- a/tools/testing/selftests/kselftest/runner.sh
> +++ b/tools/testing/selftests/kselftest/runner.sh
> @@ -1,8 +1,8 @@
> -#!/bin/sh
> +#!/bin/bash
>  # SPDX-License-Identifier: GPL-2.0
>  #
>  # Runs a set of tests in a given subdirectory.
> -export skip_rc=4
> +. $(dirname "$(readlink -e "${BASH_SOURCE[0]}")")/ktap_helpers.sh
>  export timeout_rc=124
>  export logfile=/dev/stdout
>  export per_test_logging=
> @@ -44,17 +44,11 @@ tap_timeout()
>  	fi
>  }
>  
> -report_failure()
> -{
> -	echo "not ok $*"
> -	echo "$*" >> "$kselftest_failures_file"
> -}
> -
>  run_one()
>  {
>  	DIR="$1"
>  	TEST="$2"
> -	local test_num="$3"
> +	local rc test_num="$3"
>  
>  	BASENAME_TEST=$(basename $TEST)
>  
> @@ -102,16 +96,17 @@ run_one()
>  	# Command line timeout overrides the settings file
>  	if [ -n "$kselftest_override_timeout" ]; then
>  		kselftest_timeout="$kselftest_override_timeout"
> -		echo "# overriding timeout to $kselftest_timeout" >> "$logfile"
> +		ktap_print_msg "overriding timeout to $kselftest_timeout" >> "$logfile"
>  	else
> -		echo "# timeout set to $kselftest_timeout" >> "$logfile"
> +		ktap_print_msg "timeout set to $kselftest_timeout" >> "$logfile"
>  	fi
>  
>  	TEST_HDR_MSG="selftests: $DIR: $BASENAME_TEST"
>  	echo "# $TEST_HDR_MSG"
>  	if [ ! -e "$TEST" ]; then
> -		echo "# Warning: file $TEST is missing!"
> -		report_failure "$test_num $TEST_HDR_MSG"
> +		ktap_print_msg "Warning: file $TEST is missing!"
> +		ktap_test_fail "$test_num $TEST_HDR_MSG"
> +		rc=$KSFT_FAIL
>  	else
>  		if [ -x /usr/bin/stdbuf ]; then
>  			stdbuf="/usr/bin/stdbuf --output=L "
> @@ -122,33 +117,37 @@ run_one()
>  		elif [ -x "./ksft_runner.sh" ]; then
>  			cmd="$stdbuf ./ksft_runner.sh ./$BASENAME_TEST"
>  		else
> -			echo "# Warning: file $TEST is not executable"
> +			ktap_print_msg "Warning: file $TEST is not executable"
>  
>  			if [ $(head -n 1 "$TEST" | cut -c -2) = "#!" ]
>  			then
>  				interpreter=$(head -n 1 "$TEST" | cut -c 3-)
>  				cmd="$stdbuf $interpreter ./$BASENAME_TEST"
>  			else
> -				report_failure "$test_num $TEST_HDR_MSG"
> -				return
> +				ktap_test_fail "$test_num $TEST_HDR_MSG"
> +				return $KSFT_FAIL
>  			fi
>  		fi
>  		cd `dirname $TEST` > /dev/null
> -		((((( tap_timeout "$cmd" 2>&1; echo $? >&3) |
> +		(((( tap_timeout "$cmd" 2>&1; echo $? >&3) |
>  			tap_prefix >&4) 3>&1) |
> -			(read xs; exit $xs)) 4>>"$logfile" &&
> -		echo "ok $test_num $TEST_HDR_MSG") ||
> -		(rc=$?;	\
> -		if [ $rc -eq $skip_rc ]; then	\
> -			echo "ok $test_num $TEST_HDR_MSG # SKIP"
> -		elif [ $rc -eq $timeout_rc ]; then \
> -			echo "#"
> -			report_failure "$test_num $TEST_HDR_MSG # TIMEOUT $kselftest_timeout seconds"
> +			(read xs; exit $xs)) 4>>"$logfile"
> +		rc=$?
> +		if [ "$rc" -eq "$KSFT_PASS" ]; then
> +			ktap_test_pass "$test_num $TEST_HDR_MSG"
> +		elif [ "$rc" -eq "$KSFT_SKIP" ]; then
> +			ktap_test_skip "$test_num $TEST_HDR_MSG"
> +		elif [ "$rc" -eq "$KSFT_XFAIL" ]; then
> +			ktap_test_xfail "$test_num $TEST_HDR_MSG"
> +		elif [ "$rc" -eq "$timeout_rc" ]; then
> +			ktap_test_fail "$test_num $TEST_HDR_MSG # TIMEOUT $kselftest_timeout seconds"
>  		else
> -			report_failure "$test_num $TEST_HDR_MSG # exit=$rc"
> -		fi)
> +			ktap_test_fail "$test_num $TEST_HDR_MSG # exit=$rc"
> +		fi
>  		cd - >/dev/null
>  	fi
> +
> +	return $rc
>  }
>  
>  in_netns()
> @@ -164,27 +163,34 @@ in_netns()
>  
>  run_in_netns()
>  {
> -	local netns=$(mktemp -u ${BASENAME_TEST}-XXXXXX)
>  	local tmplog="/tmp/$(mktemp -u ${BASENAME_TEST}-XXXXXX)"
> +	local netns=$(mktemp -u ${BASENAME_TEST}-XXXXXX)
> +	local rc
> +
>  	ip netns add $netns
>  	if [ $? -ne 0 ]; then
> -		echo "# Warning: Create namespace failed for $BASENAME_TEST"
> -		echo "not ok $test_num selftests: $DIR: $BASENAME_TEST # Create NS failed"
> +		ktap_print_msg "Warning: Create namespace failed for $BASENAME_TEST"
> +		ktap_test_fail "$test_num selftests: $DIR: $BASENAME_TEST # Create NS failed"
>  	fi
>  	ip -n $netns link set lo up
> +
>  	in_netns $netns &> $tmplog
> +	rc=$?
> +
>  	ip netns del $netns &> /dev/null
> +	# Cat the log at once to avoid parallel netns logs.
>  	cat $tmplog
>  	rm -f $tmplog
> +	return $rc
>  }
>  
>  run_many()
>  {
> -	echo "TAP version 13"
>  	DIR="${PWD#${BASE_DIR}/}"
>  	test_num=0
> -	total=$(echo "$@" | wc -w)
> -	echo "1..$total"
> +	local rc
> +	pids=()
> +
>  	for TEST in "$@"; do
>  		BASENAME_TEST=$(basename $TEST)
>  		test_num=$(( test_num + 1 ))
> @@ -194,10 +200,19 @@ run_many()
>  		fi
>  		if [ -n "$RUN_IN_NETNS" ]; then
>  			run_in_netns &
> +			pids+=($!)
>  		else
>  			run_one "$DIR" "$TEST" "$test_num"
>  		fi
>  	done
>  
> -	wait
> +	# Handle the return values when running in netns.
> +	for pid in "${pids[@]}"; do
> +		wait "$pid"
> +		rc=$?
> +		[ "$rc" -eq "$KSFT_PASS" ] && KTAP_CNT_PASS=$((KTAP_CNT_PASS+1))
> +		[ "$rc" -eq "$KSFT_FAIL" ] && KTAP_CNT_FAIL=$((KTAP_CNT_FAIL+1))
> +		[ "$rc" -eq "$KSFT_SKIP" ] && KTAP_CNT_SKIP=$((KTAP_CNT_SKIP+1))
> +		[ "$rc" -eq "$KSFT_XFAIL" ] && KTAP_CNT_XFAIL=$((KTAP_CNT_XFAIL+1))
> +	done
>  }
> diff --git a/tools/testing/selftests/run_kselftest.sh b/tools/testing/selftests/run_kselftest.sh
> index d4be97498b32..10930d09f2a5 100755
> --- a/tools/testing/selftests/run_kselftest.sh
> +++ b/tools/testing/selftests/run_kselftest.sh
> @@ -110,18 +110,23 @@ if [ -n "$TESTS" ]; then
>  	available="$(echo "$valid" | sed -e 's/ /\n/g')"
>  fi
>  
> -kselftest_failures_file="$(mktemp --tmpdir kselftest-failures-XXXXXX)"
> -export kselftest_failures_file
> -
> +curdir=$(pwd)
> +total=$(echo "$available" | wc -w)
>  collections=$(echo "$available" | cut -d: -f1 | sort | uniq)
> +
> +ktap_print_header
> +ktap_set_plan "$total"
> +
>  for collection in $collections ; do
>  	[ -w /dev/kmsg ] && echo "kselftest: Running tests in $collection" >> /dev/kmsg
>  	tests=$(echo "$available" | grep "^$collection:" | cut -d: -f2)
> -	($dryrun cd "$collection" && $dryrun run_many $tests)
> +	$dryrun cd "$collection" && $dryrun run_many $tests
> +	$dryrun cd "$curdir"
>  done
>  
> -failures="$(cat "$kselftest_failures_file")"
> -rm "$kselftest_failures_file"
> -if "$ERROR_ON_FAIL" && [ "$failures" ]; then
> -	exit 1
> +ktap_print_totals
> +if "$ERROR_ON_FAIL" && [ "$KTAP_CNT_FAIL" -ne 0 ]; then
> +	exit "$KSFT_FAIL"
> +else
> +	exit "$KSFT_PASS"
>  fi
> -- 
> 2.50.1
> 
