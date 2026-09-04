Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D5B51B652E;
	Fri,  4 Sep 2026 07:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788508237; cv=none; b=XYVc3tcRuMw4is0LkvRwYEtQwcsHMqexP+PT+gr+O3DhUc8Wh9j0M4lMa++1BJQ9XSSY0cN0/fM/VmT4ONRkASC+HPCXGyvcuxy+u2MVHEv5C+3U6+M6Ds/5U+0ulVEdZbCWj0Y8m5ez5Gye+gF25h4Ui3Hu8evmsqFOUiOTYOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788508237; c=relaxed/simple;
	bh=maFN79B4UiNTNUcUR3QWi+OBdUrAcheaYp42ki0ovmM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=gmVSvR7oIncB3G8eeXnaSOYFdU7Qk+YbA9qa3dyDXeMmo8DBNZsvSDwJKLl/h1XOx8PMiKF0gSm+22GWKyVQFv54mTzCT74JDWNjWIOKDN0m2/5HGPDGKXzagZLvCyUiiPiDbknhtsEmstwTPjzHQgHgp/U4V5Plsr9Blc0x+Fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fd4MZmqE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fd4MZmqE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A8CE1F00A3D;
	Fri,  4 Sep 2026 07:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788508236;
	bh=y9QnPABxRulC3VVKPDMatVPFU5510laiI9b7bfUp2OU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=fd4MZmqED+wqifzc8YGn3rfQmFbWJJsNcl9i7XwZ+dimxFlhrRfRQVLZJkmRFByJH
	 EIzVt9AW4fK8W52eLlYrWQGebC7Jo8V43MW+Msz9M1+3QMbQyuyk0MRzjBd855fhlT
	 7ljcViG+8bFAf2ueUQ/s+xMTwfAnYdrTPigrO6Nz6G4SjdmSg/NYNEHyfBdDb3OL7t
	 7mU8V4Xxq4s86bZomxpOSrSTXVTER8mGGpVK3aTAUnZKAtQbU/VdE9vkleIhC0/jMx
	 UUDZ0HKLjoBEPw0q/5Ejj0I8MYNLwjY9IAXgQnSY1L2Lzng2WS19cBmNLvcsKrmsCH
	 v4rJxW21J9lZw==
From: Christian Brauner <brauner@kernel.org>
To: Shuah Khan <shuah@kernel.org>, Paul Dolan <paul.dolan.dev@gmail.com>
Cc: Luca Boccassi <luca.boccassi@gmail.com>, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org
In-Reply-To: <20260902162615.11531-1-paul.dolan.dev@gmail.com>
References: <20260902162615.11531-1-paul.dolan.dev@gmail.com>
Subject: Re: [PATCH] selftests/pidfd: fix PPID values in error message
Message-Id: <20260904-freuen-verrohen-zeigen-5af4629d9beb@brauner>
Date: Fri, 04 Sep 2026 09:50:33 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev-db0b7

On Wed, 02 Sep 2026 17:26:15 +0100, Paul Dolan wrote:
> The PIDFD_GET_INFO PPID check compares info.ppid against getppid(), but
> its failure message prints pid and info.pid from the preceding PID
> check.
> 
> Print the PPID values being compared so that a failure reports the
> correct information.
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

[1/1] selftests/pidfd: fix PPID values in error message
      https://git.kernel.org/vfs/vfs/c/b4ad6eb49532

