Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4AE1299A82
	for <linux-kselftest@vger.kernel.org>; Thu, 21 May 2026 00:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779324865; cv=none; b=FdnosWRn5aqKeTjMcazSRFbfjQd86sauT4oDYO2BsaaBPbbH4HA4UfzgMYwNTTbIsxM5p/Op7Wz/fBsW3ye3HuaK7h3GNvKgVY2gaDJuVLa0Q21PsgmlRYk8SioeDVudS1RkucnhpWQlMVNIjmP8g3MlREXzP7RIKdOWzcI2pXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779324865; c=relaxed/simple;
	bh=Fs36l6v3uBjGsJu9zVgp2svCEtYbcicwv1lrMDRYclI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FEdSnnOiFQgEsZ2psDHef1FrZGEXX9r17rNqdgwZ8mkMC3epGl0Os9Eq9MlrQ68vIvV/+60m8JU48+bBgms21aTUEtH+vwDvv5/5psLTYKZTtfHxeBv4LGVfaNPxPLOx5jTvfFxNErsRaMhgeiyls96aQhqGJOrrO/9dHScEqQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TLDTZ7tv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TLDTZ7tv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5A191F000E9;
	Thu, 21 May 2026 00:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779324862;
	bh=d5rrceoElyX5Z7gN8RAFnZkqlYkvBiY7YEzCkRbKFSY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=TLDTZ7tv1tDWuAtn0VPJQOSMRq5/v2oWgVQFs23mffgGQ5iJdHzzRLW//6/Tbagjt
	 2WtVpFXgN18Q8mgVs56Ndi9uKqXkcFBXBzQImiZJMqX/HtHNURet4wknWBI9mJwnoR
	 L3bHQin5DKTOjrTyYcD1+V7T2D4OyqrQoQCppwxMd8uEe64Hdc4RlAhOgXJCoapgSR
	 8I1PJ/XQs770h0OyxxRVezwM+21rdKDS9hXXJyauDbrfKLOol8cCrQsmOFK8cWEUOh
	 hTAesDW5zeZlns8HUYLUSiyUa8wZxDpFDR/xfmMwrGPOlKMzEb7i+r3Sxy+KS5D9xM
	 pkzoYD2vSpFPQ==
From: SeongJae Park <sj@kernel.org>
To: Wei Yang <richard.weiyang@gmail.com>
Cc: SeongJae Park <sj@kernel.org>,
	akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH] selftests/mm: close fd on write error
Date: Wed, 20 May 2026 17:54:18 -0700
Message-ID: <20260521005418.84818-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260520020336.28914-1-richard.weiyang@gmail.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 20 May 2026 02:03:36 +0000 Wei Yang <richard.weiyang@gmail.com> wrote:

> When create_pagecache_thp_and_fd() write returns error on
> /proc/sys/vm/dropcache, it just "goto err_out_unlink", which left fd
> still open.
> 
> Use "goto err_out_close" to close the fd.
> 
> Signed-off-by: Wei Yang <richard.weiyang@gmail.com>

Reviewed-by: SeongJae Park <sj@kernel.org>


Thanks,
SJ

[...]
