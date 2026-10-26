Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792979393;
	b=A02PlbULmrBClAtEQc+6U6dPp0CBTymR3rWXur7zXMWrprwhursWVxHOhG5QdUfWoDE7
	 zEuWC/FSfoz1Olzdh98IjTEAk1bLx3rIu9qrTfkDwB1g89XJepiUcp+AS58qZ2odCQ46N
	 ngur/DuSCJV9GPYgAu8b36vrnpCLHPLDsPwkDPwm5x8q6zLpZR7eZOqIQeZ9zoEgxib8/
	 olko/Sn7RJbygbvZWgVKkrqRuW7zAUbxj8Y2D/QtyfINtsnQUM2+ppPsoGR0MCGwxLer1
	 1M1u+Ce7NuMipEh4tCoxMc1kERsXpR/CAjDWX3SAVTt2RDX1fNSe+kqkuox6QuJEfUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792979393;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=Gj50Wyl35b8FQCs8zNwzAdmPqWzyuGVVyabxqbOdDKA=;
	b=odzTl9Nisl29oMSuC9jCPMkkT25X/Fd8z1lOtSbWYpxD70yNgCpZeZxPrCDCrbdUwhP4
	 zFh6u7mpYZn8LJVqVVbnUIOtM/PtaC8ShmtvhFndzj7PVOpAoUIqcmA5BKB8tRxgZ0dQv
	 FnANCFavaM73lnv+fOu5li/xUGGPmTomzDkxn4ezEtCzQgtclf01jKQGyBs+k956/JVZ/
	 AhHrQ1VeRbE9mn27rN9S9yLS3ua6MsDqtmgYtvt6lleIEkO5jgDva0V6iiWxQJz79EOLi
	 VQQbM/Nrq5QCa65ZiVm/0Ezzg+fNYlu83GizX8QKgezMtObixpHH2tpLfjKwCdyrmdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=BeqGHU89;
	arc=none smtp.remote-ip=209.85.217.42
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E11F606A323
	for <linux-kselftest@vger.kernel.org>; Mon, 26 Oct 2026 01:49:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E11F606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=BeqGHU89
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-745497ac8fcso1046963137.0
        for <linux-kselftest@vger.kernel.org>; Sun, 25 Oct 2026 18:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1792979392; x=1793584192; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gj50Wyl35b8FQCs8zNwzAdmPqWzyuGVVyabxqbOdDKA=;
        b=BeqGHU89LBfAlIk5G7oO1nbbaMiFFoISCvQgV4cf/SKVcXL2ujX8i74vaUa73ZQT6/
         I1mnrJhqYcJ+2B0vcrjtCmdH2FSRoiAYx2+uCUOIhWs+GiNNorkrLnKzhamCL25WM+sf
         2lkzm9woyoMvmzOMSUMkVFYVdDE8DM8JSrI/T1jtwWRMf5ffv7jkFySsK3u20r0aKtDv
         zHd0unSINCMopDNpxDJn4l7zfDs1aOWaM2yDR9aMHZO2VJJrxS5f7KXcQWDRgucfOGgp
         lMAYhjBrPPaZsAOQmWbry+C7CetgMu5onO1z6UEaBjHkmwifHQd9NriCGAwlOsnVQS4U
         J1iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792979392; x=1793584192;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gj50Wyl35b8FQCs8zNwzAdmPqWzyuGVVyabxqbOdDKA=;
        b=UNjDgKAJ+NMI+MsfchXpmM4Q/V7Yem3dKVAFIYClYWVO/N8UU48lMNH1BX6LleTDdJ
         wvvlyIyDdB7PPl8eTas/jdBY9ReyCzxRor5i+gsjoW50zvvwr1bIcobmUYw9HJDSLj/7
         gx28Wt2plinUJu9+fhILvUAAqWGS5ATDdvvKeOI5q2blfZ0PbOAhmlUfVXf7jSreIH9Z
         ppKey1PfuoSJVbtlzXXeo63lrBl9pZlsmpbh9PULrgveYsVV0SOAzbD9Ieizx2fmeG4V
         28T+q6x3gp4BmNfWPw0KCI/IaU8HSvzAZjBeDl2SjNVZfimULd+3Y/Tw38vtBu5gQej+
         snvQ==
X-Gm-Message-State: AFq9FYI1M6Ts1EbL77qQtSh1gFitkmcHl/ImYn65GyAl4Ixv51yufibB
	bE6aBqJrETtoR2sVkvv5jePCZ5bFpm6UehR96r/Q6LkS+iunNFIEFoRTlFp/XqYeVQQ7jeZNM7b
	oRy2I
X-Gm-Gg: AYBFou1Wm7vuA4TyPOyrxaGIldFtRqd+lTjYhxEw9Tn70rNUTKFFQFSbzmiZ489PBVg
	5lRI7IM2NNUeUngC3VIDpX/rXxpahzEi6OSdtR9NCnQRD3iQ+YD97vhXzWAlcJ29haKg367JNu+
	0o1ovdvQj+vkoj+us25j/Ac6+XLou/HpadDLe4wISiB6FfZ7eFAWYdCwj2hDB/Xv5opYOla4siD
	cepj7TcfXbZqw8X0OyT60RhUU3SAKDxasec/AxVIsMqpfIfIZVDw58LLxyrMNvheoxVekytBXlM
	H4Iq8dW2b1ndGEEDT7nM0e0PEMBZTY43SY3o2048AO8ai8IhnYLih6BroXr/eohNXkvW6yjbfiY
	LqQahnjtswfFvb0DOy0Fo0KLJf1WeiB52iHPQFXycuNGQji1CJAv5Igy5UcpUTNMVzriiDzWsu9
	cqjWbg+aEfBSmL7nid6k897aSlBzjsDYURAypR2+069II6hR9btXZLsi5Uy54pFE5DGR2C2yffA
	HpcaDCJY6icN919jVW6W+L0CYBeqW1elgk0v/5WGjT2WM9OZgU3+rvfTq3lqRiqtzwQW2+wbqnc
	qZfGgsAA5GeioO4jeYtT5SbhvXYCHbGITUfCvagFiUWvDBIlVxIKVzxDakCoclGLlptnou4DBct
	B
X-Received: by 2002:a05:6102:38ce:b0:7a6:b8fe:e834 with SMTP id ada2fe7eead31-7ce5cd91472mr1215927137.27.1792979391619;
        Sun, 25 Oct 2026 18:49:51 -0700 (PDT)
Received: from soleen.c.googlers.com.com (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7ce5df73970sm6099917137.1.2026.10.25.18.49.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 18:49:51 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: linux-kselftest@vger.kernel.org,
	rppt@kernel.org,
	shuah@kernel.org,
	akpm@linux-foundation.org,
	linux-mm@kvack.org,
	vipinsh@google.com,
	linux-kernel@vger.kernel.org,
	pasha.tatashin@soleen.com,
	dmatlack@google.com,
	kexec@lists.infradead.org,
	pratyush@kernel.org,
	graf@amazon.com
Subject: [PATCH v4 1/3] liveupdate: Move file_set_ser handling to session serialization helpers
Date: Sun, 25 Oct 2026 21:49:44 -0400
Message-ID: <20261026014948.162559-2-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
In-Reply-To: <20261026014948.162559-1-pasha.tatashin@soleen.com>
References: <20261026014948.162559-1-pasha.tatashin@soleen.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Currently, struct luo_session_ser is populated and cleared across two
layers: luo_session_serialize() writes and clears ser->name, while
luo_file_freeze() and luo_file_unfreeze() write and clear
ser->file_set_ser.

In preparation for allowing userspace to freeze a session explicitly
before kexec reboot, luo_file_freeze() and luo_file_unfreeze() need to
be called on session->file_set before any struct luo_session_ser entry
is reserved in luo_session_serialize().

Drop the struct luo_file_set_ser pointer parameter from
luo_file_freeze() and luo_file_unfreeze(), and rename
luo_session_freeze_one() and luo_session_unfreeze_one() to
luo_session_serialize_one() and luo_session_unserialize_one() so that
all fields of struct luo_session_ser are populated and cleared in one
place.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 kernel/liveupdate/luo_file.c     | 24 ++++++++----------------
 kernel/liveupdate/luo_internal.h |  6 ++----
 kernel/liveupdate/luo_session.c  | 31 ++++++++++++++++++++-----------
 3 files changed, 30 insertions(+), 31 deletions(-)

diff --git a/kernel/liveupdate/luo_file.c b/kernel/liveupdate/luo_file.c
index a39992da504f..988eb313a135 100644
--- a/kernel/liveupdate/luo_file.c
+++ b/kernel/liveupdate/luo_file.c
@@ -440,8 +440,7 @@ static void __luo_file_unfreeze(struct luo_file_set *file_set,
 
 /**
  * luo_file_freeze - Freezes all preserved files and serializes their metadata.
- * @file_set:     The file_set whose files are to be frozen.
- * @file_set_ser: Where to put the serialized file_set.
+ * @file_set: The file_set whose files are to be frozen.
  *
  * This function is called from the reboot() syscall path, just before the
  * kernel transitions to the new image via kexec. Its purpose is to perform the
@@ -457,8 +456,8 @@ static void __luo_file_unfreeze(struct luo_file_set *file_set,
  *
  * 2. Serializes Metadata: After a successful freeze, it copies the final file
  *    metadata—the handler's compatible string, the user token, and the final
- *    private data handle—into the pre-allocated contiguous memory buffer
- *    (file_set->files) that will be handed over to the next kernel via KHO.
+ *    private data handle—into the pre-allocated serialization blocks
+ *    (file_set->block_set) that will be handed over to the next kernel via KHO.
  *
  * Error Handling (Rollback):
  * This function is atomic. If any handler's .freeze() operation fails, the
@@ -471,8 +470,7 @@ static void __luo_file_unfreeze(struct luo_file_set *file_set,
  * Context: Called only from the liveupdate_reboot() path.
  * Return: 0 on success, or a negative errno on failure.
  */
-int luo_file_freeze(struct luo_file_set *file_set,
-		    struct luo_file_set_ser *file_set_ser)
+int luo_file_freeze(struct luo_file_set *file_set)
 {
 	struct luo_file *luo_file;
 	struct kho_block_set_it it;
@@ -506,9 +504,6 @@ int luo_file_freeze(struct luo_file_set *file_set,
 		file_ser->token = luo_file->token;
 	}
 
-	file_set_ser->count = file_set->count;
-	file_set_ser->files = kho_block_set_head_pa(&file_set->block_set);
-
 	return 0;
 
 err_unfreeze:
@@ -519,28 +514,25 @@ int luo_file_freeze(struct luo_file_set *file_set,
 
 /**
  * luo_file_unfreeze - Unfreezes all files in a file_set and clear serialization
- * @file_set:     The file_set whose files are to be unfrozen.
- * @file_set_ser: Serialized file_set.
+ * @file_set: The file_set whose files are to be unfrozen.
  *
  * This function rolls back the state of all files in a file_set after the
  * freeze phase has begun but must be aborted. It is the counterpart to
  * luo_file_freeze().
  *
  * It invokes the __luo_file_unfreeze() helper with a NULL argument, which
- * signals the helper to iterate through all files in the file_set and call
- * their respective .unfreeze() handler callbacks.
+ * signals the helper to iterate through all files in the file_set, call their
+ * respective .unfreeze() handler callbacks, and clear the serialized blocks.
  *
  * Context: This is called when the live update is aborted during
  *          the reboot() syscall, after luo_file_freeze() has been called.
  */
-void luo_file_unfreeze(struct luo_file_set *file_set,
-		       struct luo_file_set_ser *file_set_ser)
+void luo_file_unfreeze(struct luo_file_set *file_set)
 {
 	if (!file_set->count)
 		return;
 
 	__luo_file_unfreeze(file_set, NULL);
-	memset(file_set_ser, 0, sizeof(*file_set_ser));
 }
 
 /**
diff --git a/kernel/liveupdate/luo_internal.h b/kernel/liveupdate/luo_internal.h
index dac6644bfb18..01a172cd9d7a 100644
--- a/kernel/liveupdate/luo_internal.h
+++ b/kernel/liveupdate/luo_internal.h
@@ -103,10 +103,8 @@ int luo_session_deserialize(void);
 
 int luo_preserve_file(struct luo_file_set *file_set, u64 token, int fd);
 void luo_file_unpreserve_files(struct luo_file_set *file_set);
-int luo_file_freeze(struct luo_file_set *file_set,
-		    struct luo_file_set_ser *file_set_ser);
-void luo_file_unfreeze(struct luo_file_set *file_set,
-		       struct luo_file_set_ser *file_set_ser);
+int luo_file_freeze(struct luo_file_set *file_set);
+void luo_file_unfreeze(struct luo_file_set *file_set);
 int luo_retrieve_file(struct luo_file_set *file_set, u64 token,
 		      struct file **filep);
 int luo_file_finish(struct luo_file_set *file_set);
diff --git a/kernel/liveupdate/luo_session.c b/kernel/liveupdate/luo_session.c
index f48e9a4185f9..827f9ad1938f 100644
--- a/kernel/liveupdate/luo_session.c
+++ b/kernel/liveupdate/luo_session.c
@@ -218,18 +218,30 @@ static int luo_session_finish_one(struct luo_session *session)
 	return luo_file_finish(&session->file_set);
 }
 
-static void luo_session_unfreeze_one(struct luo_session *session,
-				     struct luo_session_ser *ser)
+static void luo_session_unserialize_one(struct luo_session *session,
+					struct luo_session_ser *ser)
 {
 	guard(mutex)(&session->mutex);
-	luo_file_unfreeze(&session->file_set, &ser->file_set_ser);
+	luo_file_unfreeze(&session->file_set);
+	memset(ser, 0, sizeof(*ser));
 }
 
-static int luo_session_freeze_one(struct luo_session *session,
-				  struct luo_session_ser *ser)
+static int luo_session_serialize_one(struct luo_session *session,
+				     struct luo_session_ser *ser)
 {
+	int err;
+
 	guard(mutex)(&session->mutex);
-	return luo_file_freeze(&session->file_set, &ser->file_set_ser);
+	err = luo_file_freeze(&session->file_set);
+	if (err)
+		return err;
+
+	strscpy(ser->name, session->name, sizeof(ser->name));
+	ser->file_set_ser.count = session->file_set.count;
+	ser->file_set_ser.files =
+		kho_block_set_head_pa(&session->file_set.block_set);
+
+	return 0;
 }
 
 static int luo_session_release(struct inode *inodep, struct file *filep)
@@ -656,13 +668,11 @@ int luo_session_serialize(void)
 			goto err_undo;
 		}
 
-		err = luo_session_freeze_one(session, ser);
+		err = luo_session_serialize_one(session, ser);
 		if (err) {
 			kho_block_set_it_prev(&it);
 			goto err_undo;
 		}
-
-		strscpy(ser->name, session->name, sizeof(ser->name));
 	}
 
 	if (sh->count > 0)
@@ -675,8 +685,7 @@ int luo_session_serialize(void)
 	list_for_each_entry_continue_reverse(session, &sh->list, list) {
 		struct luo_session_ser *ser = kho_block_set_it_prev(&it);
 
-		luo_session_unfreeze_one(session, ser);
-		memset(ser->name, 0, sizeof(ser->name));
+		luo_session_unserialize_one(session, ser);
 	}
 	up_write(&sh->rwsem);
 	up_write(&luo_session_serialize_rwsem);
-- 
2.56.0.307.g5fe7bd680c-goog

