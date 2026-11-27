Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795739947;
	b=b6osKJQ73Huqj63by+QRzCi3srWCMBOIJQ1eK3HSApeeEPXUip68smeVlUEVnSO7j5yJ
	 tOZeXFdlCa3d4Ioc/7htrhVVZoCuBIpFucJYBs3O67gqrryJty3r4V0T0DpUfrQKaeR/J
	 oAAeOEDlxwEuaW53yptvLF4tnrTCkj8PfgHArKkrnrG6W9mfCQBHdHwa5OUSyxewX5DxN
	 kUyh919DsnUuQ2/g6G8RLPcR2XTWgJzpiWNvwKMri1pnx7fJH9d9Kqd/YJx/Rk20Ea5/M
	 PTNW3ql3yXGMb3Z0tVEO/JgJjzLzD/nUcynUMcxB/ckQCvy+Lh33OFdYzracnMnaL+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795739947;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=OvwsNYV9K/LXXZpGZnFqU4JXKALJmJzA8uLyf3/RYp8=;
	b=3rPkHVbaL26uEUYLeLAfGOsNaB7Ex8WdlGt2d8rBmpxkzTMV8Y3bWY4iC4na+A39Hqon
	 9BbBCdmnEy+n3q2SSCQcZ2RtYcuB0lJ+4EXsK2/bZyPV8g9OpnfPAHshNhJppCwyoIjjC
	 /gV3hXR+qO1Fc/ywqNVJ5pY+uFff3cMrMgfJ88UwTPSpRcl3p1hStCdd9C3HegKAr8j20
	 ipXGZISsGEIhR4qdTLU7qr4AeiTfKYW7w0+U7UhIrYdgg2skFmCzicH8t7Tg2NBnjSjVv
	 9mvr9PvVpeZullxZRXT8kQa+LjoUHT8RxVuK3PWh/7TgdKUCojMvaRsU7PUONRxGozg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0HLkjDly;
	arc=none smtp.remote-ip=209.85.219.46
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC9E606A31E
	for <linux-kselftest@vger.kernel.org>; Fri, 27 Nov 2026 00:39:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEC9E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0HLkjDly
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-921318b2eb8so92315406d6.1
        for <linux-kselftest@vger.kernel.org>; Thu, 26 Nov 2026 16:39:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795739946; x=1796344746; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OvwsNYV9K/LXXZpGZnFqU4JXKALJmJzA8uLyf3/RYp8=;
        b=0HLkjDlyNv1L0j/syzitLwcg571pG03B3AT3w+IaHzH1wQN753d0d1Imvf6t6spOM5
         9iB74sWWyJCbFMZ5Jho0FRsyFBFB0PpvPBLcywajuZnsSSrvW2dMseU7Gclrb11dIdx9
         zy+eD8IKbTc+9GLLSM6zocvnZ3nkwPdIYT85vHAcIX2+V+8GxS0e6X/NEgmlBd750qd/
         URRT5rc8DmJyKAobSr1d/Ca9Dths9uOUUIljRDSI0dXQC9jtvkTw9yKq1NKPqc8vk0iF
         9YFKKc8u6m53mYmK+FTiMGYw80r0ofR12//5B3cy/YPutbtMP+GlrfECxk6Hq4rF7YWK
         oQrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795739946; x=1796344746;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OvwsNYV9K/LXXZpGZnFqU4JXKALJmJzA8uLyf3/RYp8=;
        b=si8NWZlPvJN2wQ2oWi/mY+cVrXX6FgmPCj0I4W0J6vFxredJeRtHSZzow1kRxPzZAq
         e6re7Gobcq082FhW0zEebAWl/X6yhzCSfka08ysgTX6PlrSfTsmYK66hxpkbCeL0o89D
         fiQLGnD3F7i8VO/M9rdX1Bfp3qXDjdXDGem0L/RO9pAtlX8gwwii1mxix4TmUtLyRYoE
         oEA9VkMQun/Hkl5p+9sCzTi4jcyRhzXmCnGylmHsOdJPFIVAEeimIZJyQDWDvJDh2Fl2
         63SKnA4eKKPFBrTi+VPhFqJWPG/tKFNto5f+1Ma2w8Z9rJY9sXgFLdgj4tKNwUB729hd
         LG1g==
X-Forwarded-Encrypted: i=1; AL+hErHlVYdhBCEqISTOZvs7u4vergT3GIW1WphPqHObVK7NAAc6f2KT3e17O0s3N1MzR4NaiArLSqEXsAa/bRt3mQE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+q5Y5gmqJBaR2HUwZBcgELWsMJc78G0mPDibM0dWx5xEN/TDtK
	aeSGN960aejlmDKfq/MZK47sO6G4CS0b7YzjH54Pldq10fUMVG3jJHR9Thv9RSq5BudTlQ==
X-Gm-Gg: AZFdTZcyCxH8yVfykYI6eQ5BSjgmC94aepZOUNFQzzDha2bUfgm0PSEaItyc+Y1QCr3
	jC59GscPjwCr6B3jDgnt9GeX3R+Fy2LxK48PbhycQikHGec4x3L+gO4UEXoPo4uWJz0eADnPbSw
	zOsChZVCkQ1u1ImZW4R+c3loxC3O1Sxj1IhxyNh0cQGNtJZ1x20OHddA04J4bmF4J7E4NFSqJZy
	Q+4DDP9d5mqrJWKrOtjRwpGRxymOHPnce8z8LD0Y9ssq/YcElHgdHVLvmSrX1RDqduUeA9fdzRM
	XKcSgU69/TBDE2CfEqjGYB8rApRvAEIm75Dv5ylyMlXMjKyduuFsRaQwUWeX4FcwzeMYl/432s9
	ZCC0dHhjeCi90gKHcjJzLj4TcxYGw4rhyrDl4RBkUPLpqeHfgZnr3mLeeMVKTMo++PvwaHC51d4
	WIvhtSowRepiv70ul0RNG35cOmLsJy99dchI20/67kwDU/hCDXjHRYa09sA/3OtKnGqJ6EE332f
	zBGyo4tFhVxvkcMfPUhHeJPFMg20jafHyNQ/BXr0G/ixA+c5qdnAKUbLuXcIs81L7cRczRimJuu
	DOQBnMVe7CC9kfO678QBIEaH8KJGS8jXQupS15flLMWe773/IQe8rGlaHo/ZSdHev/dxlD9Od0k
	DQBxG4MyC0icHKrH2vm6rCP7jrg==
X-Received: by 2002:a05:6214:3bc9:b0:921:89a9:d5c4 with SMTP id 6a1803df08f44-92189a9d8cdmr68634676d6.11.1795739945651;
        Thu, 26 Nov 2026 16:39:05 -0800 (PST)
Received: from localhost ([138.197.109.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92134a058aasm200373866d6.33.2026.11.26.16.39.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 16:39:05 -0800 (PST)
From: Nikolai Dokutovich <ndokutovich@gmail.com>
To: linux-fsdevel@vger.kernel.org,
	linux-block@vger.kernel.org,
	dm-devel@lists.linux.dev
Cc: Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Alasdair Kergon <agk@redhat.com>,
	Mike Snitzer <snitzer@kernel.org>,
	Mikulas Patocka <mpatocka@redhat.com>,
	Benjamin Marzinski <bmarzins@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org
Subject: [RFC PATCH] fs: tolerate an unfrozen superblock in the block-layer thaw
Date: Fri, 27 Nov 2026 03:39:02 +0300
Message-ID: <20261127003902.48-1-ndokutovich@gmail.com>
X-Mailer: git-send-email 2.43.0
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

The in-tree selftest tools/testing/selftests/filesystems/freeze fails in
shared_bdev.unmounted_sharer on v7.4-rc1 and v7.4-rc3.

DM suspend locks filesystems by default, so lock_fs() calls bdev_freeze(),
which freezes the superblock through fs_bdev_freeze() -> fs_super_freeze()
with FREEZE_HOLDER_USERSPACE.  A userspace FITHAW thaws that same credit.
On resume bdev_thaw() calls fs_bdev_thaw() -> fs_super_thaw(); the
superblock is already thawed, thaw_super() returns -EINVAL, and
fs_bdev_thaw() propagates the error when a single superblock uses the
device.  bdev_thaw() drops bd_fsfreeze_count only on success, so the count
stays elevated and every later mount that registers a superblock on the
device fails in super_dev_add() with -EBUSY.

The same condition is already tolerated when more than one superblock
uses the device.  Tolerate it for the single-superblock case too.

Add FREEZE_SKIP_UNFROZEN, set only by fs_super_thaw(), the holder thaw of
fs_bdev_thaw().  thaw_super_locked() returns success instead of -EINVAL
when the superblock is SB_UNFROZEN and the flag is set; a partially
frozen superblock, a superblock frozen by a different holder, and a
filesystem thaw error still fail, so the block-device reference is
released only when the holder thaw succeeds.

Filesystems with a custom ->thaw_super (gfs2) are not changed.

Block-layer freezes remain marked FREEZE_HOLDER_USERSPACE, so a userspace
FITHAW can still consume a device-manager freeze credit.  Marking them
FREEZE_HOLDER_KERNEL was considered but would change FITHAW behaviour
during a suspend.

Verified with the in-tree selftest: 5/6 before, 6/6 after.

Fixes: ea4e4cc26301 ("block: allow making a block device unfreezable")
Signed-off-by: Nikolai Dokutovich <ndokutovich@gmail.com>
---
 fs/super.c                     | 11 +++++++++--
 include/linux/fs/super_types.h |  2 ++
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/fs/super.c b/fs/super.c
index c5a0658f7aaf..5d850736c8d9 100644
--- a/fs/super.c
+++ b/fs/super.c
@@ -1457,7 +1457,8 @@ static int fs_super_thaw(struct super_block *sb)
 	if (sb->s_op->thaw_super)
 		return sb->s_op->thaw_super(sb,
 				FREEZE_MAY_NEST | FREEZE_HOLDER_USERSPACE, NULL);
-	return thaw_super(sb, FREEZE_MAY_NEST | FREEZE_HOLDER_USERSPACE, NULL);
+	return thaw_super(sb, FREEZE_MAY_NEST | FREEZE_HOLDER_USERSPACE |
+			       FREEZE_SKIP_UNFROZEN, NULL);
 }
 
 static void fs_bdev_mark_dead(struct block_device *bdev, bool surprise)
@@ -2025,7 +2026,8 @@ static int wait_for_partially_frozen(struct super_block *sb)
 }
 
 #define FREEZE_HOLDERS (FREEZE_HOLDER_KERNEL | FREEZE_HOLDER_USERSPACE)
-#define FREEZE_FLAGS (FREEZE_HOLDERS | FREEZE_MAY_NEST | FREEZE_EXCL)
+#define FREEZE_FLAGS (FREEZE_HOLDERS | FREEZE_MAY_NEST | FREEZE_EXCL | \
+		      FREEZE_SKIP_UNFROZEN)
 
 static inline int freeze_inc(struct super_block *sb, enum freeze_holder who)
 {
@@ -2296,6 +2298,11 @@ static int thaw_super_locked(struct super_block *sb, enum freeze_holder who,
 {
 	int error = -EINVAL;
 
+	if (sb->s_writers.frozen == SB_UNFROZEN) {
+		if (who & FREEZE_SKIP_UNFROZEN)
+			error = 0;
+		goto out_unlock;
+	}
 	if (sb->s_writers.frozen != SB_FREEZE_COMPLETE)
 		goto out_unlock;
 
diff --git a/include/linux/fs/super_types.h b/include/linux/fs/super_types.h
index 6ce105fe8359..434cdc338360 100644
--- a/include/linux/fs/super_types.h
+++ b/include/linux/fs/super_types.h
@@ -64,6 +64,7 @@ struct sb_writers {
  * @FREEZE_HOLDER_USERSPACE: userspace wants to freeze or thaw filesystem
  * @FREEZE_MAY_NEST: whether nesting freeze and thaw requests is allowed
  * @FREEZE_EXCL: a freeze that can only be undone by the owner
+ * @FREEZE_SKIP_UNFROZEN: tolerate thawing a superblock that is not frozen
  *
  * Indicate who the owner of the freeze or thaw request is and whether
  * the freeze needs to be exclusive or can nest.
@@ -78,6 +79,7 @@ enum freeze_holder {
 	FREEZE_HOLDER_USERSPACE	= (1U << 1),
 	FREEZE_MAY_NEST		= (1U << 2),
 	FREEZE_EXCL		= (1U << 3),
+	FREEZE_SKIP_UNFROZEN	= (1U << 4),
 };
 
 struct super_operations {
-- 
2.43.0

