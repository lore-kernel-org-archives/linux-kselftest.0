Received: from mail-244107.protonmail.ch (mail-244107.protonmail.ch [109.224.244.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D94893C342B
	for <linux-kselftest@vger.kernel.org>; Mon, 28 Sep 2026 07:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790580374; cv=none; b=l/uCLsuVKzZXrkO2CZD9NjqBS/Csjfti5Ku4usY0XH+rHm9rexq0e68bctSd6hpMAjQ64LGD0ODbuxZDHHFLDZwzsY6mEZXT/hc8CY48+SFg2f+8g3UTnAeRyxKzt9a46xJqBLg8E5b9W2UoUWmOXk3A01a+29aKPoiRazYHaws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790580374; c=relaxed/simple;
	bh=fxB36Xns6Xf7zq2y6Auh1L6JzrnCB8S6SPQxWlDfsXs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hD/zbYq7C2LSPsKgwkhmrMa3sNRIzpVi9aseZ9KKWy6B7vPmvODdiCOojLGLsjFPwt9zoVi7w8NRgB8ajrY7jgzqPkizkdpuTDS+n+Q8iYlYpOz00s7+6F5vl7nrKbuZrqlDeElBzIO6HUymNTYoAhvICsjdPt1c6bQpZJz9Xa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=runtimeverification.com; spf=pass smtp.mailfrom=runtimeverification.com; dkim=pass (2048-bit key) header.d=runtimeverification.com header.i=@runtimeverification.com header.b=GW+XTNxB; arc=none smtp.client-ip=109.224.244.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=runtimeverification.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=runtimeverification.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=runtimeverification.com header.i=@runtimeverification.com header.b="GW+XTNxB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=runtimeverification.com; s=protonmail; t=1790580369; x=1790839569;
	bh=VKEfgdRG5ytdFpLC2017ALXZ2vH/UQHrtEmUlBHOpNo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=GW+XTNxB8uzS9whZwGgDKwSA3nTFU/vI4pxFZZ1Sd1oXN0fohe00eGDUlcMYHkXYz
	 a49bzgCgti8tsojvLCQ75ixtQ0FZSQSig1KJ2QKMu50RGciDi0T3hVqEP+b5flRrOk
	 Q0vg6SmhyaaishNdljY1MYpv1E6LNQpkTLFj9r2TzErIFOgKKFdE4DuMCIQpRVdD8U
	 SqhsTX00QCpEKsmcuQFPPH63C8xDyRxwCPSd1jjYH6P39C09LCgJOYZTnndOcOgRaQ
	 iamRSjJwBO2PVUZy0zVcyGHRdMNVpUK5EKDQPy73KTFKV9i759OLAWnJs7Azmbyo6q
	 WzKvuwm889rXg==
X-Pm-Submission-Id: 4htXsn186Dz2ScXT
From: Natasha Klaus <natalie.klaus@runtimeverification.com>
To: Christian Brauner <brauner@kernel.org>,
	Kees Cook <kees@kernel.org>,
	"Eric W . Biederman" <ebiederm@xmission.com>
Cc: Shuah Khan <shuah@kernel.org>,
	Jeff Layton <jlayton@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Natasha Klaus <natalie.klaus@runtimeverification.com>
Subject: [PATCH 1/2] userns: reject uid_map/gid_map values that do not fit in u32
Date: Mon, 28 Sep 2026 10:25:36 +0300
Message-Id: <20260928072537.115668-2-natalie.klaus@runtimeverification.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260928072537.115668-1-natalie.klaus@runtimeverification.com>
References: <20260928072537.115668-1-natalie.klaus@runtimeverification.com>
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
already refuses.

The write succeeds, so a runtime that computes ranges and gets one
wrong ends up with a different map than it asked for and no error to
tell it so.

Parse each field with simple_strtoull() into unsigned long long locals
and fail the write with -EINVAL if any of them exceeds U32_MAX, before
the existing checks, which are kept unchanged and in the same order.
On 32-bit kernels unsigned long is 32 bits wide and the truncation
happens inside simple_strtoul() itself, so a range check on its return
value would never fire there; that is why the values are parsed as
unsigned long long. simple_strtoull() keeps the end pointer behaviour
the multi-line parser relies on.

This is hardening, not a security fix: the truncated values are valid
ids and every later check still applies to them.

Signed-off-by: Natasha Klaus <natalie.klaus@runtimeverification.com>
Assisted-by: LLM
---
checkpatch warns that simple_strtoull() is obsolete. kstrtoull() does not
fit here: the buffer holds several lines of three space-separated fields,
and the parser relies on the end pointer to step from one field to the
next, which kstrto*() does not provide.

 kernel/user_namespace.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/kernel/user_namespace.c b/kernel/user_namespace.c
index 0bed462e9b2a..e7ed475c3685 100644
--- a/kernel/user_namespace.c
+++ b/kernel/user_namespace.c
@@ -940,6 +940,7 @@ static ssize_t map_write(struct file *file, const char __user *buf,
 	struct uid_gid_map new_map;
 	unsigned idx;
 	struct uid_gid_extent extent;
+	unsigned long long first, lower_first, cnt;
 	char *kbuf, *pos, *next_line;
 	ssize_t ret;
 
@@ -1001,17 +1002,17 @@ static ssize_t map_write(struct file *file, const char __user *buf,
 		}
 
 		pos = skip_spaces(pos);
-		extent.first = simple_strtoul(pos, &pos, 10);
+		first = simple_strtoull(pos, &pos, 10);
 		if (!isspace(*pos))
 			goto out;
 
 		pos = skip_spaces(pos);
-		extent.lower_first = simple_strtoul(pos, &pos, 10);
+		lower_first = simple_strtoull(pos, &pos, 10);
 		if (!isspace(*pos))
 			goto out;
 
 		pos = skip_spaces(pos);
-		extent.count = simple_strtoul(pos, &pos, 10);
+		cnt = simple_strtoull(pos, &pos, 10);
 		if (*pos && !isspace(*pos))
 			goto out;
 
@@ -1020,6 +1021,13 @@ static ssize_t map_write(struct file *file, const char __user *buf,
 		if (*pos != '\0')
 			goto out;
 
+		/* Verify the values fit in the u32 fields of the extent */
+		if (first > U32_MAX || lower_first > U32_MAX || cnt > U32_MAX)
+			goto out;
+		extent.first = first;
+		extent.lower_first = lower_first;
+		extent.count = cnt;
+
 		/* Verify we have been given valid starting values */
 		if ((extent.first == (u32) -1) ||
 		    (extent.lower_first == (u32) -1))
-- 
2.34.1

