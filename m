Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CA3D33F58E;
	Thu,  9 Apr 2026 13:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775739997; cv=none; b=LrB10PDDkgiWszQizAxSi5kzaklGtK1oaNtAM5PDFtuw+ORugYHzYdcp2IpxYeTjzX1aW828saktKoxbEkN0JzRzpjM5+hlrnvHOPqCs7nZ9nH6VRz5AtW5tPB0YFNdCuIntwWftB2KoAveZRRRFTeOseWgbvmAooWHsry7AZao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775739997; c=relaxed/simple;
	bh=1pFpBCsRlcNjIZkPg0z6QrG+WsJIepkHhkyq+GrZL2A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oxq6KPC2xu3Z3E6foafz48nKvMoHnU9ltBpgnoWPtI1jEF+wtElJF238sc5yzqP1fIbSpyp5wqTnFaBoYCgWSUQQrxdWdNc+xoyjTNJNl5o/UkPCGB4zA06u5wqghMByugCLsyyY254/9pHaEE3mEdF9Xr0ZAww1vf1XLXZLHl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NiBloToK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NiBloToK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6757C4CEF7;
	Thu,  9 Apr 2026 13:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775739997;
	bh=1pFpBCsRlcNjIZkPg0z6QrG+WsJIepkHhkyq+GrZL2A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NiBloToK5j+8x4vze42pybDpWac6kBMnB3MzfzHUh/5e9hn9WEJpCgilUBclycCwi
	 R3C/rYaBEx7mSQ7lzdPSrnWQyCVoJks4HpDLeP/aoOVdx6PMW3j/3sHPIUnwHoHqR9
	 y+bOQ5nid30XXRu0SIPwCCdGcgMLZJCtTC0SkCrYrAiox4yPH4+qKaiGtiFeNAa9OM
	 Ik+Kh91O44HW7n9akOl6EN84bTPT22wXIuPCHzvQTvP1wCjj7zQnW3jQuttu2xot2J
	 f07v66iXc1/nyfVPW+vIhe46PEpF7R7iDbt8gBmfELTljmzsHEm0hhnnv6P6mn7R0f
	 ZwpsN27vmQIRw==
From: Christian Brauner <brauner@kernel.org>
To: Shuah Khan <shuah@kernel.org>,
	=?UTF-8?q?Ricardo=20B=2E=20Marli=C3=A8re?= <rbm@suse.com>
Cc: Christian Brauner <brauner@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] selftests/namespaces: Fix test hangs and false failures
Date: Thu,  9 Apr 2026 15:06:31 +0200
Message-ID: <20260409-revision-hauch-b4cc4777185b@brauner>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260407-selftests-namespaces_fixes-v1-0-59109909d88b@suse.com>
References: <20260407-selftests-namespaces_fixes-v1-0-59109909d88b@suse.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=1502; i=brauner@kernel.org; h=from:subject:message-id; bh=1pFpBCsRlcNjIZkPg0z6QrG+WsJIepkHhkyq+GrZL2A=; b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWReXxKhenxx/+IlsXGeAvn+ErKmaRNk5/Zt0X79RuRWL EO3v8D7jlIWBjEuBlkxRRaHdpNwueU8FZuNMjVg5rAygQxh4OIUgIk4H2T4n/drhtec8rPbltx4 tWpxcecMsYyQFib95C/Ntt4MronP7jH8Ypowc7aCy/VzoisYd23/orK0N2n3ctWjMce/hL5ZuHf pGRYA
X-Developer-Key: i=brauner@kernel.org; a=openpgp; fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
Content-Transfer-Encoding: 8bit

On Tue, 07 Apr 2026 11:35:44 -0300, Ricardo B. Marlière wrote:
> This series addresses three reliability problems in the namespaces selftest
> suite that cause tests to hang or report incorrect results.
> 
> The first patch fixes a hang in nsid_test where the grandchild process is
> not reaped during fixture teardown, leaving it alive and holding the TAP
> pipe write-end open so the test runner blocks indefinitely waiting for EOF.
> 
> [...]

Applied to the vfs-7.2.misc branch of the vfs/vfs.git tree.
Patches in the vfs-7.2.misc branch should appear in linux-next soon.

Please report any outstanding bugs that were missed during review in a
new review to the original patch series allowing us to drop it.

It's encouraged to provide Acked-bys and Reviewed-bys even though the
patch has now been applied. If possible patch trailers will be updated.

Note that commit hashes shown below are subject to change due to rebase,
trailer updates or similar. If in doubt, please check the listed branch.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git
branch: vfs-7.2.misc

[1/3] selftests/namespaces: Kill grandchild in nsid fixture teardown
      https://git.kernel.org/vfs/vfs/c/c87e78c29c78
[2/3] selftests/namespaces: Fix waitpid race in listns_efault_test cleanup
      https://git.kernel.org/vfs/vfs/c/f079c63caa7c
[3/3] selftests/namespaces: Skip efault tests when listns() is not available
      https://git.kernel.org/vfs/vfs/c/5bdb13872094
