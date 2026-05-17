Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B255F3B52E2;
	Sun, 17 May 2026 17:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779039309; cv=none; b=bNdcmGeq45QSipMMLNtJ6ta5VDjO5v93d+8fRIvqeA9+bi8jLNOPHiWzZxmQpIwrofcuLAJR5YM+MOdJ0uhFTAeeygO4pydtXw0b4/sDRJmhHlFexAL7W6G2EBp57st9XArRm47fkVlmRh5PGu1ikSHMJVQ6x0F/27DFHxbzNSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779039309; c=relaxed/simple;
	bh=Z12kFRYy0M/EBrdKq9sEAZ94/ePFMsKWkRd0ZfTHxeo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uemGycdrZqFSPlxP8gpZaxVVAZnPU0eQ370bQyXWZi0Dgv3yUuJ6srl2+AgMCrEnaA15U3EiBBKHvzeJS/uMDZrpsz/M8vcZaH18YydCjwVNqIa7D/VRTfKyA3oPbp4OC9hBNHMo5AIAlLNdbca1pSG37Ndt7KbshOy9Wd458mU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V8zZOOis; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V8zZOOis"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE652C2BCB0;
	Sun, 17 May 2026 17:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779039309;
	bh=Z12kFRYy0M/EBrdKq9sEAZ94/ePFMsKWkRd0ZfTHxeo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V8zZOOisPy/dfHu9zDiX5r9+1f/foenG+EZgtGulAhMTuEQ2qVvK4717slDC7SCLg
	 E/B7XlG86btudizxXtXqSE0NW0I87DRHbeMEC/dMrLEN8zwI31Efv/LevZZQEXrlvS
	 HgauKMxBADhqmfIvQrJEfAMBfTO2X1kHe74Ep9Jq4Sc4CIt+QqHx0tloWRB21GHkYb
	 N6Hs3zOcdKc7bASLfS4kj2KSwTynl6TPJQg2QTKrIKId8HpQbqGewBS+kqZ0z6c08X
	 eQDfp4yYE2BZorJA6AiqM48Lr76dbJo5JCK9p3YPX2XD2LEKXSFaz43wdZDS4PZaZC
	 h3O5unJAhv+Rw==
Date: Sun, 17 May 2026 20:35:01 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: linux-kselftest@vger.kernel.org, shuah@kernel.org,
	akpm@linux-foundation.org, linux-mm@kvack.org,
	skhan@linuxfoundation.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, corbet@lwn.net, dmatlack@google.com,
	kexec@lists.infradead.org, pratyush@kernel.org, skhawaja@google.com,
	graf@amazon.com
Subject: Re: [PATCH v2 08/10] selftests/liveupdate: Test session and file
 limit removal
Message-ID: <agn8RUGJ5RcySkUY@kernel.org>
References: <20260514222628.931312-1-pasha.tatashin@soleen.com>
 <20260514222628.931312-9-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260514222628.931312-9-pasha.tatashin@soleen.com>

On Thu, May 14, 2026 at 10:26:26PM +0000, Pasha Tatashin wrote:
> With the removal of static limits on the number of sessions and files per
> session, the orchestrator now uses dynamic allocation.
> 
> Add new test cases to verify that the system can handle a large number of
> sessions and files. These tests ensure that the dynamic block allocation
> and reuse logic for session metadata and outgoing files work correctly
> beyond the previous static limits.
> 
> Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

> ---
>  .../testing/selftests/liveupdate/liveupdate.c | 75 +++++++++++++++++++
>  .../selftests/liveupdate/luo_test_utils.c     | 24 ++++++
>  .../selftests/liveupdate/luo_test_utils.h     |  2 +
>  3 files changed, 101 insertions(+)

-- 
Sincerely yours,
Mike.
