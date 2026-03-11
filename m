Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1094C35AC2D
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Mar 2026 21:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773264689; cv=none; b=DD1ZyAgT/GmDQLAyvvaAXDGGrY1uo0xOn7NT6twkC/FmLC8badRX+JSOeBpAsiRTn8f8JYMKIQr1HnwZAOlIpsrxadjL6mROEDOWenzfI+4LJsTvwB4lGcNHLoykH4zP1gSYxvNvRV4QLusRAIRO4G9z+kxlpQAHEbam/PEoPJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773264689; c=relaxed/simple;
	bh=eQt62HsmlTFVTH5oNb/cY4ErhLI9UlUZljEQgShBvag=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CUdAqNR4zn+IxLHSThkPQzYqU8ZHtqiCylsG02/Is73zlSbcZHmzW0zruD5+2xmJaUbjEwjS3Bkii6xFKJJfvYuia11fgJhwonGM6CJBKbJ/2uejjU0KkPekmDbXTUee9UsP22XAK9es4DlAlP2wTvoaf3OWEHSfR+OpllMEDPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=QoL5RXaA; arc=none smtp.client-ip=209.85.161.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="QoL5RXaA"
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-67bb5e4cf5aso235347eaf.2
        for <linux-kselftest@vger.kernel.org>; Wed, 11 Mar 2026 14:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1773264687; x=1773869487; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2qDl6PloJMJcPj6HCRptSktfhbQmRESXzBgsnYOGnNs=;
        b=QoL5RXaAdisyAHfVSsrxB0gT4OfRwZyl3Oz1RLYShW58vlpfOOQKGdrhsNazgz6yp0
         u4/y5EYb09Hckje8Plwul/howQ9l06JVTPtjwumj+IycDnF/RQqb7bVr+hlP/psLCer+
         HEXngnEyiMF7QfWvZDnxUNz7mPiUyuKeUMq3cNyjUC4ltzS9KPybVViL3VVvx4WZkEHb
         +NRs5lNQ3QhGUJnQ5iHYwky/8/jcrXy6D2Ys19erbLTftAOFfIpRapNXNkBPGnYmJ0Lj
         p9v/mrnwj06PUrb7DTrg8pqQfAHIMk5KIsYvxy0N/yA2SjM3Wzkh6OiJbJuPm4FO88RS
         EIeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773264687; x=1773869487;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2qDl6PloJMJcPj6HCRptSktfhbQmRESXzBgsnYOGnNs=;
        b=iiWXPNzK4wPs80EVOQk6SFdbogzrxL5L0Ts60ExFQFy7ETc8Xpu0kQfTiVHed6ZjHi
         OkGHaRaMA0hcLVIBkl8GJHTVDAFc8fq4qjMo8GZ50wv3b9YpWA3Q3e7mynMh8S9i80L7
         2kpOVsMRla3ONkwegIQj8rg9SE/A8KpbiccYuEfH03wd8zHD6CE9nq7ev9//VG6EkNCg
         QI03UvIo90deZDGGISwECEsWO7Uh2l2T3jPSUISV9s8FoUd3VQ2GTVJbn1tMPZV1ddNo
         PmtANWVKrpVqlvZoIG8GZFTFUaFfGYduYNXipJNyAbc9VNPdm+V3PFoWLzhScQtB0XQv
         VE3A==
X-Forwarded-Encrypted: i=1; AJvYcCU2+/zI8eGx6c6Ln59rlYmlNsoh8sPvVEcsOx7L4lAn+BxuFEFK9yAO9hVf4K8R9vdhknBzvH1x4cpa7Eg8vCE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwfQqmaRet9HtL9QXY2Tdvg8MrS+j77gDkl2iZoxMYFb3wwTD7S
	q4tpJntB+H+doaWZbc9mb/nEE41iOt+2k/RLYIkGJJqNpLa66h1Ltu8JhoWS3qivcGM=
X-Gm-Gg: ATEYQzwTIbfOctLtgdfB7B9seG5+TderV0EzJFTFkz8LzyTfJSzB3U76ynankOSZA8F
	Rjk5ti3vfMs826CXFMO9jf5JeuhVlnluArbaQWPKV73F751JcoUBL1VV2llMJFbAEi+NzynGTM2
	BWDOjzsFed+mUpTBYdcWewJ7H0aEv2fj3rwiawS5YEtk1vHHU07QJ+1ggYc35Mt5g6p8oyWz9sw
	T9nWgXkeYcj4sRittBGbUdR+53W+aSg3ypIOqdKIxkCuiAvvy92iNyqvlLGbra7G1yPPcvAPkO8
	PfEbYfcqB5UriwTQmmKjCGOB0vedhNCa4y5yWIRnr7BFUpg94zMn+HF6nV8R+4YU+yqRP13W4ix
	DcaY2Ewj7yPptV9fN8G06k7ba3l9zlKvnTkvvjZwhS/H7sl2z9IopKBvXxx64WiGptG+9qdH26T
	ca1hpYuIo=
X-Received: by 2002:a05:6820:151b:b0:67a:4b7:e2f2 with SMTP id 006d021491bc7-67bc887c20bmr2621254eaf.13.1773264686966;
        Wed, 11 Mar 2026 14:31:26 -0700 (PDT)
Received: from [127.0.1.1] ([2a09:bac5:947d:4e6::7d:82])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4177e1fb90csm3530413fac.4.2026.03.11.14.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 14:31:26 -0700 (PDT)
From: Frederick Lawler <fred@cloudflare.com>
Date: Wed, 11 Mar 2026 16:31:18 -0500
Subject: [PATCH RFC bpf-next 2/4] audit/security: Enable audit BPF kfuncs
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-bpf-auditd-send-message-v1-2-10a62db5c92f@cloudflare.com>
References: <20260311-bpf-auditd-send-message-v1-0-10a62db5c92f@cloudflare.com>
In-Reply-To: <20260311-bpf-auditd-send-message-v1-0-10a62db5c92f@cloudflare.com>
To: Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
 "Serge E. Hallyn" <serge@hallyn.com>, Eric Paris <eparis@redhat.com>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Andrii Nakryiko <andrii@kernel.org>, 
 Martin KaFai Lau <martin.lau@linux.dev>, 
 Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, 
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, 
 Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
 Jiri Olsa <jolsa@kernel.org>, Shuah Khan <shuah@kernel.org>, 
 =?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack@google.com>
Cc: linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org, 
 audit@vger.kernel.org, bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 kernel-team@cloudflare.com, Frederick Lawler <fred@cloudflare.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=772; i=fred@cloudflare.com;
 h=from:subject:message-id; bh=eQt62HsmlTFVTH5oNb/cY4ErhLI9UlUZljEQgShBvag=;
 b=owEBbQKS/ZANAwAKAasltHYDktNtAcsmYgBpsd8nHtYAwDOKsh7v5Z8COhYgAMpZ89hrDGxJo
 dWCyvAjSb2JAjMEAAEKAB0WIQTLNBqMVmu1PHvjOe2rJbR2A5LTbQUCabHfJwAKCRCrJbR2A5LT
 bVIMEADWlLWYc1BGIY/Op7LIIQwz4iXlQTcEtGoZoMi8RyXxGWw3zQTzB54FBrz++KVJcff/T5P
 D2NypWH5O/5x03D6avJKCwmkpQ/4oCxLoUhRw4jIL9EPxIwVtfHte6/nVrUAl6V/3iKaWdXGxbz
 voxsyf56R0ell/5T0hzshR96qxaZ5JvwDJXq69Wz3fAdTV8SRlLrwOMRWyj2CjkoY32MTukvYlJ
 UzyGJy4U2GDhbqY8+4hK+M9JbG4Nz/1kF9RdYiX7Th3UgS3fA1j5Y/dqt3IQ7tG2pA/m2+mtKuE
 kqLMQOGyHc3nOzwsgD60OWiCP6rw4Y4xNrFBLWWc8IctP41VBK9tnYNPMvmOVh8cydjU5tIz4vZ
 UuK7lRarHPz5MoY0nhIGuqyroEA+hsIUGHwx2janCfXQAFHiA+xgDHSCqUKPHZ0tzBjxmMKjlR2
 YIliXWA5ByQNg7C4EgR0jYFb7WAGY62aedg6uFkCfZpMq9akxbkG9Ew4+LTvOp95sZUaUw9cUU7
 l0K8PROsBJnZV0rVrU1VMz0if153iuwIZ/KX6noYWB3VT41Osq8KBvXSFA3n6x01iqBVnVX0G/8
 p3P1EhGtNLutvXs+7C65fmVdPMM0/9PGXPpZ0I/qTwPQ88d0PsQww+WGkxInk71S9HkDNBFylCG
 61IrateNCqzPS0A==
X-Developer-Key: i=fred@cloudflare.com; a=openpgp;
 fpr=CB341A8C566BB53C7BE339EDAB25B4760392D36D

Enable audit BPF kfuncs.

Signed-off-by: Frederick Lawler <fred@cloudflare.com>
---
 security/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/security/Makefile b/security/Makefile
index 4601230ba442a1bcedc3f999b74a7796ac72894d..de980b2797c1f8f8d0eaeb1be949c41e6ecb8fc1 100644
--- a/security/Makefile
+++ b/security/Makefile
@@ -16,6 +16,8 @@ obj-$(CONFIG_SECURITYFS)		+= inode.o
 obj-$(CONFIG_SECURITY_SELINUX)		+= selinux/
 obj-$(CONFIG_SECURITY_SMACK)		+= smack/
 obj-$(CONFIG_HAS_SECURITY_AUDIT)	+= lsm_audit.o
+lsm_audit-y += lsm_audit.o
+lsm_audit-$(CONFIG_BPF_LSM)	+= lsm_audit_kfuncs.o
 obj-$(CONFIG_SECURITY_TOMOYO)		+= tomoyo/
 obj-$(CONFIG_SECURITY_APPARMOR)		+= apparmor/
 obj-$(CONFIG_SECURITY_YAMA)		+= yama/

-- 
2.43.0

