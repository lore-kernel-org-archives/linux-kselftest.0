Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F8733688A
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Mar 2026 01:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772675771; cv=none; b=mbYoO5LzVnuKuWQrf2+vTgtnvGSLEJ9V6CTJEAaOPJUj2LgcYPnGywV2fvW5gfk2oQyUEcyUMJfpA3B9CDJVXreiLDc2bBfY7hVfoD3dkK9FRCTMI3aes7Bw1kuihFWT59zv8e4z409O5KrZ1dCcJ0gApEzFrjqIhlDe1ZsFQnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772675771; c=relaxed/simple;
	bh=IXGyvNUbtHNwWlO779yACClXsPwAOkeZHizYbHOl/5E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=czgYIp2LSl0sbrIdPXGsUMNxPWXXb5XGHPxnIw/PdjVSApuhO7Y5gbECS4IzdsQC7wHWdQPg9gAiCx2vYsbiRsmxW46J9ZS9qSm+XPZmAmOeba8FxTfn9nS6VAY7mEyPvsFKyq3dpTqqp2V7AOdUvd9Qtw+NqimMCjgyxxrceBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cnWaeW7f; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cnWaeW7f"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3590042fa8eso4511090a91.1
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Mar 2026 17:56:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772675769; x=1773280569; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+qfkgX7v8ytZV4SKpMC2pGAv+ee613FIPLowmgLLAh8=;
        b=cnWaeW7f1Q4ZpEv39mswZnkvAeoPDeYRl5fDf/TKmXmBpviXO54ki9PS9QTZwOMJu9
         2rOZLAW95zhnwrWfICONt/2kqcVPEoFv0YW37pa9mqvdXFMj2IG9jZLxJFqKF3wq0yEs
         bhnLcgEKo60TrPbpArmIfpUO+Mi8hlahhZED1mROUiTGULv9BFvRDLYAWPl7EP8ve6D9
         c9+UnqDwsv8q/j0RKVBK6NyrQNF774SEKz790FYnd+Sq513QqWS791rxhMtMuw+bnwwh
         u/PUo94kHKP4RhS3nQucFuD8q1/TBA8ooyiPkXZYT1yEY5DigGx/7g5d0N+asd+FUgrd
         L1UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772675769; x=1773280569;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+qfkgX7v8ytZV4SKpMC2pGAv+ee613FIPLowmgLLAh8=;
        b=ezR0w7YY5LOjg5SkkFm1c99J2NjTRPVNogq31P1ZxHGdLg25+mw7w2npkxf/bNP0k+
         fxORW+LP9SOV0lYBgaIe7wucYvdGuiD4YraKTkfXUSu464g/YsEydEdJ5WrxJwYQuwp/
         GGkvcoyhc7KNNSiV16Iachi/XA5bwvIGR5ntsBsv0f1yV0E/42We7boQIi0CFf5Yv3Vc
         0nGkWlPwKgbFw2MaTCz9tu80gzSWPKabCR8fkdXkcqbRpBbcp9GI9dtkWAX6Y0JJfYCP
         H46i9SYPXD4jYj6ngl5XwrJAS+y31FM6nP0Czorq0/avf9JGmSfeQU3vCF9MXMEhQ71F
         eq1A==
X-Gm-Message-State: AOJu0YwygUTwNnM28faI/Su6Go08j0r5y77UIZSCwvKEmJhFXnBWej8h
	YUiOwkQcdu2y+0ktXWSZ2J494Sx/8Q/OkYssfGZdfj4qqgHCiEVYs5/v
X-Gm-Gg: ATEYQzxx+h2IE3dfeS6g47hZqMHAnsI5I76J92DOuZJc9CpADTZzm9RnjS6QqhFasaQ
	2mLLS4RLjzUuF99gu8TZmwfegVobM5lrlpjOyW/KUAYQ+cEiYKYO8zRKkEeTVEmXXid6vI/mXL8
	ui9V6j+f6M+upX2ZsKkchmBFFOfRvgCmKJYYX1cGonQNNW1KSP+bvk//kuutYjxjJ0vjQTIv88r
	qG5oxNKrB2jqyeEc1PSnnVi7055Aj09UXWv9Z65eWgsXp+QNP3RN/8hqYpBJXB//deeg38igxEi
	qMxdu9jUizZEFfbGcW7b2c0UVNcLRHAafqZuH/2g7TIVX/z9lv8F8wUmGhNupQFwynfU0RpAt8s
	5YdrfFCaqcRzYwC4Tez6J3L8Bl00ELZW76zvINJsccOyEnMhyHRVjn6PP2xP6ILHryhvr8xASy3
	liST/6QHkuGHir0NgbBSKSY2+a0vo=
X-Received: by 2002:a17:90b:2e45:b0:341:c964:126c with SMTP id 98e67ed59e1d1-359a6a9faa4mr3568604a91.34.1772675768978;
        Wed, 04 Mar 2026 17:56:08 -0800 (PST)
Received: from fedora ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359b2d6f0eesm199072a91.15.2026.03.04.17.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 17:56:07 -0800 (PST)
Date: Thu, 5 Mar 2026 01:56:02 +0000
From: Hangbin Liu <liuhangbin@gmail.com>
To: Shuah Khan <shuah@kernel.org>
Cc: linux-kselftest@vger.kernel.org, Brendan Jackman <jackmanb@google.com>,
	netdev@vger.kernel.org
Subject: Re: [PATCHv3] selftests: Use ktap helpers for runner.sh
Message-ID: <aajisr9n2pInS7jm@fedora>
References: <20260225010833.11301-1-liuhangbin@gmail.com>
 <DGO2DAIFY07Y.367VMZA7XGT4U@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DGO2DAIFY07Y.367VMZA7XGT4U@google.com>

Hi Shuah,

Is there anything else I need to do to move this patch forward?

Thanks
Hangbin
On Wed, Feb 25, 2026 at 01:06:47PM +0000, Brendan Jackman wrote:
> On Wed Feb 25, 2026 at 1:08 AM UTC, Hangbin Liu wrote:
> > Instead of manually writing ktap messages, we should use the formal
> > ktap helpers in runner.sh. Brendan did some work in d9e6269e3303
> > ("selftests/run_kselftest.sh: exit with error if tests fail") to make
> > run_kselftest.sh exit with the correct return value. However, the output
> > does not include the total results, such as how many tests passed or failed.
> >
> > Let’s convert all manually printed messages in runner.sh to use the
> > formal ktap helpers. Here are what I changed:
> >
> >   1. Move TAP header from runner.sh to run_kselftest.sh, since run_kselftest.sh
> >      is the only caller of run_many().
> >   2. In run_kselftest.sh, call run_many() in main process to count the
> >      pass/fail numbers.
> >   3. In run_kselftest.sh, do not generate kselftest_failures_file. Just
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
> >
> > Tested-by: Brendan Jackman <jackmanb@google.com>
> 
> Thanks,
> 
> Reviewed-by: Brendan Jackman <jackmanb@google.com>
