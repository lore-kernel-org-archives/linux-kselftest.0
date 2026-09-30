Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C4B2F7EE0;
	Wed, 30 Sep 2026 00:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790728816; cv=none; b=Y0AerVMKJ3/AIiFk/YzsjFuveL6yoopvDWQO6SJDvg4yZyeFIkSuoMYeLkUo8hhhNjvF5DW31WkqzhCgl/0RhXTgHeHzsaYpsQErVisksEnGXryjVaD/3y5B0y/XTdKoXLhXU635myD0HyJW0s8o1yl4rx+V3Orl3i1e6WkHuLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790728816; c=relaxed/simple;
	bh=3tru82X/O8Goctid3fIyLaQlXLZBLZOcuRDhTGyNEXc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BkWvmi5gE3rJyyE6SxyvRwz24Ld6UBkaNSAE6cOH5ZGJ5Zy+fsUD3muQsGbLowv//bNO65ru56TGdfX8p4ZWFi5Bxfz83IF55zYlYgu5rMcDTAq1KmBqUrS8IUFDUvPwYlh29e8L65EnZMu6/756VP9tzjqUEyOUY8Fe50umyrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y0xOkWep; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y0xOkWep"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36A121F000FF;
	Wed, 30 Sep 2026 00:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790728802;
	bh=6iPTlTIPOeS6clY1OUuSXMt+j0Q0EcBYSEvtpzzUm88=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Y0xOkWepC+e59HaqsEa/moiYTD4aa2KW/pWde4HgKWtJvnoHx/92t/icWh2BLU9RN
	 1mNNMyfC25eQ2kv4mf+wMIDrgth9ZmtJFij1Qef3EY+SrnkcElFm5YBikpwb83HJJ8
	 eYSex8B6zaF0vfMmDfeI66wXLr2WltyQMU7KriQKil6YabDjvNDAWzMe+yAuwNezaX
	 1nhMV3bXmZJ7E0AvDRgNEMGmhByUQ2maGQq3ARfmZRoQfxEs21A1W9moWh09V4DCH7
	 4K/sZQf/j3qGPVZnupUQGKUYYZFWQ+oJeiQXN67AS9UWjiiuI34Vqnmssqezi4whyF
	 zOL/lusfRQOBA==
Date: Tue, 29 Sep 2026 17:40:01 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: "Lawrence Lee" <lfqlee314@gmail.com>
Cc: "Ido Schimmel" <idosch@nvidia.com>, "David Ahern" <dsahern@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, "Eric Dumazet"
 <edumazet@google.com>, "Paolo Abeni" <pabeni@redhat.com>, "Simon Horman"
 <horms@kernel.org>, "Randy Dunlap" <rdunlap@infradead.org>,
 <netdev@vger.kernel.org>, "Arun Ajith S" <aajith@arista.com>, "Roopa
 Prabhu" <roopa@nvidia.com>, "Jaehee Park" <jhpark1013@gmail.com>, "Jonathan
 Corbet" <corbet@lwn.net>, "Shuah Khan" <skhan@linuxfoundation.org>, "Shuah
 Khan" <shuah@kernel.org>, <linux-doc@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net-next v4 2/2] selftests: net: test untracked NA
 recovery of FAILED neighbors
Message-ID: <20260929174001.7b6ae0f4@kernel.org>
In-Reply-To: <DLMVW6Z8IU9P.31OHF60Q6YCWP@gmail.com>
References: <cover.1790127207.git.lfqlee314@gmail.com>
	<ce40008682ed26ab039168a5fcb515eff8d30c3a.1790127207.git.lfqlee314@gmail.com>
	<20260923083633.GA2626135@shredder>
	<DLMVW6Z8IU9P.31OHF60Q6YCWP@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 23 Sep 2026 17:49:33 +0000 Lawrence Lee wrote:
> On Wed Sep 23, 2026 at 8:36 AM UTC, Ido Schimmel wrote:
> > You shouldn't have added a Fixes tag. Backporting this patch to older
> > kernels will make the test fail. Wait for feedback from Jakub / Paolo
> > before posting v5. They might agree to strip it before applying.
> >  
> 
> That's my mistake, I added it in response to Sashiko review feedback on 
> v3 but thought it was just for documentation purposes, I didn't realize 
> the tag would cause it to get backported since I only submitted to 
> net-next. Sorry about that, will wait to hear from Jakub/Paolo before 
> sending any new versions.

Stripped, thanks for flagging.
