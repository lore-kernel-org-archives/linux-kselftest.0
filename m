Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F4C25392A
	for <linux-kselftest@vger.kernel.org>; Wed, 10 Jun 2026 01:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781055252; cv=none; b=PGZYkXPTs4MKyp8qC/uetnLYS2fSFzOq5W/Nz0b2OR4kvKvwrXTSIqJiBFxv7dfnSaXi7X8o3zL3b2irHOAq0t2bz1Y7/hspc3UWSdmWTvQ6gEdv5QjLo+64Llv+RBB4JvFDi8a6DqMz1tf6lNhDn8DFWZyzhREWujF1aydM6/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781055252; c=relaxed/simple;
	bh=A5XhxhQpDjd5Y3dQ6ggNhwKi4mDZqP1k/1/3dKefuSs=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=HjO0Mwukw8c3ZM17CLdmntM76rV2rADDektaCzzNsRCaiXCRDBrwygL3UkGZOE9q4+q8xQkwgNVOz1H7yBO2I1x4yKcJkO8rIWQjMZBeqeCrFHB/lqWu8vgQMceZvw4x64aGMTgBFiWVZpqb9qdxorVcFh0pUqpASYRi+ZW+WJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=VqgCaVNr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="VqgCaVNr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D409E1F00893;
	Wed, 10 Jun 2026 01:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1781055251;
	bh=LXyBFmUl+0nsx+jMMZqWFw5M81eQZPzHgTN30WwAB7s=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=VqgCaVNrlwh2oCMQD5/3dJDQarLRj11lHwjNJ8ixzhgw1EW+4DGVvpGwfSeWuFqyZ
	 Vwojx1TdTDHjOf1z8N1csF7oUE/msADxMLsZ2DrFvRZxYxnorPwcLxbs0koehRnNPk
	 ZFOB+bZROp6qtj+Js1LuKAOFkiaoGuFI7I3zomLs=
Date: Tue, 9 Jun 2026 18:34:10 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Guixin Liu <kanie@linux.alibaba.com>
Cc: Shuah Khan <shuah@kernel.org>, Bala-Vignesh-Reddy
 <reddybalavignesh9979@gmail.com>, Wei Yang <richard.weiyang@gmail.com>,
 linux-kselftest@vger.kernel.org, xlpang@linux.alibaba.com,
 oliver.yang@linux.alibaba.com, Christian Brauner <brauner@kernel.org>
Subject: Re: [PATCH] selftests/uevent: increase __UEVENT_BUFFER_SIZE to
 avoid ENOBUFS on busy systems
Message-Id: <20260609183410.8d6ade7384e6a39c076f9834@linux-foundation.org>
In-Reply-To: <20260608053934.4059533-1-kanie@linux.alibaba.com>
References: <20260608053934.4059533-1-kanie@linux.alibaba.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon,  8 Jun 2026 13:39:34 +0800 Guixin Liu <kanie@linux.alibaba.com> wrote:

> The kselftests case uevent.uevent_filtering fails reproducibly on busy
> systems (e.g. Intel EMR / AMD servers) with:
> 
>   No buffer space available - Failed to receive uevent
> 
> The listener binds the NETLINK_KOBJECT_UEVENT socket to all 32 multicast
> groups (nl_groups = -1) but only sets SO_RCVBUF to 4 KiB
> (__UEVENT_BUFFER_SIZE = 2048 * 2). On hosts with many devices, the
> kernel and userspace daemons (udev/systemd) constantly emit uevents on
> multiple groups, plus the test itself triggers 10 add events in a row.
> The 4 KiB receive buffer overflows before the listener can drain it,
> recvmsg() returns -ENOBUFS, and the test bails out as failure.
> 
> Increase __UEVENT_BUFFER_SIZE to 1 MiB so the receive buffer is large
> enough to absorb the burst of uevents on busy systems. After this
> change the test passes consistently across dozens of runs on Intel EMR
> and AMD platforms.
> 

Fair enough.

> --- a/tools/testing/selftests/uevent/uevent_filtering.c
> +++ b/tools/testing/selftests/uevent/uevent_filtering.c
> @@ -22,7 +22,7 @@
>  #include "kselftest_harness.h"
>  
>  #define __DEV_FULL "/sys/devices/virtual/mem/full/uevent"
> -#define __UEVENT_BUFFER_SIZE (2048 * 2)
> +#define __UEVENT_BUFFER_SIZE (1024 * 1024)
>  #define __UEVENT_HEADER "add@/devices/virtual/mem/full"
>  #define __UEVENT_HEADER_LEN sizeof("add@/devices/virtual/mem/full")
>  #define __UEVENT_LISTEN_ALL -1

scripts/get_maintainer.sh isn't very useful with selftests code.  But
git-blame can be used to find out who to Cc (hi, Christian!).
