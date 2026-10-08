Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C1733A0B05
	for <linux-kselftest@vger.kernel.org>; Thu,  8 Oct 2026 14:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791469653; cv=none; b=CXgbC8g6pmFZT0Yq9q5XmsNZrSsnWQCo/rAP4NeB9BngVib5YP8iQPywseJK0F26tgDpSzMju8UKysR9gs/MNZi5fiN8ufbyKDQUTXQOAA8hEYWFaB4YpR7NksiZt4heiqMdtjF8whL6eN/R2AEsOanPCBR5Jz9N/gfDiEC/hus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791469653; c=relaxed/simple;
	bh=FQdyiMqRRKM3xhoD2pvA/tqeaw4HSxE3GF3abkaMZII=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YFN8OWmSC7Rz//kIcEwbjOlxgauEczgVzwUgZizwnlJFlx8NWKYKjQTbKMMKEgQhGfcF8j91yxqdcirEYYmKgZe0VZnt7tORItlKJ1rMiInhTwcXGRocAcokh2LQi9ya/8iV3nBbyPoohhDGhp7H7ivGNnAlPDizQnXZePJOzFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WBKwMFVa; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WBKwMFVa"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a018dc1f98so26440475e9.3
        for <linux-kselftest@vger.kernel.org>; Thu, 08 Oct 2026 07:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791469650; x=1792074450; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZH737C9cPTnwYSjzXIKICQsHNjn8aaX+b4wWMoEQsIo=;
        b=WBKwMFVaUzvEiiDSXZo/liwE6v/ODUbm7SKn8h66xYDFfUR/mrp5y5dsKCd4v9ZRpF
         FwN20ev4t4pqszep9YSP1EA0r+fHoMg2Jngr475mQP7JEjGxXA4sd9nrz7kiitri8+ZB
         u3fVarsBE6qq0zxgYO2xe0/+sEPYQqkoIMUHhU+lsV8BCPZ+2zSji9V68sPvjZ+qf3/p
         XW01Pk44IstC+LwAttikGvLOIDjNvAMs5V1JkOluaiExxDRfDGLYuvMNLlXWpkjQBOz6
         PkwkMb2+Dal+GvpHeieEV7dfDb27WBgE0CXKVfgtB2uiL8vzVyLB6mUGCEv29PAGWnaI
         MxNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791469650; x=1792074450;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZH737C9cPTnwYSjzXIKICQsHNjn8aaX+b4wWMoEQsIo=;
        b=Fx/Ik24s+aqOBasqrMUOmJRx0QHM4sxHp6wCqqKfFkBDzv6jRrd5ZaP3puKIwntKS7
         1ir0dGG1prjHOsnSULiFqCo4Iy0zhzGutcgJiTmEgnTjTfI4cDBNRR/2tfROIuLZgiav
         xjDCBQ/Mzvg1E4Adjdq35V/mDqbiqKZkLhDpuIq9ohSqcIvSY5Rg0hhtXq7j8hi4Ao6f
         R1sZ9dwgYl6ZsjQx0gIAb32qN2+rKhniCMRoD29dH6iJBisiJJiQvcxQ8naan25+y5CS
         xJwOR+z5qBezoL6Fuhw+L9vAUZNJ9tgS0GBlXWJ0hUEjZlOXakSriN00lRO0TgjxUIo5
         g15g==
X-Forwarded-Encrypted: i=1; AKwUvBxfKAj/TsFMc3VSDmkYdfD/FSLwRqxgweMwBtrDPN4eTeSlwHz3a3fNQaHiIcGqQJHGyvbxzpp1a8+MnlXZy3c=@vger.kernel.org
X-Gm-Message-State: AFuF++mO8eTIjDHYC7MTXf6VeXIs0CrJoGmlgoa8td2pXscHpoSP0lk/
	/GpE66M116bHoXxi4xf98/QRFCZQZIc6fqagAuzNt15rggib53AEXQ7w28Ukc6Dn
X-Gm-Gg: AYBFou12InMQ41izaOEporMsWVR3+1Dx3FzHYXhYW+hj5a1QCjJHRFijB3yaSRmyo32
	WoyYZi+l8TDsayKZwamC5bWVL/2oj35p3UrQr39g8yTQgRrJIK3Saro78BbqViJoiIbvolLBmg6
	5Q//lNoLFP5OaCho7jSHAo8BCk2R5vcS0AVCjeBgUV7BFZUJnBPDnkWxXakoIusT5xMzZcegFSk
	VidNEZ8ZVywBsbEx2Kt15IUcf+5QC/O4lEC7ZojXvFUk+OBoFSoljo1Jt1Ddk+m+I0mcY0XczVj
	whuR60h87IyhuuvlirzuLgKsGE+S/JzsckW1LKcBbCA+QSawP6PwwbvNAlYY1FiLaWlryeHxO0q
	UGP+Fl3ksO68UV2b/xpYny8LX3pZVG2UmhPAZM3ruSc7hjXnfHOhYvqMKLd4wdAviSSLyXkxjAq
	ErihUF4FZMb3IDm0/dIKLexDIr6RI1x5cVwQsgmXRm7e85ufikwl/IBQGwseptS72r90G+ESaqX
	ADmGfetqobA1Z26sp5aOlI=
X-Received: by 2002:a05:600c:4ec9:b0:49f:e941:d6e with SMTP id 5b1f17b1804b1-4a18043b30emr100122925e9.21.1791469649559;
        Thu, 08 Oct 2026 07:27:29 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1802cdf24sm96272685e9.2.2026.10.08.07.27.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 07:27:29 -0700 (PDT)
From: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
To: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>
Cc: Wang Yan <wangyan01@kylinos.cn>,
	linux-kselftest@vger.kernel.org,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack@google.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 19/27] selftests/landlock: Fix off-by-one in regex_escape()
Date: Thu,  8 Oct 2026 16:25:48 +0200
Message-ID: <20261008142604.39107-21-gnoack3000@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261008142604.39107-2-gnoack3000@gmail.com>
References: <20261008142604.39107-2-gnoack3000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The final check in regex_escape() was off by one byte
and should require one byte less to put the NUL byte.

Assisted-by: LLM
Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---
 tools/testing/selftests/landlock/common.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/landlock/common.h b/tools/testing/selftests/landlock/common.h
index 91842f618a3a..ae6a0eb8e343 100644
--- a/tools/testing/selftests/landlock/common.h
+++ b/tools/testing/selftests/landlock/common.h
@@ -294,7 +294,7 @@ static __maybe_unused ssize_t regex_escape(const char *const src, char *dst,
 			*d++ = *s;
 		}
 	}
-	if (d >= dst + dst_size - 1)
+	if (d >= dst + dst_size)
 		goto err_nomem;
 
 	*d = '\0';
-- 
2.56.0

