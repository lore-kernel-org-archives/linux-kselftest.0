Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 511C73C3C08;
	Thu,  1 Oct 2026 22:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790894714; cv=none; b=K+cHJ3bYRt2jeCKmpUXZv7EEkZShNEXUm8aruVgUu3XPdVW4YjPz/TjkpwQv9MDZvxIZzc63O3t1qXJr1xOgj877AlyHtrSqyqW831wpiaT/r0tjyQmT55Zlt222iGOVw1J7YqNRLNntHQLVLjSunBhX/Q6IREwSn01T9YLyerg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790894714; c=relaxed/simple;
	bh=gp7PRv3WjAiMJrp0DvXpRvTv3mwC8R3NiezXzUE7FxE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RJv7d4MJ1sbVMG9XaSUjrDRAgcsf9alYJa+gKUmPXKZJCc0CmQpJ5WBI9qsnH9qCQRqHaEMAd5ny+YLva/odcf/O3dDU/UPumwheZR4aFIlV56KlSgncBGdXFRD4NcHDsl31LirqzUdoc3F1KnUWcsFbkKTpvX9zHsruj2Scpnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Elyr2LgB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Elyr2LgB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 931971F000FF;
	Thu,  1 Oct 2026 22:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790894712;
	bh=Z9zRtXHe/J1k/4/9wAeq1n+PwAt+ioXmV3zyjSNrjDw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Elyr2LgBSalBJ1Ai633m8ndKegOKWym2npAUMOk+dZwgHv/+ZxLxSSAbwAHP0MyAi
	 IdCZZwKx6kc8rdFHteudltI0tTVY0796SssuwWz5vLqAfDtCleW/S5MBi6H+ET3i71
	 1d+msaAWd0/5vuGoir4RbYnhHuyQcVHq/KgIy2L3Tnu5jXbLJfkXbCkX/9W578bJrm
	 5vHp5o7xCAsjRmjW6JztdQxXRJdoXXbTrDhmwvBeAvWGdoIAU0+8ht9AiVOCa142Eh
	 aX/yKQt+2vr/6S2rAV7D7Lhe6ojBD+9+IO2zFeCoWhIh8ebdnqSd6/bpSLd7E66LLy
	 CSIlFq6hqJyww==
From: netdev-bot+sinfo@kernel.org
To: Chuck Lever <cel@kernel.org>
Cc: John Fastabend <john.fastabend@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Sabrina Dubroca <sd@queasysnail.net>,
 "David S. Miller" <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Dave Watson <davejwatson@fb.com>,
 Shuah Khan <shuah@kernel.org>, Qingfang Deng <qingfang.deng@linux.dev>,
 Eric Dumazet <edumazet@kernel.org>, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next v2 0/8] net/tls: Receive-path fixes for
 zero-length data records
Date: Thu, 01 Oct 2026 22:45:11 +0000
Message-ID: <179089471115.1402591.14877215785916752547@kernel.org>
In-Reply-To: <20261001-tls-follow-on-v2-0-2dd1947bb642@kernel.org>
References: <20261001-tls-follow-on-v2-0-2dd1947bb642@kernel.org>
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
