Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EA4D377ED7;
	Fri,  7 Aug 2026 06:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786082430; cv=none; b=aSneRuJEJtgi8hn0jouCHH5l3pNKkHpdJiQQciD2Db3diOQOfzLYKHuM3TDeXokYNJf5MAXQ6LX6+1NE3V8KZm14fj6zhYxTUUGQkU8Wh1v9xi07p12l/c3RyAPZLWJ+R/QC8tQzBTzl3d23pfM4aBlcTDhBCBfGxt4seoe/DFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786082430; c=relaxed/simple;
	bh=BsUzJFIkkXVMGdU5PzFbh47pg27G+Jp6D4XMactssA4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M1kzI0ReGyphKNdFTTAde6xXXu3NQ3M67n4nqApGMmXN2OWfceZqHHBlH1UREBqzdzm0O47znX9tVmAJTOBRa37/QBe8KD8sT3g9KxDS7dAOeeLDnkD+d4rzPtaXEuNKKVSsl3MFyLFGuiueZFngNiOoPWn2t9RHI7lgg//q3h4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=JpWagSuz; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="JpWagSuz"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B88351516;
	Thu,  6 Aug 2026 23:00:23 -0700 (PDT)
Received: from localhost (a085714.arm.com [10.164.19.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 06D443F86F;
	Thu,  6 Aug 2026 23:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786082427; bh=BsUzJFIkkXVMGdU5PzFbh47pg27G+Jp6D4XMactssA4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JpWagSuzryOVzE4Irh2B3xcPTun1C4qhPTv4PCmqLKUClfnVMUz3UPSaPJXO8NMqC
	 /z717uNUdTf2fJjo6a5sUCnN6CZvytQ2is4MHnOQvl7x/CtRKdso1IK/HUlCjCImWT
	 uzC8UepUv5fBYfEO/JTgIVkzTG2rNmZeIFDUKpXU=
Date: Fri, 7 Aug 2026 11:30:24 +0530
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: Hongfu Li <hongfu.li@linux.dev>
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org, 
	liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, surenb@google.com, 
	mhocko@suse.com, shuah@kernel.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, Hongfu Li <lihongfu@kylinos.cn>
Subject: Re: [PATCH v2] selftests/mm: Drop duplicate
 test_seal_mprotect_two_vma_with_gap() call
Message-ID: <pwdielwzixk3v5lugx4uq6m66octmpmhqn6ankwyqkvdquscty@xwcrhdcd3ext>
References: <20260806030850.76077-1-hongfu.li@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260806030850.76077-1-hongfu.li@linux.dev>

On Thu, Aug 06, 2026 at 11:08:50AM +0800, Hongfu Li wrote:
> From: Hongfu Li <lihongfu@kylinos.cn>
> 
> mseal_test main() invokes test_seal_mprotect_two_vma_with_gap() twice.
> The second run repeats all assertions with no benefit. Drop the
> duplicate call.

Guess these two instances would have been introduced just following the
adjacent other test cases where one takes true and the other takes false
as arguments :)

> 
> Signed-off-by: Hongfu Li <lihongfu@kylinos.cn>
> Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> Acked-by: David Hildenbrand (Arm) <david@kernel.org>

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

> ---
> v2:
> - update ksft_set_plan(88) to 87 to match the actual number of tests
>   after removing the duplicate call.
> - Add Reviewed-by and Acked-by tags.
> ---
>  tools/testing/selftests/mm/mseal_test.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/tools/testing/selftests/mm/mseal_test.c b/tools/testing/selftests/mm/mseal_test.c
> index 93c2e13094d4..1a05e6921fed 100644
> --- a/tools/testing/selftests/mm/mseal_test.c
> +++ b/tools/testing/selftests/mm/mseal_test.c
> @@ -1876,7 +1876,7 @@ int main(void)
>  	if (!pkey_supported())
>  		ksft_print_msg("PKEY not supported\n");
>  
> -	ksft_set_plan(88);
> +	ksft_set_plan(87);
>  
>  	test_seal_addseal();
>  	test_seal_unmapped_start();
> @@ -1913,7 +1913,6 @@ int main(void)
>  	test_seal_mprotect_partial_mprotect(false);
>  	test_seal_mprotect_partial_mprotect(true);
>  
> -	test_seal_mprotect_two_vma_with_gap();
>  	test_seal_mprotect_two_vma_with_gap();
>  
>  	test_seal_mprotect_merge(false);
> -- 
> 2.54.0
> 
