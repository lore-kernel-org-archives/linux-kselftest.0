Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793872455;
	b=SOHkCmyGQvW6SE5gToMWN20VfJufr1kdgqdtgRbEM4tNETa44jvkOjZrE4+JQ3qCLWo+
	 H/2AevsEHV3xVm90ghlTRwlh8160ZQQmygDE7tH3r+EIaAcvPKxF4Jz0KUV3ebtetcANv
	 BUQVevB1EqrsrCr9JmPKOeXrlNmvjDqCHM1kB7pJB4pkHCTuKoJpo+3dIGdG1NtXKJ5Gg
	 3+owcV0Rb1cNXC0dFSMUmFcDvhKG94vPQZz3KBtOKNXEhdvWxKb2zvcLmOXQ9XudZLqv7
	 ox5pOytK7puts99LnT2FrFPdX+DuTZ4sOn4x+pzMTEf4J1tCrFM5IOXIPtA1Kg3UKOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793872455;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Subject:Cc:
	 From:To:X-Mailer:References:In-Reply-To:X-Last-TLS-Session-Version;
	bh=V6R4Z5QNn1TmY3Fb9b2cmHECgOA3rdSKsC6p62jeDtk=;
	b=w4sRwHZG3aeIwjzRX9tyJW+OMCRv46ci1p/sUKtScaDLyhzw/Bjl3AZmogbOC+VRQhiq
	 wBU3k3YlVnk8mx0HvSZ4/yu2cRUy9T0jy+lQxqqqkDPv5qP7MfLoVVx93KeBJkLBBLrge
	 CM0CTr7j3fHgLjwl+GYIRAr/E8TxVUaGiwSRuGxBn73bXr9NdMt7xVko9PKSI1R/4Sq9i
	 DWj3W2O63xyAULfKLbmr1TuhIBc7vztsuERRFP0kRkAMf1nJGrGJwRwDYE2R9TzPVLclq
	 rkpAHOhcPnxsYpjN7+e0Wf6ff5W9Po1K6NF6ju1G62sE2AXtlf2NWYSuoA4igwiqZAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Drud5Bh2;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2763606A330
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Nov 2026 09:54:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2763606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Drud5Bh2
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 9EA701A0830;
	Thu,  5 Nov 2026 09:54:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 72EC15FF85;
	Thu,  5 Nov 2026 09:54:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4A14A10328E77;
	Thu,  5 Nov 2026 10:54:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793872446; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=V6R4Z5QNn1TmY3Fb9b2cmHECgOA3rdSKsC6p62jeDtk=;
	b=Drud5Bh2kSmQFCtnnvVRBf9Bpw/2pvB6u2mFtC6kIBwe6l/lvVAABTN9MUisRt8dR8oay5
	aYfk922o/+l+N+kukaDg+AwrL/pFqsQs0Hly8htVtM9x/9bO9YlofGTYafqV5KorPhIT5Z
	+FiLICdmBKFIaOjNtXH+XT9IRaNw9xl7+YR1Mfqg7dqPAeGnz1mocGfIcbakHMLN4vKHPF
	4q7PyuN7EsmOTeVhc43D0a1MC9+Hg1WjQBZZywg9EDJpLnBaPnDgqwXztVmcizl/XElOKF
	4HRY5RITniyt7rrY097BUozGfWDDfcWlyiyPU+wkHICAd2wy5UYte9HbAUICmA==
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Nov 2026 10:54:02 +0100
Message-Id: <DMN6PJC05X2R.2PXWV13VGT156@bootlin.com>
Subject: Re: [PATCH bpf] selftests/bpf: Look up unpinned maps by ID in
 bpftool_maps_access
Cc: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 <qmo@kernel.org>, <andrii@kernel.org>, <eddyz87@gmail.com>,
 <ihor.solodrai@linux.dev>, <ast@kernel.org>, <daniel@iogearbox.net>,
 <shuah@kernel.org>, <linux-kselftest@vger.kernel.org>
From: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: "Tianyi Chen" <hi@tychen.cc>, <bpf@vger.kernel.org>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261104183323.409412-1-hi@tychen.cc>
In-Reply-To: <20261104183323.409412-1-hi@tychen.cc>
X-Last-TLS-Session-Version: TLSv1.3

Hi Tianyi,

On Wed Nov 4, 2026 at 7:33 PM CET, Tianyi Chen wrote:
> The unpinned subtests pass "name prot_map" or "name not_prot_map" to
> bpftool. Both maps are used by programs attached through trampolines,
> which are freed only after RCU grace periods and hold their map
> references until then. A run's maps therefore stay in the map ID table
> after its skeleton is destroyed, for about 300 ms in an x86-64 VM.
>
> If the test runs again within that window, the name matches maps from
> both runs, bpftool fails with "several maps match this handle", and
> the unpinned subtests fail.
>
> Look up these maps by ID instead and drop the now unused map names.
>
> Fixes: 2d96bbdfd3b5 ("selftests/bpf: convert test_bpftool_map_access.sh i=
nto test_progs framework")
> Assisted-by: LLM
> Signed-off-by: Tianyi Chen <hi@tychen.cc>

I've reproduced locally in my VM the mentioned issue (and saw the
"Error: several maps match this handle") with:

  while true; do ./test_progs -a bpftool_maps_access/unprotected_unpinned; =
done

With your patch applied, I don't see the error anymore. The fix
looks sane to me.

Tested-by: Alexis Lothor=C3=A9 (eBPF Foundation) <alexis.lothore@bootlin.co=
m>
Reviewed-by: Alexis Lothor=C3=A9 (eBPF Foundation) <alexis.lothore@bootlin.=
com>

Thanks, Alexis

--=20
Alexis Lothor=C3=A9, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

