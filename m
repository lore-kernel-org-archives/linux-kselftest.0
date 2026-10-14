Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D36A4315F;
	Wed, 14 Oct 2026 12:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791981964; cv=none; b=aQT65c3q+AGIzgzCoRjGxGfQWxvy1k4X8NIpUscondzzHEyNhozRVcCXnS3sSwSgV3EJ3toISsFwdH4czXIluCa5SzmQej+ubYfdYTrFhX5Uc6pDj5iR2hIO5u/Wabe4bM/19GUuUfRnQ2B75HYKBzwmPy9VIbJQKQ1ItoHNYco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791981964; c=relaxed/simple;
	bh=gp7PRv3WjAiMJrp0DvXpRvTv3mwC8R3NiezXzUE7FxE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=f5XnjCOd/jm2OVCSth6dFw2RWP1/gqDg2wH1UK93F3TwYaQefgzsSEi6p8BMImxl9ALTkBfcW6T7fVkNKnGcrD5utTBcq4bEcLlI3lGR5byqRRutXbgKDXxyiHqb//GH2fb3zv1Ubi9L2CBEoGtdQ9R7FGHUN61PmJuXykcql4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=miWazjcE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="miWazjcE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1DF01F000FF;
	Wed, 14 Oct 2026 12:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791981952;
	bh=Z9zRtXHe/J1k/4/9wAeq1n+PwAt+ioXmV3zyjSNrjDw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=miWazjcEd8o6W7xBfcqS+inHJ2uA5jOgbNj0CBz8EUnBYU8tygzNj7O7+sparbU/i
	 kiiWco4mznTZVKKU/M7KsXpDtNaPG40qey9VHg//FYYcOPPH9RTApQa5eKNBNT5ySW
	 JflKYp0Ror3GegdLeFPAAy2eew6FDFRuQTp7ciYSCsW3dbDjwHhQ1KBsfbuP+O3l2v
	 36ShOImou0OQc796O74Vdyq02iUKnCe0ikuAz4kjkLbBgQABi75FWPlAwSdq3EdDvj
	 Hs5tMvF7pIeWhCoG4Z1n4OCgczBn19ND+/QcTY+O3ewh8sfHZ1IGiTvjVOS+QRVo41
	 xd7gH5lCCyjKw==
From: netdev-bot+sinfo@kernel.org
To: Ali Firas <alishmery18@gmail.com>
Cc: netdev@vger.kernel.org, idosch@nvidia.com, kuba@kernel.org,
 pabeni@redhat.com, davem@davemloft.net, edumazet@google.com,
 andrew+netdev@lunn.ch, horms@kernel.org, razor@blackwall.org,
 roopa@nvidia.com, shuah@kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v4 0/7] vxlan: vnifilter: bound a single request
 and account per-VNI memory
Date: Wed, 14 Oct 2026 12:45:51 +0000
Message-ID: <179198195143.320699.13010054612385762312@kernel.org>
In-Reply-To: <20261014123814.388557-1-alishmery18@gmail.com>
References: <20261014123814.388557-1-alishmery18@gmail.com>
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

 - Whether the issue was actually triggered, or is only theoretical
   (e.g. found by code inspection). If it was triggered please include
   the symptoms, like the stack trace or error messages.

Please do not repost the series just to address the above. Instead,
reply to this email with the missing information, so that reviewers
can take it into account. If the series needs another revision for
other reasons, please include the information in the commit messages
then.

The evaluation is done by an LLM so it may be wrong, if you think
that is the case please reply and explain.
