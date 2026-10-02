Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0641A2110E;
	Fri,  2 Oct 2026 00:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790899519; cv=none; b=fOUko6LEyxmQ3LkJnPojhsDpfbc1xUs/7niXeLh7swlKEHU1ER5iaZs5xuRJUhn3MwBRJZ81i4RHys2wTACEby/jytBhuaovIHW+9MeHlalTjtnxFXRW5FeISu2Z3Evw8i3qvIUn1H07SwSWoCfePQBlH/Vh6AtGSQ3M7Y4u9jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790899519; c=relaxed/simple;
	bh=gkFfgIiqdNUeqBXEkI/i2VnGWCG6YP4zolNFHdMxAKY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=r3884GAqPqa+YMY4j3FX2xzy00uKUUlei+uZ7iylG/4sZyev1NUXrlwW7CYvd9+Kj7SnEFOyp0HkjbgrqcZQbZp4qvveRu2zgBcYJ3xjwIAmaIfRRfLuf8dJC6ZSh74vK5hP76k6NWzvWFqQRus1QPBCOHGSvkHv2uZd2ADR41Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GlI3qfHt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GlI3qfHt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B9291F000FF;
	Fri,  2 Oct 2026 00:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790899517;
	bh=BowdGRwQC11pj+Q1UALJVXDPq+PZqEyPcspHA31mG1w=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=GlI3qfHtMf1edr9wmPf7wPlJ7XiblogZ57hdveaIGvOQmeuFzzgJpruG4N106ui+k
	 lgjPm1LSL1so9QfPaCxxP1KYRhvFLxH9SFdrQX29tJqn5vNZtP/SkinqNl0rW+wwf8
	 T/77gCuqf+ZX0mNHDrmgdILq+MBQepaI23tG/WRZVeANnSErfoLqxdCHQXnRihLDVP
	 Ui/Yu7QjJ9PGqou/L0rITtC3yOJGIgspyvRqikG9MIgEAkdm8l+rkxvl+HR/4jGdTL
	 fxtse0eq2aS1sZkFqdZponcsE1Y+3BmJKvGcCemb86TgZJvdVDe07c9ZY9c/DKNQ5D
	 90OJ1lfTPKhag==
Date: Thu, 1 Oct 2026 17:05:16 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: "Hemendra M. Naik" <hemendranaik@gmail.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, horms@kernel.org, jiri@resnulli.us, jhs@mojatatu.com,
 shuah@kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, vishy0777@gmail.com, tahiliani@nitk.edu.in
Subject: Re: [PATCH net-next v9 0/3] net/sched: sch_fq_pie: add per-flow
 class statistics
Message-ID: <20261001170516.592e7f68@kernel.org>
In-Reply-To: <20260928043358.6866-1-hemendranaik@gmail.com>
References: <20260928043358.6866-1-hemendranaik@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 28 Sep 2026 10:03:55 +0530 Hemendra M. Naik wrote:
> v9:
> - Add a blank line between structs in commit 1/3.

I wasn't clear - you have to add the new stuff to the YAML spec.
If there's something fundamental that prevents YNL from supporting
sch_fq_pie, please explain. Otherwise you have to fill in the
support for sch_fq_pie and then add your stuff.
This is how we catch up on technical debt in open source world.
-- 
pw-bot: cr
