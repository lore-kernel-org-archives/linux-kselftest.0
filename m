Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C545748CD56;
	Fri, 25 Sep 2026 11:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790334142; cv=none; b=h0R/NGkXzUZUA84sd5OzYqI2fySc7D7yzZDCCFVBJckB8fOMUsSmRsBXrWX0YshiBa/+WKzOy7PoFu37rFPQvHzmgJMdLF/9EbWHFalOa503RDG7a4Dprz0Xr3Gq6O/ZeOX6GwnHuAgCDEsu+MQAbrZ7UAgyIM6qDCL9BBCMSKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790334142; c=relaxed/simple;
	bh=da6g01JLLJuYvc+Z5TDjyo2/9KuKxQvcQmESGkU8tcY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=vDgElE9pceIT3UNIk9B2TOUx5gINIO4YO2gjQsNCvhcJoyghYQ4sin2xEGvtj8wQJlJ5xnLBkCLcEEaWeirwyE0yr2t3gjC8Tgyle7Qse4z0OBAptMSzuDov8E6PR7qnD5MJ/8vALy7nBtiAvCmR06qpdNnuP0X0u49N4xwQwtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SX8lNg+9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SX8lNg+9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACAA71F000FF;
	Fri, 25 Sep 2026 11:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790334133;
	bh=/NVqZhf6mCxo7NZ2EURWGfnN9Xg2ZWgxXDrMRFTZgDM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=SX8lNg+9EnPqoAU3mIv/6cpW9nNjzLeafYugEHkyLIi80XzBNchirl2o40lAYHnlM
	 ff6xn5D83qdykKMteEaauxEM8nuO42qXoadIQpGpFJLTry7nObx8QDEPiVlLf6gLMg
	 6kYeva4gF7m049071JZsbIaBxZw1CrXWgf2h4YPaP8vhG7aIpKilcXHWs7tG2yc+19
	 PaHySVN2b0GaoSorBs6RGh3Z7c2szqjgw7/flMlEeMW48gyv8tLLNX3YThalIkFGXR
	 i2UbpN+rpm3C2OfOLgeNhxXPOrOldnAg9+Mw7r9PzgiCpXDdWwovUnCFvxxfTJvZBn
	 K+9sPeLMdBtlQ==
From: Christian Brauner <brauner@kernel.org>
To: shuah@kernel.org,
	Disha Goel <disgoel@linux.ibm.com>
Cc: Christian Brauner <brauner@kernel.org>,
	aleksa@amutable.com,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] selftests/filesystems/openat2: fix O_LARGEFILE definitions for non-arm64 architectures
Date: Fri, 25 Sep 2026 13:02:07 +0200
Message-ID: <20260925-entwurf-zierde-ohrfeigen-551cda0dfa2b@brauner>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260917095707.16986-1-disgoel@linux.ibm.com>
References: <20260917095707.16986-1-disgoel@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=1330; i=brauner@kernel.org; h=from:subject:message-id; bh=da6g01JLLJuYvc+Z5TDjyo2/9KuKxQvcQmESGkU8tcY=; b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWRtC9nAV+o950zMG+0lXTo5u4Lsd71Zq8he9+eT4or7J /Yc11gQ01HKwiDGxSArpsji0G4SLrecp2KzUaYGzBxWJpAhDFycAjARCWmGv2JmPiwWVX9sN9SK Lf6qPI/r7yR2naPLXjzhMTmwpyO65h7DX6HfGxVU9xkZ3Yp7NZv5iHqr8/+lN/h0d73gllugNOv tdUYA
X-Developer-Key: i=brauner@kernel.org; a=openpgp; fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
Content-Transfer-Encoding: 8bit

On Thu, 17 Sep 2026 15:27:05 +0530, Disha Goel wrote:
> The openat2_test.c code previously hardcoded O_LARGEFILE to 0x8000 on
> all architectures other than arm64 (aarch64).
> 
> However, on several architectures this value is different. For example,
> on PowerPC (including ppc64le), O_LARGEFILE is defined as 0x10000,
> whereas 0x8000 is actually O_NOFOLLOW.
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

[1/2] selftests/filesystems/openat2: fix O_LARGEFILE definitions for non-arm64 architectures
      https://git.kernel.org/vfs/vfs/c/caddcdb829b2
[2/2] selftests/filesystems/openat2: make /tmp a mountpoint inside private namespace
      https://git.kernel.org/vfs/vfs/c/26915b466490
