Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9065F2BEC5F;
	Wed, 27 May 2026 12:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779883675; cv=none; b=hp/DsqRC04WzVpSiaA36o47pPhZAmYuKcV/vFgNw+KUrmxNnz1w4IX+EhCQQUi1NVTVQe8eSKSp1R0TSjm7yeOO3rB+rcBwFW5HqEc7G9v8vdulRmT6YG6kGpOonkbe0dVzczbwKZ8MYMEypBRw8duUFwj8yFeJwuZT9dJT+Zg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779883675; c=relaxed/simple;
	bh=SKuyeingmXyC07kbzfxbDxuGg4XYSAWlmhsz0dR3lOE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k5lQcNhRIVRnvYANlExFqLUwEcJYXISLfxXPx4WIn0+GA9KEs5N/OzOPgmXB9Mw+HETTxpMoaWsCYMdxBxd7brJm245Cn/PUrEvf3t6G+CN9YADBpZ+V30RAppcyIOnvqJsGw8bjnaf9fhyAFoAxgOCANNOicpvMAuo5u8dXvJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C75YjdSg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C75YjdSg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 814D01F000E9;
	Wed, 27 May 2026 12:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779883674;
	bh=+fd9LQLB60H1uOQVNeuiKHKqqQiMgJHMejFuI8Foi/g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=C75YjdSg4mEGOqiQUb1jt+6LDE7f0sL0KTTgwdTRwQ08OGIwB800dm3zH1vuAkPPY
	 khpbrPX618SW3O+Y6CcLHUC87TBq8jA9gZjmyV+aWI0RSsPAJbwDm3hReRVpNGYFIU
	 iIhyjsbAqCx/bwzvaIv0S61aLnW6u+X17onZINo3sMFnwYAa76EFBimVMa6CA1pEzZ
	 NaQSv/4pIlvE4uMb2m7+c1MnSk95auAuIqjI50uIPoEeMSCHrCYArT0vkTSiev1DYG
	 rcvRMK4vYgSxUHNJl1YSNTug2peZVSfzP9sS96RJi5KNt8rpcKcMLZXmq1ZS76pVKu
	 b9ys5hhKWfeaQ==
From: Christian Brauner <brauner@kernel.org>
To: Shuah Khan <shuah@kernel.org>,
	Jeff Layton <jlayton@kernel.org>,
	Florian Schmaus <flo@geekplace.eu>
Cc: Christian Brauner <brauner@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests: Fix Makefile target for nsfs
Date: Wed, 27 May 2026 14:07:48 +0200
Message-ID: <20260527-rezept-wallung-handwagen-9d63410265fe@brauner>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260526-kselftest-nsfs-v1-1-7b042ebe42d6@geekplace.eu>
References: <20260526-kselftest-nsfs-v1-1-7b042ebe42d6@geekplace.eu>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=1181; i=brauner@kernel.org; h=from:subject:message-id; bh=SKuyeingmXyC07kbzfxbDxuGg4XYSAWlmhsz0dR3lOE=; b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWSJ3ZvKr8C1UDDzvk5cftCFUANJs6oPPB/ETBvlFadMV o19eXx2RykLgxgXg6yYIotDu0m43HKeis1GmRowc1iZQIYwcHEKwES0jBj+F4dU33z737GFe+fH 7JWS898uu8A+53nYUdU3q1gTD+7KbmFkmJ74JXjbsdcv+hbp3o8q7NyQEXWwz3mbxG2x87yuLh9 7GAA=
X-Developer-Key: i=brauner@kernel.org; a=openpgp; fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
Content-Transfer-Encoding: 8bit

On Tue, 26 May 2026 10:01:08 +0200, Florian Schmaus wrote:
> The kselftests for nsfs where moved under filesystem/ with
> commit cae73d3bdce5 ("seltests: move nsfs into filesystems
> subfolder"). However, the kselftest TARGETS declaration was not
> adjusted.
> 
> Since the kselftest Makefile ignores errors unless no target builds,
> the invalid target declaration can easily be missed.
> 
> [...]

Applied to the kernel-7.2.misc branch of the vfs/vfs.git tree.
Patches in the kernel-7.2.misc branch should appear in linux-next soon.

Please report any outstanding bugs that were missed during review in a
new review to the original patch series allowing us to drop it.

It's encouraged to provide Acked-bys and Reviewed-bys even though the
patch has now been applied. If possible patch trailers will be updated.

Note that commit hashes shown below are subject to change due to rebase,
trailer updates or similar. If in doubt, please check the listed branch.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git
branch: kernel-7.2.misc

[1/1] selftests: Fix Makefile target for nsfs
      https://git.kernel.org/vfs/vfs/c/77d1a2d2318f
