Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C624D309F1B
	for <linux-kselftest@vger.kernel.org>; Wed,  1 Apr 2026 14:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775053888; cv=none; b=mYSxb3ysUKCIQAws8MsLCfOznX/6VVAsXsZjf3YK4RD5DvbPv71hm97kTsH6fFM4DiVSuMFH1F4jeBtYjiyVLrmn0wji0X/7KOcIbkf3cylGADvW5fD16jfeyK6LrR45EPRCuHXZz+oS6ETirn2mFOOyDbixoKCfChJsUPh01JY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775053888; c=relaxed/simple;
	bh=8T68ciFzv9ByAxgjyQbrWL6zyFvUylJ8zF5UcucRsJg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WQi1fi/VSot+y3qQNeQe4pJOHXI/T9BY/upoZq83JAyvSXnfY1g0iorh5RMIyLJGmnfOCVib4sf91ONwG2+1CUqqjKX/bIg0p0QjxRX3Z8nEEdIXgnokIobQkNuow1dPiWKrvXpvJin18nkPkZE/QWkHoakv+q64S4Tp6tVnTNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=NyAEPi7k; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="NyAEPi7k"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b982b0889d8so852119966b.2
        for <linux-kselftest@vger.kernel.org>; Wed, 01 Apr 2026 07:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775053885; x=1775658685; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3kk0t0a+MKlgW0hq41owgJBjPy6XE8mL2ApTeI5SbiM=;
        b=NyAEPi7koFJ+0CM+TEGQtashimklFhPnd5Qwf+tnZ1AmWiahXInDZFGMvReMjV2+ej
         PZDwnk1H8guZt3Q744zEye68uELkXQhVcbD4l6gcrcxXpQ+wKJiZePQKUmQPq2g80LwY
         vWbCLrxyTmAYkKQYagLBO6XDnYyDbviPU0wBOdEV4jEVelAXVG4AEOZ6VdVPuIltRenO
         EPBODQVA83f6ivKUX3eBlMh9OgG9yVGUULOGlQ42N8Ttn14R9ZzK6Wt9i5NYH2cRVbyw
         13hYmOf7XEgU2UHWCj8LIj8kmTF5aSa4z8ZUfWcjGDVZjJN28I59JQTkcoEKIWP4cD2N
         RI8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775053885; x=1775658685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3kk0t0a+MKlgW0hq41owgJBjPy6XE8mL2ApTeI5SbiM=;
        b=I2HruOXRMyykx5/rB62lHNVZHWw+46u3AWeQCuJdtvQzeWw6EcVKrni4gJ30Sxnapp
         jzk1pm994QzcMliV1SD9sZ9nJAu2fMLGE+zVnjcNZxMW1jIUP2jbgeKR64jDWnT8azLL
         DI1UAFAI0H8hyknfq/Ho/Nve2x1CRKQrhnucq5N3CZRT12aK3L0T5OhLlDO/ewvqx0ZQ
         vb6fnip1b+SGb37j+Gt93RnqyqxEVQlh4Q90wBdIt8SELtjRyLw4x5HGUvAHNw8cIlb4
         ByhsA74VWut/qZXRr09ABp0LXBCD5b1KNkNXOVU/VKxk5SPOVnPrmJsbPjGkkmyjHTOy
         /Z8A==
X-Forwarded-Encrypted: i=1; AJvYcCXDjwywEVYsLvx7nENTyywrUgXgkoA6ntenc8a3yocQx9fSPWRsZKpfaBEL7x09GhMjCqE/7bBAZq9gYEL32ws=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHWrgzHbRpssbOY0j/tB19YQhNHSnCAuCYrxbUgJFTjmSGkeRO
	K3UhXw+GxF3dNPx4ZoYbQHuVPfMPRhLx7zNqalNcE30f47aR69yhQcHFhVI1d6up/9Q=
X-Gm-Gg: ATEYQzzPIrzfsK8Gcz9C3YbLLkHvBiGGHf/GzJ+apn9RRxo2I23AkvJyIcC36yPssCH
	5hapaNWPLa8sk61RAM9rd4YJrBTOKwpk38l8xGy6++DxFSwTWMfCPZdzz6sENsBUmcdO8RRu+bm
	w2tI3rYOoEEMCPnJzbJ7a3AWZP3lDMLOgu++gQV/wgH0N1ZXG1puX/X1wTma/FuSoi7FlfSzEEe
	7ulm4gNLuEd/yVyrHzoxk8yPzlmDH9ml4pinajVmYR8QyewHuqERaoESzpB40vUh2nDIonSl4rt
	tu5pUImVQ8HdL0hN5onA8uNdDcTj3WVX8zQyDjXBshJtenq/mcJSMdgpjJBg/X9gChJXcgTXdJQ
	lxSq4soawMz3WCPaF6rX/u9DAZvWFfIflxTaEf/O0JbLV5n88wLkDl7mPU8BnEWgZd3T01g1Bv9
	8WwseQhehQkVpwXlqMOBa1v9weQZQB5bw6MLNaxNz14J+06j3Gt7BAO+ArGZGYGA==
X-Received: by 2002:a17:906:4709:b0:b98:6a8f:7916 with SMTP id a640c23a62f3a-b9c1390270bmr211946166b.15.1775053885105;
        Wed, 01 Apr 2026 07:31:25 -0700 (PDT)
Received: from f16.localdomain ([121.167.230.140])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2427658e4sm199047295ad.48.2026.04.01.07.31.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 07:31:24 -0700 (PDT)
From: Hoyeon Lee <hoyeon.lee@suse.com>
To: bpf@vger.kernel.org,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>
Cc: Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Feng Yang <yangfeng@kylinos.cn>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH bpf-next v7 1/3] libbpf: use direct error codes for kprobe/uprobe attach
Date: Wed,  1 Apr 2026 23:29:29 +0900
Message-ID: <20260401143116.185049-2-hoyeon.lee@suse.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260401143116.185049-1-hoyeon.lee@suse.com>
References: <20260401143116.185049-1-hoyeon.lee@suse.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

perf_event_open_probe() and perf_event_{k,u}probe_open_legacy() helpers
are returning negative error codes directly on failure. This commit
changes bpf_program__attach_{k,u}probe_opts() to use those return
values directly instead of re-reading possibly changed errno.

Signed-off-by: Hoyeon Lee <hoyeon.lee@suse.com>
Acked-by: Jiri Olsa <jolsa@kernel.org>
---
 tools/lib/bpf/libbpf.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/lib/bpf/libbpf.c b/tools/lib/bpf/libbpf.c
index 9ea41f40dc82..536c19c14d21 100644
--- a/tools/lib/bpf/libbpf.c
+++ b/tools/lib/bpf/libbpf.c
@@ -11835,7 +11835,7 @@ bpf_program__attach_kprobe_opts(const struct bpf_program *prog,
 						    offset, -1 /* pid */);
 	}
 	if (pfd < 0) {
-		err = -errno;
+		err = pfd;
 		pr_warn("prog '%s': failed to create %s '%s+0x%zx' perf event: %s\n",
 			prog->name, retprobe ? "kretprobe" : "kprobe",
 			func_name, offset,
@@ -12825,7 +12825,7 @@ bpf_program__attach_uprobe_opts(const struct bpf_program *prog, pid_t pid,
 						    binary_path, func_offset, pid);
 	}
 	if (pfd < 0) {
-		err = -errno;
+		err = pfd;
 		pr_warn("prog '%s': failed to create %s '%s:0x%zx' perf event: %s\n",
 			prog->name, retprobe ? "uretprobe" : "uprobe",
 			binary_path, func_offset,
-- 
2.52.0

