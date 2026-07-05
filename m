Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C2623EA66;
	Sun,  5 Jul 2026 03:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783222578; cv=none; b=ovPNxbmqev78Q+nPt+Fcexx74OCfBNzPAJTG8hr3m8JKiY3YB9KZOxsd7nYbt/NTl/0mEhluloZbZV5jshn9m58acxaKwYEt1CRIhPBqygZ6bU1zOJU02O7UE5ijvk2PtUwFe14LZt1z0XQ9jVvbYN7NgWFimscY07Azv1DmyC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783222578; c=relaxed/simple;
	bh=cSXRHZ/mVG7DA3h4SeHE4Oml6SIucx1bV7ldnR6p+6w=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=LlF8LQI01wRvZTWpMoov8IilGg3/Iseh2bqWoolVxy9ru6fgkyk7ZyIvxqvEtjuRmdJ7D8ghNnDNit4UhlrQSIXu++GRGDSIS3+A3c31ktLOAJTiGa6pCafpkWgVbzjDybrOk/SRRq093tBSUvYdiyoLgOg/qrEZj8Dakvu1lFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=YBUQTjDh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="YBUQTjDh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67F941F000E9;
	Sun,  5 Jul 2026 03:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1783222576;
	bh=yaQSA+c0eA23eljol+15gGGuS4n86bu1Vd0UOzc/IDQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=YBUQTjDhhzOUeupzNOcNLQVaV7ok5XNKQiPZmnd7dn1uC12tIQhuww1Dr7hrZyusQ
	 CP3M8KaSQ4YSlvfi3+ONT4YcWNwH3Ptk3q5sVLSOTZIRqvufJH5CiL4SFV3X6UoYF0
	 3qprjiMzvfHQHPQgcEMHSZx8v0qYZCI5acxY6kxY=
Date: Sat, 4 Jul 2026 20:36:16 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: "Yijia Wang" <wangyijia.yeah@bytedance.com>
Cc: "Shuah Khan" <shuah@kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>, "Muchun Song"
 <muchun.song@linux.dev>
Subject: Re: [PATCH RESEND v3] selftests: mincore: fix the readahead check
 on large base page sizes
Message-Id: <20260704203616.1ce10365e07c746f1e805cab@linux-foundation.org>
In-Reply-To: <20260703125253.3016281-1-wangyijia.yeah@bytedance.com>
References: <20260703125253.3016281-1-wangyijia.yeah@bytedance.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri,  3 Jul 2026 20:52:53 +0800 "Yijia Wang" <wangyijia.yeah@bytedance.com> wrote:

> check_file_mmap faults a page in the middle of a file mapping and
> expects the readahead window to have populated further pages *after*
> it. With a large base page size this is wrong and the test fails
> reliably, e.g. on arm64 with 64K pages:
> 
>   # mincore_selftest.c:260:check_file_mmap:Expected ra_pages (0) > 0 (0)
>   # mincore_selftest.c:261:check_file_mmap:No read-ahead pages found in memory
>   not ok 4 global.check_file_mmap

I'm not sure this is a good thing for us to be self-testing for.  It's
poking pretty deeply inside the internal implementations of
kernel-of-the-moment.

Oh well, I guss if the test suddenly starts reporting errors, it might
be something we want to look into.

> The read-around window is read_ahead_kb / page_size pages wide and is
> centred on the faulting page (mm/filemap.c):
> 
>   ra->start = max(0, pgoff - ra_pages / 2)
> 
> With the default 128K budget that is 32 pages on 4K but only 2 pages on
> 64K, so the window becomes [pgoff-1, pgoff] and the single extra page
> lands *before* the faulted page. The forward-only scan finds nothing.
> This is not a huge-page (THP) effect; it is just a byte-sized readahead
> budget divided by a large page size plus a fault-centred window.
> 
> Count readahead pages on both sides of the faulted page, and skip the
> readahead check up front when there is no usable read-around window:
> either it is narrower than two pages (readahead disabled, or the base
> page size so large that read_ahead_kb covers a single page), or the file
> has no backing block device whose read_ahead_kb can be read (e.g. on
> tmpfs). When the window is wide enough the EXPECT_GT(ra_pages, 0)
> assertion is kept, so a kernel that should read ahead but does not is
> still caught.

Thanks.  AI review might have found a couple of things of interest:
	https://sashiko.dev/#/patchset/20260703125253.3016281-1-wangyijia.yeah@bytedance.com


