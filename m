Received: from mail-43171.protonmail.ch (mail-43171.protonmail.ch [185.70.43.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA7D54C4F54
	for <linux-kselftest@vger.kernel.org>; Wed, 30 Sep 2026 11:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790767764; cv=none; b=TGyZkCqYt1ruH06oYbVtSryxCcrIC+mfctmuOhE96XFyOm7k0SenDL7oYDTPztNUCuMcwrO56Rh1a2b25ZLllDwLHvsw83wY/OYrwhes72PFolqpvvAJZ3RrT8R+U5rX1Zf9PV/cWTexaLCSQL5iD9vKU/EbtolGjdpX1F6HgZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790767764; c=relaxed/simple;
	bh=mnru+liGFTIzyuqUz0727XkBdn5wDZjy0eQau0zEk9M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HXqQUlY4a/jDqrs2fhduAmHq6OjWkUzTLVgBEeVZdbLja4/Fg3Z6ogXHx+vmtiaQX3Igm6qXQ/HGJpOz0Rm7wrC3L1c4U1+xwfnAPMGIhvkeoJtD3kzmomy8I5WTwx9BYgOvJPGMcz9XYo09P2xF/0hV4W5mWAKPg2pyx/r7MRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=runtimeverification.com; spf=pass smtp.mailfrom=runtimeverification.com; dkim=pass (2048-bit key) header.d=runtimeverification.com header.i=@runtimeverification.com header.b=TGh/LsCb; arc=none smtp.client-ip=185.70.43.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=runtimeverification.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=runtimeverification.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=runtimeverification.com header.i=@runtimeverification.com header.b="TGh/LsCb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=runtimeverification.com; s=protonmail; t=1790767752; x=1791026952;
	bh=YFeNw1+x73LtRbqfSyuUkqKJ0Yks+iO69toGkEwBsQg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=TGh/LsCb87Zxr0W8w1YgoXPzRl7KluXEl/xny+qAG9+oCsSz0ep8PAkC83OLkS3eo
	 JW2ybj36cnG647XQrI36SI6nsbKKbpnZavM8N/EDmkwexjgt7cWuXxmUtl/EbAuHV+
	 y6mf2x5gvZnxrrVpbpoyCT/uys/dHVJIH8D0C6UtGo7Ld+Jh5syjdg1yIzSEsDRx1A
	 n52MEVbKPKDfC/yYeum4TDfHeceRGy/7XFVRPFIW9JQdUQqxl29VgOIYAdWtdl+CpS
	 8dzv3MiHFq45Zn1pXR942LpSfYR4t/NrUJcb3y2RqYQ9vyxBpNLeoPGWtZxgwlL8f7
	 LV34f572nsa7g==
X-Pm-Submission-Id: 4hvt9J3r8kz2ScPL
From: Natasha Klaus <natalie.klaus@runtimeverification.com>
To: Christian Brauner <brauner@kernel.org>,
	Kees Cook <kees@kernel.org>,
	"Eric W . Biederman" <ebiederm@xmission.com>
Cc: Shuah Khan <shuah@kernel.org>,
	Jeff Layton <jlayton@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Natasha Klaus <natalie.klaus@runtimeverification.com>
Subject: [PATCH v2 1/2] userns: reject uid_map/gid_map values that do not fit in u32
Date: Wed, 30 Sep 2026 14:28:53 +0300
Message-Id: <20260930112854.373184-2-natalie.klaus@runtimeverification.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260930112854.373184-1-natalie.klaus@runtimeverification.com>
References: <20260930112854.373184-1-natalie.klaus@runtimeverification.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

map_write() parses each line written to uid_map, gid_map or projid_map
with simple_strtoul() and stores the results in the u32 fields of
struct uid_gid_extent. On 64-bit kernels a value above U32_MAX is
silently truncated modulo 2^32. The coding assistant flagged this
truncation site while reading map_write(), and I confirmed it by hand
on a running kernel, where writing to the uid_map of a fresh user
namespace installs a different mapping than the one requested:

  "4294967296 1000 1"  ->  installed as "0 1000 1"
  "4294967297 1000 1"  ->  installed as "1 1000 1"
  "4294967301 1000 1"  ->  installed as "5 1000 1"

The same happens to the lower_first and count fields. Only a literal of
2^64 or more is rejected, and only because simple_strtoul() saturates
to ULLONG_MAX, which truncates onto the (u32)-1 value map_write()
already refuses. On 32-bit kernels unsigned long is itself 32 bits
wide, so the same truncation happens inside simple_strtoul().

The write succeeds, so a runtime that computes ranges and gets one
wrong ends up with a different map than it asked for and no error to
tell it so.

Parse each field with kstrtou32() instead. A new helper,
map_parse_u32(), terminates the field at the next whitespace or NUL,
parses it and puts the original character back, leaving pos where
simple_strtoul() used to leave it. The checks after each field, the
trailing junk check and every later check are unchanged and run in the
same order. A field that is not a decimal number fitting in u32 now
fails the write with -EINVAL, like any other malformed line.

Besides the range check, the one visible difference is that kstrtou32()
accepts a single leading '+', so "+5 1000 1" is now installed as
"5 1000 1" where it used to be rejected.

This makes the parser more correct; it is not a security fix: the
truncated values are valid ids and every later check still applies to
them.

Suggested-by: Eric W. Biederman <ebiederm@xmission.com>
Signed-off-by: Natasha Klaus <natalie.klaus@runtimeverification.com>
Assisted-by: LLM
---
kbuf is map_write()'s private copy of the user buffer from
memdup_user_nul(): it is NUL-terminated, nothing else refers to it, and
map_write() already overwrites each '\n' in it with '\0' and frees it
on return. So map_parse_u32() can write a '\0' after each field for
kstrtou32() and put the original character back.

 kernel/user_namespace.c | 29 ++++++++++++++++++++++++++---
 1 file changed, 26 insertions(+), 3 deletions(-)

diff --git a/kernel/user_namespace.c b/kernel/user_namespace.c
index 0bed462e9b2a..1e232f78cfd6 100644
--- a/kernel/user_namespace.c
+++ b/kernel/user_namespace.c
@@ -929,6 +929,26 @@ static bool verify_root_map(const struct file *file,
 	return true;
 }
 
+/*
+ * Parse the decimal u32 at *pos, up to the next whitespace or NUL, and
+ * leave *pos pointing at that character.
+ */
+static int map_parse_u32(char **pos, u32 *res)
+{
+	char *end = *pos;
+	char c;
+	int ret;
+
+	while (*end && !isspace(*end))
+		end++;
+	c = *end;
+	*end = '\0';
+	ret = kstrtou32(*pos, 10, res);
+	*end = c;
+	*pos = end;
+	return ret;
+}
+
 static ssize_t map_write(struct file *file, const char __user *buf,
 			 size_t count, loff_t *ppos,
 			 int cap_setid,
@@ -1001,17 +1021,20 @@ static ssize_t map_write(struct file *file, const char __user *buf,
 		}
 
 		pos = skip_spaces(pos);
-		extent.first = simple_strtoul(pos, &pos, 10);
+		if (map_parse_u32(&pos, &extent.first))
+			goto out;
 		if (!isspace(*pos))
 			goto out;
 
 		pos = skip_spaces(pos);
-		extent.lower_first = simple_strtoul(pos, &pos, 10);
+		if (map_parse_u32(&pos, &extent.lower_first))
+			goto out;
 		if (!isspace(*pos))
 			goto out;
 
 		pos = skip_spaces(pos);
-		extent.count = simple_strtoul(pos, &pos, 10);
+		if (map_parse_u32(&pos, &extent.count))
+			goto out;
 		if (*pos && !isspace(*pos))
 			goto out;
 
-- 
2.34.1

