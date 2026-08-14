Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB43351C1C;
	Fri, 14 Aug 2026 01:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786671016; cv=none; b=RLQNssBR2d0Hh3NS1u4hDvT2eC2oSNlEMq1z0zRJauW7obOw50kE19Dzg1jZUTikcPvfeAtJvGNFyGy7SeVl9cKGLVrN2yVEez1rcITD0oVJNaHG41W4nWrNzDWRsrM8pe4mrL24Ad1j0MNDr9gV11bLoHGt3ScptgiLbdCTVfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786671016; c=relaxed/simple;
	bh=YV5FlQb2I83Z8zwE+O4pS+iUBmpFSNtmtYYaGlYE330=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UcDY+f2wL1pS/odK+eddZ9AmhIATOyL5MuRE7/INLl2c69QN0xwC9eBe3PkGz3f7m1msPaJqOla8pr5CMb4n6F6jnpwu90Jc1eRtla0pgNeci54zzakjW5m1dBJKrNo8zg7XbSRW0hOoLypbKDmAuGdL6cSLML/CzRgBoEW4BXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NYVTmlEO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NYVTmlEO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59B531F000E9;
	Fri, 14 Aug 2026 01:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786671009;
	bh=pl/zgS/0jykM3Z7zE5Mqv+2yJ7UKl83IvSkTTU1YVxk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=NYVTmlEOLBv6gN6L1vVcOZFqFUF/CUOALWlH97m0VgNKMLJoqfF81xV66eCBHSBn6
	 6lThBy/UQhn8CD6DIwXqhwG9iy+s7aZFPJyRwvuXzKxTTWpmphxuS92TllO5Se2lIW
	 mJ6bDY2y7Q/k1+UC4lO6QjaZY3TYbp54jzwXDG77GT2nXEDnIt12zjhCMG8hZg1JRA
	 0TcGOnBObfkIAWihAOq/xQlmDWcctc14URzggDoFIKU3HQrx63rzGY7OXM12i7BnkM
	 /TwaM0JzpNzZ4i3M0h9PzkiYMYJ4k/0UtSNif87AffRnbLoHE+vswq0iv9lltD/JNC
	 EQExiRX6IGdag==
Date: Thu, 13 Aug 2026 18:30:08 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Xin Xie <xiexinet@gmail.com>
Cc: davem@davemloft.net, pabeni@redhat.com, edumazet@google.com,
 horms@kernel.org, shuah@kernel.org, lukma@denx.de, m-karicheri2@ti.com,
 fmaurer@redhat.com, luka.gejak@linux.dev, bigeasy@linutronix.de,
 ali@iusegentoo.com, qingfang.deng@linux.dev, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net v3 3/3] selftests: net: hsr: add shared-mutation
 regression test
Message-ID: <20260813183008.31e14297@kernel.org>
In-Reply-To: <20260808004525.1551-4-xiexinet@gmail.com>
References: <20260808004525.1551-1-xiexinet@gmail.com>
	<20260808004525.1551-4-xiexinet@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat,  8 Aug 2026 02:45:24 +0200 Xin Xie wrote:
> +	nsx python3 /dev/stdin <<'PYF1'
> +import socket, select, sys, time

It's a "no" on embedded Python in bash scripts.
Where do people get that from? Did AI generate it or are there projects
in which this is common practice?

Please write the whole test in Python (see .../net/lib/py/ helpers),
or move the python code out to its own scrip under TEST_FILES
