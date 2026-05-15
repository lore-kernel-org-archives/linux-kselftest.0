Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D56849219A
	for <linux-kselftest@vger.kernel.org>; Fri, 15 May 2026 15:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778858431; cv=none; b=tagoasAsgOEFrJLCUWCP3gAeTb41CBv9oSuXiV/3ZKXL4XfoOu16faux0d45b5TI7BrqQ91GMwCyCf/FUANS5E90b0Nb9sZ/eOwySWUHJ1SIF181JKlQCbcW5HkSYxyETbPPM+QlWWmscJmKS4VraelOMv7P0d1h4QQIHmtuM7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778858431; c=relaxed/simple;
	bh=mQgAGJ4m2Qmar19EXsMe8wXPf8JlFhMhxq8pUVUbHP8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kKgw1WmfYpUYF+yYRBP8C7VnxYzlppn0zcPEKHa35139mPxV9+l+UPSCwI/2OTwL3Inq+lMWPbM+P0PrxpO3wCSMYX3czo8QBDwER1rdkSB863stSJCduzy/qpBRom74AYCyM+0gVNimvsVxbWMngPW+zZMGDh8SFqWJtTfxqW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pCs7VktW; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pCs7VktW"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2bd2051167eso20606015ad.1
        for <linux-kselftest@vger.kernel.org>; Fri, 15 May 2026 08:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778858426; x=1779463226; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NuO01rnDl59LMjBMiEYthQHIfPuEwYqZTirIS3MXQR4=;
        b=pCs7VktWrYNy2s8a1Dbxny6CqJSGG7oCQ2jmKpijW4J3UKg+H3uLUcRl/xvnzsck+g
         XH4eUHQwM4KRKOiGcb91BSW8xV6NqLhaoH9SG1ofyscUw5tpnXlOZPEVgDTliVDoULp8
         YPvdHBZ/Ys2D7Qrk88H5zj5r8da10dHm2e111AHHZmYeRG15EtSJSx52Dx8pKnY9IlJ0
         HmUciMPeXFTrkbKh6JLgJpTENmeniqyrCzDKIihtYjmCFLRKG4LIH9HmI8zGVqVOzDiP
         /XvAFKe+92ogf15qtfLtdHoZ5eBpFFRmRFuZOef0Gmmycb6BznamI7Ja7hZzI0AgwsPB
         8SQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778858426; x=1779463226;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NuO01rnDl59LMjBMiEYthQHIfPuEwYqZTirIS3MXQR4=;
        b=hB/y0UtSbghzZgI5ygDotuVGcH8IQrmx0+ZBaI6w2EvqrsC3bpk1VTAgA7KC2hovzI
         IssAty5JggJEHE8lMDzgt5oYIOtozohrixqBMwKUxrqVCEZay+QYEroCSQExM8rqdTze
         6+mgOEvjhdAHIQapYAriZMHLZvXVt4uVa0H1JSqr2GXIeawgLV6nWrIYumUh2Ny4cesQ
         dKR5dWdMRkib0wlpl3qbZ5MAwO3psQfmLTbV1tx1bBLb3MnJBYlfDH2LfxPSUPg2434t
         EDZhx9EzpJKbeaeCSiEtZ53LfWFniEi5pKigvQ1aGr7JdY4fizWG1fYntDzYxOb9tX4t
         Pg9g==
X-Forwarded-Encrypted: i=1; AFNElJ/Aww8rUYMFuA18PW1mcu23FI+c5jleWTFH6WKn2Ds2wKCvvBd3sJw4M+OYPWEIDt3zAf81fRoaiq+OmkjEpX8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBiQsreMyH3HRhrnR2pKrDMvuV3zn+Qyjghr75N61TNYIUUebi
	M/16nNgzOgPiBTKNPHD4ZWMJvkgalYdnd05/JQzShCMdj1ZaV8hBmdRM
X-Gm-Gg: Acq92OHR6g3r5AcYgbin2BZoCBTyvV0FAyqLbJ/c/44TuL4j1CXyR9xZTlLmJxhrl4d
	N6eLO9/+7R+aZcYQITJIICTZ4Nd+ug3dwCWqf0AtiGuB99bD/mkL40lhVQe8P6dSiObc3n3YixE
	kL1GZ1zmDjJCKZ/ujKkGIqiL91emQtnZJYriRC+ZC7q+Ekh64qNKvaI0gDoB/av6IVY/aSTdR5m
	AcruwtXkfKqOmuKhfHxbJj3iufn22HXyNfYhMAlCTXkBNuc8jnU2OuqjzhrpVAusfDMgYFZkpJW
	dCL8Rq/RylrC/wCrtucTngMBGw3QKcXLworzxNi2wDw/3cSeUIMWGxQEVf0fYEmVCK2Ja/6hHFo
	CT23HUq0nUEkhRv1qNOviB4myMzyR+l4JdtPYxZ1e34uSsR5A6C/H2p52Nw9qldff/tbioY6XDJ
	UpLjSgXRb67L8bCzHYZpvxVuk+GvJJT+ie0gVq
X-Received: by 2002:a17:903:388d:b0:2ba:3e50:e3f5 with SMTP id d9443c01a7336-2bd7e9769e2mr50886965ad.30.1778858425344;
        Fri, 15 May 2026 08:20:25 -0700 (PDT)
Received: from ThinkPad-T490.. ([49.207.206.70])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5cfe6487sm63803245ad.54.2026.05.15.08.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 08:20:24 -0700 (PDT)
From: Faisal Bukhari <faisalbukhari523@gmail.com>
To: ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	martin.lau@linux.dev,
	eddyz87@gmail.com,
	memxor@gmail.com,
	shuah@kernel.org
Cc: bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] selftests/bpf: fix tunnel option size in ip6geneve_set_tunnel()
Date: Fri, 15 May 2026 20:48:30 +0530
Message-ID: <20260515151830.711129-1-faisalbukhari523@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Pass the correct size to bpf_skb_set_tunnel_opt() in
ip6geneve_set_tunnel().

sizeof(gopt) returns the size of the pointer instead of the
actual Geneve option structure, resulting in an incorrect
option length being passed to the helper. Use
sizeof(local_gopt) to provide the proper structure size.

Signed-off-by: Faisal Bukhari <faisalbukhari523@gmail.com>
---
 tools/testing/selftests/bpf/progs/test_tunnel_kern.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/bpf/progs/test_tunnel_kern.c b/tools/testing/selftests/bpf/progs/test_tunnel_kern.c
index 30f1de458669d..ca04d1d1ade4e 100644
--- a/tools/testing/selftests/bpf/progs/test_tunnel_kern.c
+++ b/tools/testing/selftests/bpf/progs/test_tunnel_kern.c
@@ -674,7 +674,7 @@ int ip6geneve_set_tunnel(struct __sk_buff *skb)
 	gopt->length = 2; /* 4-byte multiple */
 	*(int *) &gopt->opt_data = bpf_htonl(0xfeedbeef);
 
-	ret = bpf_skb_set_tunnel_opt(skb, gopt, sizeof(gopt));
+	ret = bpf_skb_set_tunnel_opt(skb, gopt, sizeof(local_gopt));
 	if (ret < 0) {
 		log_err(ret);
 		return TC_ACT_SHOT;
-- 
2.43.0

