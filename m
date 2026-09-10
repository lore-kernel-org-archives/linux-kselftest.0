Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 625143C0A00;
	Thu, 10 Sep 2026 07:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789025849; cv=none; b=kPyAq1Aqh+sblJH+ueDN1bLcEQoolJsQKiVXnbGNu+qlP0+KQX+q+ajb+yEGt8stTsSd3XLNCKYppUMoaWjJmM8dz5uXxrldM0bYhwr/VLEcRlh8QKElwtDZ0tEvU03PgX032HQK0F2FG+vKd7S0olchaeeoN5Q2QsCxQ3cBud0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789025849; c=relaxed/simple;
	bh=HEJ/LBMt/MQ8c9fSBQNJtvszHcGonOsHRlLzCVkCzFU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Fd1y7l+Y/MLXMbY7JzcVe8IhYtN3Fge/9fMDfUk6bWhC1H98B9bM3iPf909qXISCOxlktaPD+YIrPyT3KHmz4YVySs4a0hILKUJmOMtIaDzgadYZvnczQipUznapP3EH17zlMWEUZbp/+NE5A+H13Wg5HqnePfWH8cL4BwsLI94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j3BDDAyt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j3BDDAyt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E028B1F000FF;
	Thu, 10 Sep 2026 07:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789025833;
	bh=rKOlR7zkczjIT13VJsYOxjI0+oR/yc/iWOyIv6LmUYU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=j3BDDAytqTLtz0YcJCmceCQfxTUJheJPZplQ7Uqrxi83jYV+b/zSr+6N7QD+VzGMJ
	 +uzCXw3JgWGik2i24GxaT5wBdQ6wSdDvR+iQuNNP7rLD14SadrHxPWMjeKieP5x8d3
	 q1ohmZ18z+NWYeXOn5k/lXMSW7bEQ1hsVHxdQ5kFAhVSRdva5z5nnfHn/LVysPgQUO
	 3q7kiaZZDWlr8gQEUCl+fU6wDlUsqxLEHjDvFC9pOb8yQUvR0N7wxtqkKvY/B/QoV/
	 OQzldp+HJjOqN4N/2xL/Ha+EUILkKGllM44pJNtjAx+Dvgg8kpCGoVXwjJIHfaGC4S
	 T9dnYZAfq+vuw==
From: Christian Brauner <brauner@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Tejun Heo <tj@kernel.org>, Christian Brauner <brauner@kernel.org>, 
 Shakeel Butt <shakeel.butt@linux.dev>
Cc: Meta kernel team <kernel-team@meta.com>, 
 linux-kselftest@vger.kernel.org, driver-core@lists.linux.dev, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260905191613.3143937-1-shakeel.butt@linux.dev>
References: <20260905191613.3143937-1-shakeel.butt@linux.dev>
Subject: Re: [PATCH v2 0/4] kernfs: three standalone fixes
Message-Id: <20260910-holzdecke-rastplatz-gefeiert-15620af09f7f@brauner>
Date: Thu, 10 Sep 2026 09:37:06 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev-db0b7
X-Developer-Signature: v=1; a=openpgp-sha256; l=1507; i=brauner@kernel.org;
 h=from:subject:message-id; bh=HEJ/LBMt/MQ8c9fSBQNJtvszHcGonOsHRlLzCVkCzFU=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWQtilM91l/xfPeCI0xhFitrvh6ND/C97mhXpMThczB9+
 5q4nj7OjlIWBjEuBlkxRRaHdpNwueU8FZuNMjVg5rAygQxh4OIUgInM38rI8O/gUhWVYz9kHHZN
 mys3IUpp/QtG1Zj1e898XzVl0r3qT6KMDPtMHyxr5G06sEmx3WlDk6zTrne7r8Y433Cad/91T+W
 GX1wA
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

On Sat, 05 Sep 2026 12:16:09 -0700, Shakeel Butt wrote:
> kernfs: three standalone fixes
> 
> Three independent kernfs fixes, plus selftest coverage for the paths
> they touch.  The fixes do not depend on each other.
> 
> Patch 1 adds tests for decoding a file handle and for a rename that
> keeps the same parent.  Patches 2-4:
> 
> [...]

Applied to the vfs-7.4.kernfs branch of the vfs/vfs.git tree.
Patches in the vfs-7.4.kernfs branch should appear in linux-next soon.

Please report any outstanding bugs that were missed during review in a
new review to the original patch series allowing us to drop it.

It's encouraged to provide Acked-bys and Reviewed-bys even though the
patch has now been applied. If possible patch trailers will be updated.

Note that commit hashes shown below are subject to change due to rebase,
trailer updates or similar. If in doubt, please check the listed branch.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git
branch: vfs-7.4.kernfs

[1/4] selftests: cover kernfs file handles and same-parent rename
      https://git.kernel.org/vfs/vfs/c/60da22a38b01
[2/4] kernfs: take kernfs_rename_lock for same-parent renames too
      https://git.kernel.org/vfs/vfs/c/6034974e3aec
[3/4] kernfs: don't lose IN_DELETE_SELF when decoding a file handle
      https://git.kernel.org/vfs/vfs/c/dc1a0cc95737
[4/4] kernfs: fix up the unlocked attribute reads on the creation paths
      https://git.kernel.org/vfs/vfs/c/81bdc85b4c08

