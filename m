Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B36F013D638
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Feb 2026 14:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770388604; cv=none; b=ZARjcMdIf/S0yWQg+B6qDPfUgxEy4ZnvGR5wnveZ4G05y2oOhRFb7zQEKDRJxoSroC1EofD6DPVHNVDIFHbGqbj/t5lVLYGWsxbF3UQYirOHtoNSqXHveFxqRBQzoUtwmjaTHa0pE72054qD75BBytPbkzg9D85yAqe1BM56d8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770388604; c=relaxed/simple;
	bh=srqCmfI0lmYnxuLhqYXpEOsgsN6lN+17sPJcJsIlxO0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m8eDiETb/kMNIj5PJ5KYMn889TBJGcBmonQ5gT5SCtCPKGK0dNtQh0WW0HLoN+rXiCcXCLbfJYyot9u3pH2vqQlT4B8Xrwe1yEJRbuxcvouYGIhdEyfDq/kFEKZRA4Iv4d/t3zVA/L5EGuvFzriEXkARratgy8zqrnjpzVaYqxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cI3LZSh5; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cI3LZSh5"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-29f102b013fso7747675ad.2
        for <linux-kselftest@vger.kernel.org>; Fri, 06 Feb 2026 06:36:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770388604; x=1770993404; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eDdKS/YOo/C446p8JC5nD/R7yYg0MoRxmTkUkoJ9NZI=;
        b=cI3LZSh5CU5CtZVkc988nVny88KG1njdOEx8XKTg2lxnKckSPAd6L0Zckz1HDGHrMy
         A+lvaSdzxzIoGDrGUJUgyEM2nDmPeRlvtNX/k1hggkV4qVz5qjWzH8+/B+tUvnwlSu7H
         71RnhZGzlwFKStQfaPw5eiVsrcj2IxmvyQQhZq0WeHzSbkX2hxrbAcX+p5tAfb9SlOBf
         QvbX8TQ/WZa/eBgs6hDy3sQW86poZfpJlNPDNqsc/5ajw1jHVV6fvUSoUZKHf0LWi8ws
         Mt1UDTB3Goz0jpJWthPNVoV1/x8nQOWabk9Zj/huP5NGO972r0j+7v8HIBilRKgW3YaK
         1Cyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770388604; x=1770993404;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eDdKS/YOo/C446p8JC5nD/R7yYg0MoRxmTkUkoJ9NZI=;
        b=Mij2NVQPjJOK7ht5OXyX47U2ReiG+vfleN3SQHbX7OSLlGqBjAsPIb4WU8NmkRdn5a
         fO3MUiWWOKUlcj6UzfbYjh2Qx6wxIJKK3YmBH1jMQaZaHqcpz90Tcy3diNBTDPZe5+zT
         ulJukg+qwdl6bYew+JKu7E6/+iEi+hq6YrVqh/iIDIFgGE1I/5pD7qgRj3EyRtejPVtG
         7sAb1JdOpdPMDCZsczfQ18QuD1TJ3AW68KqF/nQDEm5dSKt1nfDj4aNw1qdIb5zc4Pc/
         +gzxp1l//0c77ZJZXoRdDBURKp3rNfQfTAs769NowLKa55cJb7NGFzBP8cWOOWPxSUWz
         yegA==
X-Gm-Message-State: AOJu0YwVHQ0WFhClkdQktcjbjvwCivTdUdGofkmK2X3vdJO4j9d0LGzH
	H9DAHLNydAy5rD5OUj54Is0KTL8PkPpHpHAxC+1O+7lDL9ekT5hVKMmo
X-Gm-Gg: AZuq6aI52lGQDvB2UrTyJXl1aqi/j5NZcySqIb7YhFvyoE546Mgyj359fFnstYGjdjR
	vAB0EzvWvOZingYJQtO8Se7pxdDpNi7QzVSLODM4dr3HS80u+URbkCNaIRoEG1+AxRdwGJ9/ent
	jxYIVzMVz3lSIEEkj46nJdeGeGrRKIp+rMch5K9lVs74d0J+38C/QXrARSjNKceRdF308QIsa5+
	f7H+M6jyjkMf1JywVUsp5E6Ss7oz5Ir8BPgHfp+Ccw6sWFCA4aSRxkMw18hy7xRcpU939czj2hw
	0fSzUqiHYzVp0CU9PECALOdkdNHFezrkoIO1zUfrpbxMpSUejD2VB67CNWP9rYCnROZivm91nHg
	AWWYivAYDB6FOQNyUY28++uWCMnwKsfJlp42zEYdaWapNAR17wbQUGnC4u16oyQFrUCR9nuDu0w
	0xAXZQ/vWE1N/25Vk=
X-Received: by 2002:a17:902:f788:b0:2a0:d431:930 with SMTP id d9443c01a7336-2a95196c9d4mr33606355ad.47.1770388603985;
        Fri, 06 Feb 2026 06:36:43 -0800 (PST)
Received: from fedora ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a951c9cdf1sm23622415ad.41.2026.02.06.06.36.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 06:36:43 -0800 (PST)
Date: Fri, 6 Feb 2026 14:36:38 +0000
From: Hangbin Liu <liuhangbin@gmail.com>
To: Brendan Jackman <jackmanb@google.com>
Cc: linux-kselftest@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
	netdev@vger.kernel.org
Subject: Re: [PATCH selftests] selftests: Use ktap helpers for runner.sh
Message-ID: <aYX8dot4fTh3FJFI@fedora>
References: <20260206081704.53215-1-liuhangbin@gmail.com>
 <DG7TJFKZNG1J.19BZF87IWD3UG@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DG7TJFKZNG1J.19BZF87IWD3UG@google.com>

Hi Brendan,
On Fri, Feb 06, 2026 at 10:48:59AM +0000, Brendan Jackman wrote:
> On Fri Feb 6, 2026 at 8:17 AM UTC, Hangbin Liu wrote:
> > This has been on my todo list for a long time. We should use ktap
> > helpers in runner.sh. I saw Brendan did some work in d9e6269e3303
> > ("selftests/run_kselftest.sh: exit with error if tests fail") to make
> > run_kselftest.sh exit with the correct return value. But we still use a
> > custom solution in runner.sh. Let's convert all the print messages to use
> > formal ktap helpers. Here’s what I changed:
> >
> >   1. Move TAP header from runner.sh to run_kselftest.sh, since run_kselftest.sh
> >      is the only caller of run_many().
> >   2. In run_kselftest.sh, call run_many() in main process to count the
> >      pass/fail numbers.
> >   3. In run_kselftest.sh, do not generate kselftest_failures_file; just
> >      use ktap_print_totals to report the result.
> >   4. In runner.sh run_one(), get the return value and use ktap helpers for
> >      all pass/fail reporting. This allows counting pass/fail numbers in the
> >      main process.
> >   5. In runner.sh run_in_netns(), also return the correct rc, so we can
> >      count results during wait.
> >
> > After the change, the printed result looks like:
> >
> >   not ok 4 4 selftests: clone3: clone3_cap_checkpoint_restore # exit=1
> >   # Totals: pass:3 fail:1 xfail:0 xpass:0 skip:0 error:0
> >
> >   ]# echo $?
> >   1
> 
> Sorry I'm being a bit lazy by not investigating this myself but the
> current intended behaviour is for runner.sh to output correct KTAP,
> right? Could you describe what behavioural changes this is expected to

For runner.sh, I just want to make it using the formal helper in
ktap_helpers.sh other than manually echo.

> bring - does it fix/change the KTAP output? (Or if it's just a cleanup
> with no intended change then please note that in the commit message).

It changes the run_kselftest.sh's output, with a total result. e.g.

# Totals: pass:3 fail:1 xfail:0 xpass:0 skip:0 error:0

> 
> I have not reviewed the code properly yet (I just read enough to check
> that it still does the thing I care about i.e. return an error code when
> something fails). I can do a proper review next week if you add a bit
> more context re the question above though.

Yes, I also care about the return code. This patch doesn't break it.

> 
> > -	wait
> > +	# Handle the return values when running in netns.
> > +	for pid in "${pids[@]}"; do
> > +		wait "$pid"
> > +		rc=$?
> > +		[ "$rc" -eq "$KSFT_PASS" ] && KTAP_CNT_PASS=$((KTAP_CNT_PASS+1))
> > +		[ "$rc" -eq "$KSFT_FAIL" ] && KTAP_CNT_FAIL=$((KTAP_CNT_FAIL+1))
> > +		[ "$rc" -eq "$KSFT_SKIP" ] && KTAP_CNT_SKIP=$((KTAP_CNT_SKIP+1))
> > +		[ "$rc" -eq "$KSFT_XFAIL" ] && KTAP_CNT_XFAIL=$((KTAP_CNT_XFAIL+1))
> 
> These variables don't seeem to have anything to do with KTAP so I think
> they should have a different name prefix. I guess KSFT_*? Or maybe
> RUNNER_* or something.
> 
> Also I guess we should initialise them to 0 so they are still set if no
> tests actually get run?
> 
> Also I think it's probably time to start documenting the
> interface of runner.sh - sorry I probably should have done this when I
> created kselftest_failures_file. Can you add a comment at the top to
> show that these variables are part of the "API"?

These variables are defined in ktap_helpers.sh and used by the ktap helpers.

Thanks
Hangbin
