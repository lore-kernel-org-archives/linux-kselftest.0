Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E95B13B8412
	for <linux-kselftest@vger.kernel.org>; Sun, 24 May 2026 23:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779666661; cv=none; b=a1y3eLf+PdbBH7xv823KT7FxzAx7uBGFZbbAbE/MdyOfiwzMrSK5FlOHB7QFW4R3Gv56oPEv+brAxsIqYyK4TEjYE2Uz6CLbvRZdLElQWbDX1FI3p+hcgDp4MwxA3A++JHF2+kzJMycWyQIGq9GV/P2ZRwqQC6Aor1kG2AeubIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779666661; c=relaxed/simple;
	bh=ZxjS4k5Wfeeih8LlvyZ7lzC258PmQVKVFUTNNulCANs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ydm6+uv5fP7+x1u/oIuIFcg4Nw9aBwC5PAZCaIpqmKtTDgTmWFXTn6ZRASuDep0ILbyMDf1ijUGTNBv1Z4zb/bGpCfVJNdhnfANojHCLEBit395vOPY6piZwO0JU6kMES+6W9+Wf/K5mgaDBoNnqHmg04sRe43+L8rJ0FvYicck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=gBO16XGd; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="gBO16XGd"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-43d7645adbdso5829999f8f.1
        for <linux-kselftest@vger.kernel.org>; Sun, 24 May 2026 16:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1779666658; x=1780271458; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lt6lxfl9RFsw6Y0qS/TM2FzLfwTBlZir2fyLBV9fJ4I=;
        b=gBO16XGdEwwQbkNKLfUKiBVtfuQZgqWxfoQ+qm1aWQ4E65c4Rx5KALuzxGlazPR06w
         DbvJPLzicZchgoifZSoplGjqZyxzlHn3gkGzKqmFToZc2uNET2ZdpW8t0uw7Ddugw1xf
         H3KfrgR4RecGP35eXdpoeAtUbr2ihCEVBEyU/se9ORoJHMmRpLztkWW4TDhnEPpSks/4
         n/D40BnCEqxqqUl8LMoariTN/VJ9AzUq9JYamkur6uHas+ah/wmeL7kyoRXlV3IAzadA
         FIxYxWOqBl+p1ugseUi2BwOKuAQ7JA0Q3MLBUAjrJYJwK0D2VUlyJkNwEy9GU8lhpxeV
         BZEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779666658; x=1780271458;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lt6lxfl9RFsw6Y0qS/TM2FzLfwTBlZir2fyLBV9fJ4I=;
        b=qcN0iH60A0JrSdFSN7CLI9lf7Gfu5389g5XzWxOvCmRekYxK1nDC4GJVb5FSg//0A9
         xd2aiBJOacRqVgragCDora7zAw9eobA2bzshRhFWsDh/5cCTFExj7hwBG9fMHd2LkC7s
         wn2ePCnH6BqJknq9wGXUroSxm1OPehiH65Q9E3pBMuSNGP9Mu4knUtDZlWW8rpkwMdjO
         QvfmHlYU3iKK+ccFlpUp4N1DRLXmWXDC/mGHP8/Pi6fs3SDtkK5nu7XA0BAkqAPkVlvz
         1G+83j58VU53SLOYW44Bn+yTjFed4TqndZbLUkgCXLSbAySqr50roKLwEUOofBojBbG4
         xyPg==
X-Forwarded-Encrypted: i=1; AFNElJ8FbrkFi2ZBSR+Mj99UivmhArcM2SQz52uAwFQRQhOImEqrBFuuzNi6BRsdari7ZHU9idhGZmioi84fqyfbnyI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwrfjMqRkXc1Tp5SCJqIF/JEIdE4hRdHGkk2/YVcKGBdPKrSNWi
	GiVqccbNEjblQIf+qqLChB48/s9YwLCRFzz6sp+WSjtA8i4Va83HxyZIYdJGGSLpwsw=
X-Gm-Gg: Acq92OEA2H9EW2znatLb5NxYGng0Wia/jNURki51KuS3ol8ZvRCY6c/Ay+VXh7HL9ma
	947Jh2kjr/iQv1+kLrA4chVr/PrNHqlKtEVmCUFoenS2VPJUSqBCErptjMMJ0gvNc5WIBpRmTDQ
	WBja/GZuSmYpPf1Oq53Fr4MeGDJN/lxNBWX6vAov/AhkDeiasr9G7CyUaOT9vgs9d4A+B869VrN
	s/aQSITb/ARBlXUzFwOPDj/VBVVKEUsZYsda5ne4Qmi7jI3NIM2znLBcf72aefqgzeDX3v6Bwr1
	Zrdg1XEqcbaDzZzOYoxcnsX9KRQcRy1RW9MUKHaGvqergHBe7QJ5dXvqXis3Jdh/byr68sxYKi9
	LTPSh8xHowkF+bTePPBktRkgrfbiawocw53zqMkXwd0fbEcJTFToB0QgYnEf4x6iIVHkGQt/Eoi
	IWWK0548A3qaBGbalIJwqS1+Z70FVQApusgw==
X-Received: by 2002:a05:6000:400c:b0:45d:d092:aca4 with SMTP id ffacd0b85a97d-45eb38a81b5mr19039850f8f.4.1779666658359;
        Sun, 24 May 2026 16:50:58 -0700 (PDT)
Received: from [127.0.0.1] ([2804:1bc4:224:7800:585c:db3a:fcb:e21f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6c9de2dsm21698074f8f.4.2026.05.24.16.50.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 16:50:58 -0700 (PDT)
From: Marcos Paulo de Souza <mpdesouza@suse.com>
Date: Sun, 24 May 2026 20:50:33 -0300
Subject: [PATCH 4/4] selftests: livepatch: Add information about minimum
 kernel support
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260524-livepatch-unload-on-fail-v1-4-7465de7f741d@suse.com>
References: <20260524-livepatch-unload-on-fail-v1-0-7465de7f741d@suse.com>
In-Reply-To: <20260524-livepatch-unload-on-fail-v1-0-7465de7f741d@suse.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>, Jiri Kosina <jikos@kernel.org>, 
 Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, 
 Joe Lawrence <joe.lawrence@redhat.com>, Shuah Khan <shuah@kernel.org>
Cc: live-patching@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Marcos Paulo de Souza <mpdesouza@suse.com>, 
 marcos@mpdesouza.com
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779666636; l=956;
 i=mpdesouza@suse.com; s=20231031; h=from:subject:message-id;
 bh=ZxjS4k5Wfeeih8LlvyZ7lzC258PmQVKVFUTNNulCANs=;
 b=5XrQ0kqgcWWWv8O5MO8yhqPyXestGtE9OHduTomZaCX9su6x9fAEDFWl5BD7+YVaDF/moMqmN
 TMlikFW8tFwAwwa8YLuuiKPyCA3wxEGAWufZ6rklMI8qduGSoNBuT+7
X-Developer-Key: i=mpdesouza@suse.com; a=ed25519;
 pk=/Ni/TsKkr69EOmdZXkp1Q/BlzDonbOBRsfPa18ySIwU=

The current livepatch selftests are compatible with kernel 4.12, so add
a note about it for future developers willing to contribute with new
tests.

Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>
---
 tools/testing/selftests/livepatch/README | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/testing/selftests/livepatch/README b/tools/testing/selftests/livepatch/README
index d2035dd64a2b..293f4730b927 100644
--- a/tools/testing/selftests/livepatch/README
+++ b/tools/testing/selftests/livepatch/README
@@ -54,3 +54,6 @@ check_result().  The latter function greps the kernel's ring buffer for
 those strings for result comparison.  Other utility functions include
 general module loading and livepatch loading helpers (waiting for patch
 transitions, sysfs entries, etc.)
+
+All new tests and test modules MUST be compatible with kernel version 4.12 and
+later, including current upstream kernels.

-- 
2.54.0

