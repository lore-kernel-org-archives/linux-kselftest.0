Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D85725733E
	for <linux-kselftest@vger.kernel.org>; Sat, 26 Sep 2026 07:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790406059; cv=none; b=M/cUBYvhu/OXpZgvwhIU7CAJPCeS/yzxZBPsO/wV5kKg+OGrNWDttx1AWUPMIIBvpkbPi65NyVKIlz2ZPoRIJo4Q6sEWzd2bLQXRdTTW+cZZAYV6cwvm6R+M1ee2t3AvxllyKhw+EvRy7zFAPIDQVJGheivndt7dz0kGNDTnnCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790406059; c=relaxed/simple;
	bh=zYwQwewCk4P7+4enRD40+cZRarhYq0yRswb+8KrgcNk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=p3oDu9dwXYy31HVuiCAMoppyeWJ7Yny1cdmVfDDX8T1trZOfvut6/8SKjdZs8xQTOOU7E2MSjUHgBRytb7ZH7YigFsJzEWZweSuDn3BMQUeWGMpEZA51am6apVNX6o8QBGS4hCAevqWpGSO7OifgHA/70zvrkUbVlf+CMfyT1R0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DtxoYN1q; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DtxoYN1q"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d93ff61046so8325965ad.3
        for <linux-kselftest@vger.kernel.org>; Sat, 26 Sep 2026 00:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790406057; x=1791010857; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lFMzbROQnPZ03LFhgGCTeVYFQX7f/d2hoEAIuqyzaxg=;
        b=DtxoYN1qAWaLz0Q/gRvQFhRXYDfHTV3nMgcReKZ6M+M+IfQnwvDobzzZb35n+z1ozV
         DD7hW9eeARo4YbK7MTc/t347dJZUkNhld22G12gJ7sziJx7hQ/+tnOfoT8SZLMfNKrUL
         CwdzGlGEWWR3EuY74G5X4aS4bSN8e7n736pAkU04DSKTwvMX2cM3ttgQs06+MggGsw+Q
         BVpLO9QFg6793s6TgqfHBRMWqoJ4y3ajqNmlYmf30U7Jh+c6gKsq7kMsuRNK3WscA+cw
         2vLe+SEocn3F3WWQmc5xPsAub1GCUS6ee1zdYUjvolV8BiSx4fkG+YnYF3yZsu8tqt1S
         ESNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790406057; x=1791010857;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lFMzbROQnPZ03LFhgGCTeVYFQX7f/d2hoEAIuqyzaxg=;
        b=14d6hztYUnyDJbG77Iwe+n71kdwLwqDiRIEZD2eZtDlgvFCHVKp+lpzGZdL/g4hB1q
         Dius8ace84lD945JYZm+amPGJ/dSkbvwgM8lktc5rXEdRRGqXo7zLJSiEqpl559/j4l5
         VvNXY4eqAsnGfrlfCC4fQiqmvPp3hTxlGEDGoFvAQQVcfzk5PgGY2KubbH+ImAUajJ5H
         1JrMFHHiT9c3XYMg2oAFENzCW/FTTAdso/wJgd3wvtfTID4M7j93flgErmW6hKa1K6Pc
         W6UpZRr92JlPx/WuZatzmOi6brefmDQIfqN95Kq/tREHBc3KLDYl86DJ4EV10Ohb10Bc
         ABeg==
X-Forwarded-Encrypted: i=1; AKwUvBzKR//QpoX9AH6RRH5i+/PJn+3xK8n2mPoQdSUq7ZqNESbRiMBNr2XSmRTlTTUPsjeRpsX0SRZITMPdBcDlvlM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKwknorpy1JsPhPj1F0L03bbI9JferAQUKn/mBMSP1R6Icckbhy
	yVKBer7sq86gVNzQiTZm1CCVHduJbm1tKOiySDMsmJq92BpnatZzzls+r4nGc5em
X-Gm-Gg: AYBFou3kgtVnFYqe30sBsBmnfPWPND9KpuKBJIxT/GcTU+VVlnjnFjSm//fXF2rnEYQ
	K44IaPSJu/sHMR3s8drPrMr8HMsSA+Vhnn2cm0LnIPfRh7ltfZWQIqmXHLSYPjZ6IVP2G4SnSCr
	iENfzCB08LUKzgJl5MAog/r1HyrSjfjwW7B8sF1hSrxOWKxSGMhsIr7avEYbR630ws9xMgjOUxU
	mZ9pUba1b5YN/MPe7SZgXSedqDF6EvffxedKK865WHLYgBJ3M83VNeFgD3t7gG3bNhprJctmp2N
	EKMlaY9J6R6EV9TsamncJ7ne4epbsjbVEmaZihKbdU2zu0adaptRONQjGN7zqiE/xJvcGdSIEWh
	A2XqP+L89RSpYF+XBbIEd3YVsK6frj0DeMS0Vheb8fjnlm5jc3tmI8qKL3ZGoZzo8bRadiq6bYq
	2/kjOGYJZkq9fhJejteUGoOZSgKZsyRz9+vTFRB7K7qUb/SOcBcwCe7bZS56tQJTJf7/km7g==
X-Received: by 2002:a17:90b:1b08:b0:39d:e213:9dd3 with SMTP id 98e67ed59e1d1-3a098d4769emr6127977a91.1.1790406057113;
        Sat, 26 Sep 2026 00:00:57 -0700 (PDT)
Received: from [10.1.2.130] ([67.185.120.12])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0974ec5d0sm15987119a91.4.2026.09.26.00.00.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 00:00:56 -0700 (PDT)
From: Kir Kolyshkin <kolyshkin@gmail.com>
Subject: [PATCH v2 0/2] mount: add OPEN_TREE_DROP_MNTNS_MOUNTS
Date: Sat, 26 Sep 2026 00:00:52 -0700
Message-Id: <20260926-nsfs-prune-rfc-v2-0-53509260e4e7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MMQqAMAxA0atIZgMlUEu9ijhoTTVLlQRFEO9uc
 XzD/w8Yq7BB3zygfInJXiqobSBtU1kZZakGctS5SB6LZcNDz8KoOSHPlHwI0c+JoEaHcpb7Hw7
 j+352CNG5YAAAAA==
X-Change-ID: 20260925-nsfs-prune-rfc-eb2c57795bc2
To: Christian Brauner <brauner@kernel.org>, 
 Alexander Viro <viro@zeniv.linux.org.uk>, Aleksa Sarai <cyphar@cyphar.com>
Cc: Jan Kara <jack@suse.cz>, Jeff Layton <jlayton@kernel.org>, 
 "Eric W . Biederman" <ebiederm@xmission.com>, 
 David Howells <dhowells@redhat.com>, Amir Goldstein <amir73il@gmail.com>, 
 Andrei Vagin <avagin@google.com>, Shuah Khan <shuah@kernel.org>, 
 Giuseppe Scrivano <giuseppe@scrivano.org>, linux-fsdevel@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 containers@lists.linux.dev, Kir Kolyshkin <kolyshkin@gmail.com>
X-Mailer: b4 0.14.3

crun, a container runtime, recently started using OPEN_TREE_NAMESPACE to
set up the container's mount namespace, and open_tree(OPEN_TREE_CLONE)
for the sources of its bind mounts.  This turns out not to work on hosts
that have a mount namespace pinned anywhere below such a source: the
recursive clone picks the pinned namespace up, and move_mount(2) then
refuses to attach the tree with ELOOP from check_for_nsfs_mounts().

The rule behind that goes back to commit 8823c079ba71 ("vfs: Add setns
support for the mount namespace"), which requires "all bind mounts be of
a younger mount namespace into an older mount namespace" so that mount
namespace reference loops cannot form.  OPEN_TREE_NAMESPACE ends up on
the wrong side of it by construction: the namespace it creates is younger
than everything else on the system, so from inside it every pinned
namespace is older.

By the time this fails there is nothing userspace can do.  setns() has
already run, so the host tree is unreachable by path; it is unreachable
through a fd saved beforehand as well, since mount(2) requires the source
to live in the current mount namespace; and the offending mounts cannot
be dropped from the detached copy first, because umount(2) requires
check_mnt().  So a runtime cannot fall back to the pivot_root() path at
that point -- it has to predict the situation before setns(), which is
what crun now does, at the cost of the optimization on every such host.

This is not a corner case: snapd pins mount namespaces under
/run/snapd/ns, so on Ubuntu it affects any container that bind mounts the
host root, which is not uncommon [2].

Every other path that crosses a mount namespace boundary already leaves
these mounts behind: copy_mnt_ns() passes CL_COPY_UNBINDABLE | CL_EXPIRE,
and create_new_namespace() passes no CL_COPY_MNT_NS_FILE either -- the
latter deliberately, per the comment added in commit 9b8a0ba68246
("mount: add OPEN_TREE_NAMESPACE"): "When creating a new mount namespace
we don't want to copy over mounts of mount namespaces to avoid the risk
of cycles".  Only get_detached_copy() asks for them, inherited from the
unconditional CL_COPY_MNT_NS_FILE that predates that exception.

Patch 1 adds a flag so a caller can ask for a clone without them, as
suggested by Aleksa when the exception was introduced [1]:

    I kind of think this is a somewhat theoretical issue but I don't
    think we'll be bitten by it. My gut feeling is that I'd prefer this
    to be an OPEN_TREE_* flag that you have to set (so we can support
    this in the future) but that's kinda ugly too...

Keep it opt-in rather than changing the default.  A clone attached in the
caller's own namespace, or in an older one, keeps such mounts usable, and
open_tree(OPEN_TREE_CLONE) plus move_mount(2) is what mount --rbind is
through a file descriptor, so dropping them by default would make
mount --rbind / /mnt silently lose /run/snapd/ns/*.mnt on a live system.
Only a caller heading into a younger namespace, where the tree is refused
anyway, has reason to ask for this.

With OPEN_TREE_NAMESPACE, which never copies these mounts, the flag is
accepted and has no effect, so a runtime can pass it unconditionally.
Locked nsfs mounts are skipped the same way copy_mnt_ns() already skips
them, so this exposes nothing new.

Containers observe no difference: set up the traditional way, with
unshare(CLONE_NEWNS) and pivot_root(), they see no nsfs mounts under a
recursive bind of the host root today.

Tested by booting the patched kernel in qemu and running the selftests in
tools/testing/selftests/filesystems/open_tree_ns: 19 pass (including
the two new cases), 12 skip (all in the existing tests), none fail.
Without the flag, move_mount() fails exactly as described, with ELOOP.

Patch 2 adds the selftests.

Changes since v1:
 - split into the kernel change and the selftest (Christian)
 - rename OPEN_TREE_SKIP_MNTNS to OPEN_TREE_DROP_MNTNS_MOUNTS (Christian)
 - shorten the commit message

v1: https://lore.kernel.org/linux-fsdevel/20260923205028.711077-1-kolyshkin@gmail.com/

[1] https://lore.kernel.org/all/2026-01-07-oldest-grim-captions-spills-ywC2O3@cyphar.com/
[2] https://github.com/containers/crun/issues/2262

Signed-off-by: Kir Kolyshkin <kolyshkin@gmail.com>
---
Kir Kolyshkin (2):
      mount: add OPEN_TREE_DROP_MNTNS_MOUNTS
      selftests/filesystems: test OPEN_TREE_DROP_MNTNS_MOUNTS

 fs/namespace.c                                     |  14 +-
 include/uapi/linux/mount.h                         |   1 +
 .../filesystems/open_tree_ns/open_tree_ns_test.c   | 183 +++++++++++++++++++++
 3 files changed, 196 insertions(+), 2 deletions(-)
---
base-commit: b5a051f6b840d48f159166ef073d3021989bfb50
change-id: 20260925-nsfs-prune-rfc-eb2c57795bc2

Best regards,
-- 
Kir Kolyshkin <kolyshkin@gmail.com>

