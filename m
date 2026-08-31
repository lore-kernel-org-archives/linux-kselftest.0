Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BDA128488F;
	Mon, 31 Aug 2026 07:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788162624; cv=none; b=ZPDevhwRK/PjcIZbckUV5+WiQhtHGBe/J/9KGvdbywtJn/8ySFekywF5PwSkZH5YBNbwtMWzo5oqArL+jBOWMgmeaQfiC10JcHcStMQcmd9JTcbd9Wjpx8fpYCZefRAD/8PmF/5FzNuwflXrcLc0QFgGvV1PAHjWXVBRWsOg4vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788162624; c=relaxed/simple;
	bh=5KGP3pDfd2oRfBsbLzYUjRICP7+g6Xk/mWw39Y0NrGw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RsqmhEvEWN40lGfTzm8bsoshM+ORGQV/7EsfHsWlkStupfK49UXyntygOb3KecjU9S5W4qCVJq27pUd6MWqNIgweOie0yjK59uPs1AY7F5NjPUL5x6kFdP+rWhAN6lI3sjAL+h61gom8Z12SAwo/gAPiM5NGHhcjZ0jPpO2lPdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lfbdARZD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lfbdARZD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82C0D1F000E9;
	Mon, 31 Aug 2026 07:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788162623;
	bh=Tv7TETlQonuGOZoFgYmWm+06VrFWt+2TmiKJsqOV6R4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=lfbdARZDrDjmi8JbffZc7p10w97L6Cg8ERpf+ZAI9Sqig8vvsv+1uyBosEi/fHYOJ
	 cavn60wxthLv4tDvWZhDzThBkcEv2E34zHwGmmC2aWmDFz3wd3GkOaWX+03p28vu4F
	 wBE4l7mjB7pHPQX9RuB5raA+SfU6ziP4/gFV5rYmNFzeTGsSwzwK8jWTySwkycDLFb
	 /JxKLu2J2GDJM5irsGhHdeCv2kGyIiV/6eVbA5+unP5tOdkIE+mU5TakR6Vf1A6+uP
	 EYAErwATeaDPcAoPVCYgMxxTdk+8ej4qX616cvqolpqvioCLLs1tfxt9m2Fw/vhfKR
	 jn2cyh7IBSYhg==
From: Christian Brauner <brauner@kernel.org>
To: shuah@kernel.org,
	Disha Goel <disgoel@linux.ibm.com>
Cc: Christian Brauner <brauner@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 1/2] selftests/filesystems: Move file_stressor to dedicated subdirectory
Date: Mon, 31 Aug 2026 09:50:16 +0200
Message-ID: <20260831-klopfen-gedenken-vorleben-54fd9d119a83@brauner>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260521101758.14639-1-disgoel@linux.ibm.com>
References: <20260521101758.14639-1-disgoel@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=1488; i=brauner@kernel.org; h=from:subject:message-id; bh=5KGP3pDfd2oRfBsbLzYUjRICP7+g6Xk/mWw39Y0NrGw=; b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWRNNbJa7jk9x2vJnKI1q/w95k85VJ31WeWwwLnoX628n 6/6yxVc7ChlYRDjYpAVU2RxaDcJl1vOU7HZKFMDZg4rE8gQBi5OAZiI+W2GP7ypE5wnXud85zBf tmAhg+nHZdIVvmpT9r/6rRZ8p1F47jeGf4ZzVl23mJpReL+r7Fv65vLc+79aU1mn/A/l/eH41dy 2kgkA
X-Developer-Key: i=brauner@kernel.org; a=openpgp; fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
Content-Transfer-Encoding: 8bit

On Thu, 21 May 2026 15:47:56 +0530, Disha Goel wrote:
> The file_stressor test requires a 30-minute timeout (1800 seconds) due to
> its 15-minute runtime plus setup/teardown overhead. This is significantly
> longer than the default 45-second timeout used by other filesystem tests.
> 
> Move file_stressor into its own subdirectory (filesystems/file_stressor/)
> with a dedicated settings file to isolate its timeout configuration. This
> prevents the long timeout from affecting other fast-running tests in the
> filesystems/ directory.
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

[1/2] selftests/filesystems: Move file_stressor to dedicated subdirectory
      https://git.kernel.org/vfs/vfs/c/5550456dad37
[2/2] selftests/filesystems: allow security.selinux xattr in listxattr kernfs test
      https://git.kernel.org/vfs/vfs/c/cc87d0a97bc0
