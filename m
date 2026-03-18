Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 946C030648C;
	Wed, 18 Mar 2026 07:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773818435; cv=none; b=DZdqm2uXBN8XrVlyPptZjs9+GKRHbU/Uui7Xydz+/uMamFMFlSSUES85Q2OZwrtpCyYZ9i2+cUTEcv3v8TqacLCMNfWLgfCMqzRyGgDPfMd/XiuFR7bk6pImtNIbJBDOo3f9AQzsKCmvtciNogdz0gm+bAXsx2Q5eCQTouqKDMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773818435; c=relaxed/simple;
	bh=JIho6HSp1HqOc7tsMiogR7jCSI50Btsu1/dHfTLouAA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fx+aaPowOk+1DuHu9ROPCPNxfexgLgBO0xVJLWMYsbclzdVjk6+NEdRwJkgYSzrrs5VORTPIqxodgyD1VwoxDhYn+TNti3fn2Sb1XHKRUn/RNXEBuM72FpI41AFbgayBLgi8ztyIykM4PwbqB+W88/8i9T9SxuyQPEcr0WiBFUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aN5TkoDo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aN5TkoDo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 530BCC19421;
	Wed, 18 Mar 2026 07:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773818435;
	bh=JIho6HSp1HqOc7tsMiogR7jCSI50Btsu1/dHfTLouAA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aN5TkoDofwqmglrTgotGy401/4nXLtyrFjXyIZSQhXpMzZsi7QddTFp75QSQlIc1t
	 4Xu2LeqaMPSzCJ/pJKJmAVitTcf//5duJP39s4bOesAL7rOA8kPxOt/AG8QN3oj+hU
	 RrZpyl0RSz5e/Bi1tUthCCOjKVP2NqSHmlxTMvHxuTwD8P/XMzcbQjSqur2qfaANmu
	 ElIc1YEX+7EeHFCK75cYHJmHd0EhXFOq188M0qtXfRLANjo3TELPtMi4KSOVq9lypb
	 4POn3bMW1ioPCDjx+Shx5oWzllZuejBeUqS+28Vr7yeLWhi1MWbWtyU3rt5YFo2FGh
	 7O9w6TOw+bjWA==
Date: Wed, 18 Mar 2026 09:20:29 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>,
	Shuah Khan <shuah@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH 2/6] selftests/liveupdate: add helper functions for memfd
 tests
Message-ID: <abpSPfPmPDPWPL2n@kernel.org>
References: <20260309115441.266805-1-pratyush@kernel.org>
 <20260309115441.266805-3-pratyush@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309115441.266805-3-pratyush@kernel.org>

On Mon, Mar 09, 2026 at 11:54:35AM +0000, Pratyush Yadav wrote:
> From: "Pratyush Yadav (Google)" <pratyush@kernel.org>
> 
> Add some helper functions that will be used by memfd tests. This moves
> some of the complexity out of the test itself, which results in better
> test readability and less code duplication.
> 
> Signed-off-by: Pratyush Yadav <ptyadav@amazon.de>
> Signed-off-by: Pratyush Yadav (Google) <pratyush@kernel.org>
> ---
>  .../selftests/liveupdate/luo_test_utils.c     | 175 +++++++++++++++++-
>  .../selftests/liveupdate/luo_test_utils.h     |   9 +
>  2 files changed, 183 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/liveupdate/luo_test_utils.c b/tools/testing/selftests/liveupdate/luo_test_utils.c
> index 3c8721c505df..45ace3697ee6 100644

...

> +/*
> + * Make sure fd contains expected data up to size. Returns 0 on success, 1 on
> + * data mismatch, -errno on error.
> + */
> +int verify_fd_content(int fd, const char *expected_data, size_t size)

Maybe verify_fd_content_read() to match _mmap()?

WIth this and write_size() and read_size() fixed

Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

-- 
Sincerely yours,
Mike.
