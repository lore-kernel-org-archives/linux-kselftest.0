Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11E4D4D990A;
	Wed, 16 Sep 2026 10:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789556395; cv=none; b=SnCNF0W284oFci/NoYLtsBDeb4JITlrkEBtj59E1RpUII437Ib8sQPUFmEQQuQmvlAFYEmXG2afD+q2QXNxLubUzVVk2FhbGZl/yf8MCmn4v0HZg9bqyBIXAj0ZPrC1CQ7db0QV1dpz5iC0+leXKN4Gt9PXnXAXYsVeklI3Ox7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789556395; c=relaxed/simple;
	bh=ObKnDO5ak6ielNK0q/7eij4BH1Dk4Yq0sraa2CEgg50=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UmN68pNC4nwvSCEQEH8xofICIhe6NBij1FW9//r8ujpO1cns4Fwc4P/RQIfynEYb++AEkcLDWj2qnjbCtTA/UwG2iMFKmWHdY8yxjX1sdLJcXv/N97qyv/kwx6HxaDAPxiEitQqkD6fEqsBzcRKctOlhPR5C+kjcNVq8alti10g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LAql0rPt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LAql0rPt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2864E1F00893;
	Wed, 16 Sep 2026 10:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789556378;
	bh=Tc4Aai0SNxDfo1WleUJPJGNkJ8xTAXJ3SVOUXDOmepE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LAql0rPtvN5VzBdHGrrh/28DRXddvV4XNsfz7emfkcWzFbpvCnlr1v9fPfik/3GNu
	 oQIH4coNS8f4gXlb1t/PXKzMN2X/OLhhF/G22WPMrfA+fyx5lJVR7pR4VVbawRrM0c
	 sfgZQFx1l/TtxwgjTfr2do/TkmhGicmOFC4UuhhCLqY6Mlwh7dFSop8+ryPaXsvLSc
	 wr5lV1pv0O36ymg2AkdWG9hAGP2clOuagYzdggJs54UToGTpf3aDDXpTn5n4qyy/Oa
	 F4lxmrwPTLEoVdkhKegoGRDADlwxt+Bp4eeV3NIf/KkBM0WJqnFKaiV35rTXZKj0aD
	 3xyN7hV1fg6Ug==
Date: Wed, 16 Sep 2026 11:59:32 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Jaeyeon Lee <jaeyeon.lee.dev@gmail.com>
Cc: akpm@linux-foundation.org, shuah@kernel.org, david@kernel.org, 
	liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, surenb@google.com, 
	mhocko@suse.com, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Zi Yan <ziy@nvidia.com>
Subject: Re: [PATCH v2] selftests/mm: skip khugepaged file tests if mkfs.xfs
 is unavailable
Message-ID: <aqp16Lp3mPwszQUc@gremlin>
References: <20260912202903.16157-1-jaeyeon.lee.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260912202903.16157-1-jaeyeon.lee.dev@gmail.com>

On Sat, Sep 12, 2026 at 10:29:03PM +0200, Jaeyeon Lee wrote:
> The XFS setup for ./khugepaged all:file checks that the kernel supports
> XFS but not that mkfs.xfs is installed. When CONFIG_XFS_FS=y and
> xfsprogs is missing, mkfs.xfs and mount both fail, but
> SPLIT_HUGE_PAGE_TEST_XFS_PATH is assigned from mktemp -d and stays set.
> The test then runs against plain tmpfs and six subtests fail.
>
> The script already has a skip path for this test, but it never runs
> because the path variable is always set. Assign
> SPLIT_HUGE_PAGE_TEST_XFS_PATH only once mkfs.xfs and mount have both
> succeeded, and remove the image and directory otherwise.
>
> Suggested-by: Zi Yan <ziy@nvidia.com>
> Assisted-by: LLM
> Signed-off-by: Jaeyeon Lee <jaeyeon.lee.dev@gmail.com>

I guess you didn't propagate my tag as it changed a bit? Anyway LGTM so:

Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

> ---
> Changes in v2:
> - Attempt mkfs.xfs and mount and fall back if either fails, rather than
>   only checking whether mkfs.xfs exists (Zi Yan)
> - Fix Assisted-by tag format
>
> v1: https://lore.kernel.org/linux-mm/20260911124517.63714-1-jaeyeon.lee.dev@gmail.com/
>
>  tools/testing/selftests/mm/run_vmtests.sh | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/tools/testing/selftests/mm/run_vmtests.sh b/tools/testing/selftests/mm/run_vmtests.sh
> index d09f9f6a384e..b870d21c055a 100755
> --- a/tools/testing/selftests/mm/run_vmtests.sh
> +++ b/tools/testing/selftests/mm/run_vmtests.sh
> @@ -417,11 +417,15 @@ if [ -z "${SPLIT_HUGE_PAGE_TEST_XFS_PATH}" ]; then
>      if test_selected "thp"; then
>  	if grep xfs /proc/filesystems &>/dev/null; then
>  	    XFS_IMG=$(mktemp /tmp/xfs_img_XXXXXX)
> -	    SPLIT_HUGE_PAGE_TEST_XFS_PATH=$(mktemp -d /tmp/xfs_dir_XXXXXX)
> +	    XFS_DIR=$(mktemp -d /tmp/xfs_dir_XXXXXX)
>  	    truncate -s 314572800 ${XFS_IMG}
> -	    mkfs.xfs -q ${XFS_IMG}
> -	    mount -o loop ${XFS_IMG} ${SPLIT_HUGE_PAGE_TEST_XFS_PATH}
> -	    MOUNTED_XFS=1
> +	    if mkfs.xfs -q ${XFS_IMG} && mount -t xfs -o loop ${XFS_IMG} ${XFS_DIR}; then
> +	        SPLIT_HUGE_PAGE_TEST_XFS_PATH=${XFS_DIR}
> +	        MOUNTED_XFS=1
> +	    else
> +	        rmdir ${XFS_DIR}
> +	        rm -f ${XFS_IMG}
> +	    fi
>  	fi
>      fi
>  fi
> --
> 2.43.0
>

--
Cheers, Lorenzo
