Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57EA63C6A49
	for <linux-kselftest@vger.kernel.org>; Fri,  3 Apr 2026 14:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775228383; cv=none; b=OvuvnDbB8jyEo7KibZ0DDC1p74yeWU53uK30VshmtA0LrsJfxNPlYQ2bGu9MKz0lWQGr1LYKijDDZFcR8yXQMrqX8/UUhTjZT4x7/LjN9vkg4WtIoE2323YRdBi6zU/TAOdTCAxGaORIALghsx04Qx/aYxs+LKStE5X25nw2jRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775228383; c=relaxed/simple;
	bh=2f5aVKepAPVQ6QAMkIjSa6F59NytLhs5Yj9FO1U5vIg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Lt98pStB6JiIiNelm/kFiVwQwujJjdEI0SgbRft5PqEddFZYGR7tVpLZTbKIot1BpZrTl2lt0KLB9vsJizXOhDgAnG80ymXOJtEBik8ldiRPa5Hy7W37zckc/q8ImXKG3isWM95Hqsde4pV9VdPq+d3+hX4ZnVzMKAVyaMgkE+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=M44yLjcd; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="M44yLjcd"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-487012ce896so11021455e9.0
        for <linux-kselftest@vger.kernel.org>; Fri, 03 Apr 2026 07:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775228381; x=1775833181; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GKDIAWuRtDFHvkwbDQCWFyTrBdJA4yobh9R3wJFKPAY=;
        b=M44yLjcd4xdUMfEvK38gBToCy6MKax+3a48F6Kf7Zlai1fONTSxypNlO/fUayY4Teb
         E3i9nL6KBT9zun8weHYKM0pRnrNEUHR2BPn39fHv622qjhtrGdk7gxjnTACJVbwvS4iE
         IjxO1B40+YcBi81fUmo3RPG1xDld4/6rQQMceeBKLzLQfxmNeXkTSl84hsJsAEL+ISCE
         nj97LziWU0pevU/WWOCk2/JMMsnqhb70pJFlTCfEx4WYH0cLfDC1O1+wOIqsxLal9Oy1
         f2EPVcIuJGXQupoGVtyefbdsfdAqCXinL9oub9YDmMy/I2KiISwmaCt7mhkM4Y32kuSE
         7a1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775228381; x=1775833181;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GKDIAWuRtDFHvkwbDQCWFyTrBdJA4yobh9R3wJFKPAY=;
        b=l6M2mvQdn3gaRil5JuumHuTLQf9JpXQVBkxCrY7e969HEgvWERtPTgq8jZSYpNz/lM
         nhKRox9o0YIM/EEpJMNofoEo3XaxQ2VagvLO7UgCJTA8Zqt+MRBgXOMJ9JVIQ8HPH8ja
         2B8ptz2FKO0DbpP5TdauQDbNAQUyr2lVfY5qTmK7nXpUws7dF/pMYU+fCchVYN0o9YAP
         lEcsNp+6jVL//BxnLDfjrtS3vA8kvbLC0SprlYMBcFO7EMeBU40jIIj/EYf/4lkIYKsW
         eaWUb1sk3CtYlJPyxqKleIzhJQ+8NeXvAXr0+wd7UX0r4NfPd2AiJ1LEAFV79A1Aauu7
         YvoA==
X-Forwarded-Encrypted: i=1; AJvYcCUqn2d2W2rga+KesvhnJrVbOER7H9B/eXGqmaw9u7wtOPDi+82Yt1KZy0Gpfj5anud9iwC3YbodMC8BfkwPuoY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6L42rIn+gB2GwQVOOyTvkOYLS/BQZgcfyZImRR+/0ZiRGcYnL
	c8uZcCmmV3sMHFYrORqiAd4y8Lt/G+RCFrNteN5qHMythKQfGWUlraC+x3Dd9kOGMPk=
X-Gm-Gg: ATEYQzxUU2p999M7NGtLszChrj/hGZOJmVe2+pbRB4tqrjkYbZ07dvhtITsxIW/mkCj
	1NiXwRMBekg6SPQpkNo+290CrffUnNtfLDpj1xF4cqukGd5N/jrPMv9l/zv1uVxuMTd6GJnDq/F
	VIFvP1qqyOUxDvyp0PDDpgbZCqgSYOGoC7qXGDhapthpmBBw9ouCqt2ss86/nR5VEvRnymhY5DQ
	OIDY1spWOjp3PHLrrWNX2Pl70BX3jDCWX0CedW8/nOJ/M2bfdije1wCOLGlNJwI5tl3d7W5WXax
	luQwqBQAoM/OYIdq0U/qA8iI3wooZdNVTgr+pnKnMT5ifzJevRkYT2dKX0vb7nCDuIxR2Kuh8SO
	RtFeuim1Q/9HdL4PaDAeKl1Ktmwi507zWjN2d/ilXj1EiaD1IVqwpQef1TVq9+FUIfpXffp8X7T
	As+0JoVDcr
X-Received: by 2002:a05:600c:6092:b0:487:288:1199 with SMTP id 5b1f17b1804b1-488997dfb41mr60010355e9.28.1775228380694;
        Fri, 03 Apr 2026 07:59:40 -0700 (PDT)
Received: from localhost ([189.99.238.3])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d9bc9cbbasm7312493e0c.9.2026.04.03.07.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 07:59:39 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Fri, 03 Apr 2026 11:59:02 -0300
Subject: [PATCH v2 09/10] selftests/bpf: Skip tests whose objects were not
 built
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260403-selftests-bpf_misconfig-v2-9-f06700380a9d@suse.com>
References: <20260403-selftests-bpf_misconfig-v2-0-f06700380a9d@suse.com>
In-Reply-To: <20260403-selftests-bpf_misconfig-v2-0-f06700380a9d@suse.com>
To: Andrii Nakryiko <andrii@kernel.org>, 
 Eduard Zingerman <eddyz87@gmail.com>, Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, 
 Martin KaFai Lau <martin.lau@linux.dev>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Shuah Khan <shuah@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openssh-sha256; t=1775228344; l=1739;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=2f5aVKepAPVQ6QAMkIjSa6F59NytLhs5Yj9FO1U5vIg=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QAv+Ss+JdaUOsPfoNWBRS+cKg3MWINgTH7ahWzB/w2k2cSu+EqYkRVlvI0zjzESS22puaq6LMRH
 B1yX8kJ5QIQ0=
X-Developer-Key: i=rbm@suse.com; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g

When Kconfig options or missing headers cause a .test.o not to be compiled,
the corresponding prog_test_def entry in tests.h has NULL for both run_test
and run_serial_test. The existing infrastructure check treats this case as
a fatal coding error and calls exit().

Separate the two failure modes: having both function pointers non-NULL is a
genuine coding error and remains fatal. Having both NULL means the test
object was intentionally omitted from the build; mark it should_run=false
and continue so that the remaining tests are unaffected.

Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
---
 tools/testing/selftests/bpf/test_progs.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/bpf/test_progs.c b/tools/testing/selftests/bpf/test_progs.c
index 0929f4a7bda4..85ac25a51a8d 100644
--- a/tools/testing/selftests/bpf/test_progs.c
+++ b/tools/testing/selftests/bpf/test_progs.c
@@ -2022,12 +2022,15 @@ int main(int argc, char **argv)
 		test->should_run = should_run(&env.test_selector,
 					      test->test_num, test->test_name);
 
-		if ((test->run_test == NULL && test->run_serial_test == NULL) ||
-		    (test->run_test != NULL && test->run_serial_test != NULL)) {
+		if (test->run_test && test->run_serial_test) {
 			fprintf(stderr, "Test %d:%s must have either test_%s() or serial_test_%sl() defined.\n",
 				test->test_num, test->test_name, test->test_name, test->test_name);
 			exit(EXIT_ERR_SETUP_INFRA);
 		}
+		if (!test->run_test && !test->run_serial_test) {
+			test->should_run = false;
+			continue;
+		}
 		if (test->should_run)
 			test->should_tmon = should_tmon(&env.tmon_selector, test->test_name);
 	}

-- 
2.53.0

