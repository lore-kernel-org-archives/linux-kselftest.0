Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE0CF30FF1D;
	Tue,  7 Jul 2026 21:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783459397; cv=none; b=OMKDATUFzjo16XwYlVbbZYtVoqrVFNFt2/aC/JuT49Uih5pMsaYDu30hRtcron6CMlA/viaIBrn4Kv53pinyLL1y7BEcgir2fFGdwU7FFzw74yjnT/ynpUd/98RX63cKnqwIySr09MkmcoEWMyL61wEi41vxFsaAA1CsY1vHWqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783459397; c=relaxed/simple;
	bh=UAAblJYgPQxI6A+XKos9mrQtF17LsoV5+yf5dyno1d4=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=BRUbxmaL1jr9tRkRUgUwwxrsntczNPPA6Xnyuc/bPxq+FNFy1l2LHoHbcSdX9IaPnqtlLJF+/Gf8cWPOkVpjpAVrtj9U5sPurukHwfutlGJmqGD/CYh3FWl3xWxgRuYfF3zwg74DPgahXLWTUZM3Xpx8JdKVyWhmiViOaJpNuXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=MhTUMPx8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="MhTUMPx8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B0461F000E9;
	Tue,  7 Jul 2026 21:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1783459395;
	bh=PRzd80y0ws0+Q0zWRglAwGcH32IHJNJNmc8s9zz7a3k=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=MhTUMPx8rbjt0YlsDVrtU/D0BdrszyaWBtjB0J9y7amzbmpLZ9RA+prqqCW4M55+C
	 tC9e/ljrVS/EKkjpW6vP2tI145aVESuwLaSzltE7+GDW0jcgikUDZrERFMm3MaWoTb
	 fDUjKIFy/Pge1Ck9mCMV9sMK/+0DP+C6avownUEU=
Date: Tue, 7 Jul 2026 14:23:14 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: =?UTF-8?B?546L57+K5ZiJ?= <wangyijia.yeah@bytedance.com>
Cc: <linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-mm@kvack.org>, <muchun.song@linux.dev>, <shuah@kernel.org>
Subject: Re: [PATCH RESEND v3] selftests: mincore: fix the readahead check
 on large base page sizes
Message-Id: <20260707142314.a421d05c05da56260d1bf085@linux-foundation.org>
In-Reply-To: <20260707062505.3171552-1-wangyijia.yeah@bytedance.com>
References: <20260704203616.1ce10365e07c746f1e805cab@linux-foundation.org>
	<20260707062505.3171552-1-wangyijia.yeah@bytedance.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Tue,  7 Jul 2026 14:25:05 +0800 王翊嘉 <wangyijia.yeah@bytedance.com> wrote:

> On Sat, Jul 04, 2026 at 08:36:16PM -0700, Andrew Morton wrote:
> > I'm not sure this is a good thing for us to be self-testing for.  It's
> > poking pretty deeply inside the internal implementations of
> > kernel-of-the-moment.
> >
> > Oh well, I guss if the test suddenly starts reporting errors, it might
> > be something we want to look into.
> >
> > Thanks.  AI review might have found a couple of things of interest:
> >       https://sashiko.dev/#/patchset/20260703125253.3016281-1-wangyijia.yeah@bytedance.com
> 
> Thanks for taking a look.
> 
> After thinking more about your concern, I agree that teaching this
> selftest how to compute the expected readahead window from sysfs
> read_ahead_kb is probably not the right direction. The failure is related
> to mmap read-around behaviour, but adding that policy knowledge to the
> test makes it depend even more on implementation details.
> 
> The actual failure I was trying to fix is narrower. The existing test
> already expects a neighbouring page to become resident after faulting the
> middle of the mapping, but it only scans after the faulted page. On the
> 64K-page arm64 system where I reproduced this, with the default 128K
> read_ahead_kb setting, the file-backed mmap fault on page 32 makes pages
> 31 and 32 resident. The original test scans from page 33 onwards, misses
> the resident neighbour at page 31, and reports ra_pages == 0.
> 
> I tested a smaller version which drops the readahead_window_pages()
> helper and the new skip logic, and only changes the existing check to
> scan both sides of the faulted page. On the same 64K-page system, the
> original test fails reliably, while that smaller change passes. So the
> sysfs/read_ahead_kb logic does not appear to be needed to fix the 64K
> failure.
> 
> I am thinking of sending a v4 in that direction: keep the existing
> EXPECT_GT(ra_pages, 0) check, but make it count resident neighbouring
> pages on both sides of the faulted page, without trying to compute the
> expected readahead window in the test.
> 
> The other possible direction is to remove the readahead assertion from
> check_file_mmap entirely, similar to the tmpfs case, and only verify that
> the faulted page itself becomes resident. That would avoid testing this
> implementation detail, but it would also drop the existing coverage.
> 
> Would you prefer one of these approaches?

The second approach sounds saner.  I'm not sure this test is overall
very useful, really.  But it's harmless as long as it isn't causing
these spurious issues!
