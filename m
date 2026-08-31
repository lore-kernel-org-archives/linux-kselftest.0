Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92ECD471262;
	Mon, 31 Aug 2026 15:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788190745; cv=none; b=SOl8IPtoSULg8l6ze+grf/LpEVFMU27HcsCu/MFXPJ1GryQeCfm0ujb9P2jTxVC5oLN+DT0YtQkOTeMQ0VkRHiQDlWse+pseoNNTVmtyo6HeyluElAGIE2DoLhHzNkF6FDKo8JH6c4YveAtRA57XczbzS05AVz+sTEZLBG87UHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788190745; c=relaxed/simple;
	bh=hEdHm2TlgBMAfv3WaXVoaRRdcAadZvI86mC8UFdvh+s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CpqoLWhg7anHbmaToDyDlXL9uOYFBgCleflUmcK9UgOXNooDd+PjIwtM9CA4OFXWFp6NNuqtgoGE9Ftd2fcdELw5g9hx0p/5EAe8olRfuf301fOiFSec39Ju6MuTGkktAqYAvU3PNXc5EeuXJIc4SdEQP+kAR+W93f6N8sgjbnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=uSIZKjuo; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="uSIZKjuo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1788190741;
	bh=hEdHm2TlgBMAfv3WaXVoaRRdcAadZvI86mC8UFdvh+s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uSIZKjuoBbNL4dMpM88J/cGjtIVnrsGhUH9QnUDbkIrFqfHDCSGQPK6AtRPAQzYFA
	 UMusjBPjzT3wVQ4+pFQeasplDZo85YJ1M4RNS7ZtjiTTmkDxKajybbxm4r7tFiS2v/
	 XHGuILLWBPSKujCLSchx66nqj5KNob+qG9DGw82U=
Date: Mon, 31 Aug 2026 17:39:00 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Michal Simek <monstr@monstr.eu>
Cc: Brendan Higgins <brendan.higgins@linux.dev>, 
	David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com
Subject: Re: [PATCH 2/4] microblaze: reset: Call POWER_OFF handlers
Message-ID: <64804815-65d1-4b11-8adf-c96b868056eb@t-8ch.de>
References: <20260804-kunit-microblaze-v1-0-6dcdfe12eb40@weissschuh.net>
 <20260804-kunit-microblaze-v1-2-6dcdfe12eb40@weissschuh.net>
 <0b5cbed3-ce1e-4f8c-9a24-422eb8a55806@monstr.eu>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0b5cbed3-ce1e-4f8c-9a24-422eb8a55806@monstr.eu>

On 2026-08-31 10:13:52+0200, Michal Simek wrote:
> On 8/4/26 07:32, Thomas Weißschuh wrote:
> > System power off might be implemented through sys_off handlers.
> > 
> > Currently these are not respected on microblaze.
> > 
> > On power_off call into the generic power off function which will execute
> > all regustered handlers.
> > 
> > Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> > ---
> >   arch/microblaze/kernel/reset.c | 1 +
> >   1 file changed, 1 insertion(+)
> > 
> > diff --git a/arch/microblaze/kernel/reset.c b/arch/microblaze/kernel/reset.c
> > index 2f66c7963084..3612a20ca16d 100644
> > --- a/arch/microblaze/kernel/reset.c
> > +++ b/arch/microblaze/kernel/reset.c
> > @@ -27,6 +27,7 @@ void machine_halt(void)
> >   void machine_power_off(void)
> >   {
> > +	do_kernel_power_off();
> >   	pr_notice("Machine power off...\n");
> 
> Likely it should be here. Or you will never see this notice.

Ack, will change.

> >   	while (1)
> >   		;
> > 
