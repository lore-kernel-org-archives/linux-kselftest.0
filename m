Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792740612;
	b=yAlgkkvIFZFQ48EIMwlCMSiC/mrZ4u3Bb/gWoBWqGi/G6XrqWgxEpvt9ASpTXnZ+vkny
	 qFpgxaq0Bf/8xDUsByaeg4QXt/mHGbrbs3eyUP+as8M9k/ZiJHH9BS5XFQ75nKvcLiz9v
	 eHWLMwfqDtXW+y+koGq8xZHR7GxkPtYavPlIswjRqZYPr9MPUMY22yVt8Bd/7RrDY72cY
	 a6+6xNFKqBxST0DVC6mrOOo5+R8KSdUtkG7DvophLTh4SmvwUxu2DCbubjBWS224JSwTX
	 HuD369SDT822+N21DI6kKj1bmqjNXuXojnFrRd+GOsf/8HKOvV/De01fOxMTz4sN96w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792740612;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=r4wmPWcRwAYNvROfFkIzQ3+TvTf3iBKeJ+QLx3ENVDU=;
	b=qI7NawJYudbklohsNslE705yCgZ648RvsmPumO0G1Xz6AHi+hmLMoSQvw8x070vDS9eY
	 yUmLlaREg4k/QCrOtJOVE4+2loAdJQ3FpLWCCPvX3GQQxg5Hub9Zql2otZMuc2R/Kwcfm
	 BOs5DeYn8NYTAzqrSSURjcOvkhaJLK9FudZXOq6ePlrJIfqydE3PnHiPe8NBUpGF/tBF0
	 yPRGLcjvaw8+sGZ4e+bwp1KXePkojvifK43M3jrGe9qxPE6R3vdDbOVeLtSsG8OKFr7Jr
	 QGRSg7QFcvDLQaR5px2CK+SdfwfwpBNQDsexh7DevMBl+N2fuAedCu+RWwjVNKRSLwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Qec53LB/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A9BF606A325;
	Fri, 23 Oct 2026 07:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Qec53LB/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CFBD1F01828;
	Fri, 23 Oct 2026 07:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792740612;
	bh=r4wmPWcRwAYNvROfFkIzQ3+TvTf3iBKeJ+QLx3ENVDU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Qec53LB/A1eayaCEjYLDFL9z+iuJE7bAuXTc06fl/8KJFTDdrImX2I5Dt6mpPtgZi
	 J4YK9HrpfUneKeQyozUR739UvzP0CwZeRE3vf8si30GCWKbiNowKUqUECkKz/c++GY
	 VFKz57zcN5q/l0HebM2mGTVbJffz17gB2dS3/A93a45UKO70+FZDsOixTXd6bqqXvy
	 y3LiPc1ShAWQty+3eIo8ATnpQcJL7zoHv3Om65qullG30F91UT0l+nvNAj35DUdXc8
	 UrpvYCVdiiZfgsTMn3ipa0c/FgKnYXK7Q8hdXNnA0d5M1FLkfZotYY+NoVjdbNgD5B
	 sgtH2DdeBTRXw==
Date: Fri, 23 Oct 2026 10:30:05 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: linux-kselftest@vger.kernel.org, shuah@kernel.org,
	akpm@linux-foundation.org, linux-mm@kvack.org, vipinsh@google.com,
	linux-kernel@vger.kernel.org, dmatlack@google.com,
	kexec@lists.infradead.org, pratyush@kernel.org, graf@amazon.com
Subject: Re: [PATCH v2 2/2] selftests: liveupdate: Add tests for
 LIVEUPDATE_SESSION_FREEZE
Message-ID: <atsM_WTjuZNl1EGG@kernel.org>
References: <20261020144710.4154339-1-pasha.tatashin@soleen.com>
 <20261020144710.4154339-3-pasha.tatashin@soleen.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261020144710.4154339-3-pasha.tatashin@soleen.com>

On Tue, Oct 20, 2026 at 10:47:04AM -0400, Pasha Tatashin wrote:
> Provide luo_session_freeze() in the liveupdate test library and add unit
> tests in liveupdate.c covering the LIVEUPDATE_SESSION_FREEZE ioctl. The
> tests verify that non-zero reserved bits are rejected with -EINVAL, an
> outgoing session with preserved files can be frozen early, freezing an
> already frozen session returns -EBUSY, and attempting to preserve an
> additional file descriptor into a frozen session fails with -EBUSY.

Please teach your LLM to use shorter paragraphs :)

Do we need the entire list of what the test checks in the changelog?
 
> Also freeze the test session early in luo_kexec_simple.c to exercise
> LIVEUPDATE_SESSION_FREEZE across a kexec reboot, and verify that
> attempting to freeze a retrieved incoming session returns -EINVAL.
> 
> Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> ---
>  .../liveupdate/lib/include/libliveupdate.h    |  1 +
>  .../selftests/liveupdate/lib/lu_utils.c       | 10 ++++
>  .../testing/selftests/liveupdate/liveupdate.c | 49 +++++++++++++++++++
>  .../selftests/liveupdate/luo_kexec_simple.c   |  8 +++
>  4 files changed, 68 insertions(+)

-- 
Sincerely yours,
Mike.
