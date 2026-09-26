Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F41A13769ED
	for <linux-kselftest@vger.kernel.org>; Sat, 26 Sep 2026 17:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790442139; cv=none; b=LgfM/eII3JEv2iG/QGV6Yz5Arrd9efIH8i5it82mLs4QOg57I4/wEZM//qI4J/A6DuXHIrITOGgzjLeIriS99YAyLkHHP8oGu4Kf/1P6fdEQQnvaqZ6aOF01/TSiXjHDpl7Rg5mPj3nZTTc1SQBLpcjR9JsTAw4dXIrOTdcBjrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790442139; c=relaxed/simple;
	bh=zJF4sscpF1aQho/bRZ/pm9XthLOuzMaUDPLUWBgHDD0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pEiB5h5K61YCvT02iXUro8nVH3wSpCn/dac4DRa4Xl4LHYTyDA/vWDZEfdCqqEURvGvnfgZh1zcae3rP6FetrjRfWk3p/kQs3+5DDXKWxbMCaDjriF7zEPX4dS9FydwqR7R2ixOlQwvEb2hh0RL8GCi4xLADZjFIGQ5782ZvqYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jNEIYzjp; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jNEIYzjp"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b74e0c2e4dso2015163e87.0
        for <linux-kselftest@vger.kernel.org>; Sat, 26 Sep 2026 10:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790442136; x=1791046936; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ikRv2horgnDI807qoA7PJBJJX5O1tS+tzE6IfcIPsw8=;
        b=jNEIYzjpG4Mt5KrBZJ8o0rFaaMQrATb3Hu5pY08zb/2emH0+OHEA9NtRmTftIhGNMP
         eDc3LMAK09SwtZ5O3eD6FT4vT6Igpr3N+ihTjPxFFlbhvvZVJ5qsfxBXHHDIggI9VpId
         XaEFf+CY3EW2JW7MzpJZWnLHcELAXjpvTi8wD5Z1SnFqnvcL/AEAelB6wzonA0KbUL0k
         YOvjyHWCNnW3RYmhOFuQ1epZPFgI4eC22Tw7qn9+hilv6EYF6nrBButaxmFnptqGjnXW
         a8xVTNIczvVRUzO2Hs/66lrNATSSctTbdLdVXHu1Em/6DbAidOpNuKwz1QBh9ydKrTJv
         UQ9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790442136; x=1791046936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ikRv2horgnDI807qoA7PJBJJX5O1tS+tzE6IfcIPsw8=;
        b=WAGJ6Gjp1BNx1KFbE+iHr7rBfQZvwqf8tgr/MLkscymca2p0JBpVW5TBzuDSt8pG8M
         IcfZdcCvCkBi10X03l697wRf1yksu3MJrEioGRGT8uEN/DUTuVzsXKMMWopNEfAx9Cjg
         RKN0AVLQTn/8Q1DsoCKvOxhTPQ8vqpgZjEced8wbrAgNENcn/X2VKXzGKzsD4mYFEnEn
         dVJPIVdglgJYLMDqGLOJAIOuTCTY3sNOqVFCOt7iUKuT3lvMG4ttM0Neh2j8yvLb4QBW
         IGh5K1YBFLBEFrhrhMVVY6i80SbN+fekfiRlmVDKQe1ZDxxxTtSJo5Z/8C/FHHmhLoMv
         V7pw==
X-Forwarded-Encrypted: i=1; AKwUvBxAjK95DuY3RJJU8AmBUk79J5XOOxc4p6cuinkIVXEnR3e7FXcvnhBl3yx3cAXq3ECVtK0mVp/cECHteTEv3LQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kYcQseh/wioQdxxxCqo47xzDxkMMDxToRXxRS2iDY4GOqzMZ8+
	1YDaGNPwidIqpx/QgihyNiP6PvbLCUjuQW5CoNbARx3Vek4Vw4L+BDZg
X-Gm-Gg: AYBFou2Cto5bkX9MgGQF94uFjJNQTaqRCAxo7dz/MmO5yuGAJpb5EYBUPJHK7ehY46k
	T3XzQl6fsmgOqeSEQd4T8fYE4hTWXbUG3RzTl4RxE2pfvnuh3DXQ8HtpiTP01/IKu8t0VQktag0
	XFHZlqFcf42mNiPB2iQ2gFHLP9B0iO+NFaHiOFPywSFsHax/6p1wB9DtHoUiIaIzaE6GFA05u+d
	H/tQYEhldtQdxe68VF8LKs22FAOKPDMW7I8K3FEwvqXjJNiq+8J6zTYP0Va+1cxqudXJSkoLBXQ
	m7K6P3kzDWKHNP10g6xxcpTMokhmtr7rC+qYb+YtOMIEEbF4CxoJHsU0cFfqWmo3ceksne4v7Pm
	3zCjUtJTU2kZJcDDWLhO8tX3tf5rmkHD210c6WUQWQmrmxl3AfXJUos9OQXUJbikqYzOdHo1rjF
	uRKGp03sjwW7PfBSqhBG+he6NqZTUMIIpk8vra+1cM3OtnuxRaqUeeKZNRhZUPV6Pb4tTwc4cdj
	qcwcb8HIQSGqAK66g==
X-Received: by 2002:a05:6512:130b:b0:5b1:58d6:4542 with SMTP id 2adb3069b0e04-5b8df0d444cmr3153254e87.14.1790442135516;
        Sat, 26 Sep 2026 10:02:15 -0700 (PDT)
Received: from localhost.localdomain ([80.66.93.117])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8e6b078d2sm1317178e87.63.2026.09.26.10.02.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 10:02:15 -0700 (PDT)
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
	hi@tychen.cc,
	Maxim Skokov <skokovmaksimevg@gmail.com>
Subject: [PATCH bpf-next v3 1/2] bpftool: Fail map dump for maps that can't be iterated
Date: Sat, 26 Sep 2026 20:01:26 +0300
Message-ID: <20260926170149.541352-2-skokovmaksimevg@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260926170149.541352-1-skokovmaksimevg@gmail.com>
References: <20260926170149.541352-1-skokovmaksimevg@gmail.com>
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
  Error: can't dump sk_storage map: Unknown error 524
  # bpftool -j map dump pinned /sys/fs/bpf/sk_storage
  {"error":"can't dump sk_storage map: Unknown error 524"}

An error later in the walk is now reported too, as "bpftool map getnext"
reports it, and the element count is printed only after a complete walk.

Assisted-by: LLM
Signed-off-by: Maxim Skokov <skokovmaksimevg@gmail.com>
Acked-by: Quentin Monnet <qmo@kernel.org>
---
 tools/bpf/bpftool/map.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/tools/bpf/bpftool/map.c b/tools/bpf/bpftool/map.c
index 20d59eab09a1..b7f62fcbb6fc 100644
--- a/tools/bpf/bpftool/map.c
+++ b/tools/bpf/bpftool/map.c
@@ -856,6 +856,22 @@ map_dump(int fd, struct bpf_map_info *info, json_writer_t *wtr,
 		}
 	}
 
+	/* Fail early to avoid an empty dump if map type cannot be iterated */
+	if (bpf_map_get_next_key(fd, NULL, key) && errno != ENOENT) {
+		const char *map_type_str;
+		int saved_errno = errno;
+
+		map_type_str = libbpf_bpf_map_type_str(info->type);
+		if (map_type_str)
+			p_err("can't dump %s map: %s", map_type_str,
+			      strerror(saved_errno));
+		else
+			p_err("can't dump map of type %u: %s", info->type,
+			      strerror(saved_errno));
+		err = -1;
+		goto exit_free;
+	}
+
 	if (wtr) {
 		err = get_map_kv_btf(info, &btf);
 		if (err) {
@@ -883,8 +899,11 @@ map_dump(int fd, struct bpf_map_info *info, json_writer_t *wtr,
 	while (true) {
 		err = bpf_map_get_next_key(fd, prev_key, key);
 		if (err) {
-			if (errno == ENOENT)
+			if (errno == ENOENT) {
 				err = 0;
+				break;
+			}
+			p_err("can't get next key: %s", strerror(errno));
 			break;
 		}
 		if (!dump_map_elem(fd, key, value, info, btf, wtr,
@@ -897,7 +916,7 @@ map_dump(int fd, struct bpf_map_info *info, json_writer_t *wtr,
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

