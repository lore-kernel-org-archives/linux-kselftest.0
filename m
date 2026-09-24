Received: from out-93wp-a13.jellyfish.systems (out-93wp-a13.jellyfish.systems [104.207.68.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40ED23E3D80
	for <linux-kselftest@vger.kernel.org>; Thu, 24 Sep 2026 16:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=104.207.68.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790268994; cv=none; b=OET3wFNVxH+z3mWDZjS3EbWjvET2AJaWLoBS71pF+0o815sBDk+GuG56o/eHHzqRxjeX3hDv8iburYpZ+nVIIXV62X6q6y9Sp9vHAVaip71YOUnaJt06MR5rg/9HBGfJuYoddv7lh+jyvfVQC0yWGtVWhfemAoB3kKjvZewRrIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790268994; c=relaxed/simple;
	bh=nDSslXScddRf23VE4AIAxMnO1q3GwJSoz2/cysVAWMM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Z91HJ6KjLvXENOyu6uuz4HQ7QVM0qzrJT0E8wZzBsDXTjHo+wBoUxXAosPUixQAu6WXO8AKi1uSy08T8cyoxi7KpxJtfdYhxgW4CGCwHEiMw2HIhoE8WhNe22ObaynPaMPEIhEQTJBXKZmMYCzdGlh/+9RcJCAj7HoWrvE4rbMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tychen.cc; spf=pass smtp.mailfrom=tychen.cc; dkim=pass (2048-bit key) header.d=tychen.cc header.i=@tychen.cc header.b=lRCFc/3T; arc=none smtp.client-ip=104.207.68.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tychen.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tychen.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tychen.cc header.i=@tychen.cc header.b="lRCFc/3T"
Received: from [10.18.116.108] (unknown [124.160.34.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4hrKF764WZz8sWp;
	Thu, 24 Sep 2026 16:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tychen.cc;
	s=spacemail; t=1790267709;
	bh=+sG0i2XL/6VZymXHECXeYeJzViHru/HJdsoom17EsOA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lRCFc/3TS6ZCKlGWBVBGAhKh5LYPogQjE/64VyXS0AqatWcvOu8oNsVtzX/1NMbaq
	 k/kLvxlRlNGJsfeDbxHBOoATdOkqRXTw84QEFIwsj8sV+SwR4Ov8nT9YCaabodZgpH
	 b/dV+0kkoeAxZ7BhEbkbztbmwx1NhgBgBOBO95n0XdlYNDxmJUitkFRYU5zm7SQG5X
	 VLe41qervqL6I150U0XankegBUGM9ALMsuAhnRp8A+6VMVFXcWeexe9exWNTrt0qB1
	 RC9bp732aUliBBgmMbW9QRNENMmbCRmDogQ5JBeiPA0Y/3t0P4eWDlZ2Ff2/IVqjOa
	 qnk4oiOXw54Ag==
From: Tianyi Chen <hi@tychen.cc>
To: Quentin Monnet <qmo@kernel.org>, bpf@vger.kernel.org
Cc: andrii@kernel.org, eddyz87@gmail.com, ihor.solodrai@linux.dev,
 linux-kselftest@vger.kernel.org
Subject: Re: [PATCH bpf-next v4 0/2] bpftool: Batch bounded hash map dumps
Date: Fri, 25 Sep 2026 01:35:06 +0900
Message-ID: <179026770609.205315.7245716718544035701@tychen.cc>
In-Reply-To: <141264c9-2d05-4c05-a76a-306818e854ba@kernel.org>
References: <20260911034732.219752-1-diannaaav@gmail.com>
 <141264c9-2d05-4c05-a76a-306818e854ba@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Envelope-From: hi@tychen.cc

Hi Quentin,

> Hi, could you rebase this series please?
> ... apologies for that.

No worries at all, and thanks for taking the time to review this.
I've rebased onto current bpf-next, preserving the updated per-CPU
printing interfaces.

> re-running your performance test, redirecting the output
> to /dev/null?

Done. With stdout redirected to /dev/null, a 100,000-entry hash map
with 4-byte keys and values gives these median wall times:

              baseline       batch       reduction
  plain       88.165 ms      54.951 ms      37.7%
  JSON        81.973 ms      48.216 ms      41.2%

Both binaries use the same new base and GCC 16.2.1, in a Linux 7.2.5
x86-64 KVM guest. Processes were pinned to guest CPU 0, with two warm-ups
and 15 alternating untraced runs per binary and format. Separate strace
runs still count 200,004 versus 395 BPF syscalls.

The timings include formatting and process startup. This uses a different
base and guest environment from the old measurement, so I wouldn't
attribute the whole change in speedup to redirection alone.

I've put the refreshed numbers and methodology in patch 1. All 11
selftests pass, and large-map JSON and per-CPU fallback output match
the baseline. v5 is in a new thread:
https://lore.kernel.org/r/20260924163403.203491-1-hi@tychen.cc

Thanks,
Tianyi
