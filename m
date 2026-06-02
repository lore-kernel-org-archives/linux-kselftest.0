Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2110D36C9E4
	for <linux-kselftest@vger.kernel.org>; Tue,  2 Jun 2026 03:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780370249; cv=none; b=tY/Bm96dNjvnZBt045yrMBEHSvLO/6kLAoZrwmqNpIMkZra7lwYbn2DYA47CTODO7aRAqraX/A2AucXKm9K9ogR9fezwC0j0knp3sp0K2NmkZUSeUrYKRkGYeNEU0EUHnQoi9VGC9OXBbWw2aT/23ytGkJh1q5WAzxbEKkOZK5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780370249; c=relaxed/simple;
	bh=Iya2BCuDuT2VVt8xOPzvkxqPyMFfGD2vSAsYFx6T0gE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kGkUB+NzjQmGF5tyyEs36L3cpEnx90rrqe0ELqBmNOggMkz/OGTp8T1euC52iKlcljADAUYADr08AJXT+cPQVyysrvNevMDUN0bID7deHWYhTzwLJ9i8/oDKrn3ThSAtJPzqsU2UoyVZxUr7i2VU5kUVxM0i1RBk5g9qSAMiKtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=Rk34jMpN; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="Rk34jMpN"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-51764768c36so9506051cf.0
        for <linux-kselftest@vger.kernel.org>; Mon, 01 Jun 2026 20:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1780370247; x=1780975047; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=flqTP+T3G7cekhEWLkwDVj+JxO0X/Tc2hrAvIJPKbfc=;
        b=Rk34jMpN8cXOVURk1D75tQZ6Ft6v0WA8czJ0pUxB3yhytSwtXBJeaD84zpVvXoSygt
         LFyCe2mICMi29KARtFUPSGuh8xadGvP87OAPxYuUhDPg1lJyaFmaybrsEcPV0tAgq5zS
         Ynvt9AAQaHubZKtRDq4JkgLyu3qiIiXRrFFbPNGmm6S5BMjxV/xYIKMBv16reu0YLZfl
         run5mZCyievQrkJu/ZWjdWqtIAdPGYXLUQ0z8mcKSJuXg1JIV+qh+nLefhtZyQq4LJ2H
         CyCDSp227Ntb2fl4B1m4k4UTT3qKCrkzK2xHN54Q/SAElwoKdpeylAvIa4oft/UW8q18
         bBsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780370247; x=1780975047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=flqTP+T3G7cekhEWLkwDVj+JxO0X/Tc2hrAvIJPKbfc=;
        b=cjzpLfuKmeHGekLorr648DrB0p3TQ28W8v35vTCN2eIqDiapE2Al1sxluRncSK/Euz
         lfV9+FtrDCg/oZbGDXkvORlK44vwS0vDKf9lMYgUGiid1L8MaNfQu0lRaVYDjoqXrJof
         jHTISjFTjXV/B8YmHE9bIAn3AtI0DTWhXL+LL+SyrYikcWoNK/3M3CYzRX96o6QPNo5Q
         Cq3nGPkzvHxeaTVkspDxPaYZmYarCp6zs8EZNQfkYAKeHFWeoXnHUaNznDRlDXJaiOdz
         XiGxxZrskKmd/BPCNaRo2p8wgWGgh6t9vOCT4L9JJVbznfNz3BZh1l6r4IssnHxV23c6
         hE3Q==
X-Gm-Message-State: AOJu0YwMcRI768EduokgwTXyHZ1K14+t+7HFjR4utdFouv5ebaiE4a1w
	mCfmnJmOgBUD1laVnCjKe5NoD7Ug18ChofRd1N948AxfT+t4LjIqfyGHlIGwSs7oswNtQJadEaf
	vjKD2
X-Gm-Gg: Acq92OGHCmZIH8BmgWFPgqYCLitEftX6yLHT1jAXdUgYW+HUK62kONWomFLRP43Gp+Z
	Z0P92hrJzHK9yPgVgIJ5Jh/1jJStexwvr2Dg6BfeqbpWDknMWc224sCy11WB5PNLpv8ndJrU3Hg
	mIepzb7wEqu4UJz3wJw0y4+I0DGnm6u4UC4w3UJpnO1E+TO3ijj7bBIFxbOQJ2ZvhfD0v7hCVbt
	FscNIhJjpDvtgkI6Irxz7Jfswoyp37xFf35itiRHxE2FOJ6aEQA1NU+xXQEv2VhOd4kvm4z43KA
	6r5akukrESQcyrEKmOQDCKNKjamKX3GFCKc69uHpi/q1qsZolJfUM8XJMX9+r6r5FbtOb9+txFr
	BAd3kcz/pVCCU3/pcB4htO6nCa2UDRyUKAPw/TDmUUzwnoCwpvRg/T9qiWD4oTuu441ygMbNsCZ
	aZC9yddm0L2BJdOymfok3cuukzV8RuiTZ0N3FX5M23NFGaEJid34j2Jx1w7Wrg7A==
X-Received: by 2002:a05:622a:251b:b0:50e:635b:5579 with SMTP id d75a77b69052e-5173a73ae37mr218885561cf.19.1780370247179;
        Mon, 01 Jun 2026 20:17:27 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51741b29745sm71219081cf.8.2026.06.01.20.17.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 20:17:26 -0700 (PDT)
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
Subject: [PATCH v5 06/13] liveupdate: Extract luo_session_deserialize_one helper
Date: Tue,  2 Jun 2026 03:17:10 +0000
Message-ID: <20260602031717.197696-7-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260602031717.197696-1-pasha.tatashin@soleen.com>
References: <20260602031717.197696-1-pasha.tatashin@soleen.com>
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
index 3b255ffd1bf1..9f72a8b0a9a8 100644
--- a/kernel/liveupdate/luo_session.c
+++ b/kernel/liveupdate/luo_session.c
@@ -553,6 +553,40 @@ int __init luo_session_setup_incoming(u64 sessions_pa)
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
@@ -584,34 +618,9 @@ int luo_session_deserialize(void)
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

