Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2632B4963C3;
	Tue,  9 Jun 2026 15:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781020526; cv=none; b=KnJDm6bt/+d19KaNQdzFxRnCO2qkeOQAW9/tkFl3kqj2Hpwre7998Z2xq+rkcL+geXiNZF3zqOgaDgJlU3WJMOsBHcksntYSCzRA8t/qFP15GyUMeyFEwGbplZP3HYkeUwRb/h6FXD4UFtte/4nNP0gciznmFRVlCu4qRk0VuWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781020526; c=relaxed/simple;
	bh=QMLncm3QZNbzA9IjyGg+4yTlxR5sZfMyRYZbVdKowTU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Hm+juc7u7nQumf5tSYJxyKm3K88MkT0cn3VAKl8d0eY5k+TQ/xCoe4fQ3nrBfsosWjvlZmm/z6T+HGbJ34Kitm7Ij+lApa2uJVsl0gDwGIrlPn4H7+/2LcgseEEKXxz/mEDpR7TH3C7zLlVA/kxQxStQVPP+DX2ESoTC/t2g7T0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hHxclXE6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hHxclXE6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7ACA31F00893;
	Tue,  9 Jun 2026 15:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781020524;
	bh=ZbzCK1HDZ6UQM0wxmODd5gt3PhXikPzvdF+pmduOMD4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=hHxclXE61EFMwxcZZ4ijcKdmZQrXuHFpw/8CotX43ijEM7cIj8eoOWyMjiEpkQs9z
	 8s+wxGuYEcL7qIWh2PuqYhtJ6sViwxkpG7ntvpgu2+iqzL+PKZjbAqlVXkOA9EB3JM
	 RXOop81ORKUegIcXQm2xuJUzqk3dxVGZP+7fF5udRvb4yV+c/UJA45i5eC40GfmVU7
	 DatfDIxUwYt+satO6eHDulTBroOMM0WfB/mOWLojxGfwT4BDyImoIC9N801qlUZf0D
	 TE0DXAd/e0ONGvRHfe6p72N+i7y/1poMqooU5WCKSx9FexX1x+6j+rR0jpJR23Q5/I
	 ZOJgu/CycSMNg==
From: Pratyush Yadav <pratyush@kernel.org>
To: George Guo <dongtai.guo@linux.dev>
Cc: Mike Rapoport <rppt@kernel.org>,  Huacai Chen <chenhuacai@kernel.org>,
  Pasha Tatashin <pasha.tatashin@soleen.com>,  Pratyush Yadav
 <pratyush@kernel.org>,  Shuah Khan <shuah@kernel.org>,  WANG Xuerui
 <kernel@xen0n.name>,  Alexander Graf <graf@amazon.com>,
  loongarch@lists.linux.dev,  linux-kernel@vger.kernel.org,
  kexec@lists.infradead.org,  linux-mm@kvack.org,
  linux-kselftest@vger.kernel.org,  George Guo <guodongtai@kylinos.cn>
Subject: Re: [PATCH v3 0/3] LoongArch: add KHO support and selftests
In-Reply-To: <20260609143945.512688-1-dongtai.guo@linux.dev> (George Guo's
	message of "Tue, 9 Jun 2026 22:39:45 +0800")
References: <20260601092823.110362-1-dongtai.guo@linux.dev>
	<20260609143945.512688-1-dongtai.guo@linux.dev>
Date: Tue, 09 Jun 2026 17:55:21 +0200
Message-ID: <2vxzbjdjso7q.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Jun 09 2026, George Guo wrote:

> Hi Mike, Huacai,
>
> Gentle ping on this v3. In the v2 review you mentioned you'd wait for
> v3 for a more detailed look -- v3 addresses both points (folded the two
> selftest patches into one, and replaced the LoongArch-specific kill
> loop with timeout(1), with the timeout value set per-arch in the conf).
>
> No rush, just making sure it didn't slip through the cracks. Happy to
> spin a rebase if it's gone stale.

It is on my review list, and I hope to get to it soon. But no promises
unfortunately.

-- 
Regards,
Pratyush Yadav
