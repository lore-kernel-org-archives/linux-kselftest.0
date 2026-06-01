Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9B4F1339B1;
	Mon,  1 Jun 2026 23:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780355818; cv=none; b=ck3bQ/uT6yDI0+0PQ97zlwxZuaWqcGg+8nwI8Gl8XdC+Ey9J+ILcatFpsXp1ZSQhiRKRQU9PtsTr3D2AG95eT3qeFjzNpQYojbEWdYDtwhxJDQ+Swhfzgs86UjSPGnUbvhVOD6NUeLI1tebW0fGZJC3Fub1zdkhbEnXVjmdQBus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780355818; c=relaxed/simple;
	bh=nuVegyW2v1EUlcncuX7cAKl+zieqq5BNq/FIHfCvzJ8=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=I8QWFBKdrFvt9ZbKNqr8tSlrHSYu0W60qBedlA7jAdc6iXKiIWn9rHwoIvQ89LWUsV6PuKZTFb0yd3//6Omy94K4eHfIKCZ2qYU020niduLtr3fukDroVHOXp9AYxWoS3hlQuHIB7raTTmGvT7vRihO5T4gyoFjBhpZqK/i12lM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=uLIdPDK+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="uLIdPDK+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02DDB1F00893;
	Mon,  1 Jun 2026 23:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1780355817;
	bh=4cEAcStiqlum1XAuuC9p8c4isySH/g/mtr+gGQXo9Jg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=uLIdPDK+VSy74BjLMhQwhGVHJZEqEdvehJq4lCeqxoY3WkVPbsKy+cIwb1hHRuUhI
	 AOiSgk07vxOWw/kzr3gVhVB/7zc+cLgupCmRL3PF82kG5cFjq2DBLHw+Xul+WM+o1K
	 B+e+mE7RtRTUdVW1yJKxa4iewFWKIlCB1kLlf3ww=
Date: Mon, 1 Jun 2026 16:16:56 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Hongfu Li <lihongfu@kylinos.cn>
Cc: david@kernel.org, ljs@kernel.org, liam@infradead.org, vbabka@kernel.org,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com, shuah@kernel.org,
 linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/4] selftests/mm: refactor pkey helpers and fix mmap
 error handling
Message-Id: <20260601161656.203154d9f53c2861f1bb2623@linux-foundation.org>
In-Reply-To: <20260601061953.696844-1-lihongfu@kylinos.cn>
References: <20260601061953.696844-1-lihongfu@kylinos.cn>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon,  1 Jun 2026 14:19:49 +0800 Hongfu Li <lihongfu@kylinos.cn> wrote:

> The main changes in this series are to refactor shared tracing and assertion
> helpers into a common file, unify both pkey selftests on pkey_assert() and 
> per-test tracing for consistent diagnostics, and add missing mmap() return 
> checks with MAP_FAILED used throughout for readability and consistency.

Thanks.  AI review found a couple of legitimate-looking issues.  At
least one of these was also reported against the v2(?) series and you
said you'd take a look.  Were these things false positives?

	https://sashiko.dev/#/patchset/20260601061953.696844-1-lihongfu@kylinos.cn
