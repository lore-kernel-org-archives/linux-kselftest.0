Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B6FE3B8406
	for <linux-kselftest@vger.kernel.org>; Thu, 24 Sep 2026 01:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790214752; cv=none; b=KKjwxZsAalx8lH2uVFAeqgXY+e0TSGj3Yxh6Yw5tpAURQJTzq3+gzq6Ma9n1Z/VERax3rXlV55PX3B2etxZgMqNJETJ8oZxCxAq6Z36GWwR9pDLlPd0V1nqI1LjmcMQIYSygw+z6ARbtEEp0Cj49IgqAR7pWBG6snMRE6rsKPLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790214752; c=relaxed/simple;
	bh=GeDgxcAAxWRswXI0bO4TJ+ASumLxQqwI+egxlfWdMac=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jpa7dKqu2MRx/MWkL6BDcuTUWXYsFrm6GLB0IxUWTfV5tnkju4k/GtaYp125KSoEyETc9JXWReNJ7xdJK2nYMfAaH39edKGp1jB/k6IFp3jl7wGPgJiEwQmAcGhFesia/6zuetTf0bkmu2eYmHg9qUISdSIN3UE8M8E2AebkJRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pxu3Mhcr; arc=none smtp.client-ip=209.85.160.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pxu3Mhcr"
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-48f69d8f72aso394334fac.0
        for <linux-kselftest@vger.kernel.org>; Wed, 23 Sep 2026 18:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790214748; x=1790819548; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1cN5CmufZWfppAn2JUAeeUtUy9gg/Lw5nvjqwMTeguM=;
        b=Pxu3MhcrFOM4FmLBFLHQZzDwsZ06cznT9HutdU9PpyBIwURqu3QlQ6Jzm1j+A6BdtD
         cUTwkabchRec+PVymZLVnadUCQ0mgIQ9TQf7DNxyWDOxgK9w+5rfK5c0QtKbmUjIpsmi
         YLRFYbD8U5AUPrH2qY9hyeYceZpPHJFFZAvzuMaKs+b8BlWDfHqDIFuXM9vUS1dxLZKy
         yMwUZLmexyT+bugSNyOn28nQ2xkUjFpn6ZMMwvD3eNgt5daHYgW3YTOmr0/s0N9My/lE
         vwElVgbLBSohXULeCzh/qY3z11kNUzyKSeSO6Y/OL3hD2fjixANr5GDMPvizte/Pmqyw
         mQ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790214748; x=1790819548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1cN5CmufZWfppAn2JUAeeUtUy9gg/Lw5nvjqwMTeguM=;
        b=wfRleUOnAjFS8vVjTslZUxyPqVCeFv1dbbcy6sj5XB3SAQsrLPNNbigR++ch3YjC+w
         u5O1KVk3d21rCiIw9Y52xDBo6lXg23/HZzZ43MCH6DAXgNH/p+Ay26PA/3OjpoMxCmGk
         C2FX5w9pBq196EZASzca1BqIbhp5S+WBNAoEq7puSyI5wg3mwnutveiPONjybBdvMfMe
         2Qye9NWqsdO30OxzruYwEjUtVcK43Pb/kVdNPwD6kiWNtEcunekCTPC42HONQ9rklG1O
         WrwuBdEJF2w3dEyMI4XkNjr471b3uYOiqIHzwBlmybP3OakeeSF/MUjzh+l+k6do9Kgr
         bOJg==
X-Forwarded-Encrypted: i=1; AKwUvBz9DeMroM+VSkuxI5Ycfp4n4BhgLQQ3yxFocwHByI8hlxQWdhUUr9Vb99aLM/Yh9d61Bd954JKKu3qFxm/9boM=@vger.kernel.org
X-Gm-Message-State: AFuF++nzICjZx5FzsImMbkHSr9XZQ+QwSR7vqe+SYQdl42r/nnb8tBv0
	cPqT3qq/FIfLUVSJRr/uXduoLSew1XIyXpTwgc3zSUEd2cHLZhf0a/Bk
X-Gm-Gg: AYBFou20WCV/f0+x+X0G0Zw49jfxRlrv0hTndA1HgTcUpsBDHoLmW3SQZXcQuaej1V5
	3dD2H6MfNM8g3rYrGbd5pSc4tc1tRW5fIEVFOFD4HAu8vD7Det+FLIux18JFfrQ7UExmmUnC7Qh
	gl2bPLhKNK6sG3uGOK2Qd/XyDpAjx/7MGcT9BVT2tiMExGpts0Y6Rx1BDRmndyaJ+L4imRIu4XT
	cWWn3NQmgv7WnrCS3P0bZfdIk5wsFL4iZU+QHCvkJ0MvyPXZtlbsRlJt0lsKFrkyDVa2OpphUp4
	prYkGEJE7joqfkF6g4i63UPAFeRh2146CFJO3gMT9/9WlHjlJ3tuzX0SelGwFniBHGdmfy4/1vx
	VampTT+VlniNrsphxzMXdqKELchwUrsVIcDZm43jWqkBCxT2gRkEcKCQQvIe7m4J/q9eL8yyD7h
	ibXn/GHlMxvx7E6+7mrLh0rJTH8MnrhQBHIXpzl4DG8xKLQZxsRd+9nlJOSUsGs/JtMPOeWnCSF
	KtqN5KxCxlCZdtqAo0xMsNPDxvKuobs0yzBJGl8
X-Received: by 2002:a05:6871:3a28:b0:47b:e30b:893c with SMTP id 586e51a60fabf-491e9303f7fmr908800fac.6.1790214748117;
        Wed, 23 Sep 2026 18:52:28 -0700 (PDT)
Received: from archlinux.lan ([136.34.156.120])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-491ed1ebc62sm1057379fac.3.2026.09.23.18.52.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 18:52:26 -0700 (PDT)
From: Danish Khateeb <danishkhateeb03@gmail.com>
To: Willy Tarreau <w@1wt.eu>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Shuah Khan <shuah@kernel.org>,
	Sven Schnelle <svens@linux.ibm.com>,
	Benjamin Berg <benjamin.berg@intel.com>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danish Khateeb <danishkhateeb03@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 1/3] tools/nolibc: fix readdir_r() with 64-bit directory offsets
Date: Wed, 23 Sep 2026 20:52:20 -0500
Message-ID: <20260924015222.31693-2-danishkhateeb03@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260924015222.31693-1-danishkhateeb03@gmail.com>
References: <20260924015222.31693-1-danishkhateeb03@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

readdir_r() stores the result of _sys_lseek() in an int. Directory
offsets are opaque cookies which can use all 64 bits: ext4, for
instance, gives 64-bit processes 63-bit hashes, and
0x7fffffffffffffff as the offset after the last entry. Truncated to an
int, such an offset is negative about half the time, and readdir_r()
takes it for an error.

Since commit 4ada5679f18d ("tools/nolibc/dirent: avoid errno in
readdir_r"), readdir_r() fails at the first entry whose offset has
bit 31 set, which on ext4 is usually one of the first few, and returns
the truncated offset as the error number. Before that, only -1 counted
as an error, which the last entry always hits: readdir_r() then
returned errno, usually 0, without filling in the entry, so the caller
got the previous entry a second time and never saw the last one.

32-bit processes get 31-bit hashes from ext4 and are not affected.

Keep the offset in an off_t.

Fixes: 665fa8dea90d ("tools/nolibc: add support for directory access")
Cc: stable@vger.kernel.org # v6.15+
Assisted-by: LLM
Signed-off-by: Danish Khateeb <danishkhateeb03@gmail.com>
---
 tools/include/nolibc/dirent.h | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/tools/include/nolibc/dirent.h b/tools/include/nolibc/dirent.h
index 2dbf4052b85a..19857369de2a 100644
--- a/tools/include/nolibc/dirent.h
+++ b/tools/include/nolibc/dirent.h
@@ -81,6 +81,7 @@ int readdir_r(DIR *dirp, struct dirent *entry, struct dirent **result)
 	struct linux_dirent64 *ldir = (void *)buf;
 	intptr_t i = (intptr_t)dirp;
 	int fd, ret;
+	off_t off;
 
 	if (i >= 0)
 		return EBADF;
@@ -100,9 +101,9 @@ int readdir_r(DIR *dirp, struct dirent *entry, struct dirent **result)
 	 * readdir() can only return one entry at a time.
 	 * Make sure the non-returned ones are not skipped.
 	 */
-	ret = _sys_lseek(fd, ldir->d_off, SEEK_SET);
-	if (ret < 0)
-		return -ret;
+	off = _sys_lseek(fd, ldir->d_off, SEEK_SET);
+	if (off < 0)
+		return -off;
 
 	entry->d_ino = ldir->d_ino;
 	/* the destination should always be big enough */
-- 
2.55.0

