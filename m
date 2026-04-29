Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4300E366575
	for <linux-kselftest@vger.kernel.org>; Wed, 29 Apr 2026 14:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777473344; cv=none; b=aKgaku/aufqswLQL5ufIHorBT7PNyRR0MPIokOLmFQrOvsFevhIcbJel+PZ7U7WWJJGcdR6nAgnXivAqk/Vf+ugSFbDrn+/JAfaKY/u65Kqz5EH7hHrFOSNzhpQEX+7/Csn416yrb2gWwIhZuLLLsI8Sg5ObsZ3+3sU5jF4BhXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777473344; c=relaxed/simple;
	bh=zwVAcfIrB5gkKSQrtegRJbhzNles6rOGTmiKmx6GRWQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PKPNs3wc+91EGyvwC+kXVcRt3c8wfRB/Ppbfq5sPyBvaruk1erf66+LRbeUAiMSzkiDl9zjdJmEvgw5sMHzhszJ8u068mr1z3H7iElGkEhQnKkgO1FJns+EIFFiMkAjDh4YRUGkIXaGiC58lwhzqNpPqMumR88BVrIyPACqe3+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=LKnyyxaE; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="LKnyyxaE"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so219201865e9.2
        for <linux-kselftest@vger.kernel.org>; Wed, 29 Apr 2026 07:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1777473341; x=1778078141; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/rb04HihRpFGGRez1OC1FkeRKyhSIjAaQFdeNYoGCmo=;
        b=LKnyyxaECMqUQhBvcIxWiS0daR8t76eu1YQO3xtLGtXWVw+SsRQ29IGG09LFHAaJqH
         skqjuJun2ECnW2maFhIkgQyVgO8bEFgpGg7fQLFMW+QO53sdHHHtluqq4LCW4voiTlpI
         f4ePO5kf0/6TUZHEj+RkMvmRJ8jSjofIxT032NE5FfOVhTVQZLq8ZEaBuU4kFOQUT79y
         Rmkv24gXbwW3z4zYTBHIcq+x9nJH5NJMXXXqEZLPypXJjT+5EObNH6a6jAmG5/6XP6iT
         KNPslQPWfrb7YovvgkCL7uFcrCLbhEVP8Oz2Zx3ogODHFMOgp+/ZVDgaXV5v0xsuLzYv
         ViAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777473341; x=1778078141;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/rb04HihRpFGGRez1OC1FkeRKyhSIjAaQFdeNYoGCmo=;
        b=IVHG2MffdQ/Kju5/raMguH/m5g/e1ZfeCuv/WQgkqTBOUYK4kVc/T6VIUcM2fXyUax
         /lf+fRHqPTTqgoLLq0wLxut0MPkYa+T3OCds/rrSKkyVJF8UPJKGmyAKPTVTaxW9rOh4
         hntlNRBIn1Bv9BoQWMSIdSD/dkGz5Pm+7ELRXFyFlNrDkmVlGX+nVPJbtO22xa5+Lgmz
         8jtL0MdBmGCwvhBJXwnNkuB64XO9uggm9Dyr9sUGqNuN/5CKGOV2KZuCJB5fYoYw4hld
         e6c+ryMEerOGAy/biWoGZIuL4Ux1gkvwaiMfJVXugiaSulW1ojtBsL6cLtRKvpCM4FtA
         /cRQ==
X-Forwarded-Encrypted: i=1; AFNElJ/a+DafiiJAmC/Uzm1NF3VO/6nJZ4z9BqFtEQcRBQv7FHUX0jJP8MwUFVRfBuvhT30LEDFwXpMmpzsHvyldqZY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3zokNimZQlphYiOkFJYpYbclT3uGP2sUfVYqTkL/RA+EmAJ4/
	Xo5D3VQM74CI5ODLVpGwZTyPXFoPLP+jS8I4A2h3XXwpDvq3s0hC2g92yygSmLl6cWPVC/SC89/
	hbOF1NmU=
X-Gm-Gg: AeBDieuq7vJRySMzD22EpIb3230aZtLidnX5d46G7Fa8/NXVENicKP9iHlY6EmtuMQ6
	mL1SxVgOsIB2EVTTQ+pWIfiZAYze8mUQeC85X0lzi5MBtK2qRe53kG8YCSKKZHUWUM2c7ee1/kC
	d5hs86dG2DltaFExC3FZg7Gz00aGSabQ19x9dbcEfRXi/gVGNRZGqWrhzMXExJewhoKQz/c/u7B
	GJ1pqQI2QoTzkj60HjrMK4AIYg3HMq6Fx/v75yMzs81O5TqC3zmsQ1nKUGrNp/KMYGI9P+sioEa
	LmfO+yDmEOJS9tEjl3IWbqa70+zVLqq9GF2GW44cdIjlS/OR1PZ8Q59b4f6tKKV2HAr8gesFT77
	M58El5uG9Bz94SuP6xjnOwtnHLeggAjUqiY3ndQeRCEX14tdyGH68OWdFUBXpITRraAOY50zuwX
	i3tcaa+5mCU7NxCCC40sYCKjhOlg8G1gom/Q==
X-Received: by 2002:a05:600c:3516:b0:48a:65a5:750f with SMTP id 5b1f17b1804b1-48a7b542187mr72905715e9.21.1777473341235;
        Wed, 29 Apr 2026 07:35:41 -0700 (PDT)
Received: from [127.0.0.1] ([2804:1bc4:224:7800:585c:db3a:fcb:e21f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7c305371sm19982835e9.18.2026.04.29.07.35.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 07:35:40 -0700 (PDT)
From: Marcos Paulo de Souza <mpdesouza@suse.com>
Date: Wed, 29 Apr 2026 11:35:17 -0300
Subject: [PATCH v4 3/6] selftests: livepatch: Introduce does_sysfs_exist
 function
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-lp-tests-old-fixes-v4-3-59b9741989d0@suse.com>
References: <20260429-lp-tests-old-fixes-v4-0-59b9741989d0@suse.com>
In-Reply-To: <20260429-lp-tests-old-fixes-v4-0-59b9741989d0@suse.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>, Jiri Kosina <jikos@kernel.org>, 
 Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, 
 Joe Lawrence <joe.lawrence@redhat.com>, Shuah Khan <shuah@kernel.org>
Cc: live-patching@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Marcos Paulo de Souza <mpdesouza@suse.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777473323; l=1087;
 i=mpdesouza@suse.com; s=20231031; h=from:subject:message-id;
 bh=zwVAcfIrB5gkKSQrtegRJbhzNles6rOGTmiKmx6GRWQ=;
 b=6wWstIwsc0qnLAxt9thWDch+TeV2MafYkCbFIql9U3Atbpp3vyOuKXGLAVKZLYJ7ppJojNUaX
 Rl+RiIa5DVkDqX/sdk3SCaS0OUFtNVfdjfZb97YnAgqVsn1B/gM2ejH
X-Developer-Key: i=mpdesouza@suse.com; a=ed25519;
 pk=/Ni/TsKkr69EOmdZXkp1Q/BlzDonbOBRsfPa18ySIwU=

Returns true if the livepatch sysfs attribute exists, and false otherwise.
This new function will be used in the next patches.

Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>
---
 tools/testing/selftests/livepatch/functions.sh | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tools/testing/selftests/livepatch/functions.sh b/tools/testing/selftests/livepatch/functions.sh
index 8ec0cb64ad94..2bc50271729c 100644
--- a/tools/testing/selftests/livepatch/functions.sh
+++ b/tools/testing/selftests/livepatch/functions.sh
@@ -339,6 +339,16 @@ function check_result {
 	fi
 }
 
+# does_sysfs_exist(modname, attr) - check sysfs attribute existence
+#	modname - livepatch module creating the sysfs interface
+#	attr - attribute name to be checked
+function does_sysfs_exist() {
+	local mod="$1"; shift
+	local attr="$1"; shift
+
+	[[ -f "$SYSFS_KLP_DIR/$mod/$attr" ]]
+}
+
 # check_sysfs_rights(modname, rel_path, expected_rights) - check sysfs
 # path permissions
 #	modname - livepatch module creating the sysfs interface

-- 
2.54.0

