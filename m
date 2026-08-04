Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E38B3E5A22;
	Tue,  4 Aug 2026 08:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785831651; cv=none; b=iS/6eC/cze+UgfgXDVVUkdzuR563hPtxFAqsASIf3MT5SzSlH8c89IkgjkdalmP39erirt00BwONTdQI42cGxhwD25TtmvgcU2GY0zN6SCdNvE1ML4Lbw8EQLuXAF4RciIjzWrUwE+WZu8rrLswrJNRO5aQdTWFV74HXwdk63wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785831651; c=relaxed/simple;
	bh=1p4nI/qY8FtNRqA6l75N0hnaV8ymW31iRWAmLJe9K1g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=igNqw+GrP4HlG0lXGpv47STRhiJaOq9XsLPCfCvhMFR40Sj7j6+Z3LsO/oQQfSKQRFwtWu4hPTfcEWg1l0oRPqcY8fLTpjrqHUJLrrQqe6tybrxL3soiKE0lqHNvnzE19gK0cd8SX+A2RJzx129cUC6/xn+6b7KnxOjVzX5D414=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hSSnbs/p; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hSSnbs/p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59E721F000E9;
	Tue,  4 Aug 2026 08:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785831650;
	bh=Phq3Ues4vXSMEq+m8zRcamqTW+mL1dwqWSUqiYfPWXc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hSSnbs/pEsiXp0mhl7jIFDHc3x1dv/chFMbnHbCv29g4AFSznzSllbPDyZTBHRgLk
	 5viyiOIAUeF5gFV7TkmUW/lmwSmr6ZsFdK1pjShM5E7jLArkaprY/fnQ+n0rAGVSEB
	 WrtotkEXE+ETOneQC46M8+2txyZQJbO3BHK0zl3xZ4ei2HVjixvhFO79lBQ+qVicor
	 OpugEVzq1vuSikyKw6V/NtKgQQgITqkFXNX+stkHyJh49W3OPNZR+u5KQrNZbuQnEC
	 yYw2ZDWFZKcEG9a7HUs09hLLVRuK1CVpjv7BM5sMktmApgX9q/OTv04C36BFgltWOY
	 rEhYahwXbtPSw==
Date: Tue, 4 Aug 2026 09:20:32 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Hongfu Li <hongfu.li@linux.dev>
Cc: akpm@linux-foundation.org, david@kernel.org, liam@infradead.org, 
	vbabka@kernel.org, rppt@kernel.org, surenb@google.com, mhocko@suse.com, 
	shuah@kernel.org, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Hongfu Li <lihongfu@kylinos.cn>
Subject: Re: [PATCH] selftests/mm: Drop duplicate
 test_seal_mprotect_two_vma_with_gap() call
Message-ID: <anGgp9cKiDKDhCpi@lucifer>
References: <20260804062440.58666-1-hongfu.li@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260804062440.58666-1-hongfu.li@linux.dev>

On Tue, Aug 04, 2026 at 02:24:40PM +0800, Hongfu Li wrote:
> From: Hongfu Li <lihongfu@kylinos.cn>
>
> mseal_test main() invokes test_seal_mprotect_two_vma_with_gap() twice.
> The second run repeats all assertions with no benefit. Drop the
> duplicate call.
>
> Signed-off-by: Hongfu Li <lihongfu@kylinos.cn>

:))

LGTM so

Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

> ---
>  tools/testing/selftests/mm/mseal_test.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/tools/testing/selftests/mm/mseal_test.c b/tools/testing/selftests/mm/mseal_test.c
> index 93c2e13094d4..babc217d9dc9 100644
> --- a/tools/testing/selftests/mm/mseal_test.c
> +++ b/tools/testing/selftests/mm/mseal_test.c
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

--
Cheers, Lorenzo
