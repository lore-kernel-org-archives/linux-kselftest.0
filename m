Received: from out-zbxj-a76.jellyfish.systems (out-zbxj-a76.jellyfish.systems [198.54.127.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8656377A93
	for <linux-kselftest@vger.kernel.org>; Sat, 26 Sep 2026 06:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.54.127.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790402902; cv=none; b=Sof8cLmRFjm60J3Jr8mGUCBs0l7u6PBBRECGyGRGY0N4mzA/brgw3Re8XMrE75tJ4JJcUqUBF0zf3UJC6b0KWWZBqx8F5ANySxc/7t0bDuCzxnbQD8a+TlCpdhTeh/lr9J+EFi0harzqVM0YnggEPI1gxDrqwwJNL1xBJarK6oM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790402902; c=relaxed/simple;
	bh=Z4zYFg8jCTMr0Womuol2bi+GhQy8RcamcRStIJywsaI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sPRqWhxFdg5RB3LsO2Gn5k3DRzsLhc9QgTijWxDPw2OB6D5gQfC65PQXU6noUR6dr7mepkp7cf/G/mL+/IcjQZD7ZzdLGr4ehrQrzXgqhlqQKGw9tArImWpQ2QvWIV5wAZq9JdaACFzFBhLO/qhHqWERWA0iHBlNZr/upDr0w44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tychen.cc; spf=pass smtp.mailfrom=tychen.cc; dkim=pass (2048-bit key) header.d=tychen.cc header.i=@tychen.cc header.b=YJTUhiAo; arc=none smtp.client-ip=198.54.127.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tychen.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tychen.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tychen.cc header.i=@tychen.cc header.b="YJTUhiAo"
Received: from 192.168.50.46 (unknown [114.92.81.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4hsHDp5KWZz6tkK;
	Sat, 26 Sep 2026 06:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tychen.cc;
	s=spacemail; t=1790402893;
	bh=U1YUP5eZ+G+V4/9p4Ee8cPNW/VwkvrccDlqWAfYWhRQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YJTUhiAo62XyD4ObisL9TNZRiclu60vdvcUltl5QumKjH6/+oLMXoT9aktQWsp+7o
	 2FvrKvaCDwmlRZoxU/8FwWsYfJwxMCYskAblssQv1SjZBPzrnZE4fAiMXV4IpS+iAp
	 sebJ0OJg6Ggej83byF1AXWjq+qYnldiW/TxqANmaxJegNnJt714bmFTpEptvQoxTxG
	 GQO09ZLY86/CmFeWgriZx4dYzWs4MKPxlHVPPcgv7GNMT1rMkwoVfdofx/YRWINax+
	 QzZ1bFu7FFweDTvQfOK4myl/zz8HYOATuDlq1h8tAEAcR+kC8sTqTiiofLb+whlE7/
	 Ho7rN4QitoNqA==
From: Tianyi Chen <hi@tychen.cc>
To: qmo@kernel.org, bpf@vger.kernel.org
Cc: andrii@kernel.org, eddyz87@gmail.com, ihor.solodrai@linux.dev,
 linux-kselftest@vger.kernel.org, skokovmaksimevg@gmail.com,
 kernel-ci@meta.com, daniel@iogearbox.net, martin.lau@linux.dev
Subject: Re: [PATCH bpf-next v9 0/2] bpftool: Add recursive map dumping
Date: Sat, 26 Sep 2026 15:08:08 +0900
Message-ID: <179040288807.100521.3697685098759591588@tychen.cc>
In-Reply-To: <effbbc956dbdf4c78d27608f6ef8639908323d0aaabf80e1cd592cccac938c99@mail.kernel.org>
References: <20260926014208.24773-1-hi@tychen.cc> <effbbc956dbdf4c78d27608f6ef8639908323d0aaabf80e1cd592cccac938c99@mail.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Envelope-From: hi@tychen.cc

Hi Quentin, Maxim,

> Status:     CONFLICT
> Name:       [bpf-next,v9,0/2] bpftool: Add recursive map dumping

v9 depends on Maxim's "bpftool: Fail map dump for maps that can't be
iterated" (v2, patch 1/2):
https://lore.kernel.org/r/20260925162031.27259-2-skokovmaksimevg@gmail.com

The CI application log shows that this prerequisite is absent from its
upstream base, so recursive dump patch 1/2 conflicts. I listed the
dependency in the cover letter, but should also have checked the standalone
application path before sending v9. Sorry for the churn.

The AI review on PR #14100 asks:
> Was a bpftool patch that adds 'recursive' meant to come with this series,
> or to be merged before it?

It is patch 1/2 of this submission. Both patches are present in Patchwork,
but the resulting PR contains only the selftest commit after the failed
application. That review therefore concerns an incomplete tree, not the
full submitted series:
https://github.com/kernel-patches/bpf/pull/14100

Please hold v9 for now. I'll wait for Maxim's prerequisite to land, then
rebase and resend against upstream, checking that the two mailed patches
apply cleanly without any extra prerequisite and rerunning the focused
tests. Maxim, no need to change your rebase plans for my series.

Thanks,
Tianyi
