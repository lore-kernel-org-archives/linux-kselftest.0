Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B66E23F40D
	for <linux-kselftest@vger.kernel.org>; Fri,  7 Aug 2026 00:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786063451; cv=none; b=DcPOyCYWKqdDMEVy5E90e3ZB3TjLCllC/R02hRqhdLtXCl+4xRTCZAJyaj7kAd8fRs2NZ0aeaRex6M854EVogPBkIz9x8KeNXYIfwD+E9nxB2uWpKymGjzecBjqW06ndrJvxhHG2IgtDleWztrIDiXW7GlQpRlRkiTZx+lWxbEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786063451; c=relaxed/simple;
	bh=snB2L+HUQbNtyGefpQxRnMwzaVPncrebZ/vfvOKEgVw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=siJMkpDtbP42czV9hOlZlmEnxSBF/kjHDzU4A6ckAt4tNVM6dbSwXwCPzePQesPzAWGip25sNcS7pzD+zkQUenrvf2+EArqVTmguHDJ8R4+XVnzOqTCSrKnp+kuSxte29QJps6s8QwEm9U9d1VZWdxX0uXUSFHio6iswimWkwEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fJZQ9qLX; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fJZQ9qLX"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-84f38f3b36eso1953812b3a.1
        for <linux-kselftest@vger.kernel.org>; Thu, 06 Aug 2026 17:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786063449; x=1786668249; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N+RlxWYLHhvfrSCgOSfrmuFljr7W39DgQCccVhG1vok=;
        b=fJZQ9qLX41CLD3533CSdQJNB4Jmgiv9t9CMYKG4vT8HfbVpZudXN4yHsnFE/Nymrua
         2bIzXHM29oqUZk2NzVl0sX9xZUbAt1w2tCvSS/vLY+548DO6VWJLas53+4RTYe3xhfVO
         SHGPjo3TG+RziJ5q1mT5a9PT8YroOeEBkQA+pxFpdz6LcDEl7sTUmDQAw85uG3fze+Ts
         rUDba0DVCklJ3TvhMPLsn90Yz87oONovHhqgivPIQMDCNhSmQoCDDDEmWfkE3rK2s5Hp
         d2F/WAKKbLbHlFf8dKfeYbhYR8hkwFoASbjxB48r/PqVttRh1nEQSZanEBSKjmQ6p5YX
         448A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786063450; x=1786668250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=N+RlxWYLHhvfrSCgOSfrmuFljr7W39DgQCccVhG1vok=;
        b=OJ+RekfeZSzEhIZ6hQgQW12zOE5WEGFxHaSk6J812o1WFqiwYXkbBmvt357mhZV45V
         bQhMlA1snBplbL8CHEpDEMO/jmnWHMEvrnRjc9BSpVvibNyqSxbShzHTdThDX8b5Huxp
         48snQ2ieR9DeN4b3mXQErcWuhXYESUQTLbKjzjyPM7aP6HfUomZ5r1FyCLSjLiK/82Jp
         IjgICYWHZc4s07+HWyyMH+EHrKTR04MQDFNq23vFu1PC09DEgBv15gNIhG9rbzqnfNTD
         6oUTo8SwBZY4zWFvHFmy0OesBZZT3iVWEUreb1d2FhwgwWNSgiJpfvVZrb+CbayRAACQ
         +oVA==
X-Forwarded-Encrypted: i=1; AHgh+Ro4wXrEYHWavnR/3SjROv6Rs+k+APOP0ihQtrxlZcGeu9+3KY30cScFtjgTQqe+dqwer0apXBXCqgN2XrbaLz0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNlayuVdtbEF2g3UH4dfovto6cp3gkwuz2XIva4jR6j6Hpra9t
	YiRgYukS898SwKg8aAT0myPGDV6OmQZVKpuLq/HOXWctAB4XnsCedJhJ
X-Gm-Gg: AR+sD12XQkU4eBYPL2h48VGlphlD1YH3DzY6vHLlwUe8H9dOsYw7TwT1ewrJVNrRJw9
	n9n6pmxNG0H9+H578qynyTqtqChX5Fp7bw010bu+WkGD7Hxjj8XZRdhLGuz3Uuvjcibe2OmsW6t
	XKx3dBJkF/T/5qvq0XUin5DLn/y2C6kvtJtPFyh9s/jkxihCF8Y1cIiTpxN69VSbiqYMMHJRgqN
	Fz5dbHKiUYGVcs6WNssmUr5arXA2N1PYlDd1rEcE+99nfgqs5i5lx1W0aneDnHsbZ/iIzEQ52SN
	SsN9SCGhBmMe8XpIOPDtsOmb89paU5BbbyS2dQ+SwDBfQ/57zjfWpPPhyrgFsoDPOlB1Pa2uISL
	rSww7bdqVhRDg+NacE5RkC09tnMXZcBKuX/W0WvPUYwR0YRR9ak5ORY4Hzqak2S03D6CzRCkSCe
	z/JvujqhNaibClxzllxltiUGAH/9OtMb9cvANwAM1uNG2AblTW18FT3qVwD2FKDKh5mutaeR8yd
	YIHezhqaBy3VGUs
X-Received: by 2002:a05:6a00:23cc:b0:847:c014:864e with SMTP id d2e1a72fcca58-84f4febeb98mr5766759b3a.30.1786063449596;
        Thu, 06 Aug 2026 17:44:09 -0700 (PDT)
Received: from patterson.cs.ubc.ca (patterson.cs.ubc.ca. [198.162.52.65])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f5a552859sm172922b3a.42.2026.08.06.17.44.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 17:44:09 -0700 (PDT)
From: Ning Ding <dingning04@gmail.com>
To: bpf@vger.kernel.org
Cc: memxor@gmail.com,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	shuah@kernel.org,
	Ning Ding <dingning04@gmail.com>
Subject: [PATCH bpf-next 1/2] bpf: Compare iterator types during state pruning
Date: Thu,  6 Aug 2026 17:43:19 -0700
Message-ID: <20260807004320.134069-2-dingning04@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260807004320.134069-1-dingning04@gmail.com>
References: <20260807004320.134069-1-dingning04@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

An iterator stack slot can be MEM_RCU or PTR_UNTRUSTED. These states
must not be equal, or the verifier can prune an unsafe path.

Compare the pointer type for STACK_ITER slots.

Fixes: dfab99df147b ("bpf: teach the verifier to enforce css_iter and task_iter in RCU CS")
Signed-off-by: Ning Ding <dingning04@gmail.com>
---
 kernel/bpf/states.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/kernel/bpf/states.c b/kernel/bpf/states.c
index ea2153cf28d0a..4e6aafad33bd2 100644
--- a/kernel/bpf/states.c
+++ b/kernel/bpf/states.c
@@ -812,7 +812,8 @@ static bool stacksafe(struct bpf_verifier_env *env, struct bpf_func_state *old,
 			 * infinite loop check triggering, see
 			 * iter_active_depths_differ()
 			 */
-			if (old_reg->iter.btf != cur_reg->iter.btf ||
+			if (old_reg->type != cur_reg->type ||
+			    old_reg->iter.btf != cur_reg->iter.btf ||
 			    old_reg->iter.btf_id != cur_reg->iter.btf_id ||
 			    old_reg->iter.state != cur_reg->iter.state ||
 			    /* ignore {old_reg,cur_reg}->iter.depth, see above */
-- 
2.43.0

