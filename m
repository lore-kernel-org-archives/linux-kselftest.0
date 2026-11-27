Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795802600;
	b=eR6L7PKZjf9akUL/db0yX4LGGGmcQucxN5c6SdJZEjg6S1cK3srYrHVRhv+wyc/XEDUx
	 FLofxsDTfAOaVphtpXrjqawmAPzx3ay04UmoddOLEzshJZlavIPoxN3z4U7PdAsSXDWZz
	 M+tdb3BbDvg+DJT2zrqA16uFapzt/F6WytP0yVA1lRFY7SorfpJTcruIsq+ikxitt2Y4J
	 VflX+GvPz/PSiLDHA2N/zsTcYo6Ft+xvzJi/W/NopPT5iBtCsU2Z0+5fWM70h/gBO2Z11
	 EuMSSZZ1YGSZP1zqbbag6qXkKhx80+VhroNM2zfDTn5PJ2NSUpg1nM+NtAvHSY/k+wQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795802600;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Last-TLS-Session-Version;
	bh=rD90LW/g1uRft8V8loea8ddnC8E+29zzF3dbDqD0xKk=;
	b=LCbtBvVMJUxqnRGzAsCtM+513nyRwEaVOL0KeheTse3uqRhZUWQneREws77OHnde0YRD
	 rl0wvJxyEDIsgZoio10pIh0vzM2o2uMiTfoIr8W7D3+5EzfRJ6S48bqroU38eDzq5svUN
	 Q2r45qWtBPBC/FTpHMuAsdeZ3i9H397oBtvgxe5n8F4mwQH9T75ttPWOkp4O3duPUs02H
	 Po4pnJOCWQMbuloo8YrMspaPrhuK+unuhmh+hrRd0JMepWSLJMd2TmGr4Q8xN6Eoo6X+y
	 /EzSSkxI375BWgTfUuHoZksfCMBn5irjtXLzQKsezjy1Hyogd16hXOYeLm1PqIHlz0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=marliere.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=marliere.net header.i=@marliere.net header.a=rsa-sha256 header.s=dkim header.b=MGtSOfyM;
	arc=none smtp.remote-ip=209.85.161.48
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A246606A33F
	for <linux-kselftest@vger.kernel.org>; Fri, 27 Nov 2026 18:03:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A246606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marliere.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marliere.net header.i=@marliere.net header.a=rsa-sha256 header.s=dkim header.b=MGtSOfyM
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-70bf1671c21so4753810eaf.1
        for <linux-kselftest@vger.kernel.org>; Fri, 27 Nov 2026 10:03:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795802597; x=1796407397;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rD90LW/g1uRft8V8loea8ddnC8E+29zzF3dbDqD0xKk=;
        b=ps6+ufq5+7iGz6slbkY3+9QZrlE2jFIN2aMvZIVmGYlYD0HcUG54/hZfI41Uan2jFz
         L6miXSOPkvJdcebUzZ3LO54io9a4xyaW7kiMXwwGXiwP+vcw2qhlYpzG/M+E/IAUMJjF
         JhY9CVmEIsmla0uRd6FYsEiMaVcaNmq3x6TtKmgTE2yZkiiviahJhU7pEAyMSXuXSWAc
         bP0v/tHCr4ilAUW3j4rWGn4dcSlUEaEMZW/sgVQVzA1hE0Tzcf/Y+pKD461L6CozeKXA
         fQNIunxH5ttzg0g1qQCglDV7Qm+MvGRVdTSwQ/rTUB8G2HCtFVSk8SBwaOuXPRd1+g9i
         HbDw==
X-Forwarded-Encrypted: i=1; AL+hErErJS09cRxW7babwKAdAEzHWj553PBe+82wi7aFvzqi3HPkmimrOJT4myfGhngVKx82wSVhWZ6YKY+s3WVfvqY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9VZfy1lRjbU5oPFGYP7poje1AKOSGLvwRHyYqqOkSOGiMhMeN5
	X19aSzWbg1rKzJwxP6YGkQWiKaXfe1gTm1RRIXpBdki4O3KXTgrw4Hxy
X-Gm-Gg: AZFdTZdab+UoUwLUuMgWPCjIdijyNdEItyu0jwEPOUroIzHyc0QZ1cjxi75iF1OQKRZ
	GzjWo6Mr49TwifyWrkpRMKIfu4uLvGfJrH7GnwKOmjRLlzMf0NNs57tcPf9Ej/mqGT4gUix241Q
	goD0TcAG9XXsQtUgkE8SCU4hylGtYp6T26PNuWuzq6H8y3OVTSuljoM3LtBIOsOuV0FAeYj9MFD
	hrILO34llkg82mRZx8PjNJRDmhcR8OpEM+3orA/ixsonOiy1BUCdEjJ8D6Pthu/vmSzTFbS2DeA
	KTO4X6BbDyKwLRVOJ0zNEggTSUXVLSq1+IcYx2WlfZ6K/NSUgFIm+8Y+AuN+Tbe3LlmZM193Ttm
	eyMKMPphc3CqiRndmNSgIpkI5+W8sFIvWiAzLulKJwNVrru4oY3XWPobvKaK2gWhgmkvbx2D9Zt
	qRq8XuJum65x5n4kzIM4WkW50F49Uwp47jCCIz5gtvbnjcM5DjV2hDbNThBvj/IassGyTFWg0ek
	2/Lm80s7C+f+/VRvP3+R+tAX5NIiH0tfVQKNxjJUMDZoxv4ag+bkaUWbpM+/Le/9Xt20UaF6vqC
	RKquuUAziCZPvHZEfr+L7WyNraWSPMAcManhEnl2WQILH6sXqWnHtcLL+j/TFPU/oDIdP1GkfIO
	W8JlAtU3wpoG/xYjIVgLyk6Q2C03f1So=
X-Received: by 2002:a05:6820:a09a:b0:713:e3f5:251e with SMTP id 006d021491bc7-71b395332f2mr16781524eaf.48.1795802596855;
        Fri, 27 Nov 2026 10:03:16 -0800 (PST)
Received: from mail.marliere.net (137.65.66.34.bc.googleusercontent.com. [34.66.65.137])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b38015c51sm16467798eaf.3.2026.11.27.10.03.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 10:03:16 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A773460CC6;
	Fri, 27 Nov 2026 18:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marliere.net;
	s=dkim; t=1795802594;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=rD90LW/g1uRft8V8loea8ddnC8E+29zzF3dbDqD0xKk=;
	b=MGtSOfyM8oJW5jlLXp7eOcqbLPbtiuEIRY0w2wqGyeaeznIxFEc3QplzfjVgF+EaR4EuLZ
	eIRS1n+BVPs8QTopjoGtJBLsEVGyaAyYuNplo4hcE9wKP2/QC16lzPkLaVOLZJMU8/Zb+k
	9S2OTfLhIHxLtTuMEbaTTujEYEWQblqbhJYt9My7w2GPGXKDAzAUH2RLwqag21nbjIO/M/
	0pR1eNpl/rarqA3NkklBShAipie9HkodgL6QGvrCJWPHySuBmR+Dt11Porm4/zXNzBlKBq
	v3YZYsfSMc7QnvB1OoLRg63p3Gyd1xEzK4bL06u4XzkFzjzJ+gZHHUl+V0MxWw==
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re_=28SUSE=29?= <ricardo@marliere.net>
Date: Fri, 27 Nov 2026 15:03:05 -0300
Subject: [PATCH] selftests/bpf: Drop conflicting DWARF choice from
 config.x86_64
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261127-selftests-bpf-config_dwarf-v1-1-46ef5b492f41@marliere.net>
X-B4-Tracking: v=1; b=H4sIANjFCWsC/yXMWwrCMBCF4a2UeTZoIrTqVkQkl0k6ommZiRco3
 buJPv6Hw7eAIBMKnLoFGF8kNOUaetOBH21OqCjUBrMzvdZmUIL3WFCKKDdH5accKV3D23JUAfc
 Hr49uCLaHCsyMkT4//Hz5tzzdDX1pYns4K6gc2+zHNk1MifL2YaUgw7p+AQgkhICeAAAA
X-Change-ID: 20261127-selftests-bpf-config_dwarf-de38c19b7da6
To: Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
 Eduard Zingerman <eddyz87@gmail.com>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Emil Tsalapatis <emil@etsalapatis.com>, 
 Ihor Solodrai <ihor.solodrai@linux.dev>, Shuah Khan <shuah@kernel.org>
Cc: bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re_=28SUSE=29?= <ricardo@marliere.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openssh-sha256; t=1795802589; l=1327;
 i=ricardo@marliere.net; h=from:subject:message-id;
 bh=8+DByMWjm7cAR3ST0nITHLU/9D//o+2zpqhJ2WzQCZ4=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QMneMjENWel3PSbA6CREt8noMWhcuLiVoPYrbs0oq5hnNm0VwORDPKzsIB7inPgbIaBZNvuzWbo
 OzKWv0PhzswA=
X-Developer-Key: i=ricardo@marliere.net; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g
X-Last-TLS-Session-Version: TLSv1.3

config sets CONFIG_DEBUG_INFO_DWARF4=y and config.x86_64 sets
CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y. Both are members of the same
"Debug information" choice, so on x86_64 the fragments contradict each
other and which one survives depends on the order they are merged.

Neither needs a specific DWARF version; CONFIG_DEBUG_INFO_BTF does not
depend on DWARF4. They only need any member other than DEBUG_INFO_NONE,
which the generic fragment already provides for every architecture.

Signed-off-by: Ricardo B. Marlière (SUSE) <ricardo@marliere.net>
---
 tools/testing/selftests/bpf/config.x86_64 | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/testing/selftests/bpf/config.x86_64 b/tools/testing/selftests/bpf/config.x86_64
index 523e0d29bbd4..a6e9766b6b7e 100644
--- a/tools/testing/selftests/bpf/config.x86_64
+++ b/tools/testing/selftests/bpf/config.x86_64
@@ -44,7 +44,6 @@ CONFIG_CRYPTO_SEQIV=y
 CONFIG_CRYPTO_XXHASH=y
 CONFIG_DCB=y
 CONFIG_DEBUG_ATOMIC_SLEEP=y
-CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
 CONFIG_DEBUG_MEMORY_INIT=y
 CONFIG_DEFAULT_FQ_CODEL=y
 CONFIG_DEFAULT_RENO=y

---
base-commit: 9437ee8b6cf607e883b36e44bd755968daaebd48
change-id: 20261127-selftests-bpf-config_dwarf-de38c19b7da6

Best regards,
--  
Ricardo B. Marlière (SUSE) <ricardo@marliere.net>

