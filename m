Received: from mta1.formilux.org (mta1.formilux.org [51.159.59.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B6B23EA83;
	Tue, 18 Aug 2026 18:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.159.59.229
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787078397; cv=none; b=tNrZGLm9BsXC5yiMqDbmebUbfxqnub6WbeNryvzsPi/l0YkjXtSDtPa/JhdKR8AATbdBhJOQP8AmBN04AWu4n/Ad9Ae2uUXfhYm2Lg5wJu75en3PUZdc0W4dKGtmas5/S4R5S57ewocBMTqM/SHXoY8xBsbUUh+fEWBhMazdkgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787078397; c=relaxed/simple;
	bh=Rm8N6QfAk+EDKiVFDQo0qhurn0lXHtBtSMIEJDTstyM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hacxmsvy8Q7qBbiFzZlxRXZOqzC/B1DHKiUTcHhVqG2e/GlSi62XdkpObrbnySmmuYdcXQIEqQSbQI/K1u6JPdGcwesFRQh+7Ofx6ILIdCwlZbfanSwAopFncmDHAlSdVmo3JxbApJYxR7hTVqpktuSy585vHUxUw3c7t2+giAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b=gWmHXoyp; arc=none smtp.client-ip=51.159.59.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b="gWmHXoyp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1787077848; bh=+LekPC/x+jQCzV5YVH1Im787iEDkm2hW+YdLr0FYddE=;
	h=From:Message-ID:From;
	b=gWmHXoypnBxlm0qHuVBz5Yho8PaPNn5PMhhX9PhctjZfkf2roe4nftrQnTmBQt/e7
	 ktHOtziXlc19lUdfFfI0Rsva39LdTy8tqzVcdiffcK3naRhnMxwAtPx4zwx4kpiZ2a
	 lm1OhVLvT0FkKd9r/JJ6MqeAQFxYo07UMR5EeAko=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id 11E3BC0974;
	Tue, 18 Aug 2026 20:30:48 +0200 (CEST)
Date: Tue, 18 Aug 2026 20:30:47 +0200
From: Willy Tarreau <w@1wt.eu>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/nolibc: stop treating skipped tests as warning
Message-ID: <aoSk169PzIgyZbFN@1wt.eu>
References: <20260818-nolibc-test-result-warning-v1-1-d15cdda84ccd@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260818-nolibc-test-result-warning-v1-1-d15cdda84ccd@weissschuh.net>

Hi Thomas!

On Tue, Aug 18, 2026 at 06:33:02PM +0200, Thomas Weißschuh wrote:
> The nolibc testsuite will always have some tests which get skipped.
> Due to this the full testsuite is always marked as 'warning',
> even though all testcases succeeded as expected.
> 
> Stop treating skipped tests as warning.

Agreed. It's clear this will never get the other way around.

Acked-by: Willy Tarreau <w@1wt.eu>

willy
