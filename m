Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D809431A5F;
	Thu, 13 Aug 2026 10:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786616411; cv=none; b=CBgWAJ4CXVn/xwvkHkOmziimJV1JaHcbYk+Q/ucHJAHs8fjYVwYhz+8sU1YAREQuYj0ejxr921Rag/ZtmT+s80Ix2x2UXjGRF3VhbaxZklbKNWgCU57gMGMR9aZFiMtW3L4NzXPDoF2U8KZfrtOtKnSTEB/znnCIHEHXNi0f5tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786616411; c=relaxed/simple;
	bh=wn9SVymA/JCVT6O5ueYq3v01mmf/qk+4VaF+yPRf8bI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=k+R7bvFCHFyu1QmgllrYgSefSPEJJnQ3ReeQlYXJxL0yoBgOVk2KiuUghkjWtyrRbeCmGs4wiO+nSdratYEXzkrn3cTTrjnKdbc1ClA/i6LBAmLlBI9s/rIxTc2bs1spZSmzXM6VPQX/JSrXQeXbGYfP6Se0Yc88FugolXJMPEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cXkZ+ZUB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cXkZ+ZUB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4BA41F000E9;
	Thu, 13 Aug 2026 10:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786616401;
	bh=hCcvWDNLf67xYnowgK9PnKzbhZcq2vj82FNGjP6KcmQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=cXkZ+ZUBDAnVSoVsPUoZgg4LRPhUtwyq5Cx1tFjtxSAsnAlpWoBqvbNOjs/JB/leQ
	 TblXzahnuu19RCYR837+H1WTwMgpA0oiEDQeqPO8a8ALEpJHYZ76J43D/+X1MnNkbr
	 ICrJB9QEtpJQGoRS8RmUi9avCwalhKonD8HGFty69QEz73L7GX1wiMDjj4yi5k98nJ
	 OvntlwQba7cErH+dUBSorHYIHKxbtNX0SzPI5Pn8hyzkTc/chB7XwFcdFksquCTpHN
	 9MPov+y6pKvyGA8lBG09krK4SXe0OetnuCAfu2QcNv/WT1RcPUoy5vgTxh10hxi7Z8
	 DDFQBQxdH4W/w==
From: Christian Brauner <brauner@kernel.org>
To: Nam Cao <namcao@linutronix.de>, Shuah Khan <shuah@kernel.org>, 
 Wei Yang <richard.weiyang@gmail.com>, Oleg Nesterov <oleg@redhat.com>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <amnlGZesXu-SUK2H@redhat.com>
References: <amnlGZesXu-SUK2H@redhat.com>
Subject: Re: [PATCH v2] selftests/epoll: add a regression test for
 pipe->poll_usage
Message-Id: <20260813-erbfolge-gelingen-zehrt-d1993febcc62@brauner>
Date: Thu, 13 Aug 2026 12:19:31 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev-362b8
X-Developer-Signature: v=1; a=openpgp-sha256; l=904; i=brauner@kernel.org;
 h=from:subject:message-id; bh=wn9SVymA/JCVT6O5ueYq3v01mmf/qk+4VaF+yPRf8bI=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWTVzvJ/WnhpyxbxovI1vnu97wtPebW20XH3to/FNSfC3
 4S/lbec0lHKwiDGxSArpsji0G4SLrecp2KzUaYGzBxWJpAhDFycAjCRKCdGhtN367ZMajHZt8l6
 evi+WMXo6lOtNo96b6+b3xeeISdV5cnI0BKTvuDvxQahOX9VTu/+W9enYfq3zmeG2Mwou79OT9g
 K2AA=
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

On Wed, 29 Jul 2026 13:33:45 +0200, Oleg Nesterov wrote:
> selftests/epoll: add a regression test for pipe->poll_usage

Applied to the vfs-7.3.misc branch of the vfs/vfs.git tree.
Patches in the vfs-7.3.misc branch should appear in linux-next soon.

Please report any outstanding bugs that were missed during review in a
new review to the original patch series allowing us to drop it.

It's encouraged to provide Acked-bys and Reviewed-bys even though the
patch has now been applied. If possible patch trailers will be updated.

Note that commit hashes shown below are subject to change due to rebase,
trailer updates or similar. If in doubt, please check the listed branch.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git
branch: vfs-7.3.misc

[1/1] selftests/epoll: add a regression test for pipe->poll_usage
      https://git.kernel.org/vfs/vfs/c/ab018b7733bd

