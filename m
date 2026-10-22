Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792709082;
	b=SlXkYaEfbWv+GKL4oWWWle5vpkq4/fu3dVvon0p3TVXdniv9lD7bQj3Z1EZACHs6wQ8/
	 FZKF4O0X7UQqH9iJI+pXTaCNWMM0ZZHfkGZqTM3SESQxM+kgyhzH+V2tmz6zKAeW6Kpz1
	 OACXVvtLW0VjaEX6EiX3z/scNxmfvjhw7aclFHzShCq0wu1wJeFMAiDfsyV/h+tL/pIT1
	 lZCZTGaUHFr538TJ2mLdQl9gIkIA82jnUoVEliE0627spMUXJwisHc3GZNObCQqGBUmev
	 tkbk/G+TJLFjrFzYqQ8s3ApdSc2kAdZaFej/TgYUfLEy30fdosy8AhRoEPXU9rF2uqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792709082;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=k4fZoxMlqvig8SEoaOPtbmuY6MUiHBjiaHzykL2lErI=;
	b=MIlkfzh9yud8fRyCyOPDQaBCHuYmMjA16oKYKmHjzLiy5B6lalrZM6Hb88hKBVatRGQU
	 YA1EygE9HUbOcYrcQrMibb2pCCDq4D3P8RbWC2JykzPRMcCyrC4TbUZxiVQ3NxzlMm4GJ
	 OKD0D+SDeSQB+w8o8fKKLfA8JAXy6wZrmmQ8EH/XNeCvZd62mZ6i6MFh5Ld1c7unGP7z1
	 IuxcdP5zWYLNX1d0gUKQAHHGjy+D3sg+tBIC9Kd/B53VZEGtVjAuD1/LgPjhJdi/n5r1v
	 rGBMFIYjJ8bWrfpIYI1R7jRzyAbeosLehBEsMRwkEpb+mpc6mDNClPkSEMZyS0VCE7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZbtUcfW9;
	arc=none smtp.remote-ip=209.85.210.174
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 144BB60A261F
	for <linux-kselftest@vger.kernel.org>; Thu, 22 Oct 2026 22:44:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 144BB60A261F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZbtUcfW9
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-89f639ba307so132489b3a.3
        for <linux-kselftest@vger.kernel.org>; Thu, 22 Oct 2026 15:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792709081; x=1793313881; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k4fZoxMlqvig8SEoaOPtbmuY6MUiHBjiaHzykL2lErI=;
        b=ZbtUcfW97Cbox1/4oJ+iFUIiIvU0KPpzOsKzU6NFQ3zJlZV1PyZtEMRDhcb0ViKG9d
         v8Uo2SUmB128g3IGgbyx47fP3y5DkOJU1WNCsfDHRJNvEFYd9Lytzvs9NH46dEY81zxs
         jFBqN2/AZewvymOUiXVYiLeJNZqT24TKg1v3LFVYZpaXbld26nRy8k44lmMjMh+5wNnS
         yjzMPMjZbQUpFBQu83pXk3IWuek1tlrNUKdVQQsKoxaGyFIwRbV48CvlCtIAQACDiXaA
         ya55qS5GpbOk+pQBINSF5tzKGPg09PsNK1tGynu6rR3iDy8eSPmesKht/M1Wxwbo6WKX
         WB5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792709081; x=1793313881;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=k4fZoxMlqvig8SEoaOPtbmuY6MUiHBjiaHzykL2lErI=;
        b=Qh+nzlPOMQ6Pw3z5z+PFLbrOtVdFE3OqL9f50XJ3pAxiaysZoYGE7i90IfgNgX9FMV
         n022fU7W2i+Hl7kULwa02V1lFm4yXtWV0D+sjwtdcDtx9Yq3ZZs4ekmX/UJYF32Srkkv
         pZfwWhnkASZHoC6B7/TSodAL4bAkXly/c+M9cR88teA5dOQbckEFRBNbfX0mRwajGyla
         HlD5TXmb6EdJnN+7mx0HItR6pv3U0EZ6MqOlO19/Nl8wgjTXUHWY0oKCEl2WT4gO5wza
         RMlYeNQWwFzH1d1Mk6Y0W39yVOW4SDcfdql21QcK/S/8j6huPyyQU8VSrA44TwbX5L+s
         9Bbg==
X-Forwarded-Encrypted: i=1; AKwUvBw1VID9n6axedfl30EKWHJnOqZSmna/z0EqJ/DgbS+kxByGe0Bdnk24rEDU7EMwfcJ60Bb51LCddFRNu2CQqlw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKj47krrEvKyrH9d0nOYAQpTLm77X2/76JLqNlqeWahQfdWf+5/
	wVyJwfqu8KWJ2JzvAJBpc4VaobmfpOvuM1TLnAr+i6rZIhP8Ir/BAYRL
X-Gm-Gg: AYBFou39pHARDK9QziD0P00PiwtwRF4wugD6Ez/tUCXfV0Ak2Prmwrc6UFtp3dGkIFZ
	wOZkzA8BuVBiJjBG8z8tE/LXATpAoLyjjEpuz0+0TQNMmaqLRaiok0zuV9Kq1Du1D/hAfb5AFc7
	SDXcNEHhjyNr1Ciq0Pcojca5WnSpAIubmGXdOo7L8jWYJTi9WIGvzir5Zkdygkv5diFQYy3hH/4
	NT+MoOdBJM7Kn/h3WXclQ6Rk+Rm/klkiNbWSz+W3tz291FZqT5b7wmFlDLOJwgX8zGLM+5kwzaX
	yezkOgRnhJvAoBQTbRGQeJyUaIt5uKVCEuKkc9oSsBa95+apqmAlJyZQnEKrFHIQvkTcPqN3jZd
	3g2L3tde1eZhuc9tbWelYWTp5gZ72UJ5T/4d3yczy7eXwxCRUbSO5OFEVBaC1HGYKyYYqhVAh/P
	FqTFjILTWSoYGCIkJ3mOIdHq75f2ThgGW8vQ5e6ybpa5txB894W2wS/qWotDfpYwb/eWidzkCkL
	FmaBddrMgKhRavpOB2RWov1J+fu1nne5dbYFekh3Su4F2PU+BtzAA==
X-Received: by 2002:a05:6a21:7084:b0:3e2:729c:9bcb with SMTP id adf61e73a8af0-3e376771294mr257966637.65.1792709081481;
        Thu, 22 Oct 2026 15:44:41 -0700 (PDT)
Received: from kir-tp1.lan ([67.185.120.12])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ba8e6678sm192717a12.30.2026.10.22.15.44.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 15:44:41 -0700 (PDT)
From: Kir Kolyshkin <kolyshkin@gmail.com>
To: Joe Perches <joe@perches.com>,
	Andy Whitcroft <apw@canonical.com>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Kir Kolyshkin <kolyshkin@gmail.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] checkpatch: don't suggest kstrto<type> in userspace code
Date: Thu, 22 Oct 2026 15:44:23 -0700
Message-ID: <20261022224426.2756960-5-kolyshkin@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261022224426.2756960-1-kolyshkin@gmail.com>
References: <20261022224426.2756960-1-kolyshkin@gmail.com>
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

The SSCANF_TO_KSTRTO check suggests using kstrto<type> instead of a
single-variable sscanf(). These helpers are kernel-only and are not
available to userspace code under tools/, so the suggestion can not be
followed there.

Use is_userspace() to skip the check for such files.

Signed-off-by: Kir Kolyshkin <kolyshkin@gmail.com>
---
 scripts/checkpatch.pl | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index be0e0493d4a2..7a520faec34e 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -7204,8 +7204,8 @@ sub process {
 			     "unchecked sscanf return value\n" . "$here\n$stat_real\n");
 		}
 
-# check for simple sscanf that should be kstrto<foo>
-		if ($perl_version_ok &&
+# check for simple sscanf that should be kstrto<foo> (not available in userspace)
+		if ($perl_version_ok && !is_userspace($realfile) &&
 		    defined $stat &&
 		    $line =~ /\bsscanf\b/) {
 			my $lc = $stat =~ tr@\n@@;
-- 
2.56.0

