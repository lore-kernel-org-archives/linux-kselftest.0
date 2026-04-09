Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DF5233B6E3;
	Thu,  9 Apr 2026 14:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775746579; cv=none; b=syYCPGND+hdxFMovSCysSAfW5nVJoFFJRiPg1/MViO9F4KogDBRTXHSwP/VgQGS8xBtPBFR3TPKOv9YcpQ4MmpMOIq5PQ/tDzlBZ6jbgREKoyqo/2wX6jWUn6UTObzzZtJEtylnr8xOs9r06C3gDVQgHu2ul57yTf+EkJu8nALQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775746579; c=relaxed/simple;
	bh=Ks8Nwb075Vgqs3HKRLBgmt/VpwBnFtkNGSzK2HOgBGw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=raE4/+UjekyyenQJZDFQ4AOLT7t0ua6fZ+Bc7V/90brZR/2PI5ZsDAx6NCbVwnFXE0WjS+RogyJh5aqGUTWlKGqam1ikXAaxtyM5X+RehOOdJR0aydTq0HMzA6uPketCUPaOavBJ+mbgaGiJQ+ramBP65vH6QuHAuP3EMqz+KSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FMXv6wzR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FMXv6wzR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8BDFC4CEF7;
	Thu,  9 Apr 2026 14:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775746579;
	bh=Ks8Nwb075Vgqs3HKRLBgmt/VpwBnFtkNGSzK2HOgBGw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=FMXv6wzRoFFPiqC7lq7HydgM3QU9GKyDVTkE57AmAc7O6kYSVxv/LxYECnbr1HB3n
	 lED4vgJyfeAOAt99cH1iQLlV8b2m+9Hckq/QdyhLDGswRDfdIL9mQlc1T96LKLmWsE
	 Lb/qC35qfs7kwBH95MmQ3rrD6+vQOMneEGAta2XOwlFCLa49DKeYB9sPoH6fip0/56
	 OktHgRqFZryOuI7+hpQaqL6MWmf4nlRsow8CZQgdj1O4sXdsfc7dcw6VnxS04ZLU70
	 f0jPdV50VPXPEo+JZA0TY2s3W6HTREAOhnpU19MJrEWokgm9xiXGSCvSGMW9PoaIii
	 mSu0KEWr0Po0A==
Date: Thu, 9 Apr 2026 07:56:17 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Breno Leitao <leitao@debian.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
 pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org,
 shuah@kernel.org, petrm@nvidia.com, willemb@google.com,
 linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next] selftests: net: py: add test case filtering
 and listing
Message-ID: <20260409075617.0b22db0a@kernel.org>
In-Reply-To: <adedNCKW0WE_FqZK@gmail.com>
References: <20260407151715.3800579-1-kuba@kernel.org>
	<adedNCKW0WE_FqZK@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 9 Apr 2026 05:41:59 -0700 Breno Leitao wrote:
> > +                print(f"Usage: {sys.argv[0]} [-h|-l] [-t|-T name]\n"
> > +                      f"\t-h       print help\n"
> > +                      f"\t-l       list all tests\n"  
> 
> I initially expected the help text to mention "(all or filtered)" based
> on the commit message, but since this option lists all tests
> unconditionally, the current wording is correct.

Ugh, good catch. Not sure how I lost this. It does display a filtered
list. I wanted the filtering to take effect so that one can see what
tests would have been executed with the filters without running them.
Sort of like a --dry-run.

LMK if you have any thoughts on this, otherwise I'll rephrase as:

	 f"\t-l       list tests (filtered, if filters were specified)\n" 
-- 
pw-bot: cr
