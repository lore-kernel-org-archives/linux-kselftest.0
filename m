Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92E0328003A;
	Fri, 20 Mar 2026 13:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774014472; cv=none; b=gMLn2jp/3HzxCjqEmG1ZFMziSBzHkQQ1sqxIr5xyoIci27WGcthkdI2GM1alBVgT5C2vdwget2eolGb2/gbP0vl8n6/DBvNK88XKeJZkSYEglOCqVLc2rKiGUGYDthVOxQCF9RIN9CL/IsPEDHUCYtyjYDrzvY3OaWtJNivuh1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774014472; c=relaxed/simple;
	bh=1yj3+8JgkDHlZE7ywicfVi+R3aRnk7415/Uk3keT3Vk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JAyjNlhScuaS/4gpDVKDfq8eI2zyDe4M6qo2PTncMT6EK56DTF/NH/yO3UFlF18ViS+dgmgJGFovb5b679dxbYz/VQlivGEOf5VgX+UhDGHy2oqYFcWEFKJL7ngh89FMm8l7Y9wIAq/WHxLVkYfoHAhwy80DvzAcnItvBHQ0s8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NmvzAFql; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NmvzAFql"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33F59C4CEF7;
	Fri, 20 Mar 2026 13:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774014472;
	bh=1yj3+8JgkDHlZE7ywicfVi+R3aRnk7415/Uk3keT3Vk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NmvzAFqlIF1Sd2XV6mXt4Pno+pDkhmq1oWPGDeuUIhUSBsW2XE0vWcp9ZB4tOkdj3
	 bLl4RsR0KwwNepoNGRnJuDs67bGOos+dE5N7lLPsoilCBKEJkUzHWQlJce274btbjp
	 iUK2GJ0Jt3bNQ8YmNS4Xar8NdnlwAVIbN776zHIJJRnvI7SI+oW72LH6i/4CiUfpvl
	 NYHa85yZo4xMJR2v5tgZu4gdLmmIqnCPxDrTf+GlGJ4U9hz9Db9BKZ5qKZRo77Y3oP
	 qA7levsoBLBWpLMkAHedaD1hdLFhI5/pOKNw5PwcfTJm10mv9rCG4SGzLOy7Qs4yMk
	 K+AyxVJRpz75A==
From: Christian Brauner <brauner@kernel.org>
To: Pavel Tikhomirov <ptikhomirov@virtuozzo.com>
Cc: Christian Brauner <brauner@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Shuah Khan <shuah@kernel.org>,
	Kees Cook <kees@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Jan Kara <jack@suse.cz>,
	Oleg Nesterov <oleg@redhat.com>,
	Aleksa Sarai <cyphar@cyphar.com>,
	Andrei Vagin <avagin@google.com>,
	Kirill Tkhai <tkhai@ya.ru>,
	Alexander Mikhalitsyn <alexander@mihalicyn.com>,
	Adrian Reber <areber@redhat.com>,
	Mateusz Guzik <mjguzik@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v6 0/5] pid_namespace: make init creation more flexible
Date: Fri, 20 Mar 2026 14:47:34 +0100
Message-ID: <20260320-abend-kauen-5279c838c15e@brauner>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260318122157.280595-1-ptikhomirov@virtuozzo.com>
References: <20260318122157.280595-1-ptikhomirov@virtuozzo.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=1677; i=brauner@kernel.org; h=from:subject:message-id; bh=1yj3+8JgkDHlZE7ywicfVi+R3aRnk7415/Uk3keT3Vk=; b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWTu9f8x7fPlWKEKRqPy7FSe6WxneNayK6jat6yYoKLQq r6bqba9o5SFQYyLQVZMkcWh3SRcbjlPxWajTA2YOaxMIEMYuDgFYCKLfjIyHAyt0Y/2vHFyef3W 1pNJTx9vLXtu5vC1ZkNS3HeP0vviUgx/BScf/mamosYoX/1vf5bOho6mT6UHyy7Le4pnODxntHz IAAA=
X-Developer-Key: i=brauner@kernel.org; a=openpgp; fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
Content-Transfer-Encoding: 8bit

On Wed, 18 Mar 2026 13:21:48 +0100, Pavel Tikhomirov wrote:
> The first patch properly annotates accesses to ->child_reaper with
> _ONCE macroses, to protect unlocked accesses from possible cpu/compiler
> optimization problems.
> 
> The second patch makes sure that the init is always a first process in
> the pid namespace, previously this was only checked for set_tid case.
> 
> [...]

Applied to the kernel-7.1.misc branch of the vfs/vfs.git tree.
Patches in the kernel-7.1.misc branch should appear in linux-next soon.

Please report any outstanding bugs that were missed during review in a
new review to the original patch series allowing us to drop it.

It's encouraged to provide Acked-bys and Reviewed-bys even though the
patch has now been applied. If possible patch trailers will be updated.

Note that commit hashes shown below are subject to change due to rebase,
trailer updates or similar. If in doubt, please check the listed branch.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git
branch: kernel-7.1.misc

[1/5] pid_namespace: avoid optimization of accesses to ->child_reaper
      https://git.kernel.org/vfs/vfs/c/d9c857aee2eb
[2/5] pid: check init is created first after idr alloc
      https://git.kernel.org/vfs/vfs/c/39c8806e2d88
[3/5] pid_namespace: allow opening pid_for_children before init was created
      https://git.kernel.org/vfs/vfs/c/a3bdc23ba8ea
[4/5] selftests: Add tests for creating pidns init via setns
      https://git.kernel.org/vfs/vfs/c/7c5219e1a606
[5/5] MAINTAINERS: add a new entry for testing pidns init creation via setns
      https://git.kernel.org/vfs/vfs/c/2b46715fd9ec
