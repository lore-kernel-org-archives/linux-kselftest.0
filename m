Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E553D7D67;
	Wed,  5 Aug 2026 19:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785957515; cv=none; b=XBNvzTKUymkoG2yG1eEYrakz4yQzus9D7h0GO5UnmjpynH6ub3dwm6BuzKUGK7L+GCpdUB0hxoyYrF0DmwemOBFg5DXRsgIocNwWRsrducDOy1V3BfXlAhMFyyRZjn1fgPsifG4SAhhuencrthzMjESlOgE+zAqDKRql21S1Fxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785957515; c=relaxed/simple;
	bh=6g9tZrigqIs9PwapcvJ5MOapPQyj79YP2CqzyUFfC28=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jUMycGbeyZv/uglkzkjMfcOrUuKCEVSsxaN1UtOMtVxHfhR6bOkgUggW/1VQSvv9sFKiHuhTbXIHyZYFTXb4SfFQdoOtBbuK4D3uyLtFbB5nP0FwAjQa4psHqepZVOAOljQqOpFvL0f4MFGt2y/m337mbRNJAEyOmqkZgaeEOFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=kIaPsDHd; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="kIaPsDHd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1785957511;
	bh=6g9tZrigqIs9PwapcvJ5MOapPQyj79YP2CqzyUFfC28=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kIaPsDHdtITekt0vp867zrzcgjs+fTIIoL4Gtv6NlPXrJdjvlIgZunegMQ2W7Rxsk
	 v6Wm5myfWVVGm976Gq06R1m4Avnm+cZVu2DvMBNxsAYvPObYi+/FjFIfQZNU2M2IjD
	 JjC11UiXpTZl5JiJZgMs2DRKZSC4u9FzdD+6AYrE=
Date: Wed, 5 Aug 2026 21:18:30 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: David Gow <david@davidgow.net>
Cc: Michal Simek <monstr@monstr.eu>, 
	Brendan Higgins <brendan.higgins@linux.dev>, Rae Moar <raemoar63@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com
Subject: Re: [PATCH 4/4] kunit: qemu_configs: Add microblaze configuration
Message-ID: <e11bc960-b31c-408a-a57e-631e76806bb5@t-8ch.de>
References: <20260804-kunit-microblaze-v1-0-6dcdfe12eb40@weissschuh.net>
 <20260804-kunit-microblaze-v1-4-6dcdfe12eb40@weissschuh.net>
 <42dfe558-f75b-4d7c-a560-449101bae4f5@davidgow.net>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <42dfe558-f75b-4d7c-a560-449101bae4f5@davidgow.net>

On 2026-08-05 21:59:16+0800, David Gow wrote:
> Le 04/08/2026 à 13:32, Thomas Weißschuh a écrit :
> > Add a basic configuration to run kunit tests on microblaze.
> > 
> > Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> > ---
> 
> Works well here, though there are still a couple of test failures (and a
> longer timeout is needed to get through them all on my machine):
> 
> > Testing complete. Ran 965 tests: passed: 866, failed: 3, skipped: 96
> > Failures: blake2s.test_hash_alignment_consistency,
> memcpy.memmove_overlap_test, printf.dentry

These are all due to the broken memmove() implementation.

It should be fixed by *either*:
- Disabling CONFIG_OPT_LIB_FUNCTION
- Enabling CONFIG_OPT_LIB_ASM

> I'm okay with this going in via either the microblaze or KUnit trees. Any
> preferences?

None from me. I would have expected it to go through microblaze, though.

> Reviewed-by: David Gow <david@davidgow.net>

Thanks!

(...)
