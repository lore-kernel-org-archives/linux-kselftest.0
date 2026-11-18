Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795037335;
	b=vFNEr9yba1f4A14UEzd6A/4rdb3fPpaMe2mpG8V8R3phoipm4NK1hFTBSIZ2ZHTyNLb2
	 qJoOOFmXggeXA9aXe0t6E+Fmdt94x61OveKK5WWIDikt6UVwgKCyxRdopXL76LS0UJ5XB
	 gcBPhx7HOurbw3CGsL46t2kpkcA53Rp135+o4kzng4NIXjrZafQIpzXdBD4oGq18YDplc
	 QICfa+c2Zyl8+nup1+UXpXlCka697j6x8d+b2IEyzqZf1qGsxyb9M/CyK0R+txXeuX6Ak
	 oPFW0PszDBweBjjL/r/xhVcS3b9BeUmQw30i8nq0ZRvIEhXU8myyM1o6Ns66IrVNX9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795037335;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=9q7RwoQiaN01BLggu6ENspiefzk6L5yZx5t6tiYpc7I=;
	b=eSMW1A6H89fI1cjuCamU9tm6wcqmDaV3GiVa+EMN9BnnyO3LcTeeS/BspdHvYc7iiNn8
	 VmHeMsZwjXw52jplklSTDLqxxesI2WS2H4B8KDF+FlDvyMEG4+ELnXfBy3knKpkI/JTk9
	 N/8zX/+R+DD+bshqAZ5Laub6v+hF9wZlzcULqMStnl5O/ZoFWXq36qy3IZOTn+EUE3RAV
	 JlQf9Y9BihsuoK+OxrDxvwgXeblybnECLGu2D+zxqNVb9ftlIoD/0q3JNv2x7zwW/820E
	 dx1pRokdL/58JVCRVwVWjG8xnD7KkOtGlb/X78JYYlvkinExd5aOY1c2K2RVZVI7RZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=ND2mNAj8;
	arc=none smtp.remote-ip=209.85.217.51
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9E22606A331
	for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 21:28:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9E22606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=ND2mNAj8
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-7a6e560f580so1015747137.1
        for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 13:28:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1795037334; x=1795642134; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9q7RwoQiaN01BLggu6ENspiefzk6L5yZx5t6tiYpc7I=;
        b=ND2mNAj8RbzzuQjII1khkaTmvk9Ax2F2Iyt2N/ti3hiysJWyjlqiOUYC2EYf82mU2V
         +xmDcnVaQ3U0buvHyBFRmPV/XvWO5kDYBmVmo0BwnO/97w9J8X7oyCKpsaw/gjiJKds1
         n33cceqIczZIHiRJTIYUVO5mgg/10CN4gakwqQth8jxVBQ1Nmxw5gJDRcoDGZPbGZF+O
         zdfgmEVEibh0y2zApZ2p9FIuWWEzxe31HY6vA6O4+v0mtDwWuo2gu78+IScAfZlrOfdi
         Cl72r59ZCyHqkrfFS139LoM9M8JBvxZSJTBh8oatQUB8R7DVD69VtWq4/YETvb5TsTf9
         mwKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795037334; x=1795642134;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=9q7RwoQiaN01BLggu6ENspiefzk6L5yZx5t6tiYpc7I=;
        b=bA95mBkFFdlO1Ej2KakM+adP+pdWq2ZI4PUmbCqGX7YYsgMPjVsQ9ns4DdMjAcfqLf
         tY8IoLXU4wRijW+bL/QO7SiFsg1e6TXrRA+GiliH6gVeLZPGe9VrRoxb2A1+UZyvsNLO
         YXSk4/XiWUNNPgZczQ5XxM6oa4TZqT5lzNAUftvCJunyl53/CHOodhb59rw7DizIyP+K
         S8jGi1gwonZ3K8PHMPtM1BowtYQ2gKTM7oewbpAIQhnkSiAATfo6urq/PtH1RGg13SZI
         fwaweZYfHBzX/urDfsgHlSEQwLOMegRe4gR57TI135UQ0Mts76fEFCL5bofoSseUMYqN
         67hA==
X-Gm-Message-State: APuU4Z8cUnlJJ9+jz+OrgRgsHuLmp0thyL9aH/uEU2m6MMo7g+HkZO5O
	Z0CqlrN8pbvmVSYItW7IrBhsfIIcCyc04xuTEv34isjWBxvmwVN1GC47+0QStWB+Wphc4fUTrzF
	7eZ89
X-Gm-Gg: AYBFou3lDH9+bbwL2BEUmXXCVM3wHTRNfefP6v30zw8u6pMHkeygC+Jasph3XEhL1ND
	iuxSLToZlSqnj6FKIuSixsRZThylratRb5IhAqhMnOU/ebSbbXUk1kvXjNvvRHH4EvxDxsWk8/p
	VoTyHGVBq8K0zC+nLvL7b6AbgwLk0rYaf7Vinax2YHcy+R+K1WulaW2EFRexYGoERMdEjHquPZD
	MFZpjJYiRnib8H+Lb5qCAllYxAdzQDWSH0yAJlxyX4Lpeq66rHyVYhwVCLKMRuFecXsQPBioDYE
	s39+GYp085MXcj53Bybir/ggEU+YV6I5pniSMTqGBb6R6iUw6TKlMFMnU4DyiMuhTn320QrDpH0
	WYUtHKWuuKLMa4gx2kL0OUQhhDtFa5yyDEUHXr1q5/zgZIQSdUQodPmxCeJK23jDm5QGB8lPPyt
	CqjjVPKY/f2YziAVpdWPHJRY0j/1xHcossVcrarw3NEklrEPe8OPpj9FQ909wCdp71uqGIYouPN
	nSfzX0m+ldqKLGkWnWQdVvrGQNCAfsTxRMlRHZG55LVTwO/lim7OZ8ACbdNpfYfOFHaKS5yVhSi
	IkeSrebuTkhIzaEwW7PkB1JS4r8Xpgu7MUXLzIbWKPdYYkuOp8GVZlJUE3A5XBy5vcCOvmv3nFT
	eYHT0+AbPRLtz26Xm6obxd8GkGoRTOP2Wg/VvShK27qLxo2Cxkf6Z
X-Received: by 2002:a05:6102:5088:b0:7c3:ac79:9b09 with SMTP id ada2fe7eead31-7d6ba49c736mr1818893137.30.1795037333641;
        Wed, 18 Nov 2026 13:28:53 -0800 (PST)
Received: from soleen.c.googlers.com.com (57.233.150.34.bc.googleusercontent.com. [34.150.233.57])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d6b9185bc3sm2724635137.5.2026.11.18.13.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 13:28:53 -0800 (PST)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: linux-kselftest@vger.kernel.org,
	rppt@kernel.org,
	shuah@kernel.org,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	vipinsh@google.com,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	linux-api@vger.kernel.org,
	pasha.tatashin@soleen.com,
	dmatlack@google.com,
	kexec@lists.infradead.org,
	pratyush@kernel.org,
	rdunlap@infradead.org,
	graf@amazon.com
Subject: [PATCH v6 5/7] liveupdate: Add LIVEUPDATE_SESSION_FREEZE ioctl to freeze sessions early
Date: Wed, 18 Nov 2026 16:28:40 -0500
Message-ID: <20261118212845.2855249-6-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
In-Reply-To: <20261118212845.2855249-1-pasha.tatashin@soleen.com>
References: <20261118212845.2855249-1-pasha.tatashin@soleen.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the LIVEUPDATE_SESSION_FREEZE ioctl on outgoing session FDs. Once
frozen, no additional files can be preserved in the session and
repeated freeze calls return -EBUSY.

Currently, LUO freezes sessions only during reboot(LINUX_REBOOT_CMD_KEXEC),
serially under global write locks. On hosts running multiple workloads
such as VMs, freezing sessions early under their per-session mutexes
lets workloads freeze in parallel as they pause ahead of kexec,
reducing blackout time.

By default, session lifetime remains tied to the session FD: closing
the FD before reboot unfreezes and unpreserves the session, while
keeping it open skips late auto-freeze at kexec.

Add optional flag LIVEUPDATE_SESSION_FREEZE_COMMIT to serialize the
frozen session and its FLBs immediately and transfer ownership to LUO
until reboot. Committed sessions survive closing the session FD,
allowing processes to hand off preserved state and exit prior to kexec.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 Documentation/userspace-api/liveupdate.rst | 20 ++++++
 include/linux/liveupdate.h                 |  2 +-
 include/uapi/linux/liveupdate.h            | 38 ++++++++++++
 kernel/liveupdate/luo_file.c               | 37 +++++------
 kernel/liveupdate/luo_internal.h           |  3 +
 kernel/liveupdate/luo_session.c            | 71 ++++++++++++++++++++--
 6 files changed, 146 insertions(+), 25 deletions(-)

diff --git a/Documentation/userspace-api/liveupdate.rst b/Documentation/userspace-api/liveupdate.rst
index cdd74627ab75..c298b5d0dfe7 100644
--- a/Documentation/userspace-api/liveupdate.rst
+++ b/Documentation/userspace-api/liveupdate.rst
@@ -22,6 +22,26 @@ change, so compatibility is not guaranteed when kexec rebooting between
 different kernel versions. This is expected to change and stabilize in a future
 version.
 
+Session Freeze
+==============
+
+By default, LUO freezes active sessions during reboot, and an outgoing session
+stays alive only while its session fd remains open. Closing the fd before
+reboot aborts preservation and releases the session's resources.
+
+Userspace can freeze an outgoing session earlier with LIVEUPDATE_SESSION_FREEZE
+once it is done preserving and modifying the session's files:
+
+- Freeze: freezes the session's preserved files, allowing sessions to freeze
+  concurrently ahead of reboot. The session remains tied to its fd, so closing
+  the fd before reboot rolls back and releases the session.
+
+- Freeze and commit: userspace can optionally set
+  LIVEUPDATE_SESSION_FREEZE_COMMIT in flags to commit the frozen session. This
+  serializes the session and its FLBs into the outgoing KHO state immediately
+  and hands ownership to LUO. Once committed, the session survives closing its
+  fd until reboot, allowing processes to exit before kexec.
+
 Userspace Integration
 =====================
 
diff --git a/include/linux/liveupdate.h b/include/linux/liveupdate.h
index 6051abc0612c..ead033c59c22 100644
--- a/include/linux/liveupdate.h
+++ b/include/linux/liveupdate.h
@@ -59,7 +59,7 @@ struct liveupdate_file_op_args {
  *                compatible with the given file.
  * @preserve:     Required. Performs state-saving for the file.
  * @unpreserve:   Required. Cleans up any resources allocated by @preserve.
- * @freeze:       Optional. Final actions just before kernel transition.
+ * @freeze:       Optional. Final actions on session freeze or reboot.
  * @unfreeze:     Optional. Undo freeze operations.
  * @retrieve:     Required. Restores the file in the new kernel.
  * @can_finish:   Optional. Check if this FD can finish, i.e. all restoration
diff --git a/include/uapi/linux/liveupdate.h b/include/uapi/linux/liveupdate.h
index 4043d4038712..ac456f4014c5 100644
--- a/include/uapi/linux/liveupdate.h
+++ b/include/uapi/linux/liveupdate.h
@@ -60,6 +60,7 @@ enum {
 	LIVEUPDATE_CMD_SESSION_RETRIEVE_FD = 0x41,
 	LIVEUPDATE_CMD_SESSION_FINISH = 0x42,
 	LIVEUPDATE_CMD_SESSION_GET_NAME = 0x43,
+	LIVEUPDATE_CMD_SESSION_FREEZE = 0x44,
 };
 
 /**
@@ -236,4 +237,41 @@ struct liveupdate_session_get_name {
 #define LIVEUPDATE_SESSION_GET_NAME					\
 	_IO(LIVEUPDATE_IOCTL_TYPE, LIVEUPDATE_CMD_SESSION_GET_NAME)
 
+/**
+ * enum liveupdate_session_freeze_flags - Flags for LIVEUPDATE_SESSION_FREEZE
+ * @LIVEUPDATE_SESSION_FREEZE_COMMIT: Commit the frozen session so it is
+ *                                    serialized immediately and survives
+ *                                    closing the session FD until reboot.
+ */
+enum liveupdate_session_freeze_flags {
+	LIVEUPDATE_SESSION_FREEZE_COMMIT = 1 << 0,
+};
+
+/**
+ * struct liveupdate_session_freeze - ioctl(LIVEUPDATE_SESSION_FREEZE)
+ * @size:  Input; sizeof(struct liveupdate_session_freeze)
+ * @flags: Input; Bitmask of enum liveupdate_session_freeze_flags.
+ *
+ * Freezes an outgoing session before kexec reboot. Once frozen, no further
+ * files can be preserved in the session and repeated freeze calls return
+ * -EBUSY. Calling this on an incoming session returns -EINVAL.
+ *
+ * With @flags set to 0, session lifetime stays tied to the session FD:
+ * closing the FD before reboot unfreezes and unpreserves the session.
+ *
+ * With %LIVEUPDATE_SESSION_FREEZE_COMMIT set, the frozen session is
+ * serialized immediately and ownership transfers to LUO until reboot.
+ * Closing the FD or another session failing to freeze during reboot will
+ * not unfreeze or unpreserve a committed session.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+struct liveupdate_session_freeze {
+	__u32		size;
+	__u32		flags;
+};
+
+#define LIVEUPDATE_SESSION_FREEZE					\
+	_IO(LIVEUPDATE_IOCTL_TYPE, LIVEUPDATE_CMD_SESSION_FREEZE)
+
 #endif /* _UAPI_LIVEUPDATE_H */
diff --git a/kernel/liveupdate/luo_file.c b/kernel/liveupdate/luo_file.c
index cdd3c466e5ac..2cbac44d37cc 100644
--- a/kernel/liveupdate/luo_file.c
+++ b/kernel/liveupdate/luo_file.c
@@ -31,9 +31,8 @@
  *   - unpreserve(): Cleans up any resources allocated by .preserve(), called
  *     if the preservation process is aborted before the reboot (i.e. session is
  *     closed).
- *   - freeze(): A final pre-reboot opportunity to prepare the state for kexec.
- *     We are already in reboot syscall, and therefore userspace cannot mutate
- *     the file anymore.
+ *   - freeze(): Prepares the final state for kexec, invoked either on an
+ *     explicit session freeze or during the reboot() syscall.
  *   - unfreeze(): Undoes the actions of .freeze(), called if the live update
  *     is aborted after the freeze phase.
  *   - retrieve(): Reconstructs the file in the new kernel from the preserved
@@ -48,7 +47,7 @@
  *    handler, calls its .preserve() operation, and creates an internal &struct
  *    luo_file to track the live state.
  *
- * 2. Freeze (Pre-Reboot): Just before the kexec, luo_file_freeze() is called.
+ * 2. Freeze (Pre-Reboot): When a session freezes, luo_file_freeze() is called.
  *    It iterates through all preserved files, calls their respective .freeze()
  *    operation, and serializes their final metadata (compatible string, token,
  *    and data handle) into a contiguous memory block for KHO.
@@ -77,12 +76,15 @@
  *    descriptor), the session's release handler calls
  *    luo_file_unpreserve_files(). This invokes the .unpreserve() callback on
  *    all preserved files, ensuring all allocated resources are cleaned up and
- *    returning the system to a clean state.
+ *    returning the system to a clean state. If the session was frozen early
+ *    without committing, its files are unfrozen first. Committed sessions stay
+ *    preserved until reboot even after the session FD is closed.
  *
  * 2. Freeze Failure: During the reboot() syscall, if any handler's .freeze()
  *    op fails, the .unfreeze() op is invoked on all previously *successful*
  *    freezes to roll back their state. The reboot() syscall then returns an
- *    error to userspace, canceling the live update.
+ *    error to userspace, canceling the live update. On an explicit session
+ *    freeze, only that session's frozen files are rolled back via .unfreeze().
  *
  * 3. Finish Failure: In the new kernel, if a handler's .finish() op fails,
  *    the luo_file_finish() operation is aborted. LUO retains ownership of
@@ -457,9 +459,9 @@ static void __luo_file_unfreeze(struct luo_file_set *file_set,
  * luo_file_freeze - Freezes all preserved files and serializes their metadata.
  * @file_set: The file_set whose files are to be frozen.
  *
- * This function is called from the reboot() syscall path, just before the
- * kernel transitions to the new image via kexec. Its purpose is to perform the
- * final preparation and serialization of all preserved files in the file_set.
+ * This function is called on explicit session freeze or from the reboot()
+ * syscall path to perform final preparation and serialization of all
+ * preserved files in the file_set.
  *
  * It iterates through each preserved file in FIFO order (the order of
  * preservation) and performs two main actions:
@@ -476,13 +478,12 @@ static void __luo_file_unfreeze(struct luo_file_set *file_set,
  *
  * Error Handling (Rollback):
  * This function is atomic. If any handler's .freeze() operation fails, the
- * entire live update is aborted. The __luo_file_unfreeze() helper is
- * immediately called to invoke the .unfreeze() op on all files that were
- * successfully frozen before the point of failure, rolling them back to a
- * running state. The function then returns an error, causing the reboot()
- * syscall to fail.
+ * __luo_file_unfreeze() helper is immediately called to invoke the .unfreeze()
+ * op on all files that were successfully frozen before the point of failure,
+ * rolling them back to an unfrozen state, and an error is returned to the
+ * caller, canceling the live update if called from the reboot() path.
  *
- * Context: Called only from the liveupdate_reboot() path.
+ * Context: Called on explicit session freeze or from liveupdate_reboot().
  * Return: 0 on success, or a negative errno on failure.
  */
 int luo_file_freeze(struct luo_file_set *file_set)
@@ -532,15 +533,15 @@ int luo_file_freeze(struct luo_file_set *file_set)
  * @file_set: The file_set whose files are to be unfrozen.
  *
  * This function rolls back the state of all files in a file_set after the
- * freeze phase has begun but must be aborted. It is the counterpart to
- * luo_file_freeze().
+ * freeze phase has begun. It is the counterpart to luo_file_freeze().
  *
  * It invokes the __luo_file_unfreeze() helper with a NULL argument, which
  * signals the helper to iterate through all files in the file_set, call their
  * respective .unfreeze() handler callbacks, and clear the serialized blocks.
  *
  * Context: This is called when the live update is aborted during
- *          the reboot() syscall, after luo_file_freeze() has been called.
+ *          the reboot() syscall, after luo_file_freeze() has been called,
+ *          or when a frozen uncommitted session is released before kexec.
  */
 void luo_file_unfreeze(struct luo_file_set *file_set)
 {
diff --git a/kernel/liveupdate/luo_internal.h b/kernel/liveupdate/luo_internal.h
index 3d948279f018..bd3f0d192621 100644
--- a/kernel/liveupdate/luo_internal.h
+++ b/kernel/liveupdate/luo_internal.h
@@ -66,6 +66,8 @@ struct luo_file_set {
  *              retrieved by a consumer in the new kernel.
  * @serialized: A boolean flag indicating whether this outgoing session has
  *              been serialized into KHO.
+ * @user_frozen: A boolean flag indicating whether this session has been
+ *               frozen explicitly from userspace.
  * @file_set:   A set of files that belong to this session.
  * @mutex:      protects fields in the luo_session.
  */
@@ -74,6 +76,7 @@ struct luo_session {
 	struct list_head list;
 	bool retrieved;
 	bool serialized;
+	bool user_frozen;
 	struct luo_file_set file_set;
 	struct mutex mutex;
 };
diff --git a/kernel/liveupdate/luo_session.c b/kernel/liveupdate/luo_session.c
index 013386534b69..bf58718fa61b 100644
--- a/kernel/liveupdate/luo_session.c
+++ b/kernel/liveupdate/luo_session.c
@@ -34,10 +34,11 @@
  * 1.  Creation: A userspace agent calls `luo_session_create()` to create a
  *     new, empty session and receives a file descriptor for it.
  *
- * 2.  Serialization: When the `reboot(LINUX_REBOOT_CMD_KEXEC)` syscall is
- *     made, `luo_session_serialize()` is called. It iterates through all
- *     active sessions and writes their metadata into a memory area preserved
- *     by KHO.
+ * 2.  Serialization: Sessions may be frozen ahead of reboot via
+ *     `LIVEUPDATE_SESSION_FREEZE`, and optionally committed to serialize
+ *     their metadata into KHO immediately so they survive closing the FD.
+ *     When `reboot(LINUX_REBOOT_CMD_KEXEC)` is called,
+ *     `luo_session_serialize()` freezes and serializes any remaining sessions.
  *
  * 3.  Deserialization (in new kernel): After kexec, `luo_session_deserialize()`
  *     runs, reading the serialized data and creating a list of `struct
@@ -254,12 +255,21 @@ static int luo_session_finish_one(struct luo_session *session)
 static void luo_session_unfreeze_one(struct luo_session *session)
 {
 	guard(mutex)(&session->mutex);
-	luo_file_unfreeze(&session->file_set);
+	/*
+	 * Only unfreeze sessions that were auto-frozen by
+	 * luo_session_freeze_one(); sessions frozen explicitly by
+	 * userspace stay frozen until the session FD is closed.
+	 */
+	if (!session->user_frozen)
+		luo_file_unfreeze(&session->file_set);
 }
 
 static int luo_session_freeze_one(struct luo_session *session)
 {
 	guard(mutex)(&session->mutex);
+	if (session->user_frozen)
+		return 0;
+
 	return luo_file_freeze(&session->file_set);
 }
 
@@ -280,8 +290,13 @@ static int luo_session_release(struct inode *inodep, struct file *filep)
 		}
 		sh = &luo_session_global.incoming;
 	} else {
-		scoped_guard(mutex, &session->mutex)
+		scoped_guard(mutex, &session->mutex) {
+			if (session->serialized)
+				return 0;
+			if (session->user_frozen)
+				luo_file_unfreeze(&session->file_set);
 			luo_file_unpreserve_files(&session->file_set);
+		}
 		sh = &luo_session_global.outgoing;
 	}
 
@@ -298,6 +313,9 @@ static int luo_session_preserve_fd(struct luo_session *session,
 	int err;
 
 	guard(mutex)(&session->mutex);
+	if (session->user_frozen)
+		return -EBUSY;
+
 	err = luo_preserve_file(&session->file_set, argp->token, argp->fd);
 	if (err)
 		return err;
@@ -371,11 +389,50 @@ static int luo_session_get_name(struct luo_session *session,
 	return luo_ucmd_respond(ucmd, sizeof(*argp));
 }
 
+static int luo_session_freeze(struct luo_session *session,
+			      struct luo_ucmd *ucmd)
+{
+	struct liveupdate_session_freeze *argp = ucmd->cmd;
+	int err;
+
+	if (argp->flags & ~LIVEUPDATE_SESSION_FREEZE_COMMIT)
+		return -EOPNOTSUPP;
+
+	scoped_guard(mutex, &session->mutex) {
+		if (session->user_frozen)
+			return -EBUSY;
+
+		err = luo_file_freeze(&session->file_set);
+		if (err)
+			return err;
+
+		err = luo_ucmd_respond(ucmd, sizeof(*argp));
+		if (err) {
+			luo_file_unfreeze(&session->file_set);
+			return err;
+		}
+
+		session->user_frozen = true;
+	}
+
+	if (argp->flags & LIVEUPDATE_SESSION_FREEZE_COMMIT) {
+		struct luo_session_header *sh = &luo_session_global.outgoing;
+
+		guard(rwsem_write)(&sh->rwsem);
+		guard(mutex)(&session->mutex);
+
+		luo_session_serialize_one(session);
+	}
+
+	return 0;
+}
+
 union ucmd_buffer {
 	struct liveupdate_session_finish finish;
 	struct liveupdate_session_preserve_fd preserve;
 	struct liveupdate_session_retrieve_fd retrieve;
 	struct liveupdate_session_get_name get_name;
+	struct liveupdate_session_freeze freeze;
 };
 
 /* Type of sessions the ioctl applies to. */
@@ -413,6 +470,8 @@ static const struct luo_ioctl_op luo_session_ioctl_ops[] = {
 		 struct liveupdate_session_retrieve_fd, token, LUO_IOCTL_INCOMING),
 	IOCTL_OP(LIVEUPDATE_SESSION_GET_NAME, luo_session_get_name,
 		 struct liveupdate_session_get_name, name, LUO_IOCTL_ALL),
+	IOCTL_OP(LIVEUPDATE_SESSION_FREEZE, luo_session_freeze,
+		 struct liveupdate_session_freeze, flags, LUO_IOCTL_OUTGOING),
 };
 
 static bool luo_ioctl_type_valid(struct luo_session *session,
-- 
2.56.1.708.g77570a6a1d-goog

