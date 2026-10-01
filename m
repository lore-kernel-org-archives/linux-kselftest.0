Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABDA114883F;
	Thu,  1 Oct 2026 20:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790887381; cv=none; b=RqSIwitzI74ESXrKeI4V5EDgrwwQrpwnvGg80ZP5IeFK1oWm2oLvxX4ZFjZFfXZOH/7gW8x3Vcw6ONVGLiV/L6POrMmUtNm3NQViGkO1I5Utcob8/mU/pYuWKQw9EZjVQREuPtlVBILuphNCsa4VmwqttNQuFX3cwjvPBBTSKXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790887381; c=relaxed/simple;
	bh=x8GQ9TqAFu5driuvo38kqzYt3n324pebOlaNmEELI+s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cALRhUpsFhEgzNE7f/XlTSzvhG/61czv7VKDyCuD4CrAG4zhhkMyZoMh73GnHaaehQlC0Rv6iHImnh4c/SO6zyGcRr1MV8R5UqxeaTEYJCJKyjniXcZjzcKb8CY2Fz5CydKaWinlrG5mDcuZEgkCrjDIUDOUTPvuPl9wrfWLUyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B0C/Zimb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B0C/Zimb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51DBD1F000FF;
	Thu,  1 Oct 2026 20:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790887379;
	bh=PJRu7W6/Or1we5Gv3BgoLEtby0D0Y0UGgfjBHfRc5+k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=B0C/ZimbZJ2aHjippQ83TLKnPtf6jDCJg+syvV5VKmV+ZKe5C/zCvxIPzIRPJosye
	 1FY6xlSfDLFHngh8na1Nl+ZRTo6ERfYVJQ/r28l8zHnTxxSbiO9twU9w29rH1P6QiB
	 dUXQ81zWNkWaajSGRwZspCZsmhu8hhQoEGXxImpH88q2zaFdh5sHGBZoxGMHJSr2n+
	 HnGhkOesrXev/CeHBfSaJIZ7CIWPQcAXPiECC9HqLSPsC/46awUPenv9HRY8+/fRN6
	 khmMzdYlA3uvBHAm/vgTGqTznDDafy+HvNzaZaTobqDrGquFUZQGjZ4LMZRjeU9PaA
	 713iCeeApz8Sg==
From: netdev-bot+sinfo@kernel.org
To: Haseeb Malik <haseebulhaq55@gmail.com>
Cc: Sabrina Dubroca <sd@queasysnail.net>, netdev@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>,
 Hannes Frederic Sowa <hannes@stressinduktion.org>,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v2] macsec: check the resolved SCI for duplicates
Date: Thu, 01 Oct 2026 20:42:58 +0000
Message-ID: <179088737885.1402591.6752350062839085939@kernel.org>
In-Reply-To: <20261001-fix-macsec-duplicate-sci-v2-1-330311abe5ec@gmail.com>
References: <20261001-fix-macsec-duplicate-sci-v2-1-330311abe5ec@gmail.com>
Auto-Submitted: auto-generated
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi!

This is an automated message. This series looks like a fix, but its
commit messages seem to be missing some information:

 - How the issue was discovered, e.g. hit in production, hit during
   development, syzbot report, manual code inspection, LLM or static
   analysis tool scan.

Please do not repost the series just to address the above. Instead,
reply to this email with the missing information, so that reviewers
can take it into account. If the series needs another revision for
other reasons, please include the information in the commit messages
then.

The evaluation is done by an LLM so it may be wrong, if you think
that is the case please reply and explain.
