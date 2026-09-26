Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 690B1547063;
	Sat, 26 Sep 2026 07:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790408136; cv=none; b=gM+Q4t/WIfvG6Yllzi/JJk8bBvMEOypP2RigovXXNLNpQjYqxPdhr6pNO+0UDgG/AaGVFgZgpaew0GihLIH7hoUhve6W/jDPKqlZKcQJrDINvFC7nnJ9yes+QXJP3UPQK5sKBTaaZcL6dtwwjgLtgcJhUQuhGUnYCEdCCOdziVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790408136; c=relaxed/simple;
	bh=OHzHqRTu21BYYoyCvF3vAd+71SwW9M3ExArjCnqPCl8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rabN7c4AqAxUT6Vyj3FnrkzqsiCVC4RhvTwUnDgXuOq46g1tYKp4Y4f0mLBiDn7bqCjPjwonVLHMToRD59tF/42zbqNxr8zw3jxSK556DTnSn4FmhHFw3pAwnFsai74MCStu6S++iYzf/w+wVx5RflRyGIH01ztdsDetsEOkJKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=pXLVvox2; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="pXLVvox2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1790408125;
	bh=OHzHqRTu21BYYoyCvF3vAd+71SwW9M3ExArjCnqPCl8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pXLVvox2nygsb+Hwsy4Ar+HDjPfeJ8g1YGsahYDofuANCmujKB1vFaNl2k5v6Ejq4
	 04ZnlipqzE6xjsBrQZJW/oPv4MtAcNgf+r+H3EHcGuRQw/A6OqK5FbNd11kDiqU/ab
	 6l+uAsqp4Ufbo08assuYD1pXzSnkg7MCshMDKI0I=
Date: Sat, 26 Sep 2026 09:35:25 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Danish Khateeb <danishkhateeb03@gmail.com>
Cc: Willy Tarreau <w@1wt.eu>, Shuah Khan <shuah@kernel.org>, 
	Sven Schnelle <svens@linux.ibm.com>, Benjamin Berg <benjamin.berg@intel.com>, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] tools/nolibc: fix readdir_r() and the FD_* macros
 on 64-bit
Message-ID: <a06130a1-2b31-4f13-af24-a7f3e83135f1@t-8ch.de>
References: <20260925211600.119116-1-danishkhateeb03@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260925211600.119116-1-danishkhateeb03@gmail.com>

On 2026-09-25 16:15:57-0500, Danish Khateeb wrote:
> Two bugs that only show up on 64-bit architectures:
> 
> - readdir_r() truncates the directory offset to an int. On ext4 it
>   fails within the first few entries of almost every directory (since
>   v6.19), or returns the next-to-last entry twice and never the last
>   one (v6.15 to v6.18). Patch 1.
> 
> - FD_SET(), FD_CLR() and FD_ISSET() build their masks from an int, so
>   they use the wrong bits for fds 31-63 of each 64-bit word, and
>   select() on fd 40 fails with EBADF. Patch 2, with a test in patch 3.
> 
> There is no selftest for patch 1: it needs a directory with large
> offsets, and nolibc-test only lists /proc/self, whose offsets are
> small. I tested it with a small program that lists a directory with
> readdir_r() instead.
> 
> Changes in v2:
> - Dropped Cc: stable from patches 1 and 2, which are otherwise
>   unchanged.
> - Patch 3: dropped the select() test, and moved the FD_* test to the
>   stdlib tests, with its helper in the same order as the test cases
>   (Thomas). It is also shorter: FD_CLR() is now checked on a set
>   filled with memset().
> - Rebased on nolibc/for-next 6f114ae7b600.

Applied, thanks!

(...)
