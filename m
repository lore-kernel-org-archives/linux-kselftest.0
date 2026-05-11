Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B49379CD;
	Mon, 11 May 2026 11:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778499709; cv=none; b=f02BhikkQ9qmUkWSMmzX/jYEteNCHKA2cpX1HhuZ26D7OvvzScwvVWPU+Xtkas4nz1A70ZBvFJsCHzkxROIkwf9bN2L7k+M5jD0rQexjnvmjrnELgXB4yXmuVCsI9RIdRTpA6R6BDEtIM4zBGkm7WfMAbG8shj32voyziXUDRGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778499709; c=relaxed/simple;
	bh=OJMSavFVC1MyyyWnXiT4GqHeUbTHA3ZWWM5+jx5Ex48=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uyozf7J6kAqL75ocBOjop8DM5fDIg6gLJqb9v5ZRE/CaxzCnjVzbOHKz9piK8fqDw8QCYWeDSCehb4Mmb/wE9l/vzfyHy+yQqqUpQcMmIFJwEtw5ReeQIeq6iQ6hevhbCVJR1nGSq8q6m+sg9JiV4k8bIaEmC4OtmTZoFy3MFFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=tFbypn25; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="tFbypn25"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-ID:Content-Description;
	bh=XiQPBK0lNObi9c/+Lg9kspYh1nn10mRSGToStEZf490=; b=tFbypn259IMXV4LmmxhZX+rN8H
	fDeTQKe0XTJ8e0bCl3JQWQbZVzZNyFZIyOutRllwHvD3kpb4U96sAVS/BeXG2sR3kOb02FtHfmr7/
	JgXi1S1vZqFZ6KtRYiJiamBEiOyB+KjEIkZY2hJNZ/VnFEWlxs50uuXKBzSRKFqtVUhGSHxaq/ceg
	Aeo1b/JhiX5Xxw3j+ctMoqssyXRdRJmlGLv44U53Ok9QXTe7IbcsZTAly+Hau4QUJ102QgYbBlXo/
	JNOzYHZQ4lePO/7+zYBFitq+Dz1V/Y1n/tGtLgD4O8uepfQFfYB1Kr6cJoYbBi1jKsHFEUaJSh7JM
	4TI49noA==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wMP14-001ZbI-29;
	Mon, 11 May 2026 11:41:42 +0000
Date: Mon, 11 May 2026 04:41:38 -0700
From: Breno Leitao <leitao@debian.org>
To: Sasha Levin <sashal@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, corbet@lwn.net, 
	skhan@linuxfoundation.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, gregkh@linuxfoundation.org
Subject: Re: [PATCH] killswitch: add per-function short-circuit mitigation
 primitive
Message-ID: <agG_PZ3qcl6TwLnL@gmail.com>
References: <20260507070547.2268452-1-sashal@kernel.org>
 <20260508135630.a380e3c187b59e4c04e6f358@linux-foundation.org>
 <af5Z2IvtS5pVorSl@laps>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <af5Z2IvtS5pVorSl@laps>
X-Debian-User: leitao

On Fri, May 08, 2026 at 05:47:04PM -0400, Sasha Levin wrote:
> On Fri, May 08, 2026 at 01:56:30PM -0700, Andrew Morton wrote:
> > On Thu,  7 May 2026 03:05:45 -0400 Sasha Levin <sashal@kernel.org> wrote:
> >
> > > When a (security) issue goes public, fleets stay exposed until a patched kernel
> > > is built, distributed, and rebooted into.
> > >
> > > For many such issues the simplest mitigation is to stop calling the buggy
> > > function. Killswitch provides that. An admin writes:
> > >
> > >     echo "engage af_alg_sendmsg -1" \
> > >         > /sys/kernel/security/killswitch/control
> >
> > It certainly sounds useful, but what would I know.  How do we hunt down
> > suitable operations people (aka "target audience") to find out how
> > useful this is to them?
>
> I'm not entierly sure here... If folks have suggestions on folks to loop in,
> that'll be great!

I work with these issues at Meta, and this approach would address a real
need we have.

While livepatch could theoretically solve this problem, it's less suited
for rapid mitigation for a couple of reasons:

1) Livepatch rollout is inherently slower due to the blast radius if a
   bug exists in the livepatch mechanism itself.

2) It's common to run hundreds of different kernel versions across a
   fleet. Since livepatch is kernel-specific, a single CVE suddenly
   requires building and deploying hundreds of individual livepatches—
   far less practical than a simple sysfs write.

