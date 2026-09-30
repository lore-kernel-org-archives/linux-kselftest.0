Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 840E136B923;
	Wed, 30 Sep 2026 15:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790782108; cv=none; b=ZipAFOG5IfJqngv91E5kGn6ZyQR4Z/K7siA+9R4HO9+lJhXC7F3naZzMdwPpotMmCZIUoQAa1CnrguMla0H6HS+uH0MIoLr50FM/22YTlkCOVF0opzjo6qE8kQ/leLel18GqmpuSsn6oltif7uFMe9+ey+RUDCG7joD84Vw2oAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790782108; c=relaxed/simple;
	bh=x8GQ9TqAFu5driuvo38kqzYt3n324pebOlaNmEELI+s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AALks53c251IYb412ZQAihg+d+IsGu0QAhAMefcE+yYrrUxYbRnrFr0qm6kIWOG0STyWQoxWcssbktznTYDV7GOyUoY3V8eAN2Nm7FcTo5OqWgqteLP+iLuywBPb33zlBfIbuXopk7CCMxwzamwDSrHIlgAZp0egCN+1bp73lbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fa1bpbQI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fa1bpbQI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4BDC1F00893;
	Wed, 30 Sep 2026 15:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790782100;
	bh=PJRu7W6/Or1we5Gv3BgoLEtby0D0Y0UGgfjBHfRc5+k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fa1bpbQIH70G4u6M1HJJzSMXQoZ+vwA7u9cqcitrKNYN0ABbSUoH+mkTDZpqo1/jw
	 0ADERMambtAO9bF66DM/3sKoKCnZEaR7kSAlQF0EPH8mDXjD6HPCai/eBskFvNSEAZ
	 wJxws6ohuig3/d0O/U33US2ymOexCQDZcZKQ+sjav0/NSwMv0W9wXJv+GjXFJzxdFi
	 9MxkyojKJO2GhcDOuxcz9flF7aeEtBd1ra5ebE8MR9XTNoM9TGqoX86ApufxXb2kOX
	 Cw43aarsggK833V+6h3NA4m29OZlFZDsnfs+zI3Q54sXRaksHHG0xNTtOfD62n2cmY
	 oF8QXA6s25RPg==
From: netdev-bot+sinfo@kernel.org
To: hengyul@cs.unc.edu
Cc: netdev@vger.kernel.org, "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>,
 Jiayuan Chen <jiayuan.chen@shopee.com>, Jiayuan Chen <jiayuan.chen@linux.dev>,
 Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: 
 Re: [PATCH net 0/2] ipv6: route: fix adding routes via the loopback device
Date: Wed, 30 Sep 2026 15:28:19 +0000
Message-ID: <179078209931.31693.13427991224097707402@kernel.org>
In-Reply-To: <20260930152229.1453929-1-hengyul@cs.unc.edu>
References: <20260930152229.1453929-1-hengyul@cs.unc.edu>
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
