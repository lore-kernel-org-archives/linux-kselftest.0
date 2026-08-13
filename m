Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7A1744D011;
	Thu, 13 Aug 2026 10:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786616459; cv=none; b=OaiOpOiV0USmzDZk8KyEXJXJceMrEUGVX8ITMAaChJ7DHvcGSoVMaZKPjx2p2/0OMKJAnrXhcnSnDzf2NhDW6inPjllKiFViob9fjAxAsb1h15JN9cxc8lZvXVUx897GP6dd5icXDIzWLaJGtmzXDK/ng54WR5PI8dappnVlqzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786616459; c=relaxed/simple;
	bh=1Qa+YmWJbfW7J0Go3jqLqnrNiVvSMXW5vOe9Y/CIE6I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ty14nGEex0XWirD0ZF3/o1n1ElGCS7kOw8Dnlxx4WD4iKke/yUdtUDeBTVXUcys8jBdkIz3BqApqM6233Q6Wi8G/NSX+j2I2L+2oao3IqrwCMmzB01ixtPwoPTaPINVhbXE+/MHdyyZEnVvqFLN4XkEFZJNeUchAJNF9HbvxrZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KiDdLtbT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KiDdLtbT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAB131F000E9;
	Thu, 13 Aug 2026 10:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786616451;
	bh=tydijiGOwUxPPLbFnqcLWi8yu5bCmjWGd4YlbqlaL7w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=KiDdLtbTuAKKUkBDAuq2oF625WkDWBN4DQ6+VHeAlzWZ3S2bLLocSldbFI5yAI80C
	 fOXQtVVkxuwhtFZGaZmPE3h2/M+Rboqo23DkIe0qSUT81DuBRaRXZDJdYMlvyD7Uv+
	 Ad9C/WRXsVsMxqb5bStIp2od2LQsB589Vp7X0afF7rX/loGgakCsF+8w3aOc26mYXD
	 2eYpCMUKdIUX5bp2fiAfGhcC3WER2Nuxrc6UQX/S43X57NIT4ZNBdJnvd/yY5HpO1E
	 IwpgNZOTpEjqO6U4ksL0JAvJGK//reuFdkCrdXhkR0H1+/kN8swqmTZECYtRAYxoQb
	 LqExEs0V7RViw==
From: Christian Brauner <brauner@kernel.org>
To: Shuah Khan <shuah@kernel.org>, 
 =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>, 
 =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re_=28SUSE=29?= <ricardo@marliere.net>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260810-selftests-namespaces_race-v1-1-4307e833783e@marliere.net>
References: <20260810-selftests-namespaces_race-v1-1-4307e833783e@marliere.net>
Subject: Re: [PATCH] selftests/namespaces: Fix racy pipe handshake in
 timens and pidns_separate
Message-Id: <20260813-gegen-jagten-macht-5a7077095b2d@brauner>
Date: Thu, 13 Aug 2026 12:20:47 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.17-dev-362b8
X-Developer-Signature: v=1; a=openpgp-sha256; l=948; i=brauner@kernel.org;
 h=from:subject:message-id; bh=1Qa+YmWJbfW7J0Go3jqLqnrNiVvSMXW5vOe9Y/CIE6I=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWTVzmrMSQ23jb24s/LmzR6pe4/z9nR4npVjW+H3Pe7mx
 0Mxhydu7yhlYRDjYpAVU2RxaDcJl1vOU7HZKFMDZg4rE8gQBi5OAZjIHkGGP1xbWnbbHzrmIjPl
 xdZPLzdtteYrlJ0bfVb/YV1q2nP/PbcYGc6/XJhia72mMn2xoNyMDKdMV5Upu7dWO5TaG9apH9i
 ixgIA
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

On Mon, 10 Aug 2026 17:56:00 -0300, Ricardo B. Marlière (SUSE) wrote:
> selftests/namespaces: Fix racy pipe handshake in timens and pidns_separate

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

[1/1] selftests/namespaces: Fix racy pipe handshake in timens and pidns_separate
      https://git.kernel.org/vfs/vfs/c/dcacab904fe7

