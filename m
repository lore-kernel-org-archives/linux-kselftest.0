Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7FF63F211A
	for <linux-kselftest@vger.kernel.org>; Wed,  3 Jun 2026 03:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780457352; cv=none; b=H75yrhicZUpD9LnDOL6SFr3rVZWJrRVdRhcPj1xockN/5zvp5VAc+KGf6B+V28hW0KVuxE44HqTAWIEkX5x+t4qlIMWR4GCuTYqcw5hu2s6SDYuL8L/FF7Tb8P6HQOSjK727XSunGolVwVvn10upIHQHD7UZWLqeFTuN/AqmshI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780457352; c=relaxed/simple;
	bh=jG2redhEjCAzt/rTfg+v2gYbLiDjnuNP6eco1Upctx0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XrFirPN3raKZKp2AfG24YuF/6lIDKTzXsnJc1l6jsng7z6YYCgQhslx1hfapIlzsVIY0pJP10zEaEJjwPPgOd0J/9FFvoAOT6uFyjQNmEIvTelJiEqxObeqQv03RkFUR3hh3gmmOlg+Q/+X2wfDEJ+D2r3t78f33lu9LjMKrnwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=lCflXLcv; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="lCflXLcv"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-8ce9df31840so25831956d6.1
        for <linux-kselftest@vger.kernel.org>; Tue, 02 Jun 2026 20:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1780457350; x=1781062150; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EeknQ7K2aMvDWr+2KhWa4BnSPX1nCQezxpcXmui2530=;
        b=lCflXLcvhzy3ULEDF2l/7xPcmX9O6D0UVGqZJgDOvrnCbQ6PH18DqXZt2JIL5bxmNx
         l02ccIVVgglDj1+u91/AAgreclkHHEfYMS735D24zwVQOFUDQlEwnhnOmCUGOw9PufJ8
         rwFleZViMs1N6rTznEwX8G/MKpHTz/iC60f3nqC+fUozhkBhYzG+A+WD7g3kycFHqE2K
         /rtSikOYsEj/uUuJ64rmkhCvSDoKqGJle4K9C6lFnzXl9pn8kNjMJurGbXyA4jHdWi1d
         I2sDiBbmwchzR5w/fvgfEuTOO3/LgbyEzWW73xgQOVuZXev6hmor7frzkiha6m4dmFq0
         0NSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780457350; x=1781062150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EeknQ7K2aMvDWr+2KhWa4BnSPX1nCQezxpcXmui2530=;
        b=LROWETLQqkOMM840iGNOrpEiDU4ZWjzCqqXDiV+nRInzekccChRGHxnO10WEEAUnjY
         bO7BlucK5thjfzkUw0+AJd23Hza7kO0qmmbD/66q1MKW3ocyZKDTcSa9p7TMm0ERFw8T
         P32YKSt2ekYKM2IAngrtZc53eLwKreR91ykK/F6kipW/ECLNgE8Zm9jVSwlcI4P97qDg
         pm1n2XpONDjQHvXWu58zcY7kSvD+gLLGtjfNI2q6OxkIZ+LXRhLUentJ+XlaqRiJnKVc
         VFKlzg/+PZ4jj0VVIJq5hLLprBc1taVikYygleyAZzDQIcDLp6aF1Nh09spDA7hTpgej
         ntlA==
X-Gm-Message-State: AOJu0Yy7k/nsZUVRquRy8u1Q9E0oRmvAjcGkYtPh5AOpLhtq0EIRl64Y
	hx13LUgwWiBNYifwnVB3V1RURcQjxRKyyzP7TI4f8ACAl7Sut+g5PfTbfxlZPrEvVmvifl8c7Uj
	4WyHH
X-Gm-Gg: Acq92OGaT3yqkkvoLPCHs6SaP2xkOXrKllIrbUZ/8aLxb5WPprJR3lEwT7Wh7VaKlO0
	c7Gln9T70wxZZtDBL4vVsYEziUiEy0tUmxG+lQLowcr/kmlvkuM+nAVFY+m8Rh3Wy+iDJmgsKqr
	kumbuAtr9KksciNhpc6sP6M0WQrzcx8K2Ie0Xz5MVbp86pY68z8XSvLFNliHY7bMKSuCjWKHq/l
	ovc//SrryNAo0zIIOqasLC6MUsX3kcel8cGifsu2Ym8ARl7MUjcrMQN9s3H7n+tqhaE9GZvjjuh
	SEv2GZxF/SZaUIB4FX4qnmw3SXM0/fOn/kihtTpskwWSLyrVdYgRxRRY30NAc4sF3aduF8QI47M
	fImPqt5XtCOUjwBWxcPH2AZNkcxXCdTC4cNEeH7cF0ejALv4dg9ebSMX+wJECOqoxcSYerHl/7k
	Psf0Tb9EV6TacHgtXAV2R9qyjT69XFVHTLilWkLEBCJSo7Pa6h5S0EDECtKIwjLw==
X-Received: by 2002:a0c:e086:0:b0:8ce:ade5:e8fd with SMTP id 6a1803df08f44-8cecdf0cdfdmr18753906d6.25.1780457349833;
        Tue, 02 Jun 2026 20:29:09 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8cecd26b3b9sm9244566d6.45.2026.06.02.20.29.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 20:29:09 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: linux-kselftest@vger.kernel.org,
	rppt@kernel.org,
	shuah@kernel.org,
	akpm@linux-foundation.org,
	linux-mm@kvack.org,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	pasha.tatashin@soleen.com,
	dmatlack@google.com,
	kexec@lists.infradead.org,
	pratyush@kernel.org,
	skhawaja@google.com,
	graf@amazon.com
Subject: [PATCH v6 02/13] liveupdate: avoid mixing cleanup guards with goto in luo_session_retrieve_fd
Date: Wed,  3 Jun 2026 03:28:53 +0000
Message-ID: <20260603032905.344462-3-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260603032905.344462-1-pasha.tatashin@soleen.com>
References: <20260603032905.344462-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactoring luo_session_retrieve_fd() to avoid mixing automated
cleanup-style guards with goto-based resource release, which is not
recommended under the Linux kernel coding style.

Reviewed-by: Pratyush Yadav (Google) <pratyush@kernel.org>
Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 kernel/liveupdate/luo_session.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/kernel/liveupdate/luo_session.c b/kernel/liveupdate/luo_session.c
index 5c6cebc6e326..47566db64598 100644
--- a/kernel/liveupdate/luo_session.c
+++ b/kernel/liveupdate/luo_session.c
@@ -291,10 +291,11 @@ static int luo_session_retrieve_fd(struct luo_session *session,
 	if (argp->fd < 0)
 		return argp->fd;
 
-	guard(mutex)(&session->mutex);
+	mutex_lock(&session->mutex);
 	err = luo_retrieve_file(&session->file_set, argp->token, &file);
+	mutex_unlock(&session->mutex);
 	if (err < 0)
-		goto  err_put_fd;
+		goto err_put_fd;
 
 	err = luo_ucmd_respond(ucmd, sizeof(*argp));
 	if (err)
-- 
2.53.0

