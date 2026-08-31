Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4668A47607E;
	Mon, 31 Aug 2026 16:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788192311; cv=none; b=QItj34F/OdpiI+b0GhF/i0c7xb1CR+O7Wj9DFVmEzNTKFevkjZ9UI/yV7JXQgqaksjfcBIhNOIGyjd/EvxO1538sXSkE3pN058TWVHN5IKFqBYusQMURVx3DU1RpqNgeHgyqTJTxG+JmtACYqMAp26waFCpyuhLEVIpVP4Go07o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788192311; c=relaxed/simple;
	bh=O8cMM23LUCpDyw5jvN20SoyoVKc1CUjKyifWs4b5PZk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q9Rb0cQ+L8CasS8Mu3ApIev1qAJxpWGlQUEuGp+HKsd7SzTpMzHmlg/lgC4QEnuQKS6RVnKGcx0ou9xmYeMlZapU4EoySA2JozIEi55Lqy1s9+LPaKsqGTrlQxCIKHsRTgrA9tgoOVvfhN4hoLS7jIlHd35b8Iq/+X484rhhYxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=m3lJQdsr; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="m3lJQdsr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1788192307;
	bh=O8cMM23LUCpDyw5jvN20SoyoVKc1CUjKyifWs4b5PZk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=m3lJQdsr52/yHKBBu8R8T7u8IYgFKO8cHUQTt9bw9/vjmCNtMm1D7h10HaaCYb4P9
	 xRsJID7t0/evMtd6M3mvVrc25zrFCdoq2D9b+40M5eY2kne8tguYaY6Ay6BSyYPqfe
	 m79AS5RwMTMGYocEuj008bMy7ylPwtdWWX7q3dUY=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Mon, 31 Aug 2026 18:04:59 +0200
Subject: [PATCH 1/3] tools/nolibc: verify that a directory is opened
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260831-nolibc-fdopendir-enotdir-v1-1-8cf0e79c4e6f@weissschuh.net>
References: <20260831-nolibc-fdopendir-enotdir-v1-0-8cf0e79c4e6f@weissschuh.net>
In-Reply-To: <20260831-nolibc-fdopendir-enotdir-v1-0-8cf0e79c4e6f@weissschuh.net>
To: Willy Tarreau <w@1wt.eu>, Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788192306; l=917;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=O8cMM23LUCpDyw5jvN20SoyoVKc1CUjKyifWs4b5PZk=;
 b=olH/8BpnS/ea9JeZY1PzE82CK9W7rHLTnkev3lvU8hBoLnLPGsu+Omk6RJhApsHHyaUJx0qn0
 t4E1qhpZwwGDZboZEzdJ+ESuEqWvPxhrwOrT29vqlIRhQduU9YzZ2y5
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

If a non-directory is opened, ENODIR should be returned from
opendir()/fdopendir() right away and not only during readdir_r().

Validate the type of opened file during open.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 tools/include/nolibc/dirent.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/tools/include/nolibc/dirent.h b/tools/include/nolibc/dirent.h
index 4e02ef25e72d..25fbff208998 100644
--- a/tools/include/nolibc/dirent.h
+++ b/tools/include/nolibc/dirent.h
@@ -30,10 +30,23 @@ typedef struct {
 static __attribute__((unused))
 DIR *fdopendir(int fd)
 {
+	struct stat buf;
+	int ret;
+
 	if (fd < 0) {
 		SET_ERRNO(EBADF);
 		return NULL;
 	}
+
+	ret = fstat(fd, &buf);
+	if (ret < 0)
+		return NULL;
+
+	if (!S_ISDIR(buf.st_mode)) {
+		SET_ERRNO(ENOTDIR);
+		return NULL;
+	}
+
 	return (DIR *)(intptr_t)~fd;
 }
 

-- 
2.55.0

