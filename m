Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE01936EA9B;
	Tue, 31 Mar 2026 05:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774934989; cv=none; b=qdWPsT2lHexa/cFwrcdUhahCX7F3ejAbzrO90Rwgj5NPRYS3X0Z+/BT2zfuK5wBa24z6Ui/5d0WEe6pa0gj6CvsRoZcNHLzuRveMA4YEC/f/LiEAeamCSKzz96iKiBGkbUiVHrMsp5ULLQZPR8NdUb22AKkNkD7emKhR52xw9FI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774934989; c=relaxed/simple;
	bh=DNdy8awue6ABSIysKyK4g8jkYPLvxBSWcrnExTEfhDg=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=VcpL65+V/W6iFqjtQkfI3LWCFFLhNF17pBzahb3eIsrNcmR/LcU4VzcDsxxslTxsYWmWj2fihUV1ZW28mLl0e4Ld7Pni7lNCormQ2RoJcB/gG5/88Nw+YNlJtCqURkZlaDZcOWdaQvMzmW6yEhf65222MYbNA8VnYqvP3wj5o5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=HE/NV2dh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="HE/NV2dh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C5E8C19423;
	Tue, 31 Mar 2026 05:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1774934989;
	bh=DNdy8awue6ABSIysKyK4g8jkYPLvxBSWcrnExTEfhDg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=HE/NV2dha6cd2OtUwR78Q437KzC1h6ofgAfUZm9jM9WofymJUN2njFrAFLeB1kXPn
	 gef3tSe4IhSNi7rCJF4iHKGa4at3yroDe4DpECVgZJDDJPgKp9cUNSZxtMJ/k5pc0w
	 2bp/9qroFHA0km+6DDkzHuGC+KMaEz8W9ADsVlOI=
Date: Mon, 30 Mar 2026 22:29:48 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Li Wang <liwang@redhat.com>
Cc: david@kernel.org, ljs@kernel.org, Liam.Howlett@oracle.com,
 vbabka@kernel.org, rppt@kernel.org, surenb@google.com, mhocko@suse.com,
 shuah@kernel.org, linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] selftests/mm: serialize local_config generation for
 parallel builds
Message-Id: <20260330222948.c2cc6544492e68ded355abca@linux-foundation.org>
In-Reply-To: <20260331040156.119158-2-liwang@redhat.com>
References: <20260331040156.119158-1-liwang@redhat.com>
	<20260331040156.119158-2-liwang@redhat.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 31 Mar 2026 12:01:54 +0800 Li Wang <liwang@redhat.com> wrote:

> The mm selftests generate both local_config.mk and local_config.h from
> check_config.sh. With high parallelism (-jN), this can race and lead to
> incomplete target builds (e.g. only a few binaries get built after
> 'make -j100', while 'make -j1' builds everything).
> 
> Switch to a stamp-based dependency:
> 
>   local_config.stamp: check_config.sh
>         ... run check_config.sh ...
>         touch local_config.stamp
> 
> and make local_config.mk/local_config.h depend on the stamp.
> 
> This ensures check_config.sh is executed once per update decision and
> removes the parallel race window. Also hook local_config.stamp into
> EXTRA_CLEAN.
> 
> No functional change intended for non-parallel builds.
> 
> Reported-by: Andrew Morton <akpm@linux-foundation.org>

Well, the wind changed direction.  I saw this race a single time today
but now I'm trying to produce a reliable before-and-after report, it
isn't cooperating - everything is now building with -j100 with and
without this patch.

So not very helpful, sorry.


