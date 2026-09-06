Received: from mail-pj2-f5.google.com (mail-pj2-f5.google.com [74.125.227.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE51612B143
	for <linux-kselftest@vger.kernel.org>; Sun,  6 Sep 2026 03:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788664609; cv=none; b=FIAmLfu/NSj4wx7w1tVPWzpBnpejoCPftNqdudT+jPow3JtNjI49NowqMwf2Q7zFflVEsay7Okkw7uvt3YHFHG+O74MeTyZ5ggaEmP7sVhNSnQ5u0wJl2K+kJhsct5KuB5lJcMjkJMXiweS/MFYxG2TZErfP5I21Y71GN27dIHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788664609; c=relaxed/simple;
	bh=s5TYD7BS+s/jGw29CeHqa38NtbnJHkNgMMffGi8ZnIs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AdkEs3XsD8QWhNj09oxjZsd9kVQcOqEZV6LGvUOIXw+PeUEi8ylErzkxWsLsZwn9rFcM4GTQtGKIFF22Cm2Ozrl0LB2PqBIxBkA+QUdQCBBDhIWiLQ2gchDqGIsFdWv8xc+NEURlLhnmFu8darY9fR/Tz2qKKbBUGiSc6cX7Dts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ifAv0xaZ; arc=none smtp.client-ip=74.125.227.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ifAv0xaZ"
Received: by mail-pj2-f5.google.com with SMTP id d9443c01a7336-2d942de6574so14848815ad.0
        for <linux-kselftest@vger.kernel.org>; Sat, 05 Sep 2026 20:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788664607; x=1789269407; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UQUQORBh9/effmcCOK9oZ0voPzgfijwpho2+g50NVks=;
        b=ifAv0xaZJJX0GSmT91T1NofvewP2Ju+xl4fFN5oc9vMbpYbF3mFnJpMsVZbNxGE3cZ
         SRc3Gs2tifzAzhcy31oB1spvQg4ggXTyOFT5PdGSEh8jMQh8KdALquxqDYL2nULQ1ydo
         HMWMVJ9T3sB4hiC/svaa8bzwLVZOPvY9Pk7S/Y62/83ekcZbOVQq/QPdwARUYhvoYkQu
         RoiN7WdNvVxUzMzyTEA79vo21sBY5KDd5C9s6cKX5al8CQmm4xjjj63AQ6mvsuiaVkEN
         LL3z//0cK2zEN+mm1ojLwhrlJBo6zGWcjHrHBMtkJmO9TCTz9PpCQzO1pKHgJcJek3F1
         PQXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788664607; x=1789269407;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UQUQORBh9/effmcCOK9oZ0voPzgfijwpho2+g50NVks=;
        b=isyXTN5/HhpQwN4bLUylLfqcVd8TpsBlLk0SCCx+BfATSPc+F3ecPCXd7Jgolc1LEU
         U0XCZGI/Vs44VbUPprhnrZUEFXIQQ0QU/BLE0MQa2lvwQ0elLOaXoofsdZvoinfjYWuF
         ceSImthTd4qhF/ASlkfnAhXTTCnXNWu9Mjih3DlYxcvCkE/LqEpwWVW+bKH+NpGTR/k1
         flpO7zNiNdNh4CvhI5uW0pN/ZTfLxSOcWMF66sp4ErFo8C156X0rB5bsZ3As1PrgTnqF
         Fw7d8dbsubD7f36lm6zwvpmbE9o5TjE5QH4aQ2EKt8Lw8MqXJYKin/Tmsv8q8CuB7bRY
         mseQ==
X-Forwarded-Encrypted: i=1; AKwUvBx2gLzvUp8R00Bz8u3i4hMujoB3nD/37qfJRthULjiNeyYbL9sBP/jcS4bfSJkwDxNxc3rggQRWOzfXE4vUDos=@vger.kernel.org
X-Gm-Message-State: AFuF++mpqV5r9RvezhiEDvTeOZs4DE0uZscC+UnDH+3GQRZSbL10VFA5
	grDdR5j9oHp/2YczzAZ8V7pcyl1R5tIP/d6a0it3EVolvYsB98JzfhjP
X-Gm-Gg: AYBFou3b+Hf7cCmTjCceS3bFPWOHI7CC82ElehK/8KHMkct7f24Cek+JmNahJwYbfWN
	f60nY0Skrd94025C/4EvW1yGh53YqTa1O2SSDpIL9YfnLxikOB7P5yIJv7rbcaSs2w9bgqeudTW
	rtKE8Xt/CGeFkZ2MuDFiLfFxnvhiIr/F2AYt9AwL9wEol0Aes1sQAD6nVkQ4AwNVd3hFT08lmoD
	1pSOsB8XpOJnSWAEvobkbPUAmdgpO7s318XGvi02HnWD71ZlAovqVUTDwqKirQ6y53n4PXMTOjj
	09+8Y/p1FYMN6e+Ce+qCZyFx7yx3FL6WgttOFO/hzxE2nrQd1OoQ3+2T5sa8bHXPsa9LLtQ7i9O
	J76bA8SjJunzWnn8SkzZrhPbJ6hFiT3acTaco+vMzKFKk208DymBYUkplOWiK1v1LVP1/2RML9y
	gVHjiJiox3TyD1DTFVlC6ZjMl1y61rt/L7o0qWfFlpFcRn9F+VQt6SnUrfP2EYJXfaCt7Olt7/6
	vxeHvpG/+dJFJFj+q5gQqOYP0vipsCIoD3UZApHsKGWMYt05fayvm/fJQlsWDmW7Z5IlYPtpfTg
	f72xOmV2Q17JeBRekQASe6AJeX8gdA0ywpXhZ0nvsYXSRoAPSR06MYk=
X-Received: by 2002:a05:6a21:6816:b0:3d3:afa7:8101 with SMTP id adf61e73a8af0-3da3a16d1cdmr26417705637.28.1788664606822;
        Sat, 05 Sep 2026 20:16:46 -0700 (PDT)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339a534152sm16958958eec.10.2026.09.05.20.16.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 20:16:46 -0700 (PDT)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Christian Brauner <brauner@kernel.org>,
	Bhavik Sachdev <b.sachdev1904@gmail.com>,
	linux-kselftest@vger.kernel.org
Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	Kees Cook <kees@kernel.org>
Subject: [PATCH] selftests/statmount: update list of valid filesystems
Date: Sat,  5 Sep 2026 20:16:25 -0700
Message-ID: <20260906031629.74204-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The list of valid filesystems in
tools/testing/selftests/filesystems/statmount/statmount_test.c contains
several filesystems that have been removed from the kernel, and is
missing several recently added filesystems. Update it.

The new list was generated using this small script:
(grep -rA10 'struct file_system_type .* =' | fgrep -w .name
fgrep -r MODULE_ALIAS_FS'(' | grep -v '#define'
) | cut -d '"' -f2 | LC_ALL=C sort -u | while read a; do
    printf '"%s", ' "$a"
done
echo

It was then manually formatted and edited to remove filesystem types
registered by tests and fix a few entries the script couldn't extract
correctly.

Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
 .../filesystems/statmount/statmount_test.c    | 24 +++++++++----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/tools/testing/selftests/filesystems/statmount/statmount_test.c b/tools/testing/selftests/filesystems/statmount/statmount_test.c
index 52544512edc7..352ca022f248 100644
--- a/tools/testing/selftests/filesystems/statmount/statmount_test.c
+++ b/tools/testing/selftests/filesystems/statmount/statmount_test.c
@@ -17,21 +17,21 @@
 
 static const char *const known_fs[] = {
 	"9p", "adfs", "affs", "afs", "aio", "anon_inodefs", "apparmorfs",
-	"autofs", "bcachefs", "bdev", "befs", "binder", "binfmt_misc",
+	"autofs", "bdev", "befs", "binder", "binfmt_misc",
 	"bpf", "btrfs", "btrfs_test_fs", "ceph", "cgroup", "cgroup2", "cifs",
-	"coda", "configfs", "cpuset", "cramfs", "cxl", "dax", "debugfs",
-	"devpts", "devtmpfs", "dmabuf", "drm", "ecryptfs", "efivarfs", "efs",
-	"erofs", "exfat", "ext2", "ext3", "ext4", "f2fs", "functionfs",
-	"fuse", "fuseblk", "fusectl", "gadgetfs", "gfs2", "gfs2meta", "hfs",
-	"hfsplus", "hostfs", "hpfs", "hugetlbfs", "ibmasmfs", "iomem",
-	"ipathfs", "iso9660", "jffs2", "jfs", "minix", "mqueue", "msdos",
-	"nfs", "nfs4", "nfsd", "nilfs2", "nsfs", "ntfs", "ntfs3", "ocfs2",
-	"ocfs2_dlmfs", "omfs", "openpromfs", "overlay", "pipefs", "proc",
-	"pstore", "pvfs2", "qnx4", "qnx6", "ramfs", "resctrl", "romfs",
+	"coda", "configfs", "cpuset", "cramfs", "dax", "debugfs",
+	"devpts", "devtmpfs", "dmabuf", "drm", "ecryptfs", "efivarfs",
+	"erofs", "exfat", "ext2", "ext3", "ext4", "f2fs", "failfs", "functionfs",
+	"fuse", "fuseblk", "fusectl", "gadgetfs", "gfs2", "gfs2meta", "guest_memfd", "hfs",
+	"hfsplus", "hostfs", "hpfs", "hugetlbfs", "iomem",
+	"iso9660", "jffs2", "jfs", "minix", "mqueue", "msdos",
+	"nfs", "nfs4", "nfsd", "nilfs2", "nsfs", "ntfs", "ntfs3", "nullfs", "ocfs2",
+	"ocfs2_dlmfs", "omfs", "openpromfs", "overlay", "pidfs", "pipefs", "proc",
+	"pseudo_erofs", "pstore", "pvfs2", "qnx4", "qnx6", "ramfs", "resctrl", "romfs",
 	"rootfs", "rpc_pipefs", "s390_hypfs", "secretmem", "securityfs",
 	"selinuxfs", "smackfs", "smb3", "sockfs", "spufs", "squashfs", "sysfs",
-	"sysv", "tmpfs", "tracefs", "ubifs", "udf", "ufs", "v7", "vboxsf",
-	"vfat", "virtiofs", "vxfs", "xenfs", "xfs", "zonefs", NULL };
+	"tmpfs", "tracefs", "ubifs", "udf", "ufs", "vboxsf",
+	"vfat", "vfio", "virtiofs", "xenfs", "xfs", "zonefs", NULL };
 
 static void write_file(const char *path, const char *val)
 {
-- 
2.43.0

