Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 371A93D301A
	for <linux-kselftest@vger.kernel.org>; Thu, 14 May 2026 22:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778797599; cv=none; b=tUGd/ZrYHo/1slTg/alKg3WY8NR9fY+cLS1mArSpAxgqF9VG+JG8RaXqZ3lMqE4vKhn9biQILXaVewhDmBWQD3W6ZGTKhf2H1tyeWlj8/zRIJhZ0PmjUjELY0b2PT9ACVhj1FuoTgYoLCkBXUGEZz64fNioswrMzTsnELwSQWMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778797599; c=relaxed/simple;
	bh=sVZ5o7p+/qtFwBG8i7ARh0384/n8GSnFc4REGXxfxJs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oQDgQNp5ZvnmmwJYsGrlBqudMUKLf5o0DT4s6o4OfGGpYj6t5U/vsdJVSEutF5cIQ3oAF0/heWYPjGU7UgYnVgK9ExG5R7T9SIUi0W/qtfTE/JTxbsWuEtgl1VBoNbj8L6Ubpwuro9nevJDmqzYsY+/zKyLt33OhVL2uCKKNb80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=bKUr1cjh; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="bKUr1cjh"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-512f09ecc67so59903231cf.3
        for <linux-kselftest@vger.kernel.org>; Thu, 14 May 2026 15:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1778797597; x=1779402397; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5DzA3L8/isnr0sHad5OpiNWdq+EP7DXQ1j7lGoEnI0Q=;
        b=bKUr1cjhQpiTyrgFEa9EdedLg4DPjFrY748LQdexu81c0WrSiBv4Bb48KliyEvs6wN
         nvLUhBO4NOYOm814+k6le7MG1+D+A1wcbWEGl8kyans1YuYCrpqv/rLwe1ivQ/Li6J1B
         RuQA75xm22QzOY/POXVBn9UbVfy+mUoKtdU+abR0e4O5YQjiJch7Y6E52hmDJmoTlXme
         3k5eOkZnJnf+ItaZePV0Hu4TxhqAGpELcgmJem0i2KuX14R19HQ+lUHN/HO2XhErNmC0
         gN6MvAy/373/+wee8bOiKyAVf9d22ayO5KxhEt3Yz5/knivhQz/RcSeqyU2OF8ysYMKj
         Gyvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778797597; x=1779402397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5DzA3L8/isnr0sHad5OpiNWdq+EP7DXQ1j7lGoEnI0Q=;
        b=Zp2bb9nsJGKL7JYpVhL6X0rZtItmK9/OrGXvNDCv57moiTEQDCOcrjMKBglsQ3T19H
         DoCytAn8GVSQLrOC6j3xrZ2lJuiCZ461HnGwRpK4L58TYgUC4vmR1omIcSj+01Jzt4QZ
         AV0O2VlTBaCwgRI7TYWkrA70eIglSLDaacqvRymxUb7M3UUlS7G4FHzIRgTmPQBgQvbd
         dMMff97mg0KOxXxKQ7ktC+OJ9Ez061JGBCFdK2Kck2XU0mjdYT3f32iYjk5XEg/MQhz+
         nPZK7WmkIQDZ0jbWm+kaMFhZCm1tTsnmU8XJwE5jXBQirHR23j6ZQtgbIZ266LBeCGGZ
         fmSw==
X-Gm-Message-State: AOJu0Ywqjcfd47a/0guiBYtI/3J0Mf7hABIzhNnFYdwYXRIVf9lX+qas
	uICLpb7t2+cW4SVYJ9Yh6Y/sbmGtFXnHtgF97E3/7Jh//+ZBpw85mVJ9Ye/4tZXOmRbGg04jaod
	7NVJOdBA=
X-Gm-Gg: Acq92OHr/zdtWmJRMyhtDebvZqlYmLejS3NWviFnBK2r/STwRaP74/sihZ4OPEx3ZP6
	s0MdMNkwkCS++kzQgWozcbmU6NheJkgBnj6zm1l2UZgvLo4/756BXP5dbgbpOA7+2SU4X+IvB2H
	7lhdMqJSEl9dT1uPcqwYy90aGVRMuVfLgj55xMHrVs734WgnljS4Aq3sFq5NbxUOvr3GovlEQyh
	Hy2kLqbfqiTBuQtSlL8ubOUm7GBeu1bvcm665PlCuxZLigVZUww4TouB0xAeo6hPLkZaFzkJ2UQ
	xCcwXXMjJzh1xFgvBAA6Oh/mS1Ni0HPBiudWNm8+oBDjozOG9dDb4N7Y2AEU8lHa4/7GNAm/Ysn
	vfkcdw4+BhzXwVPU5MibD47Tvy1GLhlLFG45XNKz/TPIK7AsTF7sg8xiO8psOx7TuZHXOeZMzlZ
	N6XRMDqVcb74jkiyDAFI5H/q+rE1n5kIffCxooL1ddY6rs+6jIP/8=
X-Received: by 2002:a05:622a:1814:b0:50b:893f:7d93 with SMTP id d75a77b69052e-5165a00061amr19897201cf.2.1778797597005;
        Thu, 14 May 2026 15:26:37 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-516456ba92fsm28671901cf.9.2026.05.14.15.26.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 15:26:35 -0700 (PDT)
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
Subject: [PATCH v2 03/10] liveupdate: Extract luo_session_deserialize_one helper
Date: Thu, 14 May 2026 22:26:21 +0000
Message-ID: <20260514222628.931312-4-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260514222628.931312-1-pasha.tatashin@soleen.com>
References: <20260514222628.931312-1-pasha.tatashin@soleen.com>
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

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 kernel/liveupdate/luo_session.c | 62 +++++++++++++++++++--------------
 1 file changed, 36 insertions(+), 26 deletions(-)

diff --git a/kernel/liveupdate/luo_session.c b/kernel/liveupdate/luo_session.c
index 915ab9ce0f34..c08733a328bc 100644
--- a/kernel/liveupdate/luo_session.c
+++ b/kernel/liveupdate/luo_session.c
@@ -489,6 +489,40 @@ int __init luo_session_setup_incoming(u64 sessions_pa)
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
@@ -519,33 +553,9 @@ int luo_session_deserialize(void)
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
-			return PTR_ERR(session);
-		}
-
-		err = luo_session_insert(sh, session);
-		if (err) {
-			pr_warn("Failed to insert session [%s] %pe\n",
-				session->name, ERR_PTR(err));
-			luo_session_free(session);
-			return err;
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
 			return err;
-		}
 	}
 
 	kho_restore_free(sh->header_ser);
-- 
2.53.0

