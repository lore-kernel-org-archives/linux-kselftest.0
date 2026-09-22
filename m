Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 064EB4F7CA4;
	Tue, 22 Sep 2026 07:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790060971; cv=none; b=lnVlL8MjYF1p45C8deSw6sHp0GFJDjColPwzxw84q/yeMpOE4Pdcm8haqDj5Mos1XhhcOXJAMIvAnAXqI7DZ1ldQJVaGVCvAZjyu0oSl4sMkObWropDm+5AiUU8NpccUHbj4m1fsbLaTK8S+9Kpz8xy3A5gAoWj4Ra4GnlrjmoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790060971; c=relaxed/simple;
	bh=X2elJjOWX+I6p0hkyb//O2VmgJU8aZwYp3GER8YVCRQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NI/ZMZNy9Nn7YejpKLFqotcT6puyQpBBOXTa3TYOTLUAr8GiJgcCSvYnyq5ku1clLsegRM36DCpx0aLDzfOuIrvoNSy/H3TQqbThMBnS13M1OZjhp6Vp71jCO+Qt1kJ+lKXfOfX45G1Vw/DICaF9Z9O50gKCwazSTaTw/veuUWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=FtxLmGoW; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="FtxLmGoW"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4FE1D1476;
	Tue, 22 Sep 2026 00:09:25 -0700 (PDT)
Received: from [10.164.19.84] (a081061.arm.com [10.164.19.84])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E57CE3F528;
	Tue, 22 Sep 2026 00:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790060968; bh=X2elJjOWX+I6p0hkyb//O2VmgJU8aZwYp3GER8YVCRQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FtxLmGoWO8aL//MyFM2NR6VNOmEyr2TmdtJY8DnZSFG0+8YvHYjUp35bg/UOxlhK9
	 JFpg4usURYN6gUMNLnUjxV32IdrKQLjslmdts2//QkfNANa4WIlue6KyW4G14mkAC3
	 vMlXXzh4ouDVIMQNNNipuDWCpX4HibahJYp8rWpY=
Message-ID: <2e0a8157-a529-4355-bd7e-11ef0234b825@arm.com>
Date: Tue, 22 Sep 2026 12:39:24 +0530
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/mm: mremap_test: handle ENOSYS for userfaultfd
 and add missing newlines
To: Park Tae-sun <ts930@dgu.ac.kr>, Andrew Morton
 <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260922065143.118702-1-ts930@dgu.ac.kr>
Content-Language: en-US
From: Sarthak Sharma <sarthak.sharma@arm.com>
In-Reply-To: <20260922065143.118702-1-ts930@dgu.ac.kr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Park Tae-sun!

On 9/22/26 12:21 PM, Park Tae-sun wrote:
> When running mremap_test on a kernel built without CONFIG_USERFAULTFD,
> test 26 fails:
> 
>     userfaultfd: Function not implemented
>     not ok 26 mremap move multiple invalid vmas
> 
> This happens because mremap_move_multi_invalid_vmas() only checks for
> EPERM, so ENOSYS is treated as an unexpected failure instead of being
> skipped.
> 
> In addition, ksft_test_result_skip() in both
> mremap_move_multi_invalid_vmas() and its fallback stub is missing a
> trailing newline, which causes the subsequent TAP summary count to get
> stuck on the same line:
> 
>     ok 26 # SKIP ... - missing uffd# 1 skipped test(s) detected...
> 
> Fix this following the switch pattern in guard-regions.c (lines 1498-1506):
> check for EPERM (advising running as root) and ENOSYS (missing uffd), move
> perror() to default so expected skips don't print noise to stderr, and add
> the missing '\n' to both skip strings.

Thanks for the fix, but I have posted a series of patches already [1]
which include skipping incase of ENOSYS and fixing the newline issue in
ksft_test_result_skip(). If it is okay with you, can we go ahead with my
patches since it solves some other issues as well?

[1]
https://lore.kernel.org/all/20260917111951.188266-1-sarthak.sharma@arm.com/
