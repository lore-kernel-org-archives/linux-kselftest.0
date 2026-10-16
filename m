Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 288A53CFF6C
	for <linux-kselftest@vger.kernel.org>; Fri, 16 Oct 2026 19:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792180131; cv=none; b=uhqUbq/2WhVDybOUf25qufzrcpbWO+hQwE41Oc+e/D4Fz4itOT07VGL/9M3x+ZYTdQWoIZIR/Sh59B1SGbGpyJWQmScM3A4vskjt6h5TOmDeC9kQPR6QXXfIB+4ljH4OigOezss7t4SfI4mDdsBDJD3BAGOHiX9RM/7V9ghkbiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792180131; c=relaxed/simple;
	bh=VHBA7r6iRy1nPFZtImbOCI38Ps0WpG7S8UGhNtjYXU0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uSFAl2DykGDeT/FF2E26XTolurH+FdTYm2ToyCv5NBVSmddROD8knT2UH2ffXrssSmxyfsR0xxSGlvC381devbBucuFsWGL6e5WG4n62cpizI9v9rnJXCo+e7HYc2ncfYb+VGeOnRJJol9by9rDXf+ijFhv/UJcPgpLamdY8fpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n0o7h/pm; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n0o7h/pm"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5ba3ec92031so376719e87.2
        for <linux-kselftest@vger.kernel.org>; Fri, 16 Oct 2026 12:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792180127; x=1792784927; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WaOfGjXPhKxu1i7K6sDhYeRAcqvotbUInh3VVNr1THY=;
        b=n0o7h/pmdZQYjN5X/dRovh29Ozt6LM1pGQOorFEDExB83a5ive4Mct5+8wzfbf0lt1
         pss+Wk5F+0tnTtBryerh/If9L30PBYU9pt7RK6/CgKdMa/RK6uVDKZzPr8/wx3X4VhLa
         WLwevEXhKvROTImq8UDniOc4FHvoJpEqlYfm+Wgbo+15Qgs+s8qx5Qf+CUxSvnmS4rJ/
         z3AsZ/gHBXQdXhDnNi/QKXiS0vYJDg8I7QIcOhyoOwq+8fuUcfAQuxiCb5Cst+aIBOhf
         nyk9qvexWP+vqa5HDMdljyALJstun2li+HIG5ghbU0xPOx1Oa1tkgYsrgIiZv/IrWpC4
         x0NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792180127; x=1792784927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WaOfGjXPhKxu1i7K6sDhYeRAcqvotbUInh3VVNr1THY=;
        b=QChIguP674d11cPOaRLCdzGOKlPFzp9KTmhUps/IG9AVRByKEtboaVdYVPY9gKs3Kk
         ptKD+05U982GXfwMeANY6d0//knXK3/7cGBwhxPQ3n8niJgQkjvxcqHJrRhVqlNyEV/7
         Q5UEdvXJibnAdIiRGmTC/GlKIX9B3nv+MJ4PjQ2cA1IL9SNvs0uUv56JDN4Y5aSpMf7U
         2eCv74H3Tv8/rVyV2icCcaLYFQk5IQheImGE8paIDZZkVvS4KC3P9JqLtMouNTq0kAKf
         rFg2299rmhOOvlKbJPtxBzPYiIXcf5FfeeC11O+88j/zzh8idsiShHWP94/XGO9OoHih
         pu7Q==
X-Forwarded-Encrypted: i=1; AKwUvBzgMSuUbM18VIVFOd2mfAcOSBTUaY/hMgoS+DEKtRan0POe60ADH44VIsEhn/0objGm9arEGjTOhqgZiu5zBUk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJJ8WYp7Dfs92Co9Gx+KMDw93xS9+FLaV8+yBhU+/a/P+Mnr/uM
	CPmV6LXLaTWm0Nl6W7tobav/JBJ0Kw6WXj3TpesofPfNhmw3fy6E3XY2
X-Gm-Gg: AYBFou0Qc3DYKogOCmFgrd+b4/0XJnYRi6SVPTOGl1cWQa9wpnOfSQK6IXQHXjEYCwS
	UZbMRX0O6xb57PzJLSULd4KS4AwL5jZyBg4TMStGhb1CnvdonLaLHC9ds1bZfxEDKecLjhK3Grh
	5CvimX2yiqrndzIkYxD6bnZt863LCbJ6M0GRONTJqp8bQ8ZNnPI15Cf+NApNC4gQO4wx5CE5BjM
	XbPXOwzlMQq7RE2yMIv8Mc5SRkWo8HAh/agE2kmg41a2FgxUT3pf5a7HOQI97Gw160iwpGwnjR4
	fUkRlyjY62g8dCkPckwWnwI2TbaaaU8/fSoMSr0JVscp1g9F8WJib3DLNOx8Ygk/ga1CDYLtQjR
	Y5AgWaMrZcWj2DYp0lMHtF6fwKd+09jCIq28ORo1EqwZQErKbsw7goQRYQfVkHpLuV9gev6f8ec
	CRQvfJYcjsUXE3K/ZOGIrK1a734wKGLGwChzM12b4ZSTKkQaeSPdcFMj1CijCgjzXuRbj2k9ocK
	G07eXByUnDUbRE1m4JHGSTjV5H5pxpfLi6eYZKpePcPmBF40rVr
X-Received: by 2002:a05:651c:1990:b0:3ab:13ec:d38 with SMTP id 38308e7fff4ca-3ab292b5814mr1697021fa.13.1792180127018;
        Fri, 16 Oct 2026 12:48:47 -0700 (PDT)
Received: from localhost.localdomain (95-24-167-79.broadband.corbina.ru. [95.24.167.79])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ab2a4691f2sm1179411fa.19.2026.10.16.12.48.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 12:48:45 -0700 (PDT)
From: Maxim Skokov <skokovmaksimevg@gmail.com>
To: bpf@vger.kernel.org
Cc: qmo@kernel.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	ihor.solodrai@linux.dev,
	kuba@kernel.org,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	hi@tychen.cc
Subject: [PATCH bpf-next v5 2/3] bpftool: Fail map dump for maps that can't be iterated
Date: Fri, 16 Oct 2026 22:47:57 +0300
Message-ID: <20261016194825.230433-3-skokovmaksimevg@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261016194825.230433-1-skokovmaksimevg@gmail.com>
References: <20261016194825.230433-1-skokovmaksimevg@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

"bpftool map dump" walks the map with bpf_map_get_next_key() and treats
ENOENT as the end of the map. Map types that can't be iterated fail that
call on the very first key: local storage and ringbuf with ENOTSUPP,
bloom filter and arena with EOPNOTSUPP, queue and stack with EINVAL.
bpftool then ends the walk without a word and prints what it prints for
an empty map, "[]" with BTF or "Found 0 elements" without, and only the
exit status tells that the map was not read. On a socket storage map
that holds storage for a socket:

  # bpftool map dump pinned /sys/fs/bpf/sk_storage
  []

Ask for the first key before printing anything, and when that fails with
anything but ENOENT, fail with the map type and the error instead of a
dump:

  # bpftool map dump pinned /sys/fs/bpf/sk_storage
  Error: can't dump sk_storage map: Operation not supported
  # bpftool -j map dump pinned /sys/fs/bpf/sk_storage
  {"error":"can't dump sk_storage map: Operation not supported"}

An error later in the walk is now reported too, as "bpftool map getnext"
reports it, and the element count is printed only after a complete walk.

Assisted-by: LLM
Signed-off-by: Maxim Skokov <skokovmaksimevg@gmail.com>
Acked-by: Quentin Monnet <qmo@kernel.org>
---
 tools/bpf/bpftool/map.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/tools/bpf/bpftool/map.c b/tools/bpf/bpftool/map.c
index d809b075e734f..4b65edf74859b 100644
--- a/tools/bpf/bpftool/map.c
+++ b/tools/bpf/bpftool/map.c
@@ -856,6 +856,21 @@ map_dump(int fd, struct bpf_map_info *info, json_writer_t *wtr,
 		}
 	}
 
+	/* Fail early to avoid an empty dump if map type cannot be iterated */
+	if (bpf_map_get_next_key(fd, NULL, key) && errno != ENOENT) {
+		const char *map_type_str, *err_str;
+
+		err_str = bpf_strerror(errno);
+		map_type_str = libbpf_bpf_map_type_str(info->type);
+		if (map_type_str)
+			p_err("can't dump %s map: %s", map_type_str, err_str);
+		else
+			p_err("can't dump map of type %u: %s", info->type,
+			      err_str);
+		err = -1;
+		goto exit_free;
+	}
+
 	if (wtr) {
 		err = get_map_kv_btf(info, &btf);
 		if (err) {
@@ -883,8 +898,11 @@ map_dump(int fd, struct bpf_map_info *info, json_writer_t *wtr,
 	while (true) {
 		err = bpf_map_get_next_key(fd, prev_key, key);
 		if (err) {
-			if (errno == ENOENT)
+			if (errno == ENOENT) {
 				err = 0;
+				break;
+			}
+			p_err("can't get next key: %s", bpf_strerror(errno));
 			break;
 		}
 		if (!dump_map_elem(fd, key, value, info, btf, wtr,
@@ -897,7 +915,7 @@ map_dump(int fd, struct bpf_map_info *info, json_writer_t *wtr,
 		jsonw_end_array(wtr);	/* elements */
 		if (show_header)
 			jsonw_end_object(wtr);	/* map object */
-	} else {
+	} else if (!err) {
 		printf("Found %u element%s\n", num_elems,
 		       num_elems != 1 ? "s" : "");
 	}
-- 
2.47.3

