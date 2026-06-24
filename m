Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A00F3911CD
	for <linux-kselftest@vger.kernel.org>; Wed, 24 Jun 2026 07:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782285663; cv=none; b=ge1YxLE675igDg+h6Mi+pJxzs9VgZLQhCiXuDm1z75jnD4PN4USoJH164vgcWsZbrb1rh/AmjjfR+8zoKXp22Wn25WVklzY4UVCj7anQguivcq2YFsOy+hMQtJ1DoNE3CGX/h2gPp8xbtwnnL6LJkQlcisixb1B82X+yl/Spnjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782285663; c=relaxed/simple;
	bh=pVd11EH3T/mNIRJabrh1Cdzac8ikx4GAtiYQD2B61tM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NtzZpG+Y8X6suHdOCKd8oL2YFeIdjAkw1qWuxmwYfeE0GQQbDmiYf4m3//QNixjSgCZ0yvxRJEa664nc+EaZU03xXXCHFEgM6q24t62/XW2Y87etM2hJbKJMGmRKyEcHpCI3ta4lvn7YtonCnkf0X6FiVD+kzcev1VMiP1Uwg2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dbSXct2G; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dbSXct2G"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8453f568e84so796556b3a.0
        for <linux-kselftest@vger.kernel.org>; Wed, 24 Jun 2026 00:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782285654; x=1782890454; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZgCohTv+MX28dL9XB70gpLT76ubfXGom7LP2yheQ7Is=;
        b=dbSXct2GkyWFYmc9JJdArBbvNkGvtnlDdrTECP2rkYhcHrfjM7wNyAOpLYXhxpwf88
         07zVv6C4qoMoKFDA+fXQcB9vCNAQNSd3opZ679Iho9Bc61vSGSFVMmZlkPDzYjRhn/2I
         wbYrwiVJ7hLSCu05oGa57+7ju+hvrH2HXANOHuQUECzZcS30BdHEW/8x1Wr+6lck/tXu
         rARkykTMnODykxd/XCvlBcQ9XVykASIVzMBKF5gWgGPRpm0wiVrySkpRzjqplpCJ8tKn
         /rvT8+v5B0TMWDYadGD1vCPUdoIa4iZYZIkJHz8eRCHnbGTmxkoN6lkRydkMdO7sSHn5
         t3gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782285654; x=1782890454;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZgCohTv+MX28dL9XB70gpLT76ubfXGom7LP2yheQ7Is=;
        b=L3AuCBipKgIVHg+8p8qpJrGPAnp4j1Z9+Wc0rAz51aM0TsM7hYZIf+Yms/soQb0fSW
         k7oLWwXDBT3YgoMRGGHF0t97Fwr9Nf6bLGFGYFhwdJzEtrPzx0Cs2+9zaMsMMEKLdh+i
         pn6/dOH1K8S4iRrFfyUeaE/f12cJxGWhgVWlgDb6WRFQGGjYH2PLWZu/RrZMmXBvemnZ
         6DD6+WZu0ekYbM6Aw82T23gU7KnLXKzCAtTGsMJxzmVJjh8l/3GIyTFrT+Mj2OFJnAsb
         1OCcMIjrZ4+EblUviMYX0LWNw3AtvmkqI+3Bv+7hu0wHvvX0TVTkfljp2UTcX0npM6ot
         iczg==
X-Forwarded-Encrypted: i=1; AFNElJ9fRoXPfgBnHA+EEbugUFxdSrWGrbjNIDAuB59Dj00xCOWNsn+OOJDxIBdmV1FK94qPQp/Bc2y0HOh6OtahYOw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+QWayaHNCaE/GU2Jn4e5puXjg3zAlWfKDyQQjUeoAG5nnYjos
	vD/V64ACmdB2E/gZbMfzMTa9buK+xjcjs7B2xhgNNDLWaq63HvEe7dVC
X-Gm-Gg: AfdE7cnfVTBw/TGAU2O6u1KvsAs/CK1FDV/m662FL30Qz0iOU/DiraIeVHytV6LGXfJ
	i5P+5gZcPd9huQFeV9H8o8xV223Hwh4lELEHr5yfNeNEC4fLOk+en77dC7Vt+usw+57b0yD1rDe
	1q30OZ+LSEQ6Mer/G28STGv33TI7si0oa29b/yPNfzvmb4G+K6z/x6UW9glb/ii59VRnroU/S6i
	WnG8JNO54Qb4Y4KxlcyZ1653BILhGnu+20Q2Vp98WUt5BAiHtHoPQRAeoOHf6J2kEj8bDX4+t0H
	zIKVPYIgRDPU+/4pepS5aUSN1OKCuCoZaNkRHnvhD0Wt/HZUPe2xylu+qZpYG+TEYoCr06SASN9
	R8XW3ZyVRIhW6b5vt3yj30d4nChZ3adi4xB/EOGDMLAD080vD+Ccf0V6XP3JSlC5In9Dw0UqqhN
	QmlP2NOR2R/peLxDFBOWDmORGDa2NSeleNPX2VnOHYo6gLqGGpVWSH5TfSiJx+AL6WD1iPktobi
	LqggjX3f9yLXEKj6BsSv++IiRk=
X-Received: by 2002:a05:6a00:1804:b0:837:e9cc:d474 with SMTP id d2e1a72fcca58-845952107c4mr7570210b3a.2.1782285654414;
        Wed, 24 Jun 2026 00:20:54 -0700 (PDT)
Received: from u2404-VMware-Virtual-Platform.localdomain ([202.8.105.120])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a413c7ecsm1498555b3a.56.2026.06.24.00.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 00:20:53 -0700 (PDT)
From: Sun Jian <sun.jian.kdev@gmail.com>
To: bpf@vger.kernel.org
Cc: sun.jian.kdev@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	john.fastabend@gmail.com,
	andrii@kernel.org,
	martin.lau@linux.dev,
	eddyz87@gmail.com,
	memxor@gmail.com,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	shuah@kernel.org,
	dxu@dxuuu.xyz
Subject: [PATCH bpf 1/2] bpf: Avoid eliding lookup NULLness for inner map templates
Date: Wed, 24 Jun 2026 15:20:30 +0800
Message-ID: <20260624072031.735846-1-sun.jian.kdev@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit d2102f2f5d75 ("bpf: verifier: Support eliding map lookup
nullness") allowed the verifier to elide NULLness of
bpf_map_lookup_elem() for array maps when the key is statically known to
be within max_entries.

This is not valid for array maps used as inner map templates. For such
maps, the template's max_entries is not necessarily the same as the
max_entries of the concrete inner map used at runtime. As a result, a
key that is within the template's max_entries can still be out of range
for the concrete inner map, and the lookup may return NULL.

Do not elide lookup NULLness for array maps used as inner map templates.

Fixes: d2102f2f5d75 ("bpf: verifier: Support eliding map lookup nullness")
Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>
---
 kernel/bpf/verifier.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index 7fb88e1cd7c4..3f38f85c3cb8 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -10590,6 +10590,7 @@ static int check_helper_call(struct bpf_verifier_env *env, struct bpf_insn *insn
 
 		if (func_id == BPF_FUNC_map_lookup_elem &&
 		    can_elide_value_nullness(meta.map.ptr->map_type) &&
+		    !(meta.map.ptr->map_flags & BPF_F_INNER_MAP) &&
 		    meta.const_map_key >= 0 &&
 		    meta.const_map_key < meta.map.ptr->max_entries)
 			ret_flag &= ~PTR_MAYBE_NULL;
-- 
2.43.0

