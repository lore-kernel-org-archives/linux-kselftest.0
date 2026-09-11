Received: from mail-pj2-f7.google.com (mail-pj2-f7.google.com [74.125.227.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AA5C3CB2F6
	for <linux-kselftest@vger.kernel.org>; Fri, 11 Sep 2026 03:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789098465; cv=none; b=PmEdz+wKmhmeVd1ROF5aNhQe7fjGaD9n3nIw4+VZcw/MApphlPFmbVt/pcNrfz5CHPg0B7cgNGytw0HRFgVNYu1eSQznMki7qm+kEoZThR+czBrmboPwWgkS9PQVsRBTbvmnAM8jvcqeHdlMpaszTwYXj9nir9ZMgLPMcw4ccsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789098465; c=relaxed/simple;
	bh=vcFj2FDnNl6rmAlrTt0LP0JTZu2I90zmumhQcAQpNuI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=is29xLKqFGJxgrRN3EJmbKs92Ypjd6Nlmt6CBpR4hSTxr0aFTjul0IupV5Y+8vYsTVMtRoXbebGNvNOdhhWa/ZhvWPIZ4IIDYMEppYfIL6slorTEF3EE6xxapun4ESWMog6tESfMFMiqbcAvStFUKAPYe6kCAmkd58IQAyebm3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fk3SHb6S; arc=none smtp.client-ip=74.125.227.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fk3SHb6S"
Received: by mail-pj2-f7.google.com with SMTP id d9443c01a7336-2d9181b7e1bso212455ad.1
        for <linux-kselftest@vger.kernel.org>; Thu, 10 Sep 2026 20:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789098463; x=1789703263; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bgJbrLOZqzlKO7QKcQrbBNOBhNACrrtANZ+pAkZT1uk=;
        b=Fk3SHb6SYPAir2OWsV22bn8og/9n1jZ7BDbcQmb161MPywtXbEgd/Q3DDGLgo5v97F
         QjpN7BlVV0RVFNVLe1+F+hyLreoobpVdDpDrZ+wtQw4iJ7NwMnWOMXSMS7PdFPyILTyD
         p2+cYSl9yKKYKXHQomAqe1R+y7/A+O/Hb590/agPZAFZhzANKXhy6DD7ayDCe+7lN7f2
         vgY+FEUOZKsGaoY3pOklH+kDQdd4BvYYUlnVfM6Ktug5ecLyEYBJqXLPgVCutIQf+rN0
         GwFtWkywNmpufRhT4tmQjujq6a6tCYHRMUnfXYlmAqApVJgv41I54oiM+0n1Q1TCgzzO
         xkdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789098463; x=1789703263;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bgJbrLOZqzlKO7QKcQrbBNOBhNACrrtANZ+pAkZT1uk=;
        b=ADjBOHydzBJZp2Awfeue5KnItkqxgOd0PRPItJY1pS16UkGgaRu7H7GBz5YQ9KrLwC
         DMi0/9b3QORTXrHG9r3VGjpzJu+jAnHU/oalxHncdby6cVLNv76lDkoSIi0CcUF2JQY0
         7sOEYzD9TXSIeMAUitIn0jiozAXrgCggSjLw4OX/wXPCAEHnRtj8ZPygU5P5kWM1HVEA
         QeW5PP6SL96thcSOBuEe6BL9yJc7eh6Wb6wLAiT1omE7zsnRphYnt+Klpjie1mYzascq
         Op/DB38Ic7AxOoQP2ghR3+XdyYppcW5S01OKcMZr/34z3AbvEYHl/eVWsF5bLbIbBcQr
         ibYA==
X-Forwarded-Encrypted: i=1; AKwUvBzpdQDTFsD6/MDR1pji0pWRWjXkQn3ijDhRWv1KA4Qz41EOGxg2UuW2xYMS0eTSrgsiE4zv6dwdLNARB8zdQFs=@vger.kernel.org
X-Gm-Message-State: AFuF++lcFfoJae8K+zAt1ZEwxsWevgVE0gybNTtLbmbK6kALwu1rq7lv
	9KhTlwzMqU88FNOy1PEaDt1zmlCbv6SEsk1l06uTEhoVO2kyAb7RzOv3
X-Gm-Gg: AYBFou0TsxmmIKeDVc7zS403u0V/QBtNvr0GbVZZD/EBLEbUIWIDHLvFOIe/VEzujYH
	IrDzLG8B8oLIgVyo1BNbICG76dRZrbm2PO2risDj9Rmmh2vciabOsoSbrK1GiHjwAxIVT08JMJT
	27HMq6vE+BbOpWD7qvN7azVOp6GkjHCpAULkfu2JVHLckFVI2ywiUuzSTdVaP56l0G54QJF9dcx
	W9fZ3kTp880Cfruz6tEiai2Htx/gxX1qAiPhDhxrixP2yrCdXo4tSyk6NQfjJ5GNPRlFbc83xJt
	u3FA8bsYCIW3qIYaCAPOCfQoenwLt00wMLf+speDSXv6FSHe5ecO37lUX8KZYEIiXPooilRFYVX
	t+qiZ4xMahsu5v3I778bFmHbLFIHaU4cJH9XGHvhDo1aE8kV8NcrviA2AMT5AnPyux9EnvlYFbI
	7I62iXqlgJAxGfoxYo5Gpibihnq9B+08XP72fZOwBaeyd4mw/DBHrmgwQG6296ZHTa
X-Received: by 2002:a17:90a:d410:b0:398:9bd3:d6d2 with SMTP id 98e67ed59e1d1-39d980ac288mr2512065a91.12.1789098463468;
        Thu, 10 Sep 2026 20:47:43 -0700 (PDT)
Received: from 192.168.5.7 ([69.5.53.41])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d9540fd76sm2770852a91.9.2026.09.10.20.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 20:47:42 -0700 (PDT)
From: Tianyi Chen <diannaaav@gmail.com>
To: qmo@kernel.org,
	bpf@vger.kernel.org
Cc: andrii@kernel.org,
	eddyz87@gmail.com,
	ihor.solodrai@linux.dev,
	linux-kselftest@vger.kernel.org
Subject: [PATCH bpf-next v4 1/2] bpftool: Use batch lookups for bounded hash map dumps
Date: Fri, 11 Sep 2026 11:47:31 +0800
Message-ID: <20260911034732.219752-2-diannaaav@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911034732.219752-1-diannaaav@gmail.com>
References: <20260911034732.219752-1-diannaaav@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tianyi Chen <hi@tychen.cc>

Use BPF_MAP_LOOKUP_BATCH when dumping hash maps to reduce the number
of BPF syscalls while preserving plain, JSON and BTF formatting.

For a 100,000-entry hash map in an x86-64 KVM guest, BPF syscall counts
fell from 200,004 to 395. The median of five untraced runs fell from
0.774013 s to 0.733844 s, about 5.2% in this measurement. Syscall counts
were collected separately with strace.

Hash batch lookup must fit an entire bucket. Restrict eligibility to
maps whose maximum key/value storage fits in 4 MiB, so even a worst-case
bucket can fit without restarting a partially printed dump. Start with
up to 256 entries and grow on ENOSPC using the same input cursor.

Fall back to individual lookups only when the initial batch operation
is unsupported. Restarting after output has begun would duplicate
entries. Process the final partial batch on ENOENT, but do not trust
count or output buffers after other errors. Keep fatal diagnostics on
stderr so JSON element arrays contain only map entries.

Link: https://github.com/libbpf/bpftool/issues/63

Assisted-by: LLM
Signed-off-by: Tianyi Chen <hi@tychen.cc>
---
 tools/bpf/bpftool/map.c | 117 +++++++++++++++++++++++++++++++++++++---
 1 file changed, 109 insertions(+), 8 deletions(-)

diff --git a/tools/bpf/bpftool/map.c b/tools/bpf/bpftool/map.c
index 684a8fb7241..971da173600 100644
--- a/tools/bpf/bpftool/map.c
+++ b/tools/bpf/bpftool/map.c
@@ -740,15 +740,10 @@ static int do_show(int argc, char **argv)
 	return errno == ENOENT ? 0 : -1;
 }
 
-static int dump_map_elem(int fd, void *key, void *value,
-			 struct bpf_map_info *map_info, struct btf *btf,
-			 json_writer_t *btf_wtr)
+static void print_map_elem(void *key, void *value,
+			   struct bpf_map_info *map_info, struct btf *btf,
+			   json_writer_t *btf_wtr)
 {
-	if (bpf_map_lookup_elem(fd, key, value)) {
-		print_entry_error(map_info, key, errno);
-		return -1;
-	}
-
 	if (json_output) {
 		print_entry_json(map_info, key, value, btf);
 	} else if (btf) {
@@ -762,10 +757,112 @@ static int dump_map_elem(int fd, void *key, void *value,
 	} else {
 		print_entry_plain(map_info, key, value);
 	}
+}
+
+static int dump_map_elem(int fd, void *key, void *value,
+			 struct bpf_map_info *map_info, struct btf *btf,
+			 json_writer_t *btf_wtr)
+{
+	if (bpf_map_lookup_elem(fd, key, value)) {
+		print_entry_error(map_info, key, errno);
+		return -1;
+	}
 
+	print_map_elem(key, value, map_info, btf, btf_wtr);
 	return 0;
 }
 
+#define MAP_DUMP_BATCH_FALLBACK 1
+#define MAP_DUMP_BATCH_SIZE 256U
+#define MAP_DUMP_BATCH_MAX_BYTES (4 * 1024 * 1024)
+
+/* Return MAP_DUMP_BATCH_FALLBACK only before batch traversal starts. */
+static int dump_map_batch(int fd, void *key, void *value,
+			  struct bpf_map_info *info, struct btf *btf,
+			  json_writer_t *wtr, unsigned int *num_elems)
+{
+	__u32 capacity, count, batch = 0, next_batch = 0, i;
+	void *keys = NULL, *values = NULL, *buf;
+	bool first = true, can_fallback = true;
+	int err;
+
+	/*
+	 * Hash lookup batches must accommodate a whole bucket. Restrict the
+	 * optimization to maps whose worst-case bucket fits the memory budget,
+	 * so a later ENOSPC never forces a restart after printing some entries.
+	 * Division also bounds the allocation multiplications on 32-bit hosts.
+	 */
+	if (info->type != BPF_MAP_TYPE_HASH || !info->max_entries ||
+	    (__u64)info->key_size + info->value_size >
+	    MAP_DUMP_BATCH_MAX_BYTES / info->max_entries)
+		return MAP_DUMP_BATCH_FALLBACK;
+
+	capacity = min(info->max_entries, MAP_DUMP_BATCH_SIZE);
+resize:
+	buf = realloc(keys, (size_t)capacity * info->key_size);
+	if (!buf) {
+		err = ENOMEM;
+		goto error;
+	}
+	keys = buf;
+	buf = realloc(values, (size_t)capacity * info->value_size);
+	if (!buf) {
+		err = ENOMEM;
+		goto error;
+	}
+	values = buf;
+
+	while (true) {
+		count = capacity;
+		err = bpf_map_lookup_batch(fd, first ? NULL : &batch,
+					   &next_batch, keys, values, &count, NULL);
+		err = err ? errno : 0;
+		/*
+		 * Older kernels reject the command before updating count. Do not
+		 * inspect the buffers on these errors, or fall back after progress.
+		 */
+		if (can_fallback && (err == EINVAL || err == EOPNOTSUPP ||
+				     err == 524 /* ENOTSUPP */)) {
+			err = MAP_DUMP_BATCH_FALLBACK;
+			goto out;
+		}
+		can_fallback = false;
+		if (err == ENOSPC) {
+			if (capacity == info->max_entries)
+				goto error;
+			capacity += min(capacity, info->max_entries - capacity);
+			/* Preserve the input cursor: the oversized bucket was not read. */
+			goto resize;
+		}
+		/* In particular, EFAULT can leave count and the buffers invalid. */
+		if (err && err != ENOENT)
+			goto error;
+		for (i = 0; i < count; i++) {
+			/*
+			 * Keep the alignment provided by individual lookups, including
+			 * for BTF types whose map key/value size is not aligned.
+			 */
+			memcpy(key, keys + (size_t)i * info->key_size, info->key_size);
+			memcpy(value, values + (size_t)i * info->value_size, info->value_size);
+			print_map_elem(key, value, info, btf, wtr);
+			(*num_elems)++;
+		}
+		if (err == ENOENT) {
+			err = 0;
+			goto out;
+		}
+		first = false;
+		batch = next_batch;
+	}
+error:
+	fprintf(stderr, "Error: can't lookup map batch: %s\n", strerror(err));
+	err = -1;
+out:
+	free(keys);
+	free(values);
+	return err;
+}
+
 static int maps_have_btf(int *fds, int nb_fds)
 {
 	struct bpf_map_info info = {};
@@ -869,6 +966,9 @@ map_dump(int fd, struct bpf_map_info *info, json_writer_t *wtr,
 		p_info("Warning: cannot read values from %s map with value_size != 8",
 		       map_type_str);
 	}
+	err = dump_map_batch(fd, key, value, info, btf, wtr, &num_elems);
+	if (err != MAP_DUMP_BATCH_FALLBACK)
+		goto end_dump;
 	while (true) {
 		err = bpf_map_get_next_key(fd, prev_key, key);
 		if (err) {
@@ -881,6 +981,7 @@ map_dump(int fd, struct bpf_map_info *info, json_writer_t *wtr,
 		prev_key = key;
 	}
 
+end_dump:
 	if (wtr) {
 		jsonw_end_array(wtr);	/* elements */
 		if (show_header)
-- 
2.55.0

