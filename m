Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A97B230F543;
	Tue, 19 May 2026 23:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779232096; cv=none; b=Ic1nWdXU5KIstrS5WvUsQKb74pzUDnpbAL5/JuF+uPXMvWgtsyrA/hUsg68r8O0mqTASgPA+Cini/qI/YQ9RaAIR7xaRKtXC8iGYoy4J1PMb1ZSV4kV8jOJ3scAjXPeYXp9hihgjWA6485XYXM9R70KjcRDlZKMDqn0RHN4u0MQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779232096; c=relaxed/simple;
	bh=m4ouFijZ/f67FvcXcp6pmhPM+pabAiPxP914Yinp8Bw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jZjYxUDCfAhHJf5fatFNbaW1jL+8Y2dx6ezMSk9zM88ClXxkOvNgf17hurvqDeVlM7m7ROM2fnr7hQmwnBGafYSZJ8aj6zvhvsVKitpFD21LORPTtDbJWvp6KMCPpuo98YLbl/j2Raa16pHep2SehR3lyuM74eOZp8A0bOgCtig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tj+JlzbH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tj+JlzbH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 197721F000E9;
	Tue, 19 May 2026 23:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779232094;
	bh=m4ouFijZ/f67FvcXcp6pmhPM+pabAiPxP914Yinp8Bw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Tj+JlzbHgJNURYEGo+0/hYiFbcHVdL/fzObe+JCLoCSMHET7hN3Yv4ntxiVTYKwYs
	 nw2xWuCRYrrjdaLc7PQWK9NkJHLwDJzHncPpnXHxLoibfgSEdc+XqgcakScoJPz33e
	 eVjMhXXWD7O/aq/eu+W7UcQ2Vqro4yDwWwZ5E4Dg3tXB0itf1rF4xBW7QQiNslSeMU
	 tQeW5im8oeIkCY306uJ030bee1AJfscNlr5J4Ci5CG7Ycqohjh24r2E7NG1RMxC9sJ
	 clbpLsqzs0ddPd5brHahNnn144N9PGB0lksimyjF+echLBZ1tWTx5+j8rqZ2A2aTd3
	 f1cW+f4zRs5nA==
Date: Tue, 19 May 2026 16:08:12 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Cosmin Ratiu <cratiu@nvidia.com>
Cc: <netdev@vger.kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S
 . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo
 Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>, Simon Horman
 <horms@kernel.org>, Petr Machata <petrm@nvidia.com>, Breno Leitao
 <leitao@debian.org>, Nimrod Oren <noren@nvidia.com>, Gal Pressman
 <gal@nvidia.com>, Willem de Bruijn <willemb@google.com>, Dimitri Daskalakis
 <dimitri.daskalakis1@gmail.com>, <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH net-next 3/3] selftests: Use a master ssh connection for
 remote commands
Message-ID: <20260519160812.20678f72@kernel.org>
In-Reply-To: <20260518093653.551166-4-cratiu@nvidia.com>
References: <20260518093653.551166-1-cratiu@nvidia.com>
	<20260518093653.551166-4-cratiu@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 18 May 2026 12:36:53 +0300 Cosmin Ratiu wrote:
> This finally implements this part of
> tools/testing/selftests/drivers/net/README.rst:
> "Using persistent SSH connections is strongly encouraged to avoid
> the latency of SSH connection setup on every command."

As this part of the README indicates, the expectation was that this
part of the setup will be handled outside of the harness itself.

After all something also has to set up the keys to make sure that
the hosts can actually log into each other, right?

I'm a bit on the fence, some extra Review / support tags would be
useful, and it'd be useful to make the code in patch 3 less ugly.
Patches 1 and 2 make sense.
