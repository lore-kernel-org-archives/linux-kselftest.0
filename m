Received: from mail-lr2-f12.google.com (mail-lr2-f12.google.com [74.125.230.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D76EC4BA1DB
	for <linux-kselftest@vger.kernel.org>; Tue, 15 Sep 2026 17:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789493452; cv=pass; b=CwbxRZ3Xg+Dt7FauFSH+c1yGU5bKhDeaUhfveEzOpalpC4ymSy3ZCiJpGjkJg1Y6cwhWgE1WrptdCbIPEMdYlsTADQUjNcbLAqwSGhVBIwWW9PkWG6ONSsjOV7LNm6vUmgRdqqmjFcYtafC3fcWvq4bMWhkRWTKqyp5taQc5I5k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789493452; c=relaxed/simple;
	bh=eAukwx8JnJI3cGyI5uMY8PGJs7GR2oj88tMoLLoGPII=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c/sOwJpeMlkiQCaitxseDJXrHGNfgnrAWYFiV0nJDS6/JexSFN7WFy1lBseNItzCYlzL2xy4cavQswLC/XgI4cMPyhQ7XojkjuIXQaS5iRh9/T2tjEu/KQEix0NwPk6/RA6PfwhVhmUVHjWvbAKcLv/yHfyFmx0mmn6JuXcYWt0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pMKXXO6k; arc=pass smtp.client-ip=74.125.230.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pMKXXO6k"
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a2ff176d5bso735681fa.2
        for <linux-kselftest@vger.kernel.org>; Tue, 15 Sep 2026 10:30:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789493447; cv=none;
        d=google.com; s=arc-20260327;
        b=k6wThxFJ+lZYYXQRihg9kou2F9kBtP9OaQGjI+Pe03wLqVBRTBrAa2yUlCXyEr/pnk
         DoNwAAV1smolROF/a1+KVsPFtjJA9b0DH4CTepdiM5xnoxRSj8gdizQYKkjCK2yGwpT2
         4SZC8Hwv76o+2cQ7lFe9BlgR6XHdVcPKbxus0vvgYekbM+0T+eqyHwrcekfRK96LwNeb
         HI9oWgYINn7MBjok2W2sipJzMfo3KsXeuu4Yr8vyenyULKBb8e35QO2Na9mZHYzevJf2
         HXkAEhSNL/egUW0c1yS40HxiP0ONToCtQfbB+LUDbN87/LHPL5uEMCcPkwgo/wUJvO9m
         PYRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eAukwx8JnJI3cGyI5uMY8PGJs7GR2oj88tMoLLoGPII=;
        fh=odlXdayUlv4ZiH0+z7UVzETLJy9HxbL+SL+pK8CdaL8=;
        b=nkF4yEO62AjTLn/YNfzg0SIDZVZzJJ27om4lsvAMgsc0ULWEbea9sd9+w3IgvTSM9X
         ePNcc/Imw0qMrxF/+eZn/tFooK9hdk9+WiJ7gJo/ccTFmOsXq/05BZ7cn7d/Q3btj+rp
         U4STuE7pF/OFb4tH0JwIKnSQ8JefEZNaJqPp8IAFjiEO7poTJGua1Tg9VXpM9hsoJFiJ
         5T+/GwNVAFEkcLVbBUJtfvcb73V3fzBHO25BJZSuaKflgvAF7N4Rdkw5hYtP7GzNBMvY
         0qaTRUlxrURWYB35+shuQdH9eShf+f6O5LRRUs2POkahZGHLUfeB3xKLFBXB6AoamXkJ
         j7yg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789493447; x=1790098247; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eAukwx8JnJI3cGyI5uMY8PGJs7GR2oj88tMoLLoGPII=;
        b=pMKXXO6krim404h3lA2CBgbZIVtoJ3AXBFXpC/pDA7sW5dwR/U4xQM1yl7VXrT8Mvw
         7wKqDpX5Ixgy0et2Qlw7jPxKGHJi453rrY+1OBAjVNGjpDSB3/w7g+AVTRCYn0NtraWl
         kyxT8fIel5gvFbIzM+gLWuVlVrtviHjW693GxDF4XgZ0iDfPyBG9IpMVqG7Vyf+Rzlkk
         xaE3nzrTU/XjS8MPcc40T25H/dnPBl9rc4Yr+ig6uCFYgkuhDT4eEWtpqrsQEvsOXXoJ
         WDVwIRZAgLFA/oIFw5MRmv+KGvSXlH8g6KugWMBZ+llvUQtQjDOH5Y3lH2ZYMZJ150H6
         SKnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789493447; x=1790098247;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eAukwx8JnJI3cGyI5uMY8PGJs7GR2oj88tMoLLoGPII=;
        b=W0R0WOiLrYtMH5VQ3BzAz2KobOowDPnnUxIaSEAMB3ktSJtyyhyZQIZFvD0DtfYmdT
         oTz9XS40kqoySwdMnA7qqrrk+b1yYDr7ydCtjSEmWv7azXcQQNxrGZExSuV7RPicE4Ur
         whm+kt+6JCHaMIs10RNycTOxrFNLhrmrG4p1JU1vuq+qpGUD0MPo8gRYbJNEsKvJBW6G
         HkuFka6uO1Gx3y6pmQku1WXvTY9rXPakywBmEY1ppUQM8VCEBOep4LyUyX7+C0jeMK0V
         ptaIaposKWDXeotuue8FqndKxTRksu/VyMXIhTuVCNzCe5doel28aknnMow6cteP5yV6
         eJPQ==
X-Forwarded-Encrypted: i=1; AKwUvByMUYMFST8rKExfjxVAkhyccDh8JmyMkqqAPnBGmyelnPDUVQk3Bda2yjaGTaBt+nDdkx6GHpO3F+8zeK9gzFA=@vger.kernel.org
X-Gm-Message-State: AFuF++knozNNWUA5xV/lm+5xc9n74Q8Kq03U46ANk8UkHy6q3hMWM++E
	7J6aPUgyy9OALtJwnwv9txUQp4czO+Bsa5A5rDwpU0A2LYZ/B0lNngeIxX5ABYBiLNzL669FBZ1
	+GkmL+sKUexmJ0zyA+3yVLKY06SQy4JQ=
X-Gm-Gg: AYBFou1MhklDg4cZTSKjibcVNcSwbU3GnCxJQdZ7DJa1OiZQ6Eelgoylf9sbLbPD+P3
	Q2IF0ENlDfOmK4hMg7Qd1gh7966Go3sCASQiA3ffbT5rBPBMzW5SI+brq67VOqGlWsfgKP+TKWo
	x6hojoVrguf9z7vFUoQ9zuxexSdoUCPy3CMy1HX1SK78JFmb7bUSCWjuDWedvPXrLevH4Sr30C6
	Y0NE6SJIm6GxKlVBczL3SiPVloPLr8Oga6b28QrnBKj+99Y3gXHZ1Ql2gerwyudFf5WlHnGUhsL
	Twd7t/CkZNEulTKXkQJjF6UZ7S/da5q2Fps5Z7JHDRxjXVwXTcFUOyl8uJ3d+np/oUWL6rSkuk4
	JgyVyqoK8jwnpgIuxijylPw==
X-Received: by 2002:a2e:be9a:0:b0:3a1:ab57:ea2c with SMTP id
 38308e7fff4ca-3a5c887ed99mr24859181fa.2.1789493447239; Tue, 15 Sep 2026
 10:30:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914-test-zswap-wb-ignore-eagain-v1-1-6fb715c22cd8@kernel.org>
In-Reply-To: <20260914-test-zswap-wb-ignore-eagain-v1-1-6fb715c22cd8@kernel.org>
From: Nhat Pham <nphamcs@gmail.com>
Date: Tue, 15 Sep 2026 10:30:34 -0700
X-Gm-Features: AcwNN1XbTKjkghV6cjRHkn5yooQUMbPEmMgoyX4OeoEMM6gp36nDsHu1A29JVbc
Message-ID: <CAKEwX=N=e+x=S1qq=9fsNgd63axDjjSWgL7MF1pJFEQw71TOVw@mail.gmail.com>
Subject: Re: [PATCH] selftests/cgroup: ignore memory.reclaim -EAGAIN for zswap
 writeback test
To: "Harry Yoo (Meta)" <harry@kernel.org>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Yosry Ahmed <yosry@kernel.org>, 
	Usama Arif <usamaarif642@gmail.com>, Chengming Zhou <chengming.zhou@linux.dev>, 
	Tejun Heo <tj@kernel.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Shuah Khan <shuah@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Joshua Hahn <joshua.hahnjy@gmail.com>, Kiryl Shutsemau <kas@kernel.org>, linux-mm@kvack.org, 
	cgroups@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 1:36=E2=80=AFPM Harry Yoo (Meta) <harry@kernel.org>=
 wrote:
>
> The zswap_writeback_enabled test fails when a write to memory.reclaim
> returns -EAGAIN, which means less than the requested amount was
> reclaimed. attempt_writeback() propagates the -EAGAIN to the caller,
> and the test case is marked as failed even when zswap writeback did
> happen.
>
> This heavily depends on the performance of the backing swap device.
> Reclaim does not wait for writeback (on cgroup v2), does not count pages
> that are under writeback as reclaimed, and memory.reclaim gives up after
> MAX_RECLAIM_RETRIES passes without making progress. On a slow device
> where reclaim does not make any progress before writeback completes,
> a write to memory.reclaim fails.
>
> On a VM with zswap enabled, where IO delay was injected via dm-delay,
> the success rate of the zswap writeback test drops dramatically once
> the delay reaches 11 ms: 7% failures at 10 ms and 79% failures at 11 ms,
> n =3D 100.
>
> When zswap writeback is enabled, ignore -EAGAIN from memory.reclaim and
> determine pass/fail based on the zswpwb counter because that is what
> zswap_writeback_enabled actually wants to test.
>
> With this change, the test reliably passes even on a slow swap device
> (tested up to 1000 ms delay). This makes the test resilient against
> the performance of the swap device.
>
> Assisted-by: LLM
> Fixes: 158863e5d7cc ("selftests: cgroup: add tests to verify the zswap wr=
iteback path")
> Signed-off-by: Harry Yoo (Meta) <harry@kernel.org>

Acked-by: Nhat Pham <nphamcs@gmail.com>
