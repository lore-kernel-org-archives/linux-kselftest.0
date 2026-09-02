Received: from mta0.migadu.com (out-21.mta0.migadu.com [91.218.175.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF85249EB
	for <linux-kselftest@vger.kernel.org>; Wed,  2 Sep 2026 06:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788330137; cv=none; b=JU23WC3KbOL+RfbWTF90l/AAMMGS/O6Z/mCOH8jKRDRhAX9KeWCo8MoT8XJW6Jo77iquVIY7nSaAcitWFEW4RWuQrQUYdYfF3b+UL5I271vHDEP4kMaWDYqRxgE1d/TDkQTDTMBHVr8ESdZxnKp9UxUqryTZxjVvNZw97uAm07w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788330137; c=relaxed/simple;
	bh=AEK06sHlEp3Qufm7pFG5OliZbCUDATzmIuqnGIqh3ME=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rWyByWm5DHh4EuBmS1vWxB2EzjqsjotAxmv9NPa8SLuwJvyjWeMr3eSvJMA4wayHDtTFXDG/MA49muITjZGrhJmOpNCEZSCjRBu0pvUC8px0gFanpwV3wXkGQ6xuA7N7N/2CscZItfFAtBQFqikdtnSeS4HBdlVdxj8s1sXPUxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=vDIFFwV6; arc=none smtp.client-ip=91.218.175.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="vDIFFwV6"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=AEK06sHlEp3Qufm7pFG5OliZbCUDATzmIuqnGIqh3ME=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788330131; v=1; x=1788934931;
 b=vDIFFwV62n/5OW+m+S37jGoJjzrM+4SXuB+HCyOmvcP09SOm1wvxemM4X6bHIJH9Itpa78Hf
 VrbHoNf6txxduX/iyhb05glGBR42HQruxT8tJFW7ryeG2Mhv0uHJMtw9mLPVU7yj6ENOHbYdmlF
 kcb2JoQqKrPPWGyBflo/lQeA=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 493ee8313759c530;
	Wed, 02 Sep 2026 06:22:11 +0000
X-Mizu-Trace-ID: 493ee8313759c530
X-Migadu-Flow: FLOW_OUT
Date: Wed, 2 Sep 2026 14:22:04 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: Qianheng Peng <pengqh1@chinatelecom.cn>
Cc: broonie@kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, liuhangbin@gmail.com, rbm@suse.com,
	shuah@kernel.org, skhan@linuxfoundation.org
Subject: Re: [PATCH] selftests: runner.sh: avoid overriding
 kselftest_cmd_args with empty variable
Message-ID: <apfAjBBaSG6Bs2M9@fedora>
References: <apd8mqEoyk8_O8ar@fedora>
 <20260902030542.532572-1-pengqh1@chinatelecom.cn>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260902030542.532572-1-pengqh1@chinatelecom.cn>

Hi Qianheng,
On Wed, Sep 02, 2026 at 11:05:42AM +0800, Qianheng Peng wrote:
> >Oh, I see what you mean now.
> >
> >	kselftest_cmd_args_ref="KSELFTEST_${BASENAME_SANITIZED}_ARGS"
> >
> >This is used to retrieve parameters for a *specific* test. When a test does not
> >require extra parameters, `KSELFTEST_${BASENAME_SANITIZED}_ARGS` is not set.
> >This has the same effect as when a user exports it but does not assign a value.
> >
> >Therefore, I do not think we need to add a check for this case. Users should
> >understand the semantics when exporting the `KSELFTEST_${BASENAME_SANITIZED}_ARGS`
> >variable.
> >
> >Thanks
> >Hangbin
> 
> Yes, if just only adding a check, that really makes no sense.
> But there is a issue for the follow case:
> ---------------------------------------------------------------------------
> User wrote "cmd_args=nice_value" in settings file and want to use the
> `nice_value` as arguments for a test program.So the user didn't need to
> export something like `KSELFTEST_XXXX_ARGS` because kselftest_cmd_args should
> get the `nice_value` as we can see
> 
>     eval "kselftest_$field"="$value"

AFAIK, the setting file is usually used for setting timeout value. As
you can see in runner.sh, it checks kselftest_timeout after reading setting
file.

> But in current runner.sh, kselftest_cmd_args has always been set up by
> `KSELFTEST_XXXX_ARGS` as we can see
> 
>     kselftest_cmd_args_ref="KSELFTEST_${BASENAME_SANITIZED}_ARGS"
>     eval kselftest_cmd_args="\$${kselftest_cmd_args_ref:-}"
> 
> As `KSELFTEST_XXXX_ARGS` was empty, the user unexpectedly lost `nice_value`
> written in settings file.
> ---------------------------------------------------------------------------
> 
> According to the implement of runner.sh, it may want to give users two choices:
> 1) using arguments in settings file

I’m not sure if this was the original intention. The configuration file
lives under the test directory, which typically holds multiple tests.
What if individual tests require different parameters? How would you
supply distinct arguments in the config file using only a single
`cmd_args` variable?

> 2) or using arguments by export `KSELFTEST_${BASENAME_SANITIZED}_ARGS`
> But now users has been forced to use `KSELFTEST_${BASENAME_SANITIZED}_ARGS`.

In contrast, `KSELFTEST_${BASENAME_SANITIZED}_ARGS` can target each specific
test case individually.

Perhaps I have misunderstood the design. Please feel free to correct me.

Thanks
Hangbin
> 
> For the case above and making users happy, I did two things in the patch:
> 1) If `KSELFTEST_${BASENAME_SANITIZED}_ARGS was empty, keep the value from settings file
> 2) If not, set kselftest_cmd_args by `KSELFTEST_${BASENAME_SANITIZED}_ARGS` 
> 
> Thanks and regards,
> Qianheng
