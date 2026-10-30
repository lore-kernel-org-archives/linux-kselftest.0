Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793373244;
	b=2m5h4oE8g8cTpehdT7E9NsZXm9m09Yz3DxMAamqWHVslt9OSFaAWk8YTqDau/c3LK4r6
	 wB0HqfbSzrGrRA683OqOT3FVrt29f8HCU78pGmy33UsLs37UGSy940Xzth3pkGiKNO9wj
	 OkD3+Cq4O9Mj0oFQ4Zm1sLCb5cLzi5cGpqqOWsn7G9xSy4J8CS+lYzJsY9cubPZ4Z7kjw
	 C6+wRoP4FP03yqqdwluo0vKVTfh45lbQySkh8dsRisiBPCmHqynlr/ju1u8AYXImSTc8Y
	 YwE+WZXdsYdapWFSWx6Ex7cwoREmeecPrjrhnsjk2xrU3vlRsnSW741JgbFcQtdzSbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793373244;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=i7HlylZmq7KU4xnIsqu5uagz/ebgfjgjOJ8/V0DFiHQ=;
	b=RNi6scG6gTxUP142BGK32cc49HGitfvLf7+OKWBdpuXKMBTk7RM+UQB8TG9zFC+f34NA
	 E6kSGZeV3FVgXiM9a6Wn8zff6so9QFcMsiT8Gnwe/oVf+ek+aoh8kbnY6YpQBJUxYOfvC
	 Dr1sn2qPtCTXDEYxNiCCdrajtG0Q4+noQx62nMFIciU5cFeOChJ1twKAUS5IX2sC7Dz76
	 vYPrlXiVlIxIFSzYMrzfQUvmZUwe4j8GxyByv1fSxLNUL+1MoMtrDgtHbPD2sxyDjd5H1
	 jcRzBjD2k/TF2YaGNnYQx1jCDoBA3jMfoGliM4R5t6xB3YCyOFwvfHlN+MkWonp1nLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bPNKt1xn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1871360A2608;
	Fri, 30 Oct 2026 15:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bPNKt1xn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C648A1F00A29;
	Fri, 30 Oct 2026 15:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793373243;
	bh=i7HlylZmq7KU4xnIsqu5uagz/ebgfjgjOJ8/V0DFiHQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=bPNKt1xnPPKSySyEI9SU659QRMMmI3zUGaICqo7Sm6i0Z1f+NFGwAkeGzSxyI6zuw
	 0T7CMRIeltv3rON/FJk8NEPlstilUSKQlbL2rcBcen6DI3axfRagOL3FNj9qkDM833
	 qJslEURpB66J+cw4iYN3a2H7Th09RYdwMjhOhl+mpi2vcKuW7O3y1Y9KPwNgGb3r06
	 AIGlN8aT427DOaUVnb4EzIKKMgx8SjjOjXYIgVZWNZNZj1laR3BO4m+0oikZGf9HdY
	 UMjEC0LbMv2KmovNH2uGX/vTlrw1obEg7TlKTAAtPmWLJsuuwuDeLnpvmE18NsHrH2
	 H73LUnmgIIJMQ==
From: Christian Brauner <brauner@kernel.org>
To: shuah@kernel.org, linfordWu <linfordwu@163.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
In-Reply-To: <20261029140042.1788909-1-linfordwu@163.com>
References: <20261029140042.1788909-1-linfordwu@163.com>
Subject: Re: [PATCH] selftests/pidfd: skip setns tests without namespace
 ioctls
Message-Id: <20261030-geregelt-gesondert-eschenholz-4d1275ab540b@brauner>
Date: Fri, 30 Oct 2026 16:14:00 +0100
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev-ce4c1

On Thu, 29 Oct 2026 22:00:42 +0800, linfordWu wrote:
> Kernels without the pidfd namespace ioctls return ENOTTY. The
> current_nsset fixture expects only EOPNOTSUPP and reports a failure for
> every namespace before running the tests.
> 
> Skip the fixture when ENOTTY is returned so unsupported kernels report
> skipped tests instead of failures.
> 
> [...]

Applied to the vfs-7.5.misc branch of the vfs/vfs.git tree.
Patches in the vfs-7.5.misc branch should appear in linux-next soon.

Please report any outstanding bugs that were missed during review in a
new review to the original patch series allowing us to drop it.

It's encouraged to provide Acked-bys and Reviewed-bys even though the
patch has now been applied. If possible patch trailers will be updated.

Note that commit hashes shown below are subject to change due to rebase,
trailer updates or similar. If in doubt, please check the listed branch.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git
branch: vfs-7.5.misc

[1/1] selftests/pidfd: skip setns tests without namespace ioctls
      https://git.kernel.org/vfs/vfs/c/5ac2bfaaafaa

