Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA9054BC006;
	Wed, 30 Sep 2026 23:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790812139; cv=none; b=gStYsYxXlqx964GBREiz2JQDwVAq4BwHoTGvCuIwN41aQ6ugTqM8t2tXvLmO1oIBkBY4ruhC22YXFCRVfWpKIVlQOOEPbZubwQxJgdjSYq3LuLtvY8Nw4XPr1sNkm+i2VAY/lSMsg3REmrY7D7gK6UdbYtuPVn7aaReRQO0FXRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790812139; c=relaxed/simple;
	bh=gp7PRv3WjAiMJrp0DvXpRvTv3mwC8R3NiezXzUE7FxE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LO7nEwS4VrFuMFSGMte5BotnomQXYl1CizWQXSOwZcUwVA7Ye0tD67NE34CU446RTadbASOPdut/bbcfiHVsMQn/p1MGPRSy9uJM79UjMTB6Zk0ek/IHRsXHfpCy247OnGT3gByb9uflXEFRzVXPBG0MsM2US4/ClsUkKUW6v7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UiuVXr41; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UiuVXr41"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4379B1F000FF;
	Wed, 30 Sep 2026 23:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790812137;
	bh=Z9zRtXHe/J1k/4/9wAeq1n+PwAt+ioXmV3zyjSNrjDw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=UiuVXr41BMDQk9kVJDVhoiKg0VMZOKiJgH9Qon0bwWhVDe75g+xNpxQdX3KLPVidv
	 Po3ss3N7h9Btu5l+CGgnj9Mg32KQMZ3tl10H3SARFpEE6MefBpiQ+NowVxencIdJ4+
	 QvSTUIaDDvphZ9M9GZtGCQHNa2jPtrWLd0EHOsCAzRoTou1PiCJROZApA028HDj4rU
	 C1PxAM/jMxLbu0U4G0Q7bIY06/SyM7j6Ofp6TB9skzLEOc90U/tZrGNJQNYNRfP5w2
	 WD6Jh1VHmOgv5bArUq84JbTpe6xUDccp/Kwfe373DlXX5NvMdr/ae5TMD6laI96T4h
	 psGNfqi2pJvdg==
From: netdev-bot+sinfo@kernel.org
To: Daniel Zahka <daniel.zahka@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Shuah Khan <shuah@kernel.org>,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 Kuniyuki Iwashima <kuniyu@google.com>, Willem de Bruijn <willemb@google.com>,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH net-next v2 0/4] net: psp: require an established
 connection for association setup
Date: Wed, 30 Sep 2026 23:48:55 +0000
Message-ID: <179081213582.31693.9587233196664838966@kernel.org>
In-Reply-To: <20260930-psp-defeat-v2-0-f266e7447129@gmail.com>
References: <20260930-psp-defeat-v2-0-f266e7447129@gmail.com>
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
