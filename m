Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792709080;
	b=qYJLyYIn2EDIay8XjmoiWQchViN5tjReZflrkF5YjCA4jK/kwU68LuyFw6QcoNwSRsaR
	 4abC5R64x3Mg50NU5YIGiJ+XrvLGT4GNL0bh6gmJZCsKSkLljMeyk4HFUY6939tvvs5Zb
	 Q5vtUgkWg2R8QHLUyo65ED4x9gm4m4Y+U9YPXQXYfiqTMH8Rz7MNJTUOJ9RNBq2xVbLal
	 hM32jzbyWL0nGAqThO5WAcmGenN65ss7b6/CXVh7g2RTx8DYwS1NEYVYHpp/RUs9Ll0gs
	 7xRNY6VDgGPz5CSZ1OtuP6Ol1wiP0V1C76hnz9pWPKD9kWLyyE9Rl3hlkJd/lBX0eJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792709080;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=WaR5sww3EdstGojqnpbDRs5qtuJp8C5vVRJRCE8Xo6U=;
	b=W2LsRklAFrq360AniHwyXnuLJIxQqNpXPjJPQ+V1Th6i1eWGorplBxaX4AUrvstvbg56
	 whRPWo4i8wbJS5ZOSbcCAyLtpREqOyrT9Ep5E8gKSQlUJvY+YwZ9pbKaohjny/QceHQax
	 0YytO57yCtL/KyF6azdCt61goa650v+oEl4ekSCjob+ox+WCeR+1qwnhdU3Zt9IHGPPPN
	 pnA393VCeXTiqmO3gK9j2VELUThRjiQvI8hxynAfdeepmHNzQI9nwpTPtMuydw1k2ngKp
	 31ibCQx6R2HwqrnxOsadgRC9weOBw12MkPL34kmtongw+hFrgqmCWYiAau6jw6CX7ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=tIYFGTAg;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FBA8606A339
	for <linux-kselftest@vger.kernel.org>; Thu, 22 Oct 2026 22:44:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FBA8606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=tIYFGTAg
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3ada8bc2380so136188a91.3
        for <linux-kselftest@vger.kernel.org>; Thu, 22 Oct 2026 15:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792709079; x=1793313879; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WaR5sww3EdstGojqnpbDRs5qtuJp8C5vVRJRCE8Xo6U=;
        b=tIYFGTAgPjNmIHVHpzpmsvyQ+qAMZvm5eG2GjYs4khb9zIV0fb+v8BwTiS/lo7Mime
         +x66I26Uu9aO0Mpv5VZyMAE2JV1U/1mduP8ejsTqTcrwrbaCWrUyjnajCaC4f07FQaoQ
         y20GTHFtlUmgOU1npmb2HzYOUd2S/U9YfAN0HozRaIYz3KR0qlAuSGTC4I98gyELiTET
         vV1w5X7G1reBLSOms45zLtj0vOG4OZhPA6c7JP6qGL2I8nbjhkknKNL1+dttX9oTO9Mr
         ymKW8CZNV7rpSBmplsM+lQNboKOwfXiA8cb0dXncggyfy/sMElWJZFv80uYI62Qkkk1F
         H8nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792709079; x=1793313879;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WaR5sww3EdstGojqnpbDRs5qtuJp8C5vVRJRCE8Xo6U=;
        b=tOiDQac5wwpetR/9Lqz01FLdeChMjQSvjQ3RviN87Da49NvJTXj4zA7zOkvU2cz28w
         QvA4R7Gi/l/WToUzFs1p+dUi9Xjk83vHdk/QMuxoj2I4Ji54STL3WnIetcRi5KYzsS/K
         McVC8N7UWIdDi4cTwe3wnoLjQmzrHWTa8VQsmQgBesd/5vRjF7dELOhLpiD4qSul0RLQ
         9hp+7+jJpvc+cfcEp35Ym4PF+c8CJrI4MWeiDhF2wu4zoGFVVUVuCVE/XobBri5kNbTO
         7IUsYyO7zsirT4kdYncx97YU8Jiv7cj1zNE84Gy5h89y3mpxbRdYxR1+rP3E+DQQzVw/
         ck3A==
X-Forwarded-Encrypted: i=1; AKwUvByFjUGFhu+zoM9ShrrEQZbxky3WMKI4HvG7gffUINDZTsMpCSEOnuUKM+kWP1jEREzbkpQZLMX8TV+ijD23c7A=@vger.kernel.org
X-Gm-Message-State: AFq9FYIME0zIIUGAYzdags7dVLX8560HxXpmexRcLC8P3KACaDEcrrgr
	E1penZodKarSlstEywqPzXlGNfyw0pDzGmPoj7tAvP7JzwtRIdHfpY1+
X-Gm-Gg: AYBFou33IZGs8n/36Mpg+N60UNwIDjs7saghzVuT7dWgaTNZ4fjISdipTLd3KfWVb4g
	PlMJZTr1rbJueqgefr86GfDNMzZ+URgCCrVFvNAipNG3MbCaQw/wQ6JsF9kOffO1Ao64NKeuCCw
	+gNhPMTJI5Y6/4Sf/ts9Ewqy2Nzy/w5Mcit+0qI0+XL+0yOksLBJ+PKRfFbfy4R23NK5UXTgYrF
	bM8vjjotlAu/K7ZKNC548BFBojCqvx6syTogaB+Yx0wIUZOnamfnBfTcpQlc9d2pLnWib6kpcGs
	Xc2s8XW6ZI+ixeeQ+/prTCdA3wyZct/bBc1hc+B9UQq69BMCEae0yy38FIXJGlx5+ME9gw5ILsH
	3PBP81yFyC2xJCOlQJlmV1Ose2Pq2Jht1zFij67M0SuyozuKA7eeIBDaIIhw5OjXkZ5/QwULD8J
	mcEF4yo2rhNIRkEwFY1mRwpm/p4PLeHW2KXXZ44Vt0ASgZxgCbfl+WQaBkEnTX06LIzKjE/yDzL
	/VQ2/75ldwtEpeAZb87dWdg2zRm3kok6AUclgtvqEw24STwFgSxtA==
X-Received: by 2002:a17:90b:2e86:b0:3ac:9706:7735 with SMTP id 98e67ed59e1d1-3adce0d0ca8mr270746a91.5.1792709078853;
        Thu, 22 Oct 2026 15:44:38 -0700 (PDT)
Received: from kir-tp1.lan ([67.185.120.12])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ba8e6678sm192717a12.30.2026.10.22.15.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 15:44:38 -0700 (PDT)
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
Subject: [PATCH 2/4] checkpatch: don't warn about ENOSYS in userspace code
Date: Thu, 22 Oct 2026 15:44:21 -0700
Message-ID: <20261022224426.2756960-3-kolyshkin@gmail.com>
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

The ENOSYS check enforces a kernel ABI rule: the kernel must only return
-ENOSYS for an invalid syscall number. It makes no sense for userspace
code under tools/, where ENOSYS is a regular "Function not implemented"
error, and checking for errno == ENOSYS is the standard way to detect
that a syscall is not available (e.g. to skip a selftest on an older
kernel). There, the warning is always a false positive.

Use the existing is_userspace() helper to skip the check for such files.

Signed-off-by: Kir Kolyshkin <kolyshkin@gmail.com>
---
 scripts/checkpatch.pl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 8f9a46d809ae..a97d5748878b 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -4985,7 +4985,7 @@ sub process {
 # ENOSYS means "bad syscall nr" and nothing else.  This will have a small
 # number of false positives, but assembly files are not checked, so at
 # least the arch entry code will not trigger this warning.
-		if ($line =~ /\bENOSYS\b/) {
+		if ($line =~ /\bENOSYS\b/ && !is_userspace($realfile)) {
 			WARN("ENOSYS",
 			     "ENOSYS means 'invalid syscall nr' and nothing else\n" . $herecurr);
 		}
-- 
2.56.0

