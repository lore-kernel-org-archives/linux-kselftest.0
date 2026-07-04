Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49BED3AFAFE
	for <linux-kselftest@vger.kernel.org>; Sat,  4 Jul 2026 12:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783168199; cv=none; b=b8YiI8ibb4s2RQ/lXJMDctaxRNLc6wcEVE9yIFXQeWJHIiE80PVlqljg9awYzCXJllVbJDO3WzaOZ2BdfguiQ7t+l2CQ7KcvWjx3fb+11Bzb/hRvneLEjhJXH9At53n46tdP6gnJ3/PN3lv+9XjjbdYDaU8SiEprLxDLUjKN0oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783168199; c=relaxed/simple;
	bh=cP16KMgkXs8B4/PcMRS86NXP4aXKyjKM/OK1Wgw7CsA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OHl0Lr+SV2zbKU/EKduz5Dj7BgM1GEYMWYGbTVN8HSL3N3sAA/4foBbdqBesBu2EYlPZ/1q5q9ymoY8KyCWD2Hi+Q59rPDk06ZLF/vmv4EGdyWFfsgoZxX3w0A14+jP3OGXP0XzbF4OpoOufViUBkEe42INBaiqGzc43aj52E18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gGV3DI7J; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gGV3DI7J"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-36b9d265355so1064942a91.2
        for <linux-kselftest@vger.kernel.org>; Sat, 04 Jul 2026 05:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783168192; x=1783772992; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0/l4Gk6A9ZTMBN6K1Vyblne4TPYpWKLwwp9lrwI82n8=;
        b=gGV3DI7JVJDuDYwS0d77zVjz377tsge/PytYgzedzFhDKlrj/lBaZFCMWaCC3JCWiP
         tNnDwMZ5e+zxIVdKJVeks7f/mkGreRUDn86qaBBQuXvZ91W3CKvY3sPOiwTajYQVlTK1
         MqKDgAuRqx2jFX8L+uJrd7jfyTsRPg3MYMliP2G+XvGq15125bOJ2FqCbI+Hj9ILSKuO
         YjROAr8k7Fk77ch0elwo01SHbedHLO1Rbo+mavHyz0dEJzqt5N1lAuTSnRhMJUGgX0jS
         pqM2tTxIfojZtsZXjsxhD0Ks2FfWT3DES5fylGSZqOJIBa7lFpBB6x5VdwW1P57VCv+t
         u52g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783168192; x=1783772992;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0/l4Gk6A9ZTMBN6K1Vyblne4TPYpWKLwwp9lrwI82n8=;
        b=rpYri5DuZlTOAV2mctr0VBip10IlbVfFI7E2ghhRCgOsflSA8N7c+86GeD4d6FQAss
         Kj+1110eoZsTQPnSCrvmOCClbVb7RItDaHKvv/fuTtTNDskMVvn36slVr4gWW/0tI9At
         aO849asCCsjbRYfHjQvZmx6vOfYlS9G1epVigTeHlV0JhyoGo0C6bvL/vh8CNxjkWDVb
         NGicihqPhDW2xZ+TThCcwV+gxvIV5qJVxAfvzdXTl4gu/+osY0welNUBg1niz7sXecSr
         0YGTi7rRSPVVzjUWLzTesdPH/tyLfEBi0awQjf2I32Qvi2JLY+RvEJ/EJNu09aQn9Nhl
         lO3Q==
X-Forwarded-Encrypted: i=1; AHgh+RqdSa7l2D09Oe8GTlH0a3DSQLLXq4WmFJRfwvlUN7HKQs/9z1TjKRR/GbB928WZATQ/Omj6c8W1cIOO7GYoCos=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2wKZxq/h1JNaqPsMbs7OgGpgbc6yXmQu7m8AKQsipmWgWaEyu
	q4qzsVwUWzGIO9NFrxJj2SK1M03mNa1gdLNEeBfYwdywm9qTfbjI1KWG
X-Gm-Gg: AfdE7cldJMoEKRv5PxcVc9/42CGo8BAYFKn66KOmEeoumW03bSNT7jYrN87e4rq6OZE
	XchYJQ6ucAKbLjPO2CR/y+1u+upXqyx40eBoj//veIfJa0VbQ/tzPlyS16y9LTPYCswRmIPpDPD
	AEfaBbQz8wngE1Q/ZTupNzqaU4i0ruoEGTlX3Of1EkcU/6Fl/LUVgCEAQiD9+UfTTlSJ+D41gIg
	aZfnO8NzhO+JYi4HO2Z8QzXP5Z8eUrY97EvwF82xRwqoFQbqM1RW8UEXzdtJa5A57aPiVuo4Rar
	BbZzXsuBko++rzCoDKoZ4WiOSfxOCRf0lpK89fNP46I3mnu/Ak359m/E+9ILTPI6WJGuOf2QJrS
	zCVJ+eR5j2hDeTsKNWeYnK6y0QF0koALV/VgCWvo4Imq1cIunvEFGARjiAyTMT8n3H1pASUde2Z
	Daxa8dNpRHdjhYt0d7qvoJDeHA1ugKJ/eaZeJMwrRpkkk8i/NsR60LQ27OVA==
X-Received: by 2002:a17:90b:3a50:b0:381:149:cf91 with SMTP id 98e67ed59e1d1-3829f2f84b2mr3070002a91.26.1783168191679;
        Sat, 04 Jul 2026 05:29:51 -0700 (PDT)
Received: from fedora.mrout-thinkpadp16vgen1.punetw6.csb ([103.133.229.222])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f3d92c44bsm10265522eec.19.2026.07.04.05.29.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 05:29:51 -0700 (PDT)
From: Malaya Kumar Rout <malayarout91@gmail.com>
To: andrii@kernel.org,
	daniel@iogearbox.net,
	martin.lau@linux.dev
Cc: Malaya Kumar Rout <malayarout91@gmail.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Shuah Khan <shuah@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] selftests/bpf: Fix memory leak in msg_alloc_iov error path
Date: Sat,  4 Jul 2026 17:59:35 +0530
Message-ID: <20260704122936.102394-1-malayarout91@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <7f3e0f9992a32264f6c7cf00f2ef3ce87a0a6fbd6703084aff3de68cda77dc9c@mail.kernel.org>
References: <7f3e0f9992a32264f6c7cf00f2ef3ce87a0a6fbd6703084aff3de68cda77dc9c@mail.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In msg_alloc_iov(), when calloc() fails for an individual iov_base
allocation, the error path frees all previously allocated iov_base
entries but fails to free the iov array itself that was allocated
with calloc() at the beginning of the function. This results in a
memory leak of the iov array.

Add free(iov) in the unwind_iov error path to ensure proper cleanup
of all allocated memory.

Fixes: 753fb2ee0934 ("bpf: sockmap, add msg_peek tests to test_sockmap")
Signed-off-by: Malaya Kumar Rout <malayarout91@gmail.com>
---
 tools/testing/selftests/bpf/test_sockmap.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/bpf/test_sockmap.c b/tools/testing/selftests/bpf/test_sockmap.c
index ac814eb63edb..3e6be455d158 100644
--- a/tools/testing/selftests/bpf/test_sockmap.c
+++ b/tools/testing/selftests/bpf/test_sockmap.c
@@ -436,6 +436,7 @@ static int msg_alloc_iov(struct msghdr *msg,
 unwind_iov:
 	for (i--; i >= 0 ; i--)
 		free(msg->msg_iov[i].iov_base);
+	free(iov);
 	return -ENOMEM;
 }
 
-- 
2.54.0

