Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792694300;
	b=EnMnhkf4P6UXsusNbBujILjC39hB6jyyqWyngrY/9kOILSmA3Q6pvBDTpVzZN2ekY636
	 8syjrUPtJCGoxsl6Y+1ckISsGmEKfX3BAbwdBVZgXhurLcY5TgVR5auaUBa36yYd3hcgO
	 VhP4Hh7qfRElI9E9AXnTaJXDQlLxr/GwVOU9/l6VkjH4GRSSlz0IPEAvHr0nx0arx1T27
	 1z1rTh4eeafWWFY9uJv9cSLWEME4w0hhL+rdggXSLyY3yS6s8xZkWz6VnK5VlWNX7MzGz
	 Vsu+t5LJ45ahnb4i/Rca46iET36UMEFw9Q4S5eC2o53p2EnMYVHnCpz6GvKIiAhgmbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792694300;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=CadaOibrVyhEvi6p+kMtSNGOozNSMN2i4Lv7CyhEJVA=;
	b=UF5olITuUzcRXB9l71JTb3UTSQvXpTv25JF1f/TuwA6ZooQJpenePKkbL/opXSfcaBN6
	 ClcEDwS6upxA7eqPoXudwLwPDOXnVj6628qkmgRac8znULHhTxvlP/5b8vcU+PZQlA402
	 5lhZn9ht+MiI69BuuN95yR/T03olUlwBCVa9Sy12JukTDo+7cIufD0dQXKYscFcBPSD2k
	 5ajxVHWAl3MUMXaK1GXZNjqhwgnIEsrguXOH4w9jwbGm/k8ya3HTJtr4xdRS97uuUw96n
	 uuLhKE1pf2p3tcxkfljv1+CdgpOGFOm7l2UDfmTTPYZ1Z3n5RhP8GeBbkLbze1Wn9cg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OtggQLeq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35766606A320;
	Thu, 22 Oct 2026 18:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OtggQLeq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12F841F01825;
	Thu, 22 Oct 2026 18:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792694300;
	bh=CadaOibrVyhEvi6p+kMtSNGOozNSMN2i4Lv7CyhEJVA=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=OtggQLeqk8OXmFF0mmCBtxeXlvUobmmmgNYPffTdjr5BO+NcTjaNJlXx48ohfxPEE
	 eadv+EjJ+/pyToFu0QFCgI9e0KrUxw47JGLuayDUplVFPsQerVmVBXPfiw1xaB/lj6
	 J2dObXmvcbs7tCp8F48sU3FZ6TnQYv2Ll3f/lOYvLN1FlnKMJfYzAVMFeN0Wv79C6d
	 QWc13D+xS2f6inSC0AvucYSkrI751dUx0Tng93wYkHx2QoK6y3rEoVM4QN4ZfpP/VV
	 oWs7muCIWE5vQYB5hRsqeQ0RJb3OcPI0QmLhjskMU7VltW6BTAKk0/mqsyAA9AMzBH
	 D8eAviU5N3W8A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 076C83808222;
	Thu, 22 Oct 2026 18:38:20 +0000 (UTC)
Subject: Re: [GIT PULL] kselftest next update for Linux 7.4-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <4017e436-9f32-4cdb-a75d-4cbfcddd69f4@linuxfoundation.org>
References: <4017e436-9f32-4cdb-a75d-4cbfcddd69f4@linuxfoundation.org>
X-PR-Tracked-List-Id: <linux-kselftest.vger.kernel.org>
X-PR-Tracked-Message-Id: <4017e436-9f32-4cdb-a75d-4cbfcddd69f4@linuxfoundation.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest tags/linux_kselftest-next-7.4-rc1
X-PR-Tracked-Commit-Id: 368e5d4d12a802ee3708800319cd13904721286f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 968de9d17980a0e538fc4e4394af49465294386d
Message-Id: <179269429850.110555.17915516313806192723.pr-tracker-bot@kernel.org>
Date: Thu, 22 Oct 2026 18:38:18 +0000
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, shuah <shuah@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Wed, 21 Oct 2026 13:34:16 -0600:

> git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest tags/linux_kselftest-next-7.4-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/968de9d17980a0e538fc4e4394af49465294386d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
