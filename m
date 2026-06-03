Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA9B23F411A
	for <linux-kselftest@vger.kernel.org>; Wed,  3 Jun 2026 03:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780457358; cv=none; b=RXxZtOftJ1e7/DuFPkH3sK7i0jXlJBbCZSaEX7En+j4QNdeqngxTUJFhGvjyq2Mf4CGzhhTNDHqSADa7vxhkTrhz2djHHq6fjAvRhoFC0/C78bO6tKWTs19JFL9j/a8urE1VSt2R2Rf849+AsxNwNVl2mMPpz6YtJQZMqRToYo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780457358; c=relaxed/simple;
	bh=FlpNYeZf//1t0Q1W/mmEZOxbLRAkN1/PpE/AQRaykXM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iL2+8bQC3XAQOD7E18WFvrbfYVNrjVfATLrPgAmjXpi7ewcys2lu5JXoQcja831hRAuMBUYP6eeIr4Bvvpainzijsg+ne8cMS0iL6K4xEhhpWrHSHSe9FaNuKbzCdBV6AvAt1QHMTPWg2H5jkwhHk0oAoC89YlLtC0KnFYONVgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=bebspVmA; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="bebspVmA"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-5175cb5946dso17206131cf.0
        for <linux-kselftest@vger.kernel.org>; Tue, 02 Jun 2026 20:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1780457356; x=1781062156; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QfziVgpqRfO53l/kiKYNLloUUY6f9C5CrjqJQDvl8iE=;
        b=bebspVmAznl06IYs0jzgCrNjFdT8fCHv6nTAogr41a5XDLXtiUt/5WFIW3qSdyvzxx
         4bocL2l45EFZ9YqD/Fo/BlrcB3R2R1uefBnRMrYiO6R9CvuXPwqDKk9dlzNEq0Jcd8WP
         G/L/pEzDE88CwMMX8HNti4hVFY4C2PXs7n1ohqTtKVVSsE8YMSswVwElBnEOsNnwwrfs
         et/W4aY0IUOQGhULAkDpoR3YAME92CIab/rFVHCBSJYyzoKLyA5U2B/FXdlvpWr3NBcy
         VR2yZMqFLKn/K56mHZaDFqddXHwi/DFm/hNZoY86SVeypjuHzIKTllLwa4IFSuSTB2KR
         KKRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780457356; x=1781062156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QfziVgpqRfO53l/kiKYNLloUUY6f9C5CrjqJQDvl8iE=;
        b=bVCos9bFdW++A7KdA0PeVk5gklaI5qypqKFH8yvlf6fAkQ/iSyhrpaY1UPiGizp4cr
         usBPkCIM1q5YbtYp09fmtzbfO/zZe9mJIH9V6vVbC2MEQubJj9bI3DrgVQ5hi77OHpuT
         x/Auhuam7bkvM9nRg/m+Cxxrej1s+CNrzJ76Z/ajLCLxeDBYNzeKsJPxjgt4T4S3gQpZ
         oQywmZV6pYGFceGKhgotifdTgk+GHfbTgT8YdgSKGfRhkppJLYRltV2dAI0Vy1T6luE3
         mS4yMUTW0duDAiYdxeR2PGk4ZX3pHuQT02iIN2HbPj07zbZ63dXrzmQCjkrpZR1xONxT
         LrcA==
X-Gm-Message-State: AOJu0YybPEwB1VlMaEa3m1aqDhwpFjiuCA9A0EJwB33UcwW3GDic1e0m
	BfCKAM2063DpGPBQvUeZRZJ6ThX6HuIgyLBYXxuPxE6NQWPZPfc1BYqp8cCoa0OwrPFDTGJ8Km8
	Yecfu
X-Gm-Gg: Acq92OEuPaUkitt4keN2XfIkgfGzxxwancrUmzz02qn8zEZQz2QndTlVnEMFQw50maw
	FMVgljCIjmPO4r5q8lv6KVPkync3RuESXaE1S/cHW6eclK4wbtGIuizNAdrXzeWMPWMlXdN+wSm
	qjb3nt5lwQQpbragI++Vw1eIU6V7yP1Xl0609QA4vElHFCGCMzw8K4G+e8ZKKe67CWLx0+Ol6kg
	BjRe1GDFxi3pJFiIZLaFOBfXTk5DcXbfaK1xXaW6DUyINinbgWQFWUMuYLJhb9ikeBVriwxwvhL
	8Dr+pHaEKosgfN2UnXVnsLLnNOXoH37XTRcxLg4WuSu2MVTfM5y+cEGqJKRDjxtJCFJTIU5ypMv
	Q8210TAP7eGnQjFKZ9Uq/QbYyT44IeqqeFfUyjXGt5L5fDQeyEnRfKq1Ef05FwDlf6Ci5jfsqwY
	U9aBbpaQCJK2atwcj6/sWAP7OXXfh55rjHX50QXlBU7arUnPVy1ho+AW1pqYt5Tw==
X-Received: by 2002:a05:622a:1c19:b0:516:cfb9:2856 with SMTP id d75a77b69052e-51778683f95mr26668491cf.31.1780457355655;
        Tue, 02 Jun 2026 20:29:15 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8cecd26b3b9sm9244566d6.45.2026.06.02.20.29.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 20:29:15 -0700 (PDT)
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
Subject: [PATCH v6 06/13] liveupdate: Extract luo_session_deserialize_one helper
Date: Wed,  3 Jun 2026 03:28:57 +0000
Message-ID: <20260603032905.344462-7-pasha.tatashin@soleen.com>
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

Extract the logic for deserializing single entries for sessions into
separate helper functions. In preparation to a linked-block
serialization for sessions.

This is a pure code movement, no other changes intended.

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Reviewed-by: Pratyush Yadav (Google) <pratyush@kernel.org>
Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 kernel/liveupdate/luo_session.c | 63 +++++++++++++++++++--------------
 1 file changed, 36 insertions(+), 27 deletions(-)

diff --git a/kernel/liveupdate/luo_session.c b/kernel/liveupdate/luo_session.c
index 85782c6f3d6c..1cd315e0f6de 100644
--- a/kernel/liveupdate/luo_session.c
+++ b/kernel/liveupdate/luo_session.c
@@ -555,6 +555,40 @@ int __init luo_session_setup_incoming(u64 sessions_pa)
 	return 0;
 }
 
+static int luo_session_deserialize_one(struct luo_session_header *sh,
+				       struct luo_session_ser *ser)
+{
+	struct luo_session *session;
+	int err;
+
+	session = luo_session_alloc(ser->name);
+	if (IS_ERR(session)) {
+		pr_warn("Failed to allocate session [%.*s] during deserialization %pe\n",
+			(int)sizeof(ser->name), ser->name, session);
+		return PTR_ERR(session);
+	}
+
+	err = luo_session_insert(sh, session);
+	if (err) {
+		pr_warn("Failed to insert session [%s] %pe\n",
+			session->name, ERR_PTR(err));
+		luo_session_free(session);
+		return err;
+	}
+
+	scoped_guard(mutex, &session->mutex) {
+		err = luo_file_deserialize(&session->file_set,
+					   &ser->file_set_ser);
+	}
+	if (err) {
+		pr_warn("Failed to deserialize files for session [%s] %pe\n",
+			session->name, ERR_PTR(err));
+		return err;
+	}
+
+	return 0;
+}
+
 int luo_session_deserialize(void)
 {
 	struct luo_session_header *sh = &luo_session_global.incoming;
@@ -586,34 +620,9 @@ int luo_session_deserialize(void)
 	 * reliably reset devices and reclaim memory.
 	 */
 	for (int i = 0; i < sh->header_ser->count; i++) {
-		struct luo_session *session;
-
-		session = luo_session_alloc(sh->ser[i].name);
-		if (IS_ERR(session)) {
-			pr_warn("Failed to allocate session [%.*s] during deserialization %pe\n",
-				(int)sizeof(sh->ser[i].name),
-				sh->ser[i].name, session);
-			err = PTR_ERR(session);
-			goto save_err;
-		}
-
-		err = luo_session_insert(sh, session);
-		if (err) {
-			pr_warn("Failed to insert session [%s] %pe\n",
-				session->name, ERR_PTR(err));
-			luo_session_free(session);
-			goto save_err;
-		}
-
-		scoped_guard(mutex, &session->mutex) {
-			err = luo_file_deserialize(&session->file_set,
-						   &sh->ser[i].file_set_ser);
-		}
-		if (err) {
-			pr_warn("Failed to deserialize files for session [%s] %pe\n",
-				session->name, ERR_PTR(err));
+		err = luo_session_deserialize_one(sh, &sh->ser[i]);
+		if (err)
 			goto save_err;
-		}
 	}
 
 	kho_restore_free(sh->header_ser);
-- 
2.53.0

