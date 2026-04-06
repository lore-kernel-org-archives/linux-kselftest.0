Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A42593947AC
	for <linux-kselftest@vger.kernel.org>; Mon,  6 Apr 2026 18:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775499766; cv=none; b=sq+JiZRWTPw/L1XhfM0AKUbFU7YwibR4K1m/A0UrOXRlb+2mh8HRwAix8ceuLBQrNHpMc3opvkGps8wbv7dzRVXUzHiMn+tTsKuf2MFXwBnm0K5OeG8JHYyJqMCtYokytVG6wBo/ujz6PUh4/OgB7Yo6hlToJHFOtxA/27vR6Jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775499766; c=relaxed/simple;
	bh=ucptwUIJtqhx8dsrJhSQ9C3w9ScuJ0w9Y+4aIdpjm+8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gG2aU0uu2T6QzO1cG/UO7gcgRhTmyiOcdDVXQDBO6Jyl0J2HzdkF29ROEARdNup/uej5GT9hPrkwIZu3G4r/8aa0hjKihYFkwacfbB+K6Uq2eNmOIQEBUm2MwQpQG6W1Jjz/7P84gmPBEFev71cnqgky0k2ngx/AHwXyltkrsHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=cQpMFB0T; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="cQpMFB0T"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4888244e9f9so39886605e9.0
        for <linux-kselftest@vger.kernel.org>; Mon, 06 Apr 2026 11:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775499762; x=1776104562; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VtaCX1T0hy3mWY06GsAlGBkN/yaFPOhiixn1CTjMhwc=;
        b=cQpMFB0TJaAYdE0Vuuouqw71yOWty9L79FfJlLrbrsEpDT5hp5epswGnBHphQHVZzE
         kfaCUlxYrasn2fVTr+E7CaFFc7TTItDA0n0lbWnraL4QUh6W36HIUg/SLx6A/bGWG6hg
         HCQFhzESdl9Oj6RnEgBWPhgxG+KbqKxM5syP00qvpkyNnGY0SSlF26VJV8HiFdV7fmKb
         4sw1vs1BolgFd3O/g4eXhd1qSrE9GhLKQOsyFeEa2wxDFfjDJK7ygYkOVB01tuoNzXzW
         wGH7fm0tXuYw4snRyGEQRzcFrBcUsF1/OPEq5y8W/emaq88hZMReZBUnVahnthC8FsEK
         usbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775499762; x=1776104562;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VtaCX1T0hy3mWY06GsAlGBkN/yaFPOhiixn1CTjMhwc=;
        b=VY5l8l/sjM64Yfd+rM3sAtg9GW5s3fTldOtwapqlGkWNrGirqospjMqSiIBEMkoSMg
         3gS+kZdh+5gJdWrJJ0V6sO+PL0C5p65uBPvTEJg+hSOZuXJCggNrdowbW4XKFlWcuMYD
         /TlJRDLteZzPb6meIanV7JfI0McI05Ycs2rMyfQNQmq6rHPk/iogs7R5uM47L3YCXWar
         8eA8Beb2k2JVAo4/0qi4umm4dZWxNbCQeXcoytM2YOmgnIBD9ppn0QqLpKhBS46d7TaB
         oCvgaGwyQDhyNge74scU8UNV3MuiYoiF/8ciHQ/XGA7rsgAwxSmILSWC4nssVuVmwy0m
         sLEQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvgViwe2v/A8QLEt2K1ZVJe9SRTZFrggkpIRm0qKir1+CAkjem35Xi7YZsBtUVelqT4mmwjumY3f6wLaZNN0s=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdsQQBn2/EM9uOkOcOLs0FWY53Bq1yMuDGtDOE/EZcGKy9Klkf
	23Wi82dT/iutXW7uXuQswdvAeZOo0XQLYcBnoNIFQ+nu3R82ln+QufLnINCPb3WZgTw=
X-Gm-Gg: AeBDieuTKCGEfqNEahFPVnAO4CnW7S4JMq7HbXBF+01RQIl6AJtKHGwQfIG/DmecHdf
	MOvyQHHp/Tjc7ONag4zuCaSSfK1I+cMYS9DG/2gDsR2gjeqvGTmIEA382CIXDqkP7iARnYeW8ui
	9H4of4MvimX7JdkR/bGUorIICcT0iHecXAKLnJDdDnDpyzZFBRcIQ3s63BdkWm7SzZeyR4HaZoL
	eBAsz502X0F18ZyD3GP9RD+OqlWgR1rEr0WHfgyFtfn5lzWVaEC/cSqL0oFgbi0qdjPyHk9qOJI
	q16Zce/u/5uM1JSxMNSfacybghYIY1oVlOyGmMASKdjyndtqk9f4lZDEwmyF55pzgs7pZrF6Kz3
	2n+3UfzEzPGRjadPkubI0+BVCu3vmKvwhPGjlWI6WwrWndzk4Dps01PF9bLEcb0L/sVs+EgUyvE
	UHsfvvJTl2ic/E
X-Received: by 2002:a05:600c:c8d:b0:486:ffa3:594 with SMTP id 5b1f17b1804b1-488997a6883mr187562235e9.23.1775499762028;
        Mon, 06 Apr 2026 11:22:42 -0700 (PDT)
Received: from localhost ([2804:7f0:b767:120d:a4df:3777:2c55:2b95])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d9bd2106csm17014057e0c.18.2026.04.06.11.22.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 11:22:41 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Mon, 06 Apr 2026 15:22:19 -0300
Subject: [PATCH v4 07/10] selftests/bpf: Tolerate benchmark build failures
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260406-selftests-bpf_misconfig-v4-7-9914f50efdf7@suse.com>
References: <20260406-selftests-bpf_misconfig-v4-0-9914f50efdf7@suse.com>
In-Reply-To: <20260406-selftests-bpf_misconfig-v4-0-9914f50efdf7@suse.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1775499736; l=1818;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=ucptwUIJtqhx8dsrJhSQ9C3w9ScuJ0w9Y+4aIdpjm+8=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QHRyc3p5anKKcI/W38lb5jswVJrWqewGR0lwA51VbpiHo5xK1mR7Q68dPAHEDbiBGKp3PiIOWQz
 8yGfmpM0cuwk=
X-Developer-Key: i=rbm@suse.com; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g

Benchmark objects depend on skeletons that may be missing when some BPF
programs fail to build. In that case, benchmark object compilation or final
bench linking should not abort the full selftests/bpf build.

Keep both steps non-fatal, emit SKIP-BENCH or SKIP-LINK, and remove failed
outputs so stale objects or binaries are not reused by later incremental
builds.

Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
---
 tools/testing/selftests/bpf/Makefile | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftests/bpf/Makefile
index a12bc9d76f8e..2b0747604d5f 100644
--- a/tools/testing/selftests/bpf/Makefile
+++ b/tools/testing/selftests/bpf/Makefile
@@ -875,7 +875,8 @@ $(OUTPUT)/test_cpp: test_cpp.cpp $(OUTPUT)/test_core_extern.skel.h $(BPFOBJ)
 # Benchmark runner
 $(OUTPUT)/bench_%.o: benchs/bench_%.c bench.h $(BPFOBJ)
 	$(call msg,CC,,$@)
-	$(Q)$(CC) $(CFLAGS) -O2 -c $(filter %.c,$^) $(LDLIBS) -o $@
+	$(Q)$(CC) $(CFLAGS) -O2 -c $(filter %.c,$^) $(LDLIBS) -o $@ || \
+		($(RM) $@; printf '  %-12s %s\n' 'SKIP-BENCH' '$(notdir $@)' 1>&2)
 $(OUTPUT)/bench_rename.o: $(OUTPUT)/test_overhead.skel.h
 $(OUTPUT)/bench_trigger.o: $(OUTPUT)/trigger_bench.skel.h
 $(OUTPUT)/bench_ringbufs.o: $(OUTPUT)/ringbuf_bench.skel.h \
@@ -918,7 +919,8 @@ $(OUTPUT)/bench: $(OUTPUT)/bench.o \
 		 $(OUTPUT)/usdt_2.o \
 		 #
 	$(call msg,BINARY,,$@)
-	$(Q)$(CC) $(CFLAGS) $(LDFLAGS) $(filter %.a %.o,$^) $(LDLIBS) -o $@
+	$(Q)$(CC) $(CFLAGS) $(LDFLAGS) $(filter %.a %.o,$(wildcard $^)) $(LDLIBS) -o $@ || \
+		($(RM) $@; printf '  %-12s %s\n' 'SKIP-LINK' '$(notdir $@) (some benchmarks may have been skipped)' 1>&2)
 
 # This works around GCC warning about snprintf truncating strings like:
 #

-- 
2.53.0

