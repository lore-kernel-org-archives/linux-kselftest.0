Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793617916;
	b=oEgz3mkd3WdOqJ6khBDgkUR93Z1YSQThG84TcEuFSO1WUO3JEBmyOoeJmtanmZlPaIQB
	 tZha0Hr8iALXjbQ6hsGmfW9gkHvTEDrYp7WR+9YiRRHXMaL6TWlcyU3EgTyRDgV+g58kv
	 RME66p8LGMiBbmz/f57ax0Yln+AkMVWfRDdZvoXeFZMELAhzJqKzy15R456uMrAGDRjE8
	 uS0r+CGqRD6VttVfW1GGXFpv+H+TGbYO+XK5a9cpM14Drl6z3UK8OeHsIbW63jifOA4co
	 jwAAYOleE+DotCJK3+8O6zIYOh03rYjxZTLjr4bdGsH595+ZM7+jV4iot0iG2Viy66g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793617916;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:X-ME-Received:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=tQierFXrtdBxsv90Wvr5GLl7ZIg6QP9xO7JbeTEr+Xw=;
	b=JApkbTLWcVe/NUycRWZCT/kjaeB9owYFNnhE0s6CHXzVhXZtqWTtl74qxyScB6nrGF/S
	 fV5Kn/EY1UGeknsdMUoSOTK+FX0rE92bhqUdQwq8O9/m/mF8ueU3YqUXIpoVecHw1fIcH
	 Ap5kO6WMD8Un9/01s3KmhHlccEA3Yz7X17PN05r66r3IMSDgbryJ2qr45BAU3IL73ZdOb
	 u16ETFe98hB0a52zCp8P/bRMmtI8sektqRe4Xrl9bLUQvKf/bWRDn9L3CvxtfLsym09ck
	 tdcFcZKktksdMVO2QFfgxiDw3kSuN0wN7tbhljmeY7UR7/6/eWSzrMuJE09OOW27f2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BFAwBKbw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8936C606A324
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Nov 2026 11:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BFAwBKbw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80A281F00A21;
	Mon,  2 Nov 2026 11:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793617911;
	bh=tQierFXrtdBxsv90Wvr5GLl7ZIg6QP9xO7JbeTEr+Xw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BFAwBKbwGTlz0Mn4enaQSgX8dTUg8pp7VJO7rtcJP9h8ODPemnCLR2eNJMPd38/pI
	 o3ypw45HPEIawjkPWwjC7vpedMr/rhrB556WMYHevVOUGn2DSZqM3XyTdvy9xaafGs
	 d+/SQtsBFnDZzf2np20BbCeTeaBHQValygZuXcE0jqxRoGvyrwoaqpftP2ml8O9MU/
	 0HATVm85QPYzXDyRzMncrpNRNw91wJIj2+fA+lGi97MgKvO2KPKjh0YegXTGOM4QlH
	 zeFv0Pn0ofxsDPqODF/sKmuouK59j9ZhHiStG+T3gwfGMbUvELpg99pmqo5mqiQtDr
	 OUMAd/jT7HUPw==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.ams.internal (Postfix) with ESMTP id 7A9A5198003A;
	Mon,  2 Nov 2026 06:11:47 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Mon, 02 Nov 2026 06:11:48 -0500
X-ME-Sender: <xms:8m_oap1pn22irz7gCc14BXj8OEqUpwx3JaQztnNOC7KHO2BMy333Eg>
    <xme:8m_oao2hpwX1d8FZPJSOjgh5MInTWJxHlbjIquzEsa5ouO7aByPoj37Jp-SCbE9ou
    Nx7vfKB-Oa4pHtVAHO_eH4WUmfTl6goBh_HywHjHO3FzyOQfPRy7n98>
X-ME-Received: <xmr:8m_oaomWH4ItRcaBeR3WStFTWfJK0mu8lLjdJPwJHfA2OBb4biLzLTw2OPw>
X-ME-Proxy-Cause: dmFkZTEK1+02a4zp88u4Tj7j1xR++eJHRcOeZsjArkkCuSqZTrG8QN3et3PJ5Yhpp8JgOy
    tSOq45tZMVN3zAAAPAjPYdiYp4+PM3U5Ilw/Pvtw7Ftx3GpE/TzxD++/NwBVjZwRlAofk7
    pgG6siSuYHP+MNHzb/HomkI1yVPL+oawmIR9pZi9gWP0otMusCPkQ232d0l/98yOZyjaO8
    HCSiHgy4dMxZTYLPkGusk7UMm8k5Wt2nCqc9q31PZ/V6ihq/eUyqlvPexGPv0hMZ1E+YGx
    sYu7Zoyhe+tajg6s4E3RIIUMBh/H9WcY7aPjBvRgJ+f/iJ4hRlMvNuh74OMKCJAds2lDaw
    LuHKwEP2phflf9q4kE1iwNJtNjh7Mpe/RdmadkWMkn6nU+Wb0hAdhkVdLAVbDQIOIPTSkB
    lKxK3Thu7rQlxOUPlh1jbY0wFMZNQpWVLZO8yoh/UobjpsE+YBH8Gm+QCT+dRaiS+FcvdP
    zkcv0QSHR1X6YeFjlgRImzCdCwdeFLmZAWzMlz59bkHguqNYREG58mLEZ2yCI5P0Fx7ld7
    0oN+qmyXHVQTlWvextupVYS/txj5aUgCi95wcxQcH7qyY2K7M8bHoBgwfMTdb5Rjozx/jc
    qNE9yUW3AJqwqBNA5BKKdk/cxyRYVf8/3eXZjLEoHkP9zWRSitoidzhZiOeA
X-ME-Proxy: <xmx:8m_oapPFGL__hvcoMqMzBnRZ-INyOEygljbY6EiycThk6Y0F6l6DsQ>
    <xmx:8m_oav7wSNhrP83Arz50u-l3HyYq7VbGbdKXaWdvfmj4GLR7kpXEOg>
    <xmx:8m_oas2GsREdtezfri6lt-3yakSD4672zKA1Jdet-JKU7ZBgwJBZWQ>
    <xmx:8m_oatqcVCgLulftk8UoOuP943tkcFU81X7byj4o9pPXmFkdhPVZtQ>
    <xmx:82_oamkCzupz1ocn0mSfB1WUaZPNn8heBXCkh_JvDXLF73A7bEu48WfY>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 2 Nov 2026 06:11:46 -0500 (EST)
Date: Mon, 2 Nov 2026 11:11:45 +0000
From: Kiryl Shutsemau <kas@kernel.org>
To: Muhammad Mahdi Amirpour <ampr.mhd@gmail.com>
Cc: akpm@linux-foundation.org, david@kernel.org, shuah@kernel.org, 
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	yeoreum.yun@arm.com, ziy@nvidia.com
Subject: Re: [PATCH] selftests/mm: handle child status safely in khugepaged
Message-ID: <auhvkuDO8cP9Pip4@thinkstation>
References: <20261030215841.229969-1-ampr.mhd@gmail.com>
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
In-Reply-To: <20261030215841.229969-1-ampr.mhd@gmail.com>

On Sat, Oct 31, 2026 at 01:28:41AM +0330, Muhammad Mahdi Amirpour wrote:
> The khugepaged selftest reports child exit status through a shared
> variable without checking that the child actually ran to completion.
> When fork() fails or the child is killed by a signal, the status is
> undefined and the test can report a false pass.
> 
> Capture the waitpid() result and distinguish normal exit, signal
> death, and fork failure before interpreting the status. Report the
> child's actual termination cause in the TAP output so failures are
> visible rather than silently masked.

The bug is real: for a child killed by a signal WEXITSTATUS() is 0,
which is KSFT_PASS. The parent goes on with its own checks and reports
ok, so a child that crashes in the middle of the collapse goes unnoticed.

The description doesn't match it, though. The status comes from wait(),
not from a shared variable. For a killed child it is not undefined, it
is a pass. And the patch doesn't report the termination cause anywhere.
Maybe something like:

  collapse_fork(), collapse_fork_compound() and
  collapse_max_ptes_shared() take the child's result from WEXITSTATUS()
  without checking WIFEXITED(). For a child killed by a signal
  WEXITSTATUS() is 0, which is KSFT_PASS: the parent runs its own checks
  and the test reports ok even though the child crashed.

  Fail the test when the child did not exit normally, and print the
  signal that killed it. Also fail it when fork() fails, instead of
  reading an uninitialised status.

It came with bd212a7dbdb1 ("kselftest: mm: return fail when child test
result is fail in khugepaged"), so a Fixes: tag would be good.

> +     exit_status = WIFEXITED(wstatus) ? WEXITSTATUS(wstatus) : KSFT_FAIL;

A child that dies in the middle of a step leaves the progress line open,
and the "not ok" line ends up on the "# ..." comment. Could you call
fail() with the signal number here?

> +     while (waitpid(pid, &wstatus, 0) == -1) {
> +             if (errno == EINTR)
> +                     continue;
> +
> +             fail("waitpid() failed");
> +             goto out;
> +     }

The test installs no signal handlers, so waitpid() cannot return EINTR,
and it has no other way to fail for our own child. A plain waitpid() is
enough.

The same check is now open-coded three times, four with
collapse_fork_cow_race(). A helper that takes wstatus, prints the signal
and returns the KSFT status would cover all of them.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
