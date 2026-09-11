Received: from mail-pj2-f11.google.com (mail-pj2-f11.google.com [74.125.227.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E003D3D7D83
	for <linux-kselftest@vger.kernel.org>; Fri, 11 Sep 2026 02:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789095105; cv=none; b=cqXZ1tu3sE5HZrLMbz6q3IFWlbG162N5hr/kjqL/lVqlvfjYqQLz8PmbPf38f5sm+7y0jh9LAj+PXyIrEkdJMah15891kgQ1v5HGMekRI0HKScI2/+7i09S5mKpRb5CizlDiY1HcYTgEJQ0YDHoRO/0RsAWrPtFCcePT7dpWhc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789095105; c=relaxed/simple;
	bh=e8tRCQhS2mY94PY4iQ+Z6M2YZWITUHVpCdCO5ebvFYg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZWWntw5DMuzQIC8ir1RgsAJCXa/5U3IJbzX6+PsKI87w9W6jT9xGMamqRAKHMn8jVRyzRE1ktb1mOY9LnEL722O09WE1QrMhCkWgSffQzGtUkGy3qmt4DVroV7FS++12cQASJ+1GxZwhrhcNxE8AoS6LGG/uG9hWisEWGqIbIaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CEhCdAfg; arc=none smtp.client-ip=74.125.227.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CEhCdAfg"
Received: by mail-pj2-f11.google.com with SMTP id 98e67ed59e1d1-39569e136f9so280750a91.0
        for <linux-kselftest@vger.kernel.org>; Thu, 10 Sep 2026 19:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789095103; x=1789699903; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CGufTHwMZ5iM5jUzLV4We18btvFtSid8AWHSj+fBa50=;
        b=CEhCdAfgNpT669JwtXwha4C5Y/EHRRjtCkljB/2WJe0Hftq+wOQ9Z/+1o2kiIURWrI
         w3awhYtZriL1duaLYSdvaUbI6h448GAgjNreg5MGg9borwrP0bFAWgL5A0/bwbBiMqr2
         yrKoMrdgIl3UI40SuoTnhfr46tcNBfTyevUPjlEkj96i9P1Ho/04aypyLN3tqxjA7sq9
         r5omtHOPxg47B9le8bv3oAOYGPfzDS6XgLuv9ntCz71HD8+DWm3t5XENMXPtEuEJYrWb
         8sQz/0vD+h8XqvFtikBfAE1YOtJ3BHl7lJPfhZ8bBAG+sfJw8WS1/piafphgCzFalA7d
         MEYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789095103; x=1789699903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CGufTHwMZ5iM5jUzLV4We18btvFtSid8AWHSj+fBa50=;
        b=Yn714xRE0dQ/n9MDpOrXanRHG20mWS12E7YqPkv/bJfYoFb8PnmEqkSYpheAadjQiB
         EwicHHWPr9FYxqv5vnf9BuqaB/rM5p9+zShIXR20RnuO7XPhGJIjzTDY0GuJ6eiYN01b
         FQdBZUkbWb9YrUajOyvGjcmEAD8YvaNCuDUZkBOSx68aHWx/8OSP5sPOvCVwgKAzIKx8
         ajlxeupR3fSYvYyB0RBsRw5dIA7/iQo/oJYG8BVbwsDgRsHDDQ2P4OtNeWr8SuwCvJdp
         zBijWsw5Pb3tQ7fHupeLJx5mMWQLfVp9JXVJQsjPZdN68ZB5jPfao8+DadDy8Ul2Lc/H
         87xw==
X-Forwarded-Encrypted: i=1; AKwUvBzB8oEnyQG8ilKy8CXC3g3hKhEtYYK8B1aSeXznJvM1X/YA9DzLiw10LIIRJD/PflTAJ0rIy4Gf/8uK9RlTfak=@vger.kernel.org
X-Gm-Message-State: AFuF++kdCwKoTbO7uTEWHEJYmp9MBhmkQtC4E3CtlQrcqPoRGcIaOn06
	md9F8q6sno3RSgDTM45sIvqpEH/ivVEaaeJK8KEEsZxmvsGSA2foEtXw
X-Gm-Gg: AYBFou2wKrkPofR+FHQz8g+6tKdt9VGdtOnO9a6sFNottnhkWHxkV84xHp8R98o+wbC
	70X0sbUHqdR51dYDBVy90fVp7orhIb3R+mq4XrdlfUsbyPiTj/tzqGm0FV0JVMJ1iFqtuSsKq/O
	ETLXFkZGbgHfWAEjnMnQIXhOW3Zd/5OkK000sssB5P2j4Uph+uNjgd91/gvCqu8D5xxVqn75IpA
	YjuzzRbT6lKb5mFvbV7mhUiRc5A8C4tmfH08lBxl0oqADSw7HZ1EtGas8ncWb3JCsgoGFmSC9ZH
	ECsRDroAPVaTWtsDXo6qml/MFuA+iKXhwDSEE0r73DJ8AR64MxJU0DbJGbCLLcpWFUQ3WWdD6gv
	4dqEIV2/GqXiNMasEKzYzgE/DgoaA+4G7I4XhasgCTniXvxStw4V5L5V9KWNuancq/plFi1ssxO
	Fqto0oVAwDZp+e3T6+P7AFghPbPz+hENU8Xjsp6Sy/vlZOl5id/1Soysqu7OF+4Z5fgA==
X-Received: by 2002:a17:90b:5287:b0:398:9bd5:490d with SMTP id 98e67ed59e1d1-39d9c22e224mr3330421a91.20.1789095103078;
        Thu, 10 Sep 2026 19:51:43 -0700 (PDT)
Received: from 192.168.5.7 ([69.5.53.41])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d994cc978sm1888632a91.9.2026.09.10.19.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 19:51:42 -0700 (PDT)
From: Tianyi Chen <diannaaav@gmail.com>
To: qmo@kernel.org,
	bpf@vger.kernel.org
Cc: andrii@kernel.org,
	eddyz87@gmail.com,
	ihor.solodrai@linux.dev,
	linux-kselftest@vger.kernel.org
Subject: [PATCH bpf-next v3 1/2] bpftool: Use batch lookups for bounded hash map dumps
Date: Fri, 11 Sep 2026 10:51:29 +0800
Message-ID: <20260911025130.191011-2-diannaaav@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911025130.191011-1-diannaaav@gmail.com>
References: <20260911025130.191011-1-diannaaav@gmail.com>
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
 tools/bpf/bpftool/map.c | 116 +++++++++++++++++++++++++++++++++++++---
 1 file changed, 108 insertions(+), 8 deletions(-)

diff --git a/tools/bpf/bpftool/map.c b/tools/bpf/bpftool/map.c
index 684a8fb72414..ea6f1389245f 100644
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
@@ -762,10 +757,111 @@ static int dump_map_elem(int fd, void *key, void *value,
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
 
+#define MAP_DUMP_BATCH_SIZE 256U
+#define MAP_DUMP_BATCH_MAX_BYTES (4 * 1024 * 1024)
+
+/* Return 1 to use individual lookups, but only before batch traversal starts. */
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
+		return 1;
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
+			err = 1;
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
@@ -869,6 +965,9 @@ map_dump(int fd, struct bpf_map_info *info, json_writer_t *wtr,
 		p_info("Warning: cannot read values from %s map with value_size != 8",
 		       map_type_str);
 	}
+	err = dump_map_batch(fd, key, value, info, btf, wtr, &num_elems);
+	if (err != 1)
+		goto end_dump;
 	while (true) {
 		err = bpf_map_get_next_key(fd, prev_key, key);
 		if (err) {
@@ -881,6 +980,7 @@ map_dump(int fd, struct bpf_map_info *info, json_writer_t *wtr,
 		prev_key = key;
 	}
 
+end_dump:
 	if (wtr) {
 		jsonw_end_array(wtr);	/* elements */
 		if (show_header)
-- 
2.55.0

