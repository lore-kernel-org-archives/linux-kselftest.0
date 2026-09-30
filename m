Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C79836167E;
	Wed, 30 Sep 2026 02:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790733790; cv=none; b=G7ZI2B1Q638Eu7zbdbvNZcaZFs3cCmwbnnJt7agSaD5Eqkbz4vv2cnCqr6g16HtFmFAj0U88pJKfxLFwf+YPcgY80nqXI1BmQgJ41xXnB69HrJZZmOd7hmH5gqOEsMyjlJuGVh44ERhilgw+SAVt/qRbDrFkwrH17kvK1jqtyGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790733790; c=relaxed/simple;
	bh=vgH/OsbI2sIw+4O8+rlHKr38Hc76+fR31GpB2FIVYIo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=koGeiAWucxhDHlYWA4u0VOx9hKQK8aU7ZDgVS0r/eRVqmMMzmhH7r9ocMIoRVd5IIHuJldM6rNm2QTi3IPCSsnMl/esCRVAhO6mJeUmi1Wk/eC8jdFpSOOx9AgbU9ZkL8eknMDr5oQQVSetBqqvbMBEN4lH+C+6ildTm49d+9pE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hb4aA5pI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hb4aA5pI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4ED1B1F0089B;
	Wed, 30 Sep 2026 02:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790733788;
	bh=fKkGfb4xgkC7xPIKlQ2uK92hzU29CD+84MVKZ8G0J6I=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=hb4aA5pIe3cJE1ca4mZE75IgOhwK1ckDbGrse5TLhFPfTFOR+95BTg7xO/hh1kybw
	 cu/VrfNiCEaBok+JvrbE8ExK3MWp+++A35dXlX7l/9Ks2H0t1Dz1XHL0NgH3Rap/u4
	 hpefYxCtI5WKcUhSlCU+iFb7iqsz0XGKha+CZaO8X2ZnYZegbmyoUkHOakOZQbj4s6
	 7bbjIPMWqKL1kWduSCscLMz9Yz0Qvx3DqA+Y+laV0n/RGiAu04P0lmjveUP065K84q
	 Sc4S4aBNyt1J4NajcjIYLfzkfzMbVLRmzTg+xYuL5g+ZMty5zVosYaC6J1hKed1JLJ
	 TW2kksll0HR3w==
Date: Tue, 29 Sep 2026 19:03:07 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Jeremy Kerr <jk@codeconstruct.com.au>, Matt Johnston
 <matt@codeconstruct.com.au>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon
 Horman <horms@kernel.org>, netdev@vger.kernel.org, Geert Uytterhoeven
 <geert@linux-m68k.org>, Brendan Higgins <brendan.higgins@linux.dev>, David
 Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>,
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next] net: mctp: Stop selecting flow support for
 KUnit tests
Message-ID: <20260929190307.4d121561@kernel.org>
In-Reply-To: <20260925192510.93840-1-kmehltretter@gmail.com>
References: <20260925192510.93840-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 25 Sep 2026 21:25:10 +0200 Karl Mehltretter wrote:
> MCTP_TEST selects MCTP_FLOWS, which also enables SKB_EXTENSIONS when no
> transport requires them. Remove the selection to follow the dependency
> rule in Documentation/dev-tools/kunit/style.rst.
> 
> The two flow-specific tests already skip when MCTP_FLOWS is disabled.
> The remaining tests can run in either configuration.

This patch causes the CI's "kunit-all/alltests" job to fail at the build
configuration step, before any KUnit test actually runs:

  ERROR:root:Not all Kconfig options selected in kunitconfig were in the
  generated .config. This is probably due to unsatisfied dependencies.
  Missing: CONFIG_MCTP_FLOWS=y

tools/testing/kunit/configs/all_tests.config (used by this job) lists
CONFIG_MCTP_FLOWS=y explicitly. However, MCTP_FLOWS in
net/mctp/Kconfig has no user-visible prompt:

  config MCTP_FLOWS
          bool
          depends on MCTP
          select SKB_EXTENSIONS

so it can only be turned on by another symbol's "select". Previously
MCTP_TEST selected it, which is what let all_tests.config's explicit
"CONFIG_MCTP_FLOWS=y" line take effect. After this patch removes that
select, nothing enables MCTP_FLOWS anymore, so olddefconfig silently
drops it and the kunit tooling treats the mismatch as fatal, aborting
the whole "alltests" run.

Since MCTP_FLOWS is a prompt-less symbol, simply listing it in a
kunitconfig fragment isn't enough on its own - it still needs to be
selected by something. Could you either:

 - keep a select of MCTP_FLOWS from an appropriate config (e.g. from
   MCTP_TEST guarded to only the flow-specific tests, if that's
   expressible), or
 - update tools/testing/kunit/configs/all_tests.config to select the
   flow tests explicitly (e.g. via a symbol that can select
   MCTP_FLOWS), or
 - give MCTP_FLOWS a real prompt so it can be enabled directly from a
   config fragment.

Let me know if you'd like the exact CI log for the failure.
