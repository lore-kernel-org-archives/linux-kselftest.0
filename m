Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEE2F4B04BF;
	Fri,  7 Aug 2026 00:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786062696; cv=none; b=QR5GwFtsbmZiw7ilU/eG/DTaDXMymooaaUXwpgG95ILmIY+N7aGdXTWrR+RamFSve0ULFYeLWIKapJu//4SdcNQOLRBgEwEYThN6cpiv6X4eLacOUniIa3yT1YbbjMmbOthYQDOTOZwOHBqdlQI6LRiC4rrFm4lPrzzr5jDM2ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786062696; c=relaxed/simple;
	bh=LjVAmWcDvCuNPff1+FT5n/Unke0tJ/h5k29ETO3N2wY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iiXMFuSmNghvi7ZPFOwv3KswYnDdfFGsZJGi0dQBXDnjpbANXETnWadHtdu13rLfhCptZAvxcW9qnfizujcmU+v/Uya/eBcYwvCHI+TvaF16iq4Xg0k7GA2DsfShgB0t/oNYqrmCtm8tkCq+iQvRDPXjHeQPTGy6TySecsAvgiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IHChuiov; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IHChuiov"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF24D1F000E9;
	Fri,  7 Aug 2026 00:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786062695;
	bh=7NPx44srqDXQ3MSLJooPApZRQAlXn9cWqKgTgh2pWK0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=IHChuiov2hnAugjTA2JagJdzCr8QlgHVXcqXautlK9/YdPGMKRGI5jE1e6Jlpmq3x
	 Ax0rIZrzb1+hOfrzxqydbUBRnUzjPXSEWiKKtIRLGn15WETJQswmHibqUpOB9zOzWf
	 F79YfUTSJjHrdBr5CBQQvyVGvkV59jOtH8ttp1mGF5DmbybLmhVery0b0Gc9BwQ6gO
	 19pkL7n/Vxoh+P3x2NmN0BaPh3j5gE4RN7sYYafLDC7mEMU1dVErt8+NwVc9LKo5r0
	 XPiIeqVRdVcyBunnTCITDCNVnrvv1p6peL6V8SjTlG1aoSFG3HQQ/Cj3gc6fjHf693
	 eh3QlppOzobAg==
From: SJ Park <sj@kernel.org>
To: Hongfu Li <hongfu.li@linux.dev>
Cc: SJ Park <sj@kernel.org>,
	akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	shuah@kernel.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hongfu Li <lihongfu@kylinos.cn>
Subject: Re: [PATCH v2] selftests/mm: Drop duplicate test_seal_mprotect_two_vma_with_gap() call
Date: Thu,  6 Aug 2026 17:31:25 -0700
Message-ID: <20260807003126.81629-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260806030850.76077-1-hongfu.li@linux.dev>
References: 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu,  6 Aug 2026 11:08:50 +0800 Hongfu Li <hongfu.li@linux.dev> wrote:

> From: Hongfu Li <lihongfu@kylinos.cn>
> 
> mseal_test main() invokes test_seal_mprotect_two_vma_with_gap() twice.
> The second run repeats all assertions with no benefit. Drop the
> duplicate call.

Good eyes, thank you for fixing this!

> 
> Signed-off-by: Hongfu Li <lihongfu@kylinos.cn>
> Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> Acked-by: David Hildenbrand (Arm) <david@kernel.org>

Reviewed-by: SJ Park <sj@kernel.org>

> ---
> v2:
> - update ksft_set_plan(88) to 87 to match the actual number of tests
>   after removing the duplicate call.

I wonder if there could be an automated way for this.  Obviously not a question
to the author but just my loud thought.


Thanks,
SJ

[...]
