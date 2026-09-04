Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B1E3D566A;
	Fri,  4 Sep 2026 08:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788509232; cv=none; b=aU7Weux3HhTkpzUSDNFjCRJOBPOLxcyqGn9S4qcXhMPTa1VzQsq3aRJZBGl2OTjlwyjyoHYC4HJwy4KOQqkC9EGgv5H6u2XhjP4rBg676l5pqjRuGQNKjk+b5XhOQFlL+aaXlNwflM5SjKOguZFiAb69ee7sprjz8JQUxYBsubU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788509232; c=relaxed/simple;
	bh=nIzb/NtZrQ9X06TaH4MEw11stImndvAtVzhCob516yo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=OFn2d+QH0yDMc6P10RH9KajKOzpm9Tcv5oF05qXjQTK1jb1/4OT+EWN9OZdR0pENlNmACgX5HJPMoylDj4BV6QIpucn7Z2YvlDfVJKA3ZCJGsbDOiVev51zQ5NY/8qnI438Kub38T3SA/gbhlIkQER7CpqiNbwcNydCcO15HFWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eBzKnRS9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eBzKnRS9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FB7B1F00A3D;
	Fri,  4 Sep 2026 08:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788509228;
	bh=ygWvMrdiAzcLUzh3sJXFGlIO6jh/AShzu4OcprEpEP4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=eBzKnRS9QE1xQykTip02HxjrHBCl9PUoa2f+1NE3cvsqwS865NPjZI9PMiFAHkSGP
	 5og/C6FubhQYg5iggDOzMbKJJOagSKulWHk3sa86NFss9St+BfDorGeHnSxM4fCAkg
	 eAt82vQqz6PS4uTUdrUJw1I+37CUHB8Ga2QFv5TrFX3fGlVOHFbV0y6s3xLMZbC9zZ
	 1uEJ6x57YC4kOartlCCxLRL5/KnF+7SpDWtKxUPAuk0o4tqm7tTsrZZO8GyvcWs0To
	 RgPidqo9qESgJwi7Ob0M4Hph8HP66PxTj2vE6dUdm58qfeKrmdU+5duOVqPIE6hJue
	 EmmgTU41BojYg==
From: Christian Brauner <brauner@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Tejun Heo <tj@kernel.org>, Christian Brauner <brauner@kernel.org>, 
 Shakeel Butt <shakeel.butt@linux.dev>
Cc: Meta kernel team <kernel-team@meta.com>, 
 linux-kselftest@vger.kernel.org, driver-core@lists.linux.dev, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260902014050.499002-1-shakeel.butt@linux.dev>
References: <20260902014050.499002-1-shakeel.butt@linux.dev>
Subject: Re: [PATCH v2] selftests: cover kernfs dentry revalidation
Message-Id: <20260904-hochnehmen-bildhaft-problemlos-a5181ef57ee3@brauner>
Date: Fri, 04 Sep 2026 10:07:04 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev-db0b7

On Tue, 01 Sep 2026 18:40:50 -0700, Shakeel Butt wrote:
> kernfs_test only checked two xattr calls. It did not touch the part of
> kernfs that userspace hits most: the dentry cache.
> 
> The kernel adds and removes kernfs nodes on its own, with no VFS call
> behind it, and removal cannot always unhash the dentries that are
> already cached. So ->d_revalidate() is what keeps the cache honest,
> let's add tests for it.
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

[1/1] selftests: cover kernfs dentry revalidation
      https://git.kernel.org/vfs/vfs/c/c38b381d2027

