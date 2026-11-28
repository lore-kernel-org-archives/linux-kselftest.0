Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795848761;
	b=q3LN5vQNv28xHj7mvwcIqQyq4wG1fjcRijMmRDz96GMrDq0aM/p9VbVKqzASFscEx0lN
	 +R3jJdY9j4pgF3OtY4iE5Ih1N0Oq4g9zsXIVZp/alDWF8ym/jyk8YVA68zPSoUxSdjNxW
	 laejAN9FsTTy4h+m94TB+kmvnPqCVoSqoiQnizSTWIX142USmgxKOhcFD3IwLHpNVlFHq
	 BLkBukfsZKVA3wZFgSGRMxSuZMnGrlyRID58nUTeAKQMz/c6K07Cpxw3fjPR4C1ppRyqN
	 NGqWawSpkKA3qPir/Vfk4btHcug7s2i8B839nKZiEYaPXy43NlfoYLQmqIesI2eoY9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795848761;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ble64br97A+47+OONyEcJbI7jgmlLrB0p0v7ulwPq68=;
	b=0s8zqM+AkarLoa9CQH30ZRDNdIc6d6t2fmsNY3UNtjUmFcIyGApvn4TpSOsq585Dt68V
	 Ghj0jHnCrTcsqxAmb1KHf28ZPSaYD8EMRxR51pF/nwEsFSTZEszWfLHx8+6m2oUL67pej
	 TiJbpXfTieFyh9sOaFF4AmHBsQ0LJp/6Teeg5tz2tH4enre6lYel94D+e/VuhS+nz01Ka
	 erivdZPqR8k7yge0Ftx0y0Rxk0WZuoFsc8fSOF+HakpyQhxiGfDYAXYHGcOmpy/wqVyOe
	 fny216GICYLMfNfZBc5Tj7spmV0ehpznz0kNMSkRfQLjsc3Z+A8u0m1vyVccQAfJJwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SdZ1qEx2;
	arc=none smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C80606A337
	for <linux-kselftest@vger.kernel.org>; Sat, 28 Nov 2026 06:52:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68C80606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SdZ1qEx2
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cdb1199bfd8so4082107a12.1
        for <linux-kselftest@vger.kernel.org>; Fri, 27 Nov 2026 22:52:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795848761; x=1796453561; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ble64br97A+47+OONyEcJbI7jgmlLrB0p0v7ulwPq68=;
        b=SdZ1qEx2enr8skg9XEiVFJKrMzA/CoIp4Tdf8G7PXLIVHgrZ9gdtycHXK1ZdYFjHAS
         QcZjfmhedQgzEy30NJXxP/7+qUBajFXACz2S1fGK07dUp1c7gB16v25aiipi9vqvjzl/
         y9CVrMW9RIoYvKe/+qUX7CdeLuQk4caTY8Ok5+N8nB4Cf9+PlRzC8qmwwmtCEvjJla1D
         1OOQQgcz2dJ0koDQMJVtB2gvm8065Sj1F4LH+uXCd/aaM6GyvQ86zzDF5fFalCVg/5QJ
         I+574/mH5UFK8SGcy53w1PzCGJg7NOpkmG69EezcbFFkj4CJhc4NhjXpFkdpiwn7yvuD
         OWxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795848761; x=1796453561;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ble64br97A+47+OONyEcJbI7jgmlLrB0p0v7ulwPq68=;
        b=OD48V92w3gbw/NOeXC/BcPLfYl00fjOtLfo0pDaYXvEinJonfikmSCjbAK0uqqMJ/b
         xwA4CinwWlwPpY0QhQd9kkicsgZ15EVlJ0KYAlsxLsR5F1VYROlAQLIheOK7lhS/ycXQ
         oWm9QSsAPNmGB8LnyCvxbrF71eoKhVKnSonlKvMJid+U9UZu1ii1ZuNsnOL9nhXsBu4I
         j4rIeXWCq2zoSlINfHR1IecObLp7ePAa54AvPi7nJgI6gpdnQq0H/arqzsDyn6OhQPYN
         H7080SrElaK+FNw90UkGu9p6ZoHQakfpCqSL0aBvYiVoBRkoeDM/CewokZsFgvEr858d
         nfHQ==
X-Forwarded-Encrypted: i=1; AL+hErG9sz6W2tKzmtvL6I/CYbgU+JYmISdiItd/pqHa/tNLfAtzHBkYOIpR6zknApP4v4MATfaYJvnNX7iiz1+gJV8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9L5pPc1JccYG5blEyBX12SaakJr2rB8VBYjOmQYSPOhaT97THD
	veAyjVzLpgnnBm1r1Kc2qTl1/EyEgYqSu6BbrSWVEnmDsXda2GUxKruR
X-Gm-Gg: AZFdTZfPQaW7/0w/16ayyMVudpx7/+ZWUwIbrP6cnryozOT2WG9H/+VxUItiD0M/i3I
	QqLezz7abMneAkMEyrOKX8R8/3JJJeSx41xoIJt18a3Wk2vlwmLLL8rk1sRQtSvuOy+DePqdFla
	HMiDBxYjjAmqb0Tm9Rnz400n8zUuFWHIk8FtU4q/eyg927D9cOkGf0EJP/YYdd8mk+PPSg3hKgh
	rOxuqF5+qmQJAE4yLH2hsg76KkGmszh8Kw0WMCzCHfM8svntfSDJmCCGwmuYBeEZrg1gFyqb3ev
	mBoUgzZ0ECS0kVAX6LdKu914hPygMC9CoBeFWZKuSCIxsZT+HESAu3UvBtcBp8JphimvgcF9v14
	ERpSxP1MAQjdvIDIIoxvqVbPmotUYPJIYa5MB4aUVBjxL/B248j0dD/vluTmYj7CsBZAfBQ1XiU
	/cgep9VEF58JnV2KDvZaUlnhyaMoSMhFXziDNzjsOmdcKKOTpanCdRyNN9UrXCzYA2bZMB32GLx
	O/yeSynsdj5XsFmyukRirxv2hLon2kGcl2Lfu4kGVM3ybsoqPhyIDWKH88y8sYgzqUgYB6UVttW
	GEU8caVnFFsxPgrpyPD7QngeILqTsB5SgDStkyqVleTyAU3yNUsmsomPoD5IF5r9zRlcRxD5Tak
	SXDHwS0+mV/QdNuFjaTXUUnLEIYHOZyF4//E5wirI
X-Received: by 2002:a17:90b:1b0e:b0:3b5:3606:f7a with SMTP id 98e67ed59e1d1-3b536060fa4mr5474722a91.1.1795848760623;
        Fri, 27 Nov 2026 22:52:40 -0800 (PST)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40a878d50sm44372965a91.11.2026.11.27.22.52.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 22:52:39 -0800 (PST)
From: HyeongJun An <sammiee5311@gmail.com>
To: broonie@kernel.org,
	tiwai@suse.com
Cc: perex@perex.cz,
	shuah@kernel.org,
	ivan.orlov0322@gmail.com,
	ben.copeland@linaro.org,
	linux-sound@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>
Subject: [PATCH v2 1/2] selftests/alsa: Add a config file for the test-only options
Date: Sat, 28 Nov 2026 15:52:26 +0900
Message-ID: <20261128065228.3628550-2-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261126035526.1779288-1-sammiee5311@gmail.com>
References: <20261126035526.1779288-1-sammiee5311@gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some of the ALSA selftests need kernel options that a normal config does
not enable. test-pcmtest-driver needs the pcmtest driver, seq-ump-test
needs CONFIG_SND_SEQ_UMP, utimer-test needs CONFIG_SND_UTIMER, and
aloop-test needs snd-aloop. Without them these tests skip.

CI systems build their kselftest kernels with make kselftest-merge, which
merges the config file of each selftest directory, and alsa has none. On
the KernelCI arm64 kselftest kernel CONFIG_SND_PCMTEST, CONFIG_SND_SEQ_UMP
and CONFIG_SND_UTIMER are off, and every test-pcmtest-driver case skips.

Add a config file with only these options. pcmtest and aloop are under
CONFIG_SND_DRIVERS, so enable that too in case the base config turns it
off. mixer-test and pcm-test check whatever sound drivers a system has,
so no drivers are listed.

Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 tools/testing/selftests/alsa/config | 7 +++++++
 1 file changed, 7 insertions(+)
 create mode 100644 tools/testing/selftests/alsa/config

diff --git a/tools/testing/selftests/alsa/config b/tools/testing/selftests/alsa/config
new file mode 100644
index 000000000000..23ea0ccfdfa6
--- /dev/null
+++ b/tools/testing/selftests/alsa/config
@@ -0,0 +1,7 @@
+CONFIG_DEBUG_FS=y
+CONFIG_SND_ALOOP=m
+CONFIG_SND_DRIVERS=y
+CONFIG_SND_PCMTEST=m
+CONFIG_SND_SEQUENCER=m
+CONFIG_SND_SEQ_UMP=y
+CONFIG_SND_UTIMER=y
-- 
2.43.0

