Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBCA72586C2;
	Wed, 18 Mar 2026 07:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773819313; cv=none; b=iJ/j1DppadJSyhGosGVMkME57zDyiS1EbNVFHQuMtZ3GMZG2Cx+XFq/lkms/BvmzM3IMhAX1yU4hi1N3GGfACzYqBfnSCTTXIXyG4Kh9ralo9og60rWg02x2S4KO+Vl6DtdMiWNzxErPWkMeh7el5pF5BIpVt3o1FjedsIx3q7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773819313; c=relaxed/simple;
	bh=aKgcvPGTjYha//Cur4xRQFNmv+GIS6eHhEkPZRVaV+g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O1BMdfY3coZPiS10mEho7ZOcsbrfwiG+5zIoLpO8t2Oo5QGGCYFQkHCRkMfNqJfLsWmgPmpivD4/jhIwKM9GEHVZn1JfARb8Xjbc7/ITGSmkgmbyfT3ALBYDb5SPyxfrmSN3G7NOwCsMchmNBFUXmeCm/goVIa7rsDlk1VsXBhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dBGgZIb+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dBGgZIb+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8163C19421;
	Wed, 18 Mar 2026 07:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773819313;
	bh=aKgcvPGTjYha//Cur4xRQFNmv+GIS6eHhEkPZRVaV+g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dBGgZIb+ecwylwaxTk0P155leL9bw1r4hZwUIDB4+tm7bPE1ypoetja9t3ZmzSaDD
	 6KxanD+Ro5fANTpuBuHWvBvR0zNIlB1k173drlfkGBzTC7JqBDGNp5RN7GAGQTLzja
	 tia7yL5G8mVVk+2pKUWkiXIDw9IrDSNsOUhfEWc9sPs1ikgIdTYT+0h2/AhnvyYSTj
	 i/EDNUnE5nChQY6TsfWPo/7nLECcFXsGVOYHVHYS9vLwCmWF/57Mf+YCdwYkz4dbAy
	 t5UVqN2Yn4DaNlx8BZvTdR0lEFoXcNyV+1COoQ5YrcFuBPEbIjkJ1AWGAdMAF1zI1U
	 20t2h+ipomKZQ==
Date: Wed, 18 Mar 2026 09:35:08 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>,
	Shuah Khan <shuah@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH 4/6] selftests/liveupdate: add test for zero-size memfd
 preservation
Message-ID: <abpVrFwp9h6lqfhm@kernel.org>
References: <20260309115441.266805-1-pratyush@kernel.org>
 <20260309115441.266805-5-pratyush@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309115441.266805-5-pratyush@kernel.org>

On Mon, Mar 09, 2026 at 11:54:37AM +0000, Pratyush Yadav wrote:
> From: "Pratyush Yadav (Google)" <pratyush@kernel.org>
> 
> A zero-size memfd is a special case of memfd preservation. It takes a
> different path from normal both during preservation and during restore.
> In the serialization structure, the number of folios if zero and the

                                                       ^ typo: is

> vmalloc array with folios is empty. The restore logic should check for
> this and make sure to not touch the invalid array.
> 
> Add a test to make sure this path works as expected. In stage 1, the
> test creates and preserves a memfd without any data. In stage 2, the
> test retrieves the memfd and makes sure it is still without data.
> 
> Signed-off-by: Pratyush Yadav (Google) <pratyush@kernel.org>
> ---
>  .../testing/selftests/liveupdate/luo_memfd.c  | 47 +++++++++++++++++++
>  1 file changed, 47 insertions(+)
> 
> diff --git a/tools/testing/selftests/liveupdate/luo_memfd.c b/tools/testing/selftests/liveupdate/luo_memfd.c
> index 52b5f6b16e19..56106cd09978 100644
> --- a/tools/testing/selftests/liveupdate/luo_memfd.c
> +++ b/tools/testing/selftests/liveupdate/luo_memfd.c
> @@ -36,6 +36,9 @@
>  #define MEMFD_DATA_BUFFER_SIZE SZ_1M
>  #define RANDOM_DATA_FILE "luo_random_data.bin"
>  
> +#define ZERO_SESSION_NAME "zero_session"
> +#define ZERO_MEMFD_TOKEN 1
> +
>  #define LIVEUPDATE_DEV "/dev/liveupdate"
>  static int luo_fd = -1, stage;
>  
> @@ -89,6 +92,50 @@ TEST(memfd_data)
>  	}
>  }
>  
> +/*
> + * Test that a zero-sized memfd is preserved across live update.
> + */
> +TEST(zero_memfd)
> +{
> +	int zero_fd, session;
> +	struct liveupdate_session_preserve_fd preserve_arg = { .size = sizeof(preserve_arg) };
> +	struct liveupdate_session_retrieve_fd retrieve_arg = { .size = sizeof(retrieve_arg) };
> +
> +	switch (stage) {
> +	case 1:

Helper functions?  And in other tests that do save and restore too?

Otherwise

Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>


> +		session = luo_create_session(luo_fd, ZERO_SESSION_NAME);
> +		ASSERT_GE(session, 0);
> +

-- 
Sincerely yours,
Mike.
