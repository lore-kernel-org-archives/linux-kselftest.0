Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A01D73603F7;
	Thu,  2 Apr 2026 19:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775157797; cv=none; b=eL7sCfeVjUE1TEOwcCJHeuoB8ZpkpNcloJbXbJWmB7gvGmVz7XFXJsVaowpbFzz+GJqh51fIpGtEO9bvKyzWb+SxEccHMv35of73A8UFAKAzB+E+1uvZBRuhznQzUiJB1ts4MdYJLuwmD7UASbE2+L9k7KWHkQ8I0mWxlVsMkY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775157797; c=relaxed/simple;
	bh=lfGA7Qu0hcSxaT68KsQdDKs+ctX2esjAkT0VLHdpspc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RA8R37E1N6rdw660tF14g6w+WScee+hrO2iTSj/UZ5b+65QFem/W3BPhEIoHu6s48S1WIdpbMerhF3g7iWpZxDhLjd7IW4ESLKwgr/Xclb8rYPp336USHxYpTPl+O9iA2g/d6wxlouWoEKfJiw0EhofJl0hdzlaxgTASRMP26Gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CYSwSnpD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CYSwSnpD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 721EEC2BCAF;
	Thu,  2 Apr 2026 19:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775157797;
	bh=lfGA7Qu0hcSxaT68KsQdDKs+ctX2esjAkT0VLHdpspc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=CYSwSnpDNKKV0uCGXvDeVdYH2fxeu7p0Ogt+WYEvkK/LjQTredsgeOu+voMAetY0v
	 tUYtadWWxxIQQvsyf00+9Ciej5bakh6KAoO8xiIQUL5ddttSotsR4JYX9MXE720vG+
	 lpVxGq20fRcDdKat1GyRl1OMeQGsjy0+efCN9ZfR/yg/O/7ykNir8E13fcD8hl3pIr
	 O64QqxMCho8wMY1aB/SkClv5Y4PTPduTJy9+G1l2O1wKlaQOxEWsS00eH7QM/0TdP2
	 zGiYCbQK3xzmtg7kpD+S71LGNogfg09a9sFImAXMDyLGvMgfqVvFZY09VxBwvUuT6a
	 /aHqI/FzqtCmg==
From: Jeff Layton <jlayton@kernel.org>
Date: Thu, 02 Apr 2026 15:23:08 -0400
Subject: [PATCH v7 1/2] firmware_loader: add search_path= module option for
 multi-path firmware lookup
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-fw-path-v7-1-5b7e9c41a8c0@kernel.org>
References: <20260402-fw-path-v7-0-5b7e9c41a8c0@kernel.org>
In-Reply-To: <20260402-fw-path-v7-0-5b7e9c41a8c0@kernel.org>
To: Luis Chamberlain <mcgrof@kernel.org>, 
 Russ Weight <russ.weight@linux.dev>, Danilo Krummrich <dakr@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: Michal Grzedzicki <mge@meta.com>, driver-core@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Jeff Layton <jlayton@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10692; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=lfGA7Qu0hcSxaT68KsQdDKs+ctX2esjAkT0VLHdpspc=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpzsIi0bO32VSnBBPWduIV5VK6oEp5DBGHYUVzx
 uuCg1iczBeJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCac7CIgAKCRAADmhBGVaC
 FcHjD/41U4M3GMC4n1Q5pwODrKJ6v37AiFTqIIp93rBX6wxtTwUFVIvZQ8JNQeRKAASfYY3rKU6
 EpN3MsKV52N5llUMu/SqvgksaMHVCenIRJKqT4nBPhnSdI6armgFMUwVt+wofA82gkNnZt2YK6N
 GlNoVUD5TRn3DnK9bpTIg2L+EOSRb2Xyp0hESheBJQ1L44FRW3jEZNI6ESUdOnTlPx40NWMiavh
 dNE5tHQfXXQwOu7s61A6qPV+b2e5KzO6COOikRvqmjGevxHO8WQ9aZDsmatw1/eva3Ni52LCV6O
 tKk1NbphRb8SQkdrg03bX0D81mxWHPDUfr/7SxG6JdIPRle6V5CeMjpeoQr/ulnAvMisZceNv24
 DqGjDxif2RWsw/bFlfp/V8DTHl/wURlXtLcjLkYXZhGBDBpRwZvNrT4+cZZhAOJO36w9KjJAcoH
 S2sRYygghvxWYj4SendTVnsjGa1O3XNZoT13rvR1nU7dlEa+g/GbbTLd8nwwa1oF4m6xYHeIB+O
 wtAyUYw1fs4bmvRbdjdWzKlVXcsdAV/eHx9TnsBI63Pk2C/I52Jo7qgkT65VYButz8lpfPWEBU2
 aRi9rejASldkuvq1Kk5EgfRz+FdrJnH1g/kYB6kzodenKfdAQ5385yPiCxx12I9ZHtfkYNXM3iH
 bsafXtsOC+xkosg==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215

Refactor fw_get_filesystem_firmware() by extracting the per-path
firmware loading logic into a new fw_try_firmware_path() helper.

Add a new firmware_class.search_path= module option that accepts a
':'-separated list of firmware search directories. The input is
preprocessed at set time (boot or sysfs write) into a NUL-separated
sequence of paths, avoiding per-load parsing overhead. Backslash
escapes are supported: '\:' for literal ':', '\\' for literal '\'.

The firmware lookup order is:

  1. firmware_class.path= (single legacy path)
  2. firmware_class.search_path= (colon-separated paths)
  3. Built-in default paths (/lib/firmware/updates/..., /lib/firmware)

Example:

  firmware_class.search_path=/custom/path1:/custom/path2

Suggested-by: Michal Grzedzicki <mge@meta.com>
Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 drivers/base/firmware_loader/main.c | 305 +++++++++++++++++++++++++++---------
 1 file changed, 229 insertions(+), 76 deletions(-)

diff --git a/drivers/base/firmware_loader/main.c b/drivers/base/firmware_loader/main.c
index a11b30dda23be563bd55f25474ceff2153ddd667..45a8c12a647db267f25ddec0fb9a4337e5390aa4 100644
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
@@ -485,6 +486,191 @@ static const char * const fw_path[] = {
 module_param_string(path, fw_path_para, sizeof(fw_path_para), 0644);
 MODULE_PARM_DESC(path, "customized firmware image search path with a higher priority than default path");
 
+/*
+ * fw_search_unescape - copy src to dst, processing backslash escapes
+ *
+ * Handles '\:' (literal ':') and '\\' (literal '\'). Returns the number
+ * of bytes written (not counting the trailing NUL).
+ */
+static int fw_search_unescape(char *dst, int dst_size, const char *src, int src_len)
+{
+	int i, len = 0;
+
+	for (i = 0; i < src_len && len < dst_size - 1; i++) {
+		if (src[i] == '\\' && i + 1 < src_len &&
+		    (src[i + 1] == ':' || src[i + 1] == '\\'))
+			i++;
+		dst[len++] = src[i];
+	}
+	dst[len] = '\0';
+	return len;
+}
+
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
+	int len = 0;
+
+	if (!val) {
+		fw_search_para[0] = '\0';
+		fw_search_len = 0;
+		return 0;
+	}
+
+	while (*val) {
+		const char *sep;
+		int comp_len, remaining;
+
+		/* find the next unescaped ':' or end of string */
+		for (sep = val; *sep; sep++) {
+			if (*sep == '\\' && (sep[1] == ':' || sep[1] == '\\'))
+				sep++;
+			else if (*sep == ':')
+				break;
+		}
+
+		remaining = sizeof(fw_search_para) - len - 1;
+		comp_len = fw_search_unescape(fw_search_para + len, remaining,
+					       val, sep - val);
+
+		/* strip trailing newline */
+		if (comp_len > 0 && fw_search_para[len + comp_len - 1] == '\n')
+			comp_len--;
+
+		/* only record non-empty components */
+		if (comp_len > 0) {
+			len += comp_len;
+			fw_search_para[len++] = '\0';
+		}
+
+		val = *sep ? sep + 1 : sep;
+	}
+
+	/* ensure NUL termination even when empty */
+	fw_search_para[len] = '\0';
+	fw_search_len = len;
+
+	return 0;
+}
+
+/*
+ * fw_search_get - reconstruct colon-separated string for sysfs reads
+ *
+ * Re-escapes ':' and '\' characters so the output can be written back
+ * to produce the same parsed result.
+ */
+static int fw_search_get(char *buffer, const struct kernel_param *kp)
+{
+	const char *p;
+	int pos = 0;
+
+	p = fw_search_para;
+	while (p < fw_search_para + fw_search_len) {
+		int slen = strlen(p);
+		int i;
+
+		if (!slen)
+			break;
+		if (pos > 0 && pos < PAGE_SIZE - 1)
+			buffer[pos++] = ':';
+		for (i = 0; i < slen && pos < PAGE_SIZE - 2; i++) {
+			if (p[i] == ':' || p[i] == '\\')
+				buffer[pos++] = '\\';
+			buffer[pos++] = p[i];
+		}
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
+module_param_cb(search_path, &fw_search_ops, NULL, 0644);
+MODULE_PARM_DESC(search_path, "colon-separated list of firmware search paths, tried after path= (use '\\:' for literal ':', '\\\\' for literal '\\')");
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
@@ -493,10 +679,9 @@ fw_get_filesystem_firmware(struct device *device, struct fw_priv *fw_priv,
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
 
@@ -511,83 +696,51 @@ fw_get_filesystem_firmware(struct device *device, struct fw_priv *fw_priv,
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
+		if (dirlen > 0 && fw_path_para[dirlen - 1] == '\n')
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

