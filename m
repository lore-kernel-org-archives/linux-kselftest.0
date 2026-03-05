Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF951E86E;
	Thu,  5 Mar 2026 22:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772750994; cv=none; b=qCC93zFhxrEeF5RgzMKg44koese9MAgwqxJM1sXQIH6L41hZEtTeDR/qm/OGzOryiBCHKn3iIVHYfJXHwawL+YeLfnsFJOHQ3K9KxUYAaIAIe3bJB/eGLCl6QZpc1JSX9PPQxo03oUKtHY9smX42kCrFkfNwIwpWBRTgd/q4zMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772750994; c=relaxed/simple;
	bh=aFDeB1Cx2VZhCKNYc5NqzFoT6MRL0GXJ2BdOEwBPL24=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Y5icFbmmis6howOJwHGQ4Y3tccPUQysVS0SVhuu9QTNN28Td+6L1XTOw/KIGLLUIlwXIzRMLLav3CBXNiwvsGL7bEBaRjuIQRLwjWkg9nr4hsfAyj+AccyddoZIXEO7jy37p8ZI2nS0WOoKZQuMwhln5ZUMbYP3fzm9RIqowY7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q214Y6jz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q214Y6jz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC0FBC116C6;
	Thu,  5 Mar 2026 22:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772750993;
	bh=aFDeB1Cx2VZhCKNYc5NqzFoT6MRL0GXJ2BdOEwBPL24=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=q214Y6jzB6t5U5uPCBQAQ1hWUwitE5xoCyj5jFpUavF+iNWm5qQ4EeVYF7dwQSsir
	 sTb6peVj2sAWpvPvcPwoX49MBFJdCXJPR6p2fNx68PLcGQb/rtZivZnKKh8FQ9p+xd
	 uSDHks3xgMarNcC3s9YpbY31fZL7M+xTuN8vuWAJrpTSSy8S+M8xf4NSpRoFhpKPoJ
	 Fgw0G0FGHPRA/vFLskF2hM/XvEeoouTuCC92JSFSXFvD/+O1qLpcJFcf3lJD7MVJZt
	 RPkxjw2fLG98hUEsMkrNdc0YJhgGFhFwfYjIjaUwVRCTBlP+V96zXE/uW5piZSbt+k
	 VnGYBBZK1pgAQ==
From: Mark Brown <broonie@kernel.org>
To: brendan.higgins@linux.dev, davidgow@google.com, raemoar63@gmail.com, 
 Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20260304162402.1714759-1-rf@opensource.cirrus.com>
References: <20260304162402.1714759-1-rf@opensource.cirrus.com>
Subject: Re: (subset) [PATCH 0/4] ASoC: cs35l56: More KUnit tests for
 speaker ID
Message-Id: <177275099163.367135.16322725961590151401.b4-ty@kernel.org>
Date: Thu, 05 Mar 2026 22:49:51 +0000
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-6ac23

On Wed, 04 Mar 2026 16:23:58 +0000, Richard Fitzgerald wrote:
> The first 3 patches in this series add some more KUnit testing for
> fetching speaker ID and combining it with the system name to create
> part of the qualifier for a firmware filename.
> 
> Patch #4 enables GPIOLIB in KUnit 'alltests' builds. This can be taken
> separately from the first 3 patches.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: cs35l56: KUnit tests for setting dsp.system_name
      commit: bae6668c526018af45b70e7825b61e6edb528f41
[2/4] ASoC: cs35l56: Some KUnit testing of cs35l56_get_speaker_id()
      commit: 72e1c4704844766c46725d6b043ba04559054d02
[3/4] ASoC: cs35l56: KUnit tests for reading speaker ID from host GPIOs
      commit: ef0b4783afc211a4b120e72b5a57f3d0340a9981

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

