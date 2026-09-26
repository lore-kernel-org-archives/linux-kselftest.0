Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C52B738D011;
	Sat, 26 Sep 2026 00:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790383867; cv=none; b=hQu+5v76zlOIYeuBWH6DZ4HH2Aanw3gMHJYWWc4Wp5qwMZ3MAl8z6zTFzuTNtwtQFrgrsIEU3Z+TvSyHzP5XtBcjoO9UCnzaAgGehYRDMrXYhv2D2q5qjqC7RqdD2awoXdc9idJY74J5CG4l/5C186FLakVMieS75x9xJAWbiwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790383867; c=relaxed/simple;
	bh=fUfAI7w350svlsvLZCZFopBRIP8u4YYbXPEaNG/f7F8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ic4q6ZPG47GGeaBwyo9n8ttyu4bekqnUFy8htLxRyZgVIRngA6Zv2qYdLoXJwRqauenyBQHLhe3Tqft1J8C2QBbQ4W49Y7wBJEXXLBLBqVDOIxYaCGkABVQq5go6LBp/qEQeHWZE/FwHjCFEqmXtMjyZxspAKWbBnGerUDBNLQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UD0kZzV4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UD0kZzV4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46CE11F00893;
	Sat, 26 Sep 2026 00:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790383866;
	bh=l9R5zN5/fRx7DAaYIuEPMRdTTf8b7Qc3R6cRlgcNkGY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=UD0kZzV4s/cRPkAfTGVShAxBJVtZwrc+46iqLmBCJylfP5E2Lq9FVy0NtvD0TNgdz
	 OhA5Jb0u5i5QgMNy7pIS9K0vcbQ21aFUgrqmaLOB1Z9T321BjdRtYMRlYdU5rSnZV/
	 uCzW0ai9QMkvjU6uNFsKknAeieOBhGtohHRXqaZpBVqBM6tmMk0Y1svmaiGfZK8ay9
	 lvPGGCDVI4eeazm53qKrnXrIpeTeS9Q++UoOkQ/N3hyh/+y3e25voG/Cq89PalJtfV
	 31cEqdsJ8KdXIop439S/x+SzMoG00HSxo+pKRu5qPbbVfVNS3sO5hsWN123RLz0bmR
	 elzEb3Hmy65GA==
Date: Fri, 25 Sep 2026 17:51:05 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: "Hemendra M. Naik" <hemendranaik@gmail.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, horms@kernel.org, jiri@resnulli.us, jhs@mojatatu.com,
 shuah@kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, vishy0777@gmail.com, tahiliani@nitk.edu.in
Subject: Re: [PATCH net-next v8 1/3] net/sched: sch_fq_pie: add per-flow
 statistics via class ops
Message-ID: <20260925175105.1a8897d3@kernel.org>
In-Reply-To: <20260922205924.32173-2-hemendranaik@gmail.com>
References: <20260922205924.32173-1-hemendranaik@gmail.com>
	<20260922205924.32173-2-hemendranaik@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 23 Sep 2026 02:29:22 +0530 Hemendra M. Naik wrote:
> +	__u32 dq_rate_estimating;	/* is avg_dq_rate being calculated? */
> +};
>  struct tc_fq_pie_xstats {

nit: missing empty line between structs
