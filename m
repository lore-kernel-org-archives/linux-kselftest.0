Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.105
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795415163;
	b=00hNekylmu1D3opnHmRsJSNPapAh9bfS39d1eIioSLfM1G8WssG4YOSbu0f9cjDJVow/
	 mJi3OUGJx95kqjxSvfx4BMC6d/zbWfi8r8FITaEFf5JPGFfp74H+j62Y8SQzEzyHotrf/
	 ed1SKlXi4bkIVq9TTYnssl7ebBVNXLkSaRuDb3lfA790nz/HJdmYztiSXw0eWAHGps+TK
	 cUjWtHmm/JSEwyCweNLIM0fs3r0pbHHayKeuVFdbXrFcWqSJAeMTs5mMb5HvUamXFIkMZ
	 3v1s3yH3X1nikEloLEhcEjiUnqJyJw0E9ewtHo+uJcDA6l3f2C1lNfN2GcWCpD9WZuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795415163;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=TIdffghSJlSSvoACGCvht+x8YKlpMwi7tdF6MONLBA4=;
	b=k25fHAAWmgJaoco538PmMxtw5+FlZYE4u6LmYd+LKitRwWuP+Ah4XCP9amMOR8tyuSqO
	 91U3NWABqLkpmsz+5WZvk3m2bE/W/IE2KjZpZt8UiXLRxyp7SaWXiZpFPU+RdssKnGbNK
	 NDzB5yeQ7YGFOkoFM7i43Wzcr38tv5XsW4e3mExUa8jDQSJl7oCxFz5isdqzA0nClYkGU
	 8IYIMJgBFNtkyzRMAuYKAu4JuWCiQiXx1hXbOxQy0Ubl8yJZT63w9WXJrxVZ/zgAK7o7c
	 15Vc9HqdMJN/rhsH/Smc0qdrLALcSmxfT1KK7mq8qITO41nQB5dn44DVWzZwQmOeoaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=DAaQFNYa;
	arc=none smtp.remote-ip=95.215.58.105
Received: from mta1.migadu.com (out-105.mta1.migadu.com [95.215.58.105])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E63606A31E
	for <linux-kselftest@vger.kernel.org>; Mon, 23 Nov 2026 06:26:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4E63606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=DAaQFNYa
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=8RgpuFL/0AjtN2cxvRLOw38i1czpAgoobTTA4kOjNqQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795415159; v=1; x=1796019959;
 b=DAaQFNYaB9OMJiILK5/bfHawyRPHShFZ6hCB9dnApCfsxAI48qbKX9Wt/eLr7fmpT9K62xmo
 0XPn0qJdr7gyQlR3o2na864V8ev8b/RF2BDWTuTtKcyiD90iChr8Os0tvcr0M3/4kFTzwmoOZJB
 QPMN499XFSKH/g0YWFGBZHF4=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id ed972c9e76fd63aa;
	Mon, 23 Nov 2026 06:25:46 +0000
X-Mizu-Trace-ID: ed972c9e76fd63aa
X-Migadu-Flow: FLOW_OUT
Date: Mon, 23 Nov 2026 14:25:41 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: "Jori Koolstra (CIQ)" <jkoolstra@xs4all.nl>
Cc: Shuah Khan <shuah@kernel.org>, David Ahern <dsahern@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Ricardo =?iso-8859-1?Q?B=2E_Marli=E8re?= <ricardo@marliere.net>,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] selftests: pass the timeout override to tests run
 in a netns
Message-ID: <20261123062541.GK10218@Liu-laptop>
References: <20261120-kselftest-run-timer-v2-0-9802690a370b@xs4all.nl>
 <20261120-kselftest-run-timer-v2-1-9802690a370b@xs4all.nl>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261120-kselftest-run-timer-v2-1-9802690a370b@xs4all.nl>

On Fri, Nov 20, 2026 at 06:25:28AM -0500, Jori Koolstra (CIQ) wrote:
> When run_kselftest.sh is invoked with -n, each test is run by in_netns()
> in a new bash process, which sources runner.sh again and then calls
> run_one(). Sourcing runner.sh resets its global settings, which is why
> in_netns() explicitly passes on logfile. kselftest_override_timeout is
> not passed on, so -o/--override-timeout is silently ignored for tests
> that are run in a network namespace and they use the timeout from their
> settings file or the default instead.
> 
> Pass kselftest_override_timeout to the netns shell as well.
> 
> Fixes: 9d0b4ad82d61 ("kselftest/runner.sh: add netns support")
> Signed-off-by: Jori Koolstra (CIQ) <jkoolstra@xs4all.nl>
> ---
>  tools/testing/selftests/kselftest/runner.sh | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tools/testing/selftests/kselftest/runner.sh b/tools/testing/selftests/kselftest/runner.sh
> index 45fb8ec38493..bbb2e61f323c 100644
> --- a/tools/testing/selftests/kselftest/runner.sh
> +++ b/tools/testing/selftests/kselftest/runner.sh
> @@ -169,6 +169,7 @@ in_netns()
>  		BASE_DIR=$BASE_DIR
>  		source $BASE_DIR/kselftest/runner.sh
>  		logfile=$logfile
> +		kselftest_override_timeout=$kselftest_override_timeout
>  		run_one $DIR $TEST
>  	EOF
>  }

Thanks for the fix.

Reviewed-by: Hangbin Liu <liuhangbin@kylinos.cn>
