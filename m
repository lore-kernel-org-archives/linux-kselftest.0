Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0BD2379C5D;
	Thu,  9 Jul 2026 01:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783559355; cv=none; b=jiOOCG+2R6rTP7fwBhhCW3NMDOnOVGLjrcjZZ0E91MS2ONILFNlnpUJEQ781bwHGkj+lO5evXPsv2rg04GC9sZr5jWUg2swZ9xDTyahHtlnINwvDCh3msFqvh2OQzapwfiP4rAsisqq6+W6KVaP/T1V8hodetihQFZ37emAyDik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783559355; c=relaxed/simple;
	bh=KVWnCBN4eV0DsyLfYEywPaDCOmOwMKRxtuNf3OJ6Tv4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lVnoj5Y0oPJeDNXcjXJmqTyeLuOzI8OVuK326jMjV19CAytOS7vj2sHe9e4c3+HKECE7HJ5TvU3jXbnjItNzk7R3eFT+RK4dnVHK4yII32GnHfujuWHmcRy0hGLwmhvO4JNaq8B+K1VDSVkBdnHbkR/jJONc+ngLpgUFfgoWtaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WgETxV6r; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WgETxV6r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 624BF1F000E9;
	Thu,  9 Jul 2026 01:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783559354;
	bh=0FaheSr3CaISFRxMibGkeH5Y3VBuv/2lrq9rBo3xqu0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=WgETxV6rAx1ERycUu6u9WCbqVuHl6Hyzu9meHjXRxKF7kESuWae2ehr3Ni/fyboBd
	 hQia3X+EkmD4sQoHev4N4l/hjKFzwapBPF6JhRoAe5gESXrTv3j3MugfUYB9ELt6G3
	 51/VYGBppnEoBIR0vMnEoyReilySCjg/AenrB0V0aHERBnX3wndIqm+/CMggKkmpg3
	 d4XLX1R04Lm7z+OeP5cqlM+r9tJTJk8s2ICMHDERD02tym2PGcKTCqzdNX5NJm8lY7
	 V8ePw67ZEQkXX879mQ6/3a0ww0bMW+JtMy9jm9eBtopzlnHVXeS0UCiAB39PLkpC/B
	 8bYG628vFSxSQ==
From: SJ Park <sj@kernel.org>
To: Hongfu Li <lihongfu@kylinos.cn>
Cc: SJ Park <sj@kernel.org>,
	jgg@ziepe.ca,
	leon@kernel.org,
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
	hongfu.li@linux.dev
Subject: Re: [PATCH] selftests/mm: Fix memleak in migration benchmark
Date: Wed,  8 Jul 2026 18:09:05 -0700
Message-ID: <20260709010905.128451-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260708103705.840679-1-lihongfu@kylinos.cn>
References: 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed,  8 Jul 2026 18:37:05 +0800 Hongfu Li <lihongfu@kylinos.cn> wrote:

> Several early return paths in run_migration_benchmark() skip
> hmm_buffer_free(), leaking the buffer. Replace with a single cleanup
> label.

Looks good to me.

> 
> Signed-off-by: Hongfu Li <lihongfu@kylinos.cn>

As David suggested, having Fixes: would be nice.  Seems 271a7b2e3c13
("selftests/mm/hmm-tests: new throughput tests including THP") could be the
one?

Reviewed-by: SJ Park <sj@kernel.org>

[...]
>  
>  	/* Cleanup */
> +cleanup:
>  	hmm_buffer_free(buffer);
> -	return 0;
> +	return ret;

A trivial nit.  I think '/* Cleanup */' doesn't really need to be stayed there,
as the 'cleanup:' label self-explains what it is doing here.


Thanks,
SJ

[...]
