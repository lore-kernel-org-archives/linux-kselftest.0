Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDCB83DD522;
	Mon, 11 May 2026 13:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778506830; cv=none; b=QCHkBdPYvscEicj4nBZU3r6rGXHe3hhWSWFeOEddWL3vHLe3tpk505jM5xlPjJI/vNHBLEfcQcn8KN6SV+mK36wLoqXcr/9F3SPDe05yOhWXmMYwTP0vt1NfztVMEcKgZj/2AaVADKHIbIVMaHRngCuQSnnXfvPKyX2i2PCZX6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778506830; c=relaxed/simple;
	bh=HetL7fwL88YbNiLLCNv2HBHdNqdmtHPgs5HbLx9YVCo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gP0uHHXhfiVhWEKhDPsHIHyNhuKiw0dQ/tmEG636lkFBy5dTHrVHhBN2xb6xbh4ioGzaXbesz/+6HlfRvLgAHL5WEX8kpOqMDlHYgXKBR3ETN8/nBI6Y63+Qs+AG0pfJoiG1ktvwaugVMN025AVPkBZLqlCNm4bIfo5TzfxTUUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=meJvWriC; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="meJvWriC"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-ID:Content-Description;
	bh=KA30ajxPuAZxlVx+oW1ephR/e4yqdZ0I6hebdfKsqw4=; b=meJvWriC8hyPN2Nz+wZVWxIyUa
	a/TAVOI0lzz9pFZtUiPpqsP/ogn6fHDMKF4oX3yy38uLhp+XxKSusjILf/E4p6zYJHxPoj46TwmHs
	UdgOOX8jOQRcfAKmsicpsL/vioeuKPYM0eml2tBXqOpSzEgBvtL17k9qbjTpaOvYCO8GFSwE3eSuZ
	6S5nzfhZ/k6zP7AkEF0AuwVFL7rsvxvnr8mlD+unWemVwoxGVIi8vrs7k8ylaYehb9JYEqEbyWfdB
	QgBYgMSCHk8kbha3Ro2pSfwQWQWTqohdgywapGLhYvFxAtGtfoOcqOManMtRd0AIa6U+41b0mtXAe
	tgBBcaGQ==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wMQrt-001dfv-32;
	Mon, 11 May 2026 13:40:22 +0000
Date: Mon, 11 May 2026 06:40:16 -0700
From: Breno Leitao <leitao@debian.org>
To: Michal Hocko <mhocko@suse.com>
Cc: Sasha Levin <sashal@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, corbet@lwn.net, skhan@linuxfoundation.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	gregkh@linuxfoundation.org, ivaz@meta.com
Subject: Re: [PATCH] killswitch: add per-function short-circuit mitigation
 primitive
Message-ID: <agHW-lYKoWmuBLDQ@gmail.com>
References: <20260507070547.2268452-1-sashal@kernel.org>
 <20260508135630.a380e3c187b59e4c04e6f358@linux-foundation.org>
 <af5Z2IvtS5pVorSl@laps>
 <agG_PZ3qcl6TwLnL@gmail.com>
 <agHUp8ulaWJ75WU5@tiehlicka>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <agHUp8ulaWJ75WU5@tiehlicka>
X-Debian-User: leitao

Hello Michal,

On Mon, May 11, 2026 at 03:07:51PM +0200, Michal Hocko wrote:
> > I work with these issues at Meta, and this approach would address a real
> > need we have.
> >
> > While livepatch could theoretically solve this problem, it's less suited
> > for rapid mitigation for a couple of reasons:
> >
> > 1) Livepatch rollout is inherently slower due to the blast radius if a
> >    bug exists in the livepatch mechanism itself.
> >
> > 2) It's common to run hundreds of different kernel versions across a
> >    fleet. Since livepatch is kernel-specific, a single CVE suddenly
> >    requires building and deploying hundreds of individual livepatches—
> >    far less practical than a simple sysfs write.
>
> LP is certainly a more laborous solution. I guess this is quite clear.
>
> It is also much safer option as it deals with all implementation details
> like consistency. All that is not done for fun. I am really wondering
> how admins are expected to a) know which kernel functions are ok/safe to
> disable and b) when it is safe to do so without introducing unsafe
> kernel state or introduce an outright bug that way.

You raise a valid concern. There's no simple answer. Making these decisions
requires deep understanding of both the code and the potential consequences.

The value proposition here (IMO) is the ability to completely disable a
code path by returning an error code (such as -EINVAL or -EBUSY) at key
entry points, rather than attempting surgical modifications.

While this approach is far from perfect, it can serve as an effective
stopgap measure until a proper fix is deployed or a livepatch becomes
available.

> Thiking about this I can see how waiting for an official LP can be time
> consuming and sometimes creating those is far from trivial. But would it
> make sense to have automated LP creation tooling available that would
> allow to return early from a function and relly on the existing
> infrastructure to do the right thing?

Absolutely. I view this as a progression of mitigation strategies, where
the ultimate goal is deploying a properly fixed kernel, but reaching that
endpoint may require intermediate steps.

1) Fix and deploy a new kernel:
   * Pros: Lowest risk, permanent solution
   * Cons:
   	- Requires reboot and extended downtime

2) Livepatch:
   * Pros: Complete mitigation, clean approach, zero downtime
   * Cons:
	- Time-intensive rollout (requires bake time and health checks)
	- Demands manual patch creation and review for each kernel version
	  (i.e., kernel developer involvement is essential)

3) This approach (killswitch):
   * Pros: Immediate deployment capability
   	- Security engineers familiar with kernel code can act independently
   * Cons:
	- Risk of instability if the operator misjudges the impact

In short, I see killswitch as a complementary tool in the security
toolbox, not a universal solution.

--breno
