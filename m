Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 886864F85CC;
	Mon, 19 Oct 2026 13:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792417968; cv=none; b=AVjQ+S7Irk8gClLrdmM4nmhk1t7ppNyidbttVbjcl4ZPyYMdeh0cn/IzIol5HVdRVuhSAMpu6nIC8iTZ27p0b8rHnYkT9PgkVypnQKDmg2Q30SoxTNm74ZZGF8rdXNTx4Sk3v0OeSOUUFEvc6LK6FcFo2lCC67ZjF6pYE+Qxwzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792417968; c=relaxed/simple;
	bh=UZd3+7Sz2K2tpPdVqkzPg7GAIgTpN7PEKpeBlkHrT3w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U1/qUdyZphGwHPKwiEKEFXIcRjdr2mMZ+bdOmmLBWgUPBbDMj5+KtxAihHQQRjZsWrAaqZLfZIENDCTI8q+VUYMbb2kQ0v7jDl6e1vZJ4MyUdm0wtCLUGGlR9N2GzUkj0eT97NtpW6iPz7vOr7D6fQ/WNrLka/cRlrp9nL0YYAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l7EUbFqc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l7EUbFqc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AFB81F000C4;
	Mon, 19 Oct 2026 13:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792417967;
	bh=l9bSlYKhNusONtpe/ntZh5k1VKWpXkJkxTvQbX0UK3o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=l7EUbFqcyWm4e7ptbtN/i/L9m+cg/xSsSWjxJKMp4HYTOz1CTTDXWrEWfY9urWcPg
	 M9WI5LgV0DlHaEO4zwOI4P6ZH8Xx20yMLp2LOBuGK9a4dQWQ4wL6/Ukwt2sXLtKv6B
	 qKrw7/L6NdyQG0xZV9+yTu0L5RCu6aYrZjp5EZp2/6jAGnWCt467KM/EZE6foMP+IF
	 JZXG6FEwSDgWmzMPaVIJws9GHR2Gj9NKhjmuT/xJAiKfbYj+odGxnXbIREkul3oGiR
	 zbhoR3T3qyJtlsHG/VeV2QNGMeSYjziuFAPqeoboffglVFS2+B0MUhAG8T8SLjjA/f
	 StZ9hW6niwUQQ==
Date: Mon, 19 Oct 2026 16:52:37 +0300
From: Mike Rapoport <rppt@kernel.org>
To: "Ning, Hongyu" <hongyu.ning@linux.intel.com>
Cc: x86@kernel.org, shuah@kernel.org, rick.p.edgecombe@intel.com,
	tglx@kernel.org, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, hpa@zytor.com, ljs@kernel.org,
	akpm@linux-foundation.org, david@kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	hongyu.ning@intel.com, jolsa@kernel.org, dwindsor@gmail.com
Subject: Re: [PATCH] selftests/x86: Fix userfaultfd test for shadow stack
 rejection
Message-ID: <atYgpbjclZJDSRbJ@kernel.org>
References: <3b3e0a35-e664-40ab-84ad-afa3e31e3aea@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3b3e0a35-e664-40ab-84ad-afa3e31e3aea@linux.intel.com>

On Mon, Oct 19, 2026 at 09:03:12AM +0800, Ning, Hongyu wrote:
> Commit 3c58f641e813 ("userfaultfd: prevent registration of special
> VMAs") prevents userfaultfd registration on shadow stack VMAs to avoid
> bypassing shadow stack protections through UFFDIO_COPY.
> 
> The existing shadow stack selftest still expects UFFDIO_REGISTER to
> succeed and uses UFFDIO_COPY to populate the shadow stack. This causes
> the selftest to fail on Kernels containing this security fix.
> 
> Update the selftest to verify that UFFDIO_REGISTER rejects shadow stack
> VMAs with EINVAL. Remove the obsolete userfaultfd fault handling thread
> and UFFDIO_COPY test path.
> 
> Tested on: Intel shadow stack capable x86_64 platform
> 
> Before fix:
> 	[FAIL]  Userfaultfd test with return code 1
> 
> After fix:
> 	[OK]    Userfaultfd rejects shadow stack registration (EINVAL)
> 
> Fixes: 3c58f641e813 ("userfaultfd: prevent registration of special VMAs")
> 
> Signed-off-by: Hongyu Ning <hongyu.ning@linux.intel.com>

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

> ChatGPT was used to assist with root-cause analysis and patch
> preparation. The changes were reviewed and validated on Intel shadow
> stack capable x86_64 platform, with all 12 shadow stack tests passing.
> ---
>  .../testing/selftests/x86/test_shadow_stack.c | 105 ++++++------------
>  1 file changed, 34 insertions(+), 71 deletions(-)

-- 
Sincerely yours,
Mike.
