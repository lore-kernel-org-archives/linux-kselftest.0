Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AEF02248A5;
	Fri,  3 Apr 2026 17:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775237837; cv=none; b=GLUHxS/tETehJ06+em85uGhFQDrXiHfCvxn9JMrr2l/TS04yJogi7c+PeN494qrIfFMFD54UtCVChXJa2Ly1R9jN8y/mGfHIh0uG+Ohh7jGHn2E9ZCQhgREeqj9EDdivuzOxeR9raSgF9RhvDYZFGvQEHOKSeUAuBl0cIgQPeXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775237837; c=relaxed/simple;
	bh=5wivT/1CHuKGSFxPIsOl2/Bj9TfQNtwwD7V/KfbZO9U=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=Jpjy53rZQWrSZS6uUvSLYGB2bvXqtdm/zuz508+9V717xptr+CoiSt8JDDTcw+JKs0SPrpdiILTVp4QQDk/6AHkDZUFF/h8qzoYjaYkCbSbbyr//iAk6LPV5ry11X3rPQdt6OjHxxhhVkNwl8MANiqmYPpOiDXHAD6p447/YHV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=y5uKcWX8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="y5uKcWX8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 617ABC19421;
	Fri,  3 Apr 2026 17:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1775237836;
	bh=5wivT/1CHuKGSFxPIsOl2/Bj9TfQNtwwD7V/KfbZO9U=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=y5uKcWX8kD48kqz0cp/5ZVIWIwf5/lCY5Yp+T4vXaP15g2yMe9Vj3qPLTqkUoyvV2
	 XiLcCOnVhZT6oCoXdQncRVCdxKx7QqFb+7xqG2PSIvdEQm9F0M7d7IJFu1gCZczzth
	 gxVOv1zcI6j6rUJeawSxa5WCeXllxWeYr8clXsPE=
Date: Fri, 3 Apr 2026 10:37:15 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Anthony Yznaga <anthony.yznaga@oracle.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, david@kernel.org, ljs@kernel.org,
 Liam.Howlett@oracle.com, vbabka@kernel.org, rppt@kernel.org,
 surenb@google.com, mhocko@suse.com, jannh@google.com, pfalcato@suse.de,
 Jason@zx2c4.com, shuah@kernel.org, Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 0/2] fix MAP_DROPPABLE not supported errno
Message-Id: <20260403103715.0f61fa1d0991a90d85bedaf5@linux-foundation.org>
In-Reply-To: <20260402235933.10588-1-anthony.yznaga@oracle.com>
References: <20260402235933.10588-1-anthony.yznaga@oracle.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu,  2 Apr 2026 16:59:31 -0700 Anthony Yznaga <anthony.yznaga@oracle.com> wrote:

> Mark Brown reported seeing a regression in -next on 32 bit arm with the
> mlock selftests. Before exiting and marking the tests failed, the following
> message was logged after an attempt to create a MAP_DROPPABLE mapping:
> 
> Bail out! mmap error: Unknown error 524
> 
> It turns out error 524 is ENOTSUPP which is an error that userspace is not
> supposed to see, but it indicates in this instance that MAP_DROPPABLE is
> not supported.
> 
> The first patch changes the errno returned to EOPNOTSUPP. The second patch
> is a second version of a prior patch to introduce selftests to verify
> locking behavior with droppable mappings with the additonal change to skip
> the tests when MAP_DROPPABLE is not supported.

Thanks, I updated mm.git's mm-unstable branch to this version.

In [1/2] I added Mark's Reported.by:.  We had David's Acked-by: on v1's
[1/2] patch so I reinstated that.


