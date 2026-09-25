Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D61B4D957A
	for <linux-kselftest@vger.kernel.org>; Fri, 25 Sep 2026 16:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790353260; cv=none; b=B+eSk4moRJbWlxMxO/ZQqRA2XLcKamjBWn/fgfykKvsLnH6zMIn1NYSBY0Q2LCnKTUMjUrTFahfYXJj6m7OFEuUEOTWI8uuWPkGOtLJ+oOnSt6GgjKymSjeevhMQ3PKDCp2WIDiF0AAHy7/2fG3fkPRTbcMh+HDLT2XAa5iIaOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790353260; c=relaxed/simple;
	bh=Q28sniXV7om3+Qk8sgoZevKDtaOXidBbVHOpP+ehFRI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BxeBdAqdvTySoy3CQEWXfiT7sPf/o1hNNhjIzWXiHACWfohIv2UvGMzXcEPBpi3LCudUIw5mV6c9MEtPWggyLFgdPUEgEF/rfVX5dV5kL+t3yl3xYlTJuzVUo13pz9h0CMcq0RTX9UTfmzgGVTmmo+FvXL6FEpClxBVhKFEA6i4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G6QEB/jv; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G6QEB/jv"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f15b78so892642e87.2
        for <linux-kselftest@vger.kernel.org>; Fri, 25 Sep 2026 09:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790353257; x=1790958057; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DYIMNeEsRRVimy1D2TXApSJburFYEEfCHdBBJQmjvA4=;
        b=G6QEB/jvITnIeV3wiHixdHdwrZGu9C3BveEdF8G2uhVW6GSrFVNs0Z82QGbk5QfaoL
         Y592GGobU46j3++J2haPOANCdvs4GzzeJk3iU3Fvndym+B9d0WEf46aJyC2Omj3N2SXZ
         hAVfuKh8xT8lz+jNaecDuR8rzXFKiRq5Mtho2H1zXSuzL2qOOXT68N/Eoyql0caUiVxg
         wlhUfhedM/LlfG9HwMMxZrhHI3NyrVVqIBwD3hodQ3WK7P2GObxOHPRzgwEWOMBleeG9
         3+dfV7P+uyJP36Q0TmdaIoRfTgBeded/sLAcoyodBQh0M8F/z4oSoco8Q98aNBGSt3NQ
         sSsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790353257; x=1790958057;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DYIMNeEsRRVimy1D2TXApSJburFYEEfCHdBBJQmjvA4=;
        b=aKyQEc5pCswI/WZ4V7db0+8Yv/KyG7a0H6MVfwPNNIBlJ8DJ8yTWakl+3kdrF5qvRa
         dwdN/ctzVI16ZVtjmgZ+rBiC0+Hx2gSGcpXnhrBjceBzFRuQaEAkh5tfwcY0fTI+W4Qe
         48frIGg1z1PGPLOpoezcge1/2KMPM187yH1O4PZGyMpqoAdGpcU+aAuQzU95Hhrzm+4F
         p2/4iu2h59qeYaNY81buiFZVl0kXT96Mqi4I8uF98OkL1ydUaTiBLomBb29MRRTJAxDV
         QnPfUJ2zRXOqruRxfA9tQ18FQyWPiaxdjei5Ws9Jhylaa2b3xo+/fv6Jgd5ukQ+0W3zU
         Mbmw==
X-Forwarded-Encrypted: i=1; AKwUvBwIKRRWo8r3fnSFsMoLqPBqlKdEnNKQO/u+JcpkNCUi5SYOBcSDajmPtk/BvpYwzoVKHD3UdYpcWVNHv8CJg6w=@vger.kernel.org
X-Gm-Message-State: AFuF++kkKcyT3T63zPHI08seS6WZMfljVeKexc47PbrKlhXvIIUN99oE
	KZ2sOoMrb5EB9Vf38StUh0X/8G1njUtcyRMdc0ABHAyP2qvRxwX/tNGP
X-Gm-Gg: AYBFou31zLhNe8yzWMY7iCm3uNhc+O8nUT3BjTcG/2E9p7c8Xat/dKcUSOsYLbLGkPV
	Lv5+R3QZJOXCyXM32+kvBAT7mh1+RbnNvnjmqjgn42hEU2p3JYTXMtjKqcBKPn1/3zXIOvrf+6w
	c1lBPoupThpo98rchLP3oazsjYd8FSmP+oDDHG1IUiwtmtG8GXkYXzrV63t9lvHidmcdRqi8y98
	yKOiymUgDWqW07mc+6uvfKynxhYSrENMppXu3mF6KrE6gMPQZMapBHFnCwFF6DcoWhjd6yCFAMM
	fq84e1XCE1VHFkM3ltcYM+Mv89zH+YbzFOyO6+xHJy/Ft2qKYLjeBFIVr5tPsMk57xzeCqILjAx
	bkBOeEtim3Bku7HnStkgp0jm6CjiQzi8FzPy8ObIYXCtGg9wc8g4qPBm31AOnpiaKHVb+l8qfeH
	jlj8biGkSH60ODyhNSkoW+WID94UGz0w/fDTRX7/WKc4QE9MU0xlUMlhzslmv3x5m/pDFI5Fi20
	lVw9Yl8nEgexgk=
X-Received: by 2002:a05:6512:15a8:b0:5b8:e89a:5ca4 with SMTP id 2adb3069b0e04-5b8e89a5d36mr835126e87.65.1790353256807;
        Fri, 25 Sep 2026 09:20:56 -0700 (PDT)
Received: from localhost.localdomain ([80.66.93.66])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8e6ae62d7sm655740e87.20.2026.09.25.09.20.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 09:20:56 -0700 (PDT)
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
	Maxim Skokov <skokovmaksimevg@gmail.com>
Subject: [PATCH bpf-next v2 1/2] bpftool: Fail map dump for maps that can't be iterated
Date: Fri, 25 Sep 2026 19:20:01 +0300
Message-ID: <20260925162031.27259-2-skokovmaksimevg@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260925162031.27259-1-skokovmaksimevg@gmail.com>
References: <20260925162031.27259-1-skokovmaksimevg@gmail.com>
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
---
 tools/bpf/bpftool/map.c | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/tools/bpf/bpftool/map.c b/tools/bpf/bpftool/map.c
index 20d59eab09..626882f207 100644
--- a/tools/bpf/bpftool/map.c
+++ b/tools/bpf/bpftool/map.c
@@ -856,6 +856,25 @@ map_dump(int fd, struct bpf_map_info *info, json_writer_t *wtr,
 		}
 	}
 
+	/*
+	 * Map types that can't be iterated fail on the very first key. Say so
+	 * before printing anything, so that the output isn't an empty dump.
+	 */
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
@@ -883,8 +902,11 @@ map_dump(int fd, struct bpf_map_info *info, json_writer_t *wtr,
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
@@ -897,7 +919,7 @@ map_dump(int fd, struct bpf_map_info *info, json_writer_t *wtr,
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

