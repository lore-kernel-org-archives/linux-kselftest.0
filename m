Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2ABC3B27E1;
	Mon, 23 Mar 2026 14:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774276787; cv=none; b=K1/KSFykEGI6Z0GsuYPsZIXWg/bEyHHgNCaY/JYtbT4GU7Hn8rJcklA7kShfj5lx2wfhHMhe2eec+Pk31j/ftzMvYcMUHLgb+osq0n3/I+qQwz9gCNI9FFvjUi72vntKiwidArpRFvanYGiNa0/v6q3tfOQTqGGw7hOtZqepNBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774276787; c=relaxed/simple;
	bh=qTh5iHJUrUvA/mCf9ROhVLF/ed+RNX39tTVd2f/sH+Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uymTyK8xpRq0GxjSHYU1peDObV8l2y00oAZkjRoPk4X49f+wUS2EoGxykBu3O6llqM4g7+EywKVD0nz0Jv+YXwtCAYlwAUJsaSxr6Q7zbtcHjpl3fkQIueBJ6HhCXA/m4c/6iWuoCK17Z4EqC0ppUiVGmXNzrjNZaFMfZ8w+ZCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mNBNS/wc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mNBNS/wc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0109C2BCB4;
	Mon, 23 Mar 2026 14:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774276786;
	bh=qTh5iHJUrUvA/mCf9ROhVLF/ed+RNX39tTVd2f/sH+Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=mNBNS/wcJG6Qc7cZmAJvYxS3Vq+irU67wpfthe+JnANVAajrhhhs5b8hAv0fA9E1x
	 eo1g/PPZ459XS9/QjfjGC2hDArZtLoqz49I9pE0RlHOE1nE493901slOOLOwBA58xQ
	 DSOt6+dJNUIif5XEkU7wvMcZGhLIuUOABAtTtMZcULAztlcKL3mOoLSYQnhu1PpJx/
	 YobzpzOZQn3hKyW82SQ2jPtaa9a+Ny2skk2yXYaTW8K652QUdjcy1YVXndWm3jdPVB
	 fv4LSkItO71igFbTbwO72KOy44sxEs2lOmADX5cg2se76qsEhaSBPock0WKM1Qe8U8
	 nqfDKK1VF0y2A==
From: Jeff Layton <jlayton@kernel.org>
Date: Mon, 23 Mar 2026 10:39:30 -0400
Subject: [PATCH v5 1/2] firmware_loader: add search= module option for
 multi-path firmware lookup
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-fw-path-v5-1-e88b2fe145f3@kernel.org>
References: <20260323-fw-path-v5-0-e88b2fe145f3@kernel.org>
In-Reply-To: <20260323-fw-path-v5-0-e88b2fe145f3@kernel.org>
To: Luis Chamberlain <mcgrof@kernel.org>, 
 Russ Weight <russ.weight@linux.dev>, Danilo Krummrich <dakr@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: Michal Grzedzicki <mge@meta.com>, driver-core@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Jeff Layton <jlayton@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=9798; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=qTh5iHJUrUvA/mCf9ROhVLF/ed+RNX39tTVd2f/sH+Y=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpwVCwZRHSXBGu29v8v/rUqbAbe7L/GRj3SI4sl
 hcL4v2lrOKJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCacFQsAAKCRAADmhBGVaC
 FUp8D/9mb6NSzRNhsnfeFbp+zAzmUydMkgBn5sOQNSXDOMSWjcEYWJK/wqN5HjwsBG9S7WnT6JW
 AzmldFgl7K2tXE9urjXTwWKUZOJQCVXFKLD+KZvMD4R3R0Jc837foMF8Jb+V+R8cCtAcljIxzmC
 r5TSCn5UJQQXS+AVlzElhSPHTz4P9LRQXTQzVMefqb/dW5g/693NwmpV2UZPPgwgUvWC27gtkLj
 BL9POJ2HZvZrBMM3GGTPQOyIKD8I4SCVnfk6kwdH4dwSkh8NTmRaVL5agvsRIjrTMPXPuZJiv9B
 QVgdlzTulwd7Ssrq8OWfHuBu/sMw+ottl6kirlZJdhbK0+pOLayYIYLLWOG0bT213612MWkv5Um
 gnCg4/qjy53lFCloHqt0h9+3q0i4Oj6z7q1g2o8Lxbt3tHe8Fz2t/9g92pC1KS/r6TcxyVVYsx1
 KL6fgTeZToOkfcrR3TDA45WldBYxwmUULobpytUWggCZa8vK0YGhRg4889AqgjTV/USz6NYsL5V
 XRl3WaiYBAgGi3HtCxKUZDyUDNqsmZZcTSZ/Fjlv+wnamIhYWpbuelrMRRzsvSd9h8p2wcECVSj
 xHywtSefjXZAp/EZTJhmXEDSUULp0NiCsvr7k8010SzeW4BdZ5GusU1uSz4+0gKZX7mRVXgnt5b
 plGX05joz2NpMkw==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215

Refactor fw_get_filesystem_firmware() by extracting the per-path
firmware loading logic into a new fw_try_firmware_path() helper.

Add a new firmware_class.search= module option that accepts a
':'-separated list of firmware search directories. The input is
preprocessed at set time (boot or sysfs write) into a NUL-separated
sequence of paths, avoiding per-load parsing overhead. Backslash
escapes are supported: '\:' for literal ':', '\\' for literal '\'.

The firmware lookup order is:

  1. firmware_class.path= (single legacy path)
  2. firmware_class.search= (colon-separated paths)
  3. Built-in default paths (/lib/firmware/updates/..., /lib/firmware)

Example:

  firmware_class.search=/custom/path1:/custom/path2

Suggested-by: Michal Grzedzicki <mge@meta.com>
Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 drivers/base/firmware_loader/main.c | 273 ++++++++++++++++++++++++++----------
 1 file changed, 197 insertions(+), 76 deletions(-)

diff --git a/drivers/base/firmware_loader/main.c b/drivers/base/firmware_loader/main.c
index a11b30dda23be563bd55f25474ceff2153ddd667..c86f86977aa436ce6ccc19506cb0a774e06d019c 100644
--- a/drivers/base/firmware_loader/main.c
+++ b/drivers/base/firmware_loader/main.c
@@ -469,8 +469,9 @@ static int fw_decompress_xz(struct device *dev, struct fw_priv *fw_priv,
 
 /* direct firmware loading support */
 static char fw_path_para[256];
+static char fw_search_para[4096];
+static int fw_search_len;
 static const char * const fw_path[] = {
-	fw_path_para,
 	"/lib/firmware/updates/" UTS_RELEASE,
 	"/lib/firmware/updates",
 	"/lib/firmware/" UTS_RELEASE,
@@ -485,6 +486,159 @@ static const char * const fw_path[] = {
 module_param_string(path, fw_path_para, sizeof(fw_path_para), 0644);
 MODULE_PARM_DESC(path, "customized firmware image search path with a higher priority than default path");
 
+/*
+ * fw_search_set - preprocess a colon-separated search path string
+ *
+ * Converts the input into a NUL-separated sequence of paths stored in
+ * fw_search_para, with fw_search_len tracking the total used length.
+ * Backslash escapes '\:' (literal ':') and '\\' (literal '\').
+ * Trailing newlines on each component are stripped.
+ */
+static int fw_search_set(const char *val, const struct kernel_param *kp)
+{
+	const char *p;
+	int len = 0;
+
+	if (!val) {
+		fw_search_para[0] = '\0';
+		fw_search_len = 0;
+		return 0;
+	}
+
+	for (p = val; *p; p++) {
+		if (p[0] == '\\' && (p[1] == ':' || p[1] == '\\')) {
+			p++;
+			if (len < sizeof(fw_search_para) - 2)
+				fw_search_para[len++] = *p;
+		} else if (*p == ':') {
+			/* strip trailing newline before the separator */
+			if (len > 0 && fw_search_para[len - 1] == '\n')
+				len--;
+			if (len > 0 && fw_search_para[len - 1] != '\0') {
+				if (len < sizeof(fw_search_para) - 2)
+					fw_search_para[len++] = '\0';
+			}
+		} else {
+			if (len < sizeof(fw_search_para) - 2)
+				fw_search_para[len++] = *p;
+		}
+	}
+
+	/* strip trailing newline from last component */
+	if (len > 0 && fw_search_para[len - 1] == '\n')
+		len--;
+
+	/* ensure double-NUL termination */
+	fw_search_para[len] = '\0';
+	fw_search_len = len;
+
+	return 0;
+}
+
+/*
+ * fw_search_get - reconstruct colon-separated string for sysfs reads
+ */
+static int fw_search_get(char *buffer, const struct kernel_param *kp)
+{
+	const char *p;
+	int pos = 0;
+
+	p = fw_search_para;
+	while (p < fw_search_para + fw_search_len) {
+		int slen = strlen(p);
+
+		if (!slen)
+			break;
+		if (pos > 0)
+			buffer[pos++] = ':';
+		memcpy(buffer + pos, p, slen);
+		pos += slen;
+		p += slen + 1;
+	}
+	buffer[pos] = '\0';
+	return pos;
+}
+
+static const struct kernel_param_ops fw_search_ops = {
+	.set = fw_search_set,
+	.get = fw_search_get,
+};
+module_param_cb(search, &fw_search_ops, NULL, 0644);
+MODULE_PARM_DESC(search, "colon-separated list of firmware search paths, tried after path= (use '\\:' for literal ':', '\\\\' for literal '\\')");
+
+static int
+fw_try_firmware_path(struct device *device, struct fw_priv *fw_priv,
+		     const char *suffix,
+		     int (*decompress)(struct device *dev,
+				       struct fw_priv *fw_priv,
+				       size_t in_size,
+				       const void *in_buffer),
+		     const char *dir, int dirlen,
+		     char *path, void **bufp, size_t msize)
+{
+	size_t file_size = 0;
+	size_t *file_size_ptr = NULL;
+	size_t size;
+	int len, rc;
+
+	len = snprintf(path, PATH_MAX, "%.*s/%s%s",
+		       dirlen, dir, fw_priv->fw_name, suffix);
+	if (len >= PATH_MAX)
+		return -ENAMETOOLONG;
+
+	fw_priv->size = 0;
+
+	/*
+	 * The total file size is only examined when doing a partial
+	 * read; the "full read" case needs to fail if the whole
+	 * firmware was not completely loaded.
+	 */
+	if ((fw_priv->opt_flags & FW_OPT_PARTIAL) && *bufp)
+		file_size_ptr = &file_size;
+
+	/* load firmware files from the mount namespace of init */
+	rc = kernel_read_file_from_path_initns(path, fw_priv->offset,
+					       bufp, msize,
+					       file_size_ptr,
+					       READING_FIRMWARE);
+	if (rc < 0) {
+		if (!(fw_priv->opt_flags & FW_OPT_NO_WARN)) {
+			if (rc != -ENOENT)
+				dev_warn(device,
+					 "loading %s failed with error %d\n",
+					 path, rc);
+			else
+				dev_dbg(device,
+					"loading %s failed for no such file or directory.\n",
+					path);
+		}
+		return rc;
+	}
+	size = rc;
+
+	dev_dbg(device, "Loading firmware from %s\n", path);
+	if (decompress) {
+		dev_dbg(device, "f/w decompressing %s\n",
+			fw_priv->fw_name);
+		rc = decompress(device, fw_priv, size, *bufp);
+		/* discard the superfluous original content */
+		vfree(*bufp);
+		*bufp = NULL;
+		if (rc) {
+			fw_free_paged_buf(fw_priv);
+			return rc;
+		}
+	} else {
+		dev_dbg(device, "direct-loading %s\n",
+			fw_priv->fw_name);
+		if (!fw_priv->data)
+			fw_priv->data = *bufp;
+		fw_priv->size = size;
+	}
+	fw_state_done(fw_priv);
+	return 0;
+}
+
 static int
 fw_get_filesystem_firmware(struct device *device, struct fw_priv *fw_priv,
 			   const char *suffix,
@@ -493,10 +647,9 @@ fw_get_filesystem_firmware(struct device *device, struct fw_priv *fw_priv,
 					     size_t in_size,
 					     const void *in_buffer))
 {
-	size_t size;
-	int i, len, maxlen = 0;
+	int i;
 	int rc = -ENOENT;
-	char *path, *nt = NULL;
+	char *path;
 	size_t msize = INT_MAX;
 	void *buffer = NULL;
 
@@ -511,83 +664,51 @@ fw_get_filesystem_firmware(struct device *device, struct fw_priv *fw_priv,
 		return -ENOMEM;
 
 	wait_for_initramfs();
-	for (i = 0; i < ARRAY_SIZE(fw_path); i++) {
-		size_t file_size = 0;
-		size_t *file_size_ptr = NULL;
-
-		/* skip the unset customized path */
-		if (!fw_path[i][0])
-			continue;
-
-		/* strip off \n from customized path */
-		maxlen = strlen(fw_path[i]);
-		if (i == 0) {
-			nt = strchr(fw_path[i], '\n');
-			if (nt)
-				maxlen = nt - fw_path[i];
-		}
 
-		len = snprintf(path, PATH_MAX, "%.*s/%s%s",
-			       maxlen, fw_path[i],
-			       fw_priv->fw_name, suffix);
-		if (len >= PATH_MAX) {
-			rc = -ENAMETOOLONG;
-			break;
-		}
+	/* Try the customized path first */
+	if (fw_path_para[0]) {
+		int dirlen = strlen(fw_path_para);
 
-		fw_priv->size = 0;
+		/* strip trailing newline */
+		if (fw_path_para[dirlen - 1] == '\n')
+			dirlen--;
 
-		/*
-		 * The total file size is only examined when doing a partial
-		 * read; the "full read" case needs to fail if the whole
-		 * firmware was not completely loaded.
-		 */
-		if ((fw_priv->opt_flags & FW_OPT_PARTIAL) && buffer)
-			file_size_ptr = &file_size;
-
-		/* load firmware files from the mount namespace of init */
-		rc = kernel_read_file_from_path_initns(path, fw_priv->offset,
-						       &buffer, msize,
-						       file_size_ptr,
-						       READING_FIRMWARE);
-		if (rc < 0) {
-			if (!(fw_priv->opt_flags & FW_OPT_NO_WARN)) {
-				if (rc != -ENOENT)
-					dev_warn(device,
-						 "loading %s failed with error %d\n",
-						 path, rc);
-				else
-					dev_dbg(device,
-						"loading %s failed for no such file or directory.\n",
-						path);
-			}
-			continue;
-		}
-		size = rc;
-		rc = 0;
-
-		dev_dbg(device, "Loading firmware from %s\n", path);
-		if (decompress) {
-			dev_dbg(device, "f/w decompressing %s\n",
-				fw_priv->fw_name);
-			rc = decompress(device, fw_priv, size, buffer);
-			/* discard the superfluous original content */
-			vfree(buffer);
-			buffer = NULL;
-			if (rc) {
-				fw_free_paged_buf(fw_priv);
-				continue;
-			}
-		} else {
-			dev_dbg(device, "direct-loading %s\n",
-				fw_priv->fw_name);
-			if (!fw_priv->data)
-				fw_priv->data = buffer;
-			fw_priv->size = size;
+		rc = fw_try_firmware_path(device, fw_priv, suffix, decompress,
+					  fw_path_para, dirlen,
+					  path, &buffer, msize);
+		if (!rc)
+			goto done;
+	}
+
+	/* Try each preprocessed NUL-separated path in fw_search_para */
+	if (fw_search_len > 0) {
+		const char *p = fw_search_para;
+
+		while (p < fw_search_para + fw_search_len) {
+			int dirlen = strlen(p);
+
+			if (!dirlen)
+				break;
+			rc = fw_try_firmware_path(device, fw_priv,
+						  suffix, decompress,
+						  p, dirlen,
+						  path, &buffer, msize);
+			if (!rc)
+				goto done;
+			p += dirlen + 1;
 		}
-		fw_state_done(fw_priv);
-		break;
 	}
+
+	/* Try default firmware paths */
+	for (i = 0; i < ARRAY_SIZE(fw_path); i++) {
+		rc = fw_try_firmware_path(device, fw_priv, suffix, decompress,
+					  fw_path[i], strlen(fw_path[i]),
+					  path, &buffer, msize);
+		if (!rc)
+			break;
+	}
+
+done:
 	__putname(path);
 
 	return rc;

-- 
2.53.0

