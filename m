Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792709458;
	b=R46SWvzPDmsBGc3WOfiASWfRDBNPoOxJ7Ad8k6/yYPuyBFZWH48kzBhwqHSAH/8ndZkX
	 0Hxb33x4ZUmIz5rN7VXyMM+HHZwjKPH2bBqZRytnkSzLJwHA2qjq8f3ctrASfACa2CTV9
	 cr0k7RpFhrOYzFaU+ShwqHAVUMh7jRyaUp8RtKCA/Zz9RjDcT//53k2+3XCL2J36RHfSN
	 5q5yi0ExOiC72yCN/HK0tOteD6IC5Hf6LSi+cWA8BxhbQ8a7rNBHuNMs3ypgdPTNWvM78
	 kYVgDbUcHX8Qekm+FEhHfgkjpjFgZWessaOPE0M9cn0X+BDHcJPmg0DvUGROxIgnOwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792709458;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=M8wkRoJDHKCl2H3ues/+67+xXGDD9mtv8dtHSiakNgQ=;
	b=ejGokX8uW6VCBSsFs04iH7Xa+y/tC1NwgQKh1aAVDseNxSgN65Sq6XPXhVTdeVrxY6X0
	 xXNJBKfx1KuG5X/CPHG+TTWilg34dI/1SYhVBelJBR+LxE+UF1ZIKS4fVewe5CJ+TKhVd
	 Da3SCTBoDi2Zm7rYEU9/H/Pwr+CgmXvxKN/VMAsQUPOc+wtuz4vI94T6NcsMnEQsgj6KA
	 KhusGA9sUB0A9CYtljRzgV/05N9SSL99V4Rb6vokrcSPwuQiXmhTCWDfKUiIxIzuNvu8P
	 cuKR9jAPG4glxcqweh0jyPfTZXhpdYotSctKUEwEWa5pawA1bgMP9u5w0G9WskzTpKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=JSGwrRyA;
	arc=none smtp.remote-ip=209.85.215.199
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 497F4606A32A
	for <linux-kselftest@vger.kernel.org>; Thu, 22 Oct 2026 22:50:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 497F4606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=JSGwrRyA
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cd0e92d64a1so141707a12.1
        for <linux-kselftest@vger.kernel.org>; Thu, 22 Oct 2026 15:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792709458; x=1793314258; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M8wkRoJDHKCl2H3ues/+67+xXGDD9mtv8dtHSiakNgQ=;
        b=JSGwrRyAkEs5nLY0TI/rFOOQA7leL5Heko62iD6uNJwQpUemrInQKvcrfKXhRYE8kp
         Fu7QCVVM+pAUJUMVjIvVQhWXGlGz7mkUdg6TEd7aRYsPAzOawRlrhql2unxygupRQEN7
         uXbo3qO5zxmMdPNMGzVzocKFN4+yRhG+Ny3JHtq1tkOIfUFxM/kUOAvQWKgTu5e5pdJX
         1WT6FcNwkFErCzQ7gRQ85QghI8Px64bMJZOSIBJk5yg/2VfhNFkrVO3yG0v4Ndk4wC9r
         O68CgQTd+aUh1N2SSFbXFjrrbgcvJ4eFEgRe0HSygJHnIDbLImt9i+ZBC1HZriG3YW0Z
         l6aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792709458; x=1793314258;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M8wkRoJDHKCl2H3ues/+67+xXGDD9mtv8dtHSiakNgQ=;
        b=Fyb9d2rKg5YRKtJCkUei7/hSomkveKgsd/jWCoiG3ioCJ2v/MTDsdwXs5pFR2wRdpl
         Kb+MbaDGqcvGh4nzFoGWj+sZkpsmam5bXEVXFkcHQsGSzqwYq+NZhracEHH7eCAlDWsy
         1k7CRtFLN07dEiVAjGQtQyq3x0IKeS1vaO/sCASxzpnMnz+hcbJ1a+MuwNk2q3gJjA4h
         4dSWzm2GyLIwEWlAJb+yNT+nvfyrPzWW0G8lMphYVR+/Z2IqoUyfOS3651mxDFNB7GO6
         FYrCBuRUUGzeqVxF89/hEroEovZx5+rMlgXR3TaFM1eybS+hUaRC6HOsPAJvhlJkSpLy
         DvbA==
X-Forwarded-Encrypted: i=1; AKwUvByze/PltrCXGw/B6wJWgd21xn/Nx37955tkPxKLindL0UYbUQLWfPHoJC7EfxsrN5CAMlqXqDVf2Q+WB/07bWU=@vger.kernel.org
X-Gm-Message-State: AFq9FYL5sPTeiwlcem6fNisDtwPe4ZaJUTFwaTCMDfQYwHK2A0QusJxL
	nFtZqzVmE9Oyg8CxUijXwU+kus1zQT8KYOyY14+SfjVYw30LpW0OFyy7RZ6JSPXMX5JLTH6m+KV
	k7ldNqUtoGKSYvQ==
X-Received: from pgbm22-n2.prod.google.com ([2002:a05:6a02:6196:20b0:cd6:a6ae:1ba0])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6300:8001:b0:3e2:78bf:63d6 with SMTP id adf61e73a8af0-3e2a0c4a3a0mr1802376637.46.1792709457482;
 Thu, 22 Oct 2026 15:50:57 -0700 (PDT)
Date: Thu, 22 Oct 2026 22:50:33 +0000
In-Reply-To: <20261022225035.377445-1-dmatlack@google.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261022225035.377445-1-dmatlack@google.com>
X-Mailer: git-send-email 2.56.0.257.gf7497c7d27-goog
Message-ID: <20261022225035.377445-9-dmatlack@google.com>
Subject: [PATCH v2 08/10] mm/shmem_luo: Allow preserving tmpfs files that are
 still linked
From: David Matlack <dmatlack@google.com>
To: kexec@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org
Cc: Alexander Graf <graf@amazon.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Christian Brauner <brauner@kernel.org>, 
	David Hildenbrand <david@kernel.org>, Hugh Dickins <hughd@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	"Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, Michal Hocko <mhocko@suse.com>, 
	Mike Rapoport <rppt@kernel.org>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Samiullah Khawaja <skhawaja@google.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@kernel.org>, 
	David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="UTF-8"

shmem_luo already accepts any shmem file without links, which includes
unlinked tmpfs files and files created with O_TMPFILE. Also accept tmpfs
files that are still linked, so that userspace doesn't have to unlink
files to preserve them and can keep using them by path until the live
update.

The path of the file isn't preserved. Like other files from tmpfs
mounts, a linked file is retrieved onto a tmpfs mount chosen by
userspace, which can then link it at the path it wants.

While a file is preserved, its size is frozen, so truncating it,
fallocate() and writes past its end fail with -EPERM. For a linked file,
this affects everyone who opens the file by its path, so a caller that
can only read the file, e.g. a world-readable file in /dev/shm, could
use it to break the owner of the file. So require permission to write to
the file to preserve it, for all files. Like FS_IOC_ENABLE_VERITY, don't
require a file opened for writing, so that binaries that are being
executed can still be preserved through read-only fds, nor a writable
mount. If the size of the file can't change anyway, because it is
immutable or on a read-only superblock, also let its owner preserve it.
Don't let others do that, since the size could change again once the
file is made writable.

Preserving a file also fills its holes, but don't require any permission
for that. Anyone who can read a tmpfs file can already fill its holes by
faulting them in through a read-only mapping, also on read-only mounts
and for immutable files.

Document the frozen size and the permission requirement.

Assisted-by: LLM
Signed-off-by: David Matlack <dmatlack@google.com>
---
 mm/shmem_luo.c | 55 +++++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 52 insertions(+), 3 deletions(-)

diff --git a/mm/shmem_luo.c b/mm/shmem_luo.c
index ecbeb37d33a8..aba2bc1f18c5 100644
--- a/mm/shmem_luo.c
+++ b/mm/shmem_luo.c
@@ -28,6 +28,23 @@
  * the file are preserved. All others are reset to default. The preserved
  * properties are described below.
  *
+ * A tmpfs file can be preserved even if it is linked, but its path is not
+ * preserved. Userspace chooses where to put the file when retrieving it, as
+ * described in "Retrieving Tmpfs Files" below.
+ *
+ * Preserving a file requires permission to write to it, since preserving it
+ * affects all of its users, as described below. But the file doesn't need to
+ * be opened for writing. For example, a binary that is being executed can be
+ * preserved through a read-only file descriptor. The owner of a file whose
+ * size can't change anyway, because it is immutable or on a read-only
+ * superblock, may also preserve it. The file can be preserved through a
+ * read-only mount.
+ *
+ * While a file is preserved, its size can't change and no holes can be punched
+ * into it. Truncating the file, ``fallocate()`` and writes past the end of the
+ * file fail with ``-EPERM``. This applies to all users of the file, including
+ * users that open it by its path.
+ *
  * .. note::
  *    The LUO API is not stabilized yet, so the preserved properties of a memfd
  *    or tmpfs file are also not stable and are subject to backwards
@@ -298,6 +315,34 @@ static void shmem_luo_unpreserve_folios(struct kho_vmalloc *kho_vmalloc,
 	vfree(folios_ser);
 }
 
+/*
+ * Check whether the caller may preserve @file. Preserving the file freezes its
+ * size until it is unpreserved, for all users of the file, so require
+ * permission to write to the file. Like FS_IOC_ENABLE_VERITY, don't require a
+ * file opened for writing, so that e.g. a binary that is being executed can be
+ * preserved, nor a writable mount. If the size of the file can't change
+ * anyway, because it is on a read-only superblock or immutable, its owner may
+ * also preserve it. The size could only change again after the file is made
+ * writable, which is up to the owner or root.
+ *
+ * Preserving the file also fills its holes, but that doesn't need any
+ * permission: Anyone who can read the file can fill its holes by faulting
+ * them in through a read-only mapping.
+ */
+static int shmem_luo_may_preserve(struct file *file)
+{
+	struct mnt_idmap *idmap = file_mnt_idmap(file);
+	struct inode *inode = file_inode(file);
+	int err;
+
+	err = inode_permission(idmap, inode, MAY_WRITE);
+	if (err && (sb_rdonly(inode->i_sb) || IS_IMMUTABLE(inode)) &&
+	    inode_owner_or_capable(idmap, inode))
+		return 0;
+
+	return err;
+}
+
 static int shmem_luo_preserve(struct liveupdate_file_op_args *args)
 {
 	struct inode *inode = file_inode(args->file);
@@ -307,6 +352,11 @@ static int shmem_luo_preserve(struct liveupdate_file_op_args *args)
 	int err = 0, seals;
 
 	inode_lock(inode);
+
+	err = shmem_luo_may_preserve(args->file);
+	if (err)
+		goto err_unlock_inode;
+
 	shmem_freeze(inode, true);
 
 	/* Allocate the main serialization structure in preserved memory */
@@ -362,6 +412,7 @@ static int shmem_luo_preserve(struct liveupdate_file_op_args *args)
 	kho_unpreserve_free(ser);
 err_unlock:
 	shmem_freeze(inode, false);
+err_unlock_inode:
 	inode_unlock(inode);
 	return err;
 }
@@ -710,9 +761,7 @@ static int shmem_luo_retrieve(struct liveupdate_file_op_args *args)
 static bool shmem_luo_can_preserve(struct liveupdate_file_handler *handler,
 				   struct file *file)
 {
-	struct inode *inode = file_inode(file);
-
-	return shmem_file(file) && !inode->i_nlink;
+	return shmem_file(file);
 }
 
 static unsigned long shmem_luo_get_id(struct file *file)
-- 
2.56.0.257.gf7497c7d27-goog

