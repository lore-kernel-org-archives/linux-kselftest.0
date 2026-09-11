Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1506B47A87A;
	Fri, 11 Sep 2026 13:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789131727; cv=none; b=Kp06FSFSNCbDV0KIrDjBssk5q51ORXZ1xd1xWutGW2BwdXpt1fMPrg1cjeFneEBc4ENsrk8wLwIQM+NCMys7nOiEKYRbXZDiSBSt9OcJHpIAdvJ476dE7O5jRA6mqjW/Ywh143wLWRRwwPH++RDbqA9nznii/XGa7g18VlPr9Gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789131727; c=relaxed/simple;
	bh=D8y/ChwnezgHRy5dWL1VmFVporLU0EQ9XInyedfH35o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YdffQ78MrvhCzNkp2+su/E6XD0akaOFTEptyp8T01rNHZ58tcwEabJFSd4IOiiQWgHu8IRFXrr6XllhT/u0GUcuHafYt0JpMvq7LVZTB0Fg61yMHVwvgajIAuZ9V4GO9t2Tv17808HBMPo4N1mF/MV+N+4JYUK2nMBSmwjVMCu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eGf6kE80; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eGf6kE80"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FFBE1F000FF;
	Fri, 11 Sep 2026 13:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789131721;
	bh=nbFIIEzlUTxl2xJVgrwWeAYn7BDxFx09xtnVsWU/DZU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eGf6kE80/niewCA/exBDVcLLTbWRMPwpulCnRJlfbdYNfHtJSrXSDAl6WIH3FTjtG
	 gaFkHeK9+N2Lb/C4CsTee5ZeaAKLQB1DjL+lM2ijnCJmSzlMbr3eiqOFWHkizw5EJa
	 6HtfC4xrAjaDF2jpRDgtoHcB1UQRrQur+rXjubVZS/d6dl5fmNzS6yupuZRVPW7LXb
	 Hb440HnuyGwFbwdSc5ywhqJam0/v9ujlkJfeJFb2ZObm4MMuicmW75bfytQ9sTVxi0
	 FJ6ZOxMr3f5f1IAxpAdX+Rz4SFHqEUigz5AMi7xOn3sv0tMRyaOJIWBU4RpOMmVEjh
	 0WdO6plnGG75Q==
Date: Fri, 11 Sep 2026 14:01:55 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Jaeyeon Lee <jaeyeon.lee.dev@gmail.com>
Cc: akpm@linux-foundation.org, shuah@kernel.org, david@kernel.org, 
	liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, surenb@google.com, 
	mhocko@suse.com, ziy@nvidia.com, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/mm: skip khugepaged file tests if mkfs.xfs is
 unavailable
Message-ID: <aqP7gW98GIiYgL1z@gremlin>
References: <20260911124517.63714-1-jaeyeon.lee.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911124517.63714-1-jaeyeon.lee.dev@gmail.com>

On Fri, Sep 11, 2026 at 02:45:17PM +0200, Jaeyeon Lee wrote:
> The XFS setup for ./khugepaged all:file checks that the kernel supports
> XFS but not that mkfs.xfs is installed. When CONFIG_XFS_FS=y and
> xfsprogs is missing, mkfs.xfs and mount both fail, but
> SPLIT_HUGE_PAGE_TEST_XFS_PATH is assigned from mktemp -d and stays set.
> The test then runs against plain tmpfs and six subtests fail.
>
> The script already has a skip path for this test, but it never runs
> because the path variable is always set. Check that mkfs.xfs exists
> before attempting the XFS setup.
>
> Assisted-by: claude.ai:claude-opus-5

Convention is now:

Assisted-by: LLM

See https://docs.kernel.org/process/coding-assistants.html

> Signed-off-by: Jaeyeon Lee <jaeyeon.lee.dev@gmail.com>

This seems sensible, so with the tag fixed:

Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

> ---
>  tools/testing/selftests/mm/run_vmtests.sh | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/tools/testing/selftests/mm/run_vmtests.sh b/tools/testing/selftests/mm/run_vmtests.sh
> index d09f9f6a384e..6315b67b6733 100755
> --- a/tools/testing/selftests/mm/run_vmtests.sh
> +++ b/tools/testing/selftests/mm/run_vmtests.sh
> @@ -415,7 +415,8 @@ CATEGORY="thp" run_test ./khugepaged -c 4 mthp_khugepaged:anon
>  # Try to create XFS if not provided
>  if [ -z "${SPLIT_HUGE_PAGE_TEST_XFS_PATH}" ]; then
>      if test_selected "thp"; then
> -	if grep xfs /proc/filesystems &>/dev/null; then
> +	if grep xfs /proc/filesystems &>/dev/null &&
> +	   command -v mkfs.xfs &>/dev/null; then
>  	    XFS_IMG=$(mktemp /tmp/xfs_img_XXXXXX)
>  	    SPLIT_HUGE_PAGE_TEST_XFS_PATH=$(mktemp -d /tmp/xfs_dir_XXXXXX)
>  	    truncate -s 314572800 ${XFS_IMG}
> --
> 2.43.0
>

--
Cheers, Lorenzo
