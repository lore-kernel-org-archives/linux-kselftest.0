Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795184966;
	b=TrVn4+WOtblnzwnMbigtjDeqnIVPPlf6y0CUc3w1gmMkPgYGd+Z0QMjV16/OhmUF1rF7
	 KCF8R2sklKoPgNi5H4VmMNtIuFpEcUkY7nPwwogkfHzjHMTwjBaaj+JRF76xVoueHoAJ7
	 XZN2nHdPoSiLuz2RMXF5JeNV0PTeA9Qux2qHlgvD4lJbtRQHErFlCGTyqxGkwAozP0VIm
	 TJHh8YsrDv9RMbJrPWfkYiGnZosC3qwBqBwu9IAc8brEwas9JPI093dWEjEykZczBF7HE
	 xZTewn4SdpPyrJlri4Dl9Ibs2wOtK8vFd16n31TTRQx37QXFMDkRngHFsDDirbsbmTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795184966;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=rhOyoytlnDVzUE3pO2YswTduW+qVAkiRX4Xy+qDagYo=;
	b=uOwqmWJHKGPm5vzcAPuxSYz1EsNiy1+e08xJhaXghs8LmjsU4BkVBHcwl8ysixReucxp
	 cvfpk31WVS9pIco9Ec3Ug4l1dsiDgDgo5C4IQRNvALVpfcCwFOQvSlBbIfSJE5GAGbQbx
	 GC8jWgRFceV5dcVygkuE/wwqYlsa+yxpWwbW0RSSP8J/GHRk9sbXNG/MT7jy71/zBKAGa
	 M7bsFWl/KaIr4WDbTCKsdd2oLMskNMC3op5vGspGJavqT+4/XPpxjQ7v+Uv/s6Mk2Vwd9
	 cSRcpWV2RxF8QchJYO7nV3SzWdEcq1oro9dyTGxyWIC6RBdQPvnozv1G/h2kyy/nuqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Gt+MBOJ9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E6A4606A326;
	Fri, 20 Nov 2026 14:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Gt+MBOJ9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6EB61F000C0;
	Fri, 20 Nov 2026 14:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795184965;
	bh=rhOyoytlnDVzUE3pO2YswTduW+qVAkiRX4Xy+qDagYo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=Gt+MBOJ99ecdCoik/DrDTQPtJz5L/ZTUyz/EegTnM9kepvs1tpxlCXOv1QgdhAHCu
	 Rmea41jfXufLIE9H7uiBcy5CTMLzjfkcfLsQwgixDcr/U+q3RoZbmZZMqNU1OAuVv/
	 aJL0k0omtXBWH1QfEfPodlrJd6YnP4ktpCjHBX2T/Fj/2sJEv9VCS9VsIA1i/Liuxu
	 mjSFcrKqc8hvKpD9cZWD9ytUtBRRiNqbPEoe3oRte2J3A84utdWKl3hIvZBKhIlmeu
	 KXKHkErlt1fr1FyS1G4E4e0/dmYnunLescQcyb+4VQwLXaMDFM8m3apbWo/ePA8e0j
	 9v3XLNMi3UdSw==
From: Pratyush Yadav <pratyush@kernel.org>
To: David Matlack <dmatlack@google.com>
Cc: kexec@lists.infradead.org,  linux-doc@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-kselftest@vger.kernel.org,
  linux-mm@kvack.org,  Alexander Graf <graf@amazon.com>,  Andrew Morton
 <akpm@linux-foundation.org>,  Baolin Wang <baolin.wang@linux.alibaba.com>,
  Christian Brauner <brauner@kernel.org>,  David Hildenbrand
 <david@kernel.org>,  Hugh Dickins <hughd@google.com>,  Jonathan Corbet
 <corbet@lwn.net>,  "Liam R. Howlett" <liam@infradead.org>,  Lorenzo
 Stoakes <ljs@kernel.org>,  Michal Hocko <mhocko@suse.com>,  Mike Rapoport
 <rppt@kernel.org>,  Pasha Tatashin <pasha.tatashin@soleen.com>,  Pratyush
 Yadav <pratyush@kernel.org>,  Randy Dunlap <rdunlap@infradead.org>,
  Samiullah Khawaja <skhawaja@google.com>,  Shuah Khan
 <skhan@linuxfoundation.org>,  Suren Baghdasaryan <surenb@google.com>,
  Vlastimil Babka <vbabka@kernel.org>
Subject: Re: [PATCH v4 14/19] selftests/liveupdate: Test which tmpfs files
 can be preserved
In-Reply-To: <20261111002358.1842967-15-dmatlack@google.com> (David Matlack's
	message of "Wed, 11 Nov 2026 00:23:52 +0000")
References: <20261111002358.1842967-1-dmatlack@google.com>
	<20261111002358.1842967-15-dmatlack@google.com>
Date: Fri, 20 Nov 2026 14:29:19 +0000
Message-ID: <2vxzh5hb1sqo.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Nov 11 2026, David Matlack wrote:

> Add tests to liveupdate.c for the checks done when preserving a tmpfs
> file: A file can be preserved through a read-only fd, but not a
> write-only fd. Preserving it requires permission to write to it, except
> for the owner of an immutable file or of a file on a read-only
> superblock. Append-only files can't be preserved, and files can be
> preserved through a read-only mount. Also check that the size of a
> preserved file is frozen until the file is unpreserved.
>
> These checks don't need a kexec, so they run as part of the regular
> liveupdate selftest.
>
> Enable CONFIG_TMPFS_XATTR for FS_IOC_SETFLAGS. The test cases that use
> it are skipped without it.
>
> Signed-off-by: David Matlack <dmatlack@google.com>
> ---
>  tools/testing/selftests/liveupdate/config     |   1 +
>  .../testing/selftests/liveupdate/liveupdate.c | 303 ++++++++++++++++++
>  2 files changed, 304 insertions(+)
>
[...]
> +/*
> + * Test Case: Frozen Size of a Preserved File
> + *
> + * While a file is preserved, its size can't change and no holes can be punched
> + * into it. Writes within the file still work. Closing the session unpreserves
> + * the file, after which its size can change again.
> + */
> +TEST_F(preserve_tmpfs, frozen_size)

Nit: This test isn't really for "frozen size", it makes sure a preserved
file behaves as we expect it to. So perhaps call it "preserved_ops" and
update the comment?

> +{
> +	long page_size = getpagesize();
> +	struct stat st;
> +	char c;
> +	int fd;
> +
> +	fd = create_file("file", 0644);
> +	ASSERT_GE(fd, 0);
> +	ASSERT_EQ(ftruncate(fd, 2 * page_size), 0);
> +	ASSERT_EQ(luo_session_preserve_fd(self->session_fd, fd, 1), 0);
> +
> +	EXPECT_EQ(ftruncate(fd, page_size), -1);
> +	EXPECT_EQ(errno, EPERM);
> +	EXPECT_EQ(ftruncate(fd, 4 * page_size), -1);
> +	EXPECT_EQ(errno, EPERM);
> +	EXPECT_EQ(fallocate(fd, 0, 0, 4 * page_size), -1);
> +	EXPECT_EQ(errno, EPERM);
> +	EXPECT_EQ(fallocate(fd, FALLOC_FL_PUNCH_HOLE | FALLOC_FL_KEEP_SIZE, 0,
> +			    page_size), -1);
> +	EXPECT_EQ(errno, EPERM);
> +	EXPECT_EQ(pwrite(fd, "x", 1, 2 * page_size), -1);
> +	EXPECT_EQ(errno, EPERM);

Nit: Is there any point in matching the exact error code? Wouldn't
checking for a failed syscall be enough?

> +
> +	/* The size didn't change, but writes within the file work. */
> +	ASSERT_EQ(fstat(fd, &st), 0);
> +	EXPECT_EQ(st.st_size, 2 * page_size);
> +	EXPECT_EQ(pwrite(fd, "x", 1, page_size), 1);
> +	EXPECT_EQ(pread(fd, &c, 1, page_size), 1);
> +	EXPECT_EQ(c, 'x');
> +
> +	ASSERT_EQ(close(self->session_fd), 0);
> +	self->session_fd = -1;
> +	EXPECT_EQ(ftruncate(fd, page_size), 0);
> +
> +	close(fd);
> +}
> +
>  TEST_HARNESS_MAIN

-- 
Regards,
Pratyush Yadav
