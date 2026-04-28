Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17BDF1DA23;
	Tue, 28 Apr 2026 01:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777338690; cv=none; b=O9IJ6tvaEVxcQFdOukIRSy5vb21uNCnx3PYlennYMnMFe9aJREcUxDutJui8FS575mcAYso0GGr0g8dF/dFGTPaB91fujUs6+LLd9IPoBl5PwxlvQWuxuIWIf34JxxAZPwDUtOyW0j/MJVY0dZBJtr0mnTYr8gr1MSEhuDoTk/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777338690; c=relaxed/simple;
	bh=0chybH7wDbE+Yxx7fnZNf/D9EykYuOuLrNTgRV+W8is=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ma3vLndhE5DTE5p09cGALvetuqp4I61JLIB0vh8DgNNSjDeN9hi6hvFTsuSgYu3swd8mmrAdJawedZ8/kUk3kZO4tLwjRn5FsreZbDArpz8i20qR6ICGNpiKTqjggI0l0RxsqEVPN8ocmRMspHxC0/0XXg1aOSnKo0wlpM4tiAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nx9cBZLN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nx9cBZLN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28F56C19425;
	Tue, 28 Apr 2026 01:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777338689;
	bh=0chybH7wDbE+Yxx7fnZNf/D9EykYuOuLrNTgRV+W8is=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nx9cBZLNU6RhYrZt7DSdNNRGo+eHDDen6vRfRUrjaDxGmSgWrkduggNJxgtpIIplu
	 fx0fovQZzL6DiM2k+cAiBcH0xCHq4DskyH5bQ/nBG2aqD/HFgGKJMTkEVNZDpH7Gge
	 OSkjdb70B0n6yWErKWNmS/3ng4MLp2bDgknxaSCN2M27nJmi4uCU1zagGb9dtJU4Rd
	 L8hu4jswqM2SOqvI6kv58dp/UEQ6/q2ECDcw4QehFRkgXDmqN0oTQVqUu0mPDRyg+m
	 N47Wlqs7hBkKtA3ORURRcEC/mGIInrNjmtuoVGHcdhYZW10V5eRDTi4lyr+54TcmvO
	 6PLA2yEMWAkig==
From: SeongJae Park <sj@kernel.org>
To: fujunjie <fujunjie1@qq.com>
Cc: SeongJae Park <sj@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Jann Horn <jannh@google.com>,
	Shuah Khan <shuah@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2] mm/madvise: reject invalid process_madvise() advice for zero-length vectors
Date: Mon, 27 Apr 2026 18:11:18 -0700
Message-ID: <20260428011119.113840-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <tencent_BB588C2CDED859A873093DAF28B2CC1F7B0A@qq.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 27 Apr 2026 09:43:30 +0000 fujunjie <fujunjie1@qq.com> wrote:

> process_madvise() used to validate the advice while walking each
> imported iovec. If the vector has zero total length, vector_madvise()
> does not enter the loop and can return success without checking whether
> the advice value is valid.
> 
> For a local mm, such as process_madvise(PIDFD_SELF, ...), the remote-only
> process_madvise_remote_valid() check is skipped. As a result, an invalid
> advice can be reported as success when the vector has zero total length.
> This differs from madvise(), which rejects an invalid advice before
> returning success for a zero-length range.
> 
> Validate the generic madvise behavior at the syscall-facing entry points
> before any vector walk. In process_madvise(), do this before the
> remote-only advice restriction so unsupported advice is rejected with the
> same priority for local and remote mm. Then keep the per-range helper
> focused on address/length validation, avoiding repeated behavior checks
> for every iovec.
> 
> Valid zero-length requests remain no-ops and continue to return 0. Add a
> selftest that covers invalid advice with a zero-length iovec and an empty
> vector, while also checking that a valid zero-length request still
> succeeds.
> 
> Fixes: 021781b01275 ("mm/madvise: unrestrict process_madvise() for current process")
> Signed-off-by: fujunjie <fujunjie1@qq.com>

Looks good to me.  I have trivial comments below, though.  Because those are
really trivial, please feel free to add

Reviewed-by: SeongJae Park <sj@kernel.org>

> ---
[...]
>   *
> - * If the specified behaviour is invalid or nothing would occur, we skip the
> - * operation.  This function returns true in the cases, otherwise false.  In
> - * the former case we store an error on @err.
> + * If the specified range is invalid or nothing would occur, we skip the
> + * operation.  This function returns true in these cases, otherwise false.  In
> + * the former case we store an error in @err.

Maybe we can keep the second and the third lines of the above comment
unchanged?

[...]
> +/*
> + * Test that invalid advice is rejected even when the iovec has zero total
> + * length. A zero-length advice is a no-op for valid advice, but invalid
> + * advice should still fail with EINVAL.
> + */
> +TEST_F(process_madvise, invalid_advice_zero_length)
> +{
> +	struct iovec vec = {
> +		.iov_base = NULL,
> +		.iov_len = 0,
> +	};
> +	int pidfd = self->pidfd;
> +	ssize_t ret;
> +
> +	errno = 0;
> +	ret = sys_process_madvise(pidfd, &vec, 1, -1, 0);
> +	ASSERT_EQ(ret, -1);
> +	ASSERT_EQ(errno, EINVAL);
> +
> +	errno = 0;
> +	ret = sys_process_madvise(pidfd, &vec, 1, MADV_DONTNEED, 0);
> +	ASSERT_EQ(ret, 0);
> +
> +	errno = 0;

The previous sys_process_madvise() is expected to not set errno, correct?
Maybe the above 'errno' reassignment is unnecessary?

> +	ret = sys_process_madvise(pidfd, NULL, 0, -1, 0);
> +	ASSERT_EQ(ret, -1);
> +	ASSERT_EQ(errno, EINVAL);
> +}


Thanks,
SJ

[...]
