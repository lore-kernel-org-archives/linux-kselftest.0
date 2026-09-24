Received: from mail-lr2-f40.google.com (mail-lr2-f40.google.com [74.125.230.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD874A4997
	for <linux-kselftest@vger.kernel.org>; Thu, 24 Sep 2026 16:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790266084; cv=none; b=Zl22VQbpEu8XXkAJzgHawTY3Ge8Adice8OgQFnNGfV4XNiPnn/yfGPd+7jta867nFJwiEZSEGYv9XjGmEvcl3qXJiqFKDDuxqdnijAwXkAUmBLUcAeUvfXMDWVJ8pZJH2gCIfQmai47Pd0D5A1gIuw0Ewjl9bMlVD/6L3d2OXQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790266084; c=relaxed/simple;
	bh=sziXoGyA6UGJllRA/Ie85NjFCXBSTo1NKVZeW6Yq6WA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JYgPsZvfuPY2nlfXqcWD69WrfdZ9xDcvNlv4j2o6DgvAjdYv+sRA5zTxL9OEXdG+G5mh4q26iCCocuJES9C3E3H9B1jAKeMy3Tq4rJz7siF1MsEAEIW3aMobIPkilZzHI38CuRSUdXg28Dw7lRbSu7PnCFpRmeIQM6yNBeCDf0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lT4fEbL2; arc=none smtp.client-ip=74.125.230.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lT4fEbL2"
Received: by mail-lr2-f40.google.com with SMTP id 38308e7fff4ca-3a5da7416f9so17878121fa.2
        for <linux-kselftest@vger.kernel.org>; Thu, 24 Sep 2026 09:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790266081; x=1790870881; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BbdAxPRSQudHFXkDFge6mH3yayN/WLn49JJ5+xvwtOU=;
        b=lT4fEbL22CGyCHvGFSSvoEKjqq4AqF8drmgYRaihdyIwhFIUVRv3mQSXI1b9BBD29/
         2M/KndTzINr/FZKCKZH5KgwyqKvbrFsX2kWrkFHCcP7BfBx3k3cm7UWDquwrzi9jb/i2
         1gkhVKOcHn7QroIruOfTAd39Fs2bEibNt/KjI0HOJg1tyyDvmFDEwpr1OQG7JmwmUSZY
         Tw4fbqDT3Nu11K8y85os/lVPVpKhmYpIjvw0lIlVtci8b9AsupZyU8Wc49FIMLW3sIY8
         v30g+GI19izvSyTxPX2yVsY1sZOziZuitIvyl6TpBiHqCGq8Xqk3zs7TmfhhPJFDPHWq
         urkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790266081; x=1790870881;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BbdAxPRSQudHFXkDFge6mH3yayN/WLn49JJ5+xvwtOU=;
        b=o5Bq8u3huG6H/9icd/RwfieYBc0epPDgHN+g5UjYYEUmJ1DHMLqJu+IJCseklmeegq
         FImAxgtPQPg/ztpqOSjdG118bpDvUwLRcLueK8Ib4JLyS2GI1FT1luo/75r1NX+lMFZm
         VzGygfyoIUEB1QyFqWhhzv9ETTZEQ/p94Ejgx6LThKDErbDkP+KNAJETOEKfD1AYQghY
         ajNqqYDlYJd2bAkovEJaqsrVPycOmJEKG+na3O4B5Z/SWBGd/mikZMm6mj1qxTFL0PBL
         wTa1ZGBLFnE72GntRmodypoly+U+wZPkvmICHZBOMP+GymoRzQECC2BA/Pn7KE6jbQYB
         hPGg==
X-Forwarded-Encrypted: i=1; AKwUvBwUoSSIYLGnZZGgWir+6dEcXqNvyYOiWXrQCwigApKj/fiaiMyB+mRaa5ISWkYZXwQs4HmkkTSXwAytNLqBrFQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lMErHE2cEp4EUx176dHMiGABiLAd8ycihvio/NIVr8UJvSDXVX
	xU3JqSNzzi+nKcvWLhNuzShI+kpGwKaoXO2rs6rnNhm55+y038Bcp4mb+AbNdXhJNIGGhA==
X-Gm-Gg: AYBFou0Y3kAF0sb8YEEMT3qOwBzY0oWJMMw71hU8TGQH30s/Pbf/K1XNnMiVsHPT2Kz
	tfPft1T59U1+JNTw692+Wu5T5tlqkfuRWtTV7V4aec6B8B8o/RLk9uqrKUIM3HAey/2u2W+hsQM
	03llEQSh9mm4Xas2+KuwQqYf6WW325hJURbpOkkFxg/uAcD6zuXS51i672d4yWZdCtggiPTr/+/
	j8yXspPQ2LL5hk1EH2IL0bZLAgWAggSmrsoRUOk+KtXBSkpP1q8rPZ3xYsQ7CHuB9bkLRIS07Bp
	apxZOxrL8wE264fvBQ0KX9O70kOXjUa7c1k0lxWFZjWhxpUcKSOFimqbeMHXttXcWyWx2Kv85WI
	O5J+JFflGCI3pdpddEJM2JMCNTcpUyfEmpLn44BkLnnWEBUkG7r4gK/XyAc4RLDC2a/UurMyJwB
	onS1m4GwhZ+/VDGSgKc5FTEBP+1bontHNN4R+dhGhTUYpR84q12mGyITycrx5JcC7gZ2r7bgbqt
	qqsr4rnsSRu8TQ=
X-Received: by 2002:ac2:4c50:0:b0:5b8:bc5e:b583 with SMTP id 2adb3069b0e04-5b8df2129bdmr1107032e87.59.1790266080489;
        Thu, 24 Sep 2026 09:08:00 -0700 (PDT)
Received: from localhost.localdomain ([80.66.93.93])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8d8552fd4sm1563292e87.2.2026.09.24.09.07.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 09:07:59 -0700 (PDT)
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
	kuba@kernel.org,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	Maxim Skokov <skokovmaksimevg@gmail.com>
Subject: [PATCH bpf-next 1/2] bpftool: Don't report an empty map when key iteration fails
Date: Thu, 24 Sep 2026 19:07:19 +0300
Message-ID: <20260924160732.485650-2-skokovmaksimevg@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260924160732.485650-1-skokovmaksimevg@gmail.com>
References: <20260924160732.485650-1-skokovmaksimevg@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

map_dump() walks the map with bpf_map_get_next_key() and treats ENOENT
as the end of the map. Any other error ends the walk as well, but
silently: bpftool prints an empty dump, "[]" with BTF or "Found 0
elements" without, and only the exit status tells that the map was not
read at all.

This is what every local storage map (sk, inode, task and cgrp storage)
gets, since their map_get_next_key returns -ENOTSUPP. On a
BPF_MAP_TYPE_SK_STORAGE map holding storage for five TCP sockets:

  # bpftool map dump pinned /sys/fs/bpf/tc/globals/cilium_lb4_reverse_sk_v2
  []
  # echo $?
  244

"bpftool map getnext" on the same map already reports the failure.
Report it the same way from map dump, with a hint when the map type
does not support iteration, and print the element count only after the
whole map was walked:

  # bpftool map dump pinned /sys/fs/bpf/tc/globals/cilium_lb4_reverse_sk_v2
  []
  Error: can't get next key: Unknown error 524 -- map type does not support iteration

In JSON mode the error is emitted as an {"error": ...} object, as for
the other bpftool commands.

Fixes: 71bb428fe2c1 ("tools: bpf: add bpftool")
Signed-off-by: Maxim Skokov <skokovmaksimevg@gmail.com>
Assisted-by: LLM
---
 tools/bpf/bpftool/map.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/tools/bpf/bpftool/map.c b/tools/bpf/bpftool/map.c
index 20d59eab09..00e49ae05c 100644
--- a/tools/bpf/bpftool/map.c
+++ b/tools/bpf/bpftool/map.c
@@ -883,8 +883,15 @@ map_dump(int fd, struct bpf_map_info *info, json_writer_t *wtr,
 	while (true) {
 		err = bpf_map_get_next_key(fd, prev_key, key);
 		if (err) {
-			if (errno == ENOENT)
+			int saved_errno = errno;
+
+			if (saved_errno == ENOENT) {
 				err = 0;
+				break;
+			}
+			p_err("can't get next key: %s%s", strerror(saved_errno),
+			      saved_errno == 524 /* ENOTSUPP */ ?
+			      " -- map type does not support iteration" : "");
 			break;
 		}
 		if (!dump_map_elem(fd, key, value, info, btf, wtr,
@@ -897,7 +904,7 @@ map_dump(int fd, struct bpf_map_info *info, json_writer_t *wtr,
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

