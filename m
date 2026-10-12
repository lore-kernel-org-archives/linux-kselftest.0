Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4AB847142D;
	Mon, 12 Oct 2026 09:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791797045; cv=none; b=gliX+NjgdxUcub/E2A5o0xcU7Kur/YoQp340gviWrNpVdhFtELoASEO4U3JXEmOykzvH2kxYH4tZslUqUM4oXAjcT6mpHvd4ll4pr4p+aA3FK0yE0RRT40N/Uxt0ZIQAhqmyJVox+9leEkoWC5sllrhKckNKptXnCQbgexqp2Jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791797045; c=relaxed/simple;
	bh=6Nq32IxKaSbnIN7AOyL/EtEd436x8WABsN5LZyrDx+8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=st7sTIILHsiDZpYX3wsL12LoK3VTIdKQyy/Ly3Brw5xgykSAC5zsOD1Ipzh9gR+htBnJyFB11Imgr7qrcglD8286SOnr/KmNu5So1g5d2CEc/L8Z9WyHWC1hhab948xjgtOhJa+BLWkU95Nuqlms8cApX0XBHAf689hCCuYIxkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ioEHbV4h; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ioEHbV4h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E98BC1F0089B;
	Mon, 12 Oct 2026 09:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791797039;
	bh=QOL90pIjqycVxCWaLvkQOh41we7TPJcH3IJeyyik2B8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=ioEHbV4hbbEZwtSh42QC5wyHvnt6noLgGplegyuxEfB5AmAIBXl/Jq2KLRg9QckE+
	 w92WcFG0F6RgTwX9KFQhhPWXf+4jE8We82ZrGoaC+pbjSe/OgvitsE1gFHaE8CQNpx
	 cltnMtlNUIrUnX0QsPMxHLJZkjXW+ekWW8Co9d6J/7UqI23yW6aVRi155z+itF8lWj
	 qHKuf6utc4n0bGc8a/fO6bTwY+f4bIBZ24lseqwSOe1VVWg62bTngZk5EEx90nK3xg
	 +eqF1vzbs0J8LCEAY/INMJOIlSBKfia3UAyVG04dc9kXqcQ9FOV/O/+XvUJgnkdiJd
	 PKL7E59TGX2oA==
From: Christian Brauner <brauner@kernel.org>
To: Shuah Khan <shuah@kernel.org>, Jeff Layton <jlayton@kernel.org>, 
 =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re_=28SUSE=29?= <ricardo@marliere.net>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261001-selftests-namespaces-nsid_race-v1-1-25f542cf0b9c@marliere.net>
References: <20261001-selftests-namespaces-nsid_race-v1-1-25f542cf0b9c@marliere.net>
Subject: Re: [PATCH] selftests/namespaces: Wait for thread exit via pidfd
 in active-ref tests
Message-Id: <20261012-sprachen-unwahr-zuflucht-04b2ef783ffa@brauner>
Date: Mon, 12 Oct 2026 11:23:56 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.17-dev-3d1b8

On Thu, 01 Oct 2026 09:21:56 -0300, Ricardo B. Marlière (SUSE) wrote:
> pthread_join() returns once exit_mm() wakes the CLEARTID futex, but the
> exiting thread drops its namespace reference later, in
> exit_nsproxy_namespaces(). The joining thread can therefore still see the
> namespace as active, making the final open_by_handle_at() check in
> thread_ns_inactive_after_exit and thread_ns_fd_keeps_active fail
> intermittently.
> 
> [...]

Applied to the vfs-7.4.misc branch of the vfs/vfs.git tree.
Patches in the vfs-7.4.misc branch should appear in linux-next soon.

Please report any outstanding bugs that were missed during review in a
new review to the original patch series allowing us to drop it.

It's encouraged to provide Acked-bys and Reviewed-bys even though the
patch has now been applied. If possible patch trailers will be updated.

Note that commit hashes shown below are subject to change due to rebase,
trailer updates or similar. If in doubt, please check the listed branch.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git
branch: vfs-7.4.misc

[1/1] selftests/namespaces: Wait for thread exit via pidfd in active-ref tests
      https://git.kernel.org/vfs/vfs/c/123dcfe87d5f

