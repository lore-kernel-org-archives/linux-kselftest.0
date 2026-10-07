Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B9C3546F9
	for <linux-kselftest@vger.kernel.org>; Wed,  7 Oct 2026 06:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791354255; cv=none; b=DtInCs4rRkmCDpl3+rPDor8bpLnWSpurrYgnC9v7YeXbFY6EsF01PQzU+HLSUHFd7qlHeGylCwHLJXXNrgpn4SStSfhXZmdagJX8b2QDBsXKCsl+dDV2kzxyLn6GrTrt/YgIxIvIzGTUptnN6soEJZZpPGJHJ0FcrSZ/ZnkNjX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791354255; c=relaxed/simple;
	bh=kFkUB9JMmamFMPVjw4kHxB2PL/LKqChP+4PfGUIXYy0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fDvcQGFIZa1Acg8mH5E2DVdCSTDqyWpRLcU+xIiLV7b/n6bnXMXZxR1yMxIFWNbmpRyE6aVtsND9LPG+nIRPzFrzxtxFznrFLY4ltGyhKV02ubxXyebk62mEG5zdbnV+4rALEJYYS30CRkMSxXE0KDZRIyojU0maVRz7pDmyKic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j4yNZUYr; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j4yNZUYr"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2e618db81c0so645875ad.2
        for <linux-kselftest@vger.kernel.org>; Tue, 06 Oct 2026 23:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791354252; x=1791959052; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RtO3NtbRo/3Bu2ksyEYckCsBeXypsAqVn6J8VkJKvcA=;
        b=j4yNZUYrbJClyR58G6BsrbXFdQLeMHg6xQdEpUoCGxy9CdEH38rHJBsCjj5m7As7eX
         thU1tZOOK0lVBtTwHLojzg2lE58QvsGipIyc4aI8Wog6rs8ZKlEi0Mxt9E7vkqVJy573
         Oo7m2SzA8guQHW25hj+qdTfpc9tFSSVIWRVfWYGawec7T+SYf0pfoGGnY4GmOehvc5yY
         YwoJXZ8NPLYsLbdtcKymNURI4BuNBJ1b3htp3yjTIgQWXqo6Y/rDJ25YegubTDtX7ezi
         Zsabs3kmpDOXKGGvS3ljFIPhdPcj6xNXtFLzduplRvr1AVTIfGouYivBLSSSn9x2GcHU
         +iOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791354252; x=1791959052;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RtO3NtbRo/3Bu2ksyEYckCsBeXypsAqVn6J8VkJKvcA=;
        b=Bh9NU44dzyvuAvY4l7CO2UYPL49VyPgucYG3eUDDaYzMA19XxSfqDGzTjC+PDo+9OY
         Yy/DJFW7zGG9ApmOJ6HaOf6FwjgfsJp8e1tViOcMO9+6aJf5/B7xm0STNiLJ+wFU6Set
         UPOiToyKBeIebrKZwRZ2arSrwdSLKdudkvmzaTDwZdJCi9RKAgCR4+UunfwrrDU2BFOe
         8WwzS+v+VkE05+WyKEw8FVSlP/Z4SUVZeHm7aBD/Scaxx5iSqAxIMEkMtaaI6sRartE2
         DOkmaeOHrP+gCRUOUSIt79IqgU4lHSlwmnJj2vFYaybcA6or0MsTS8Pug3++cSrAfYbe
         dkdw==
X-Forwarded-Encrypted: i=1; AKwUvBwBVjHiV6hl1AKtrQNBhr7Fko2LsdmMRAE0IyBaq6GoYMdpcZeGJTAShT2rDlsvrvAqb50pbpXn8y+H9fEVDPk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJpwS5YIGcf6mUtHpFmiDQ6BNpO1eT3GUICvA2Xa2/2pEw+1RIe
	oeW3wih/9GKdhqesSw5Qq3W1stMYq0nQXwd8r5XFX1dWv0f+5GkPgVl9
X-Gm-Gg: AYBFou1ijYQrvHbaqfNGrakt94PMVVnQfrhrn7bxrLTygxgCRzpazsdLju3dNSb+mT+
	ukQvX22XkwB2D1lf0lDmRiI8z2QN18ds3uZvy0Pra/zrsPs0wgseJ2T4+2jdW95XEInrwNk21qs
	6C84UU383dEMAPBmCskrnfcDaMqkMO0Xzmyea37wSOAqYUgPHfYZDUXuWUCi997UeUOIiLQmAfz
	gBP5Edzi8HRneMI4eETzSvmXQg7cNKhZQY5z8qpIZui1I+3n+gAckKa0AykL7IKwi3xXXNpPyEQ
	6FcTx+CW0/YVMxthD3Ao0U4y7HD6jH1rj5OmrW09EnLWbb1vWG3a3m6XOyRlfjVMC4yz//1DiTi
	CvvCl8Y4kUVeB2lHX052CCCW72XMyyYPB8GIOL2YLeNKzZMiMLJQxNO8jGkYaIs3IqwNx9KVXQU
	BhtG+shyWWNMrLUv282PQOWANr3gO2ZkhPuAz0XQskROJ6GluSmWVS6XD7aP8BzbOB+U11Bg==
X-Received: by 2002:a17:902:dac9:b0:2e5:356b:b0c1 with SMTP id d9443c01a7336-2e60038d656mr13217325ad.37.1791354251831;
        Tue, 06 Oct 2026 23:24:11 -0700 (PDT)
Received: from [10.1.2.130] ([67.185.120.12])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e60482ccb3sm5303515ad.51.2026.10.06.23.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 23:24:11 -0700 (PDT)
From: Kir Kolyshkin <kolyshkin@gmail.com>
Subject: [PATCH v3 0/2] mount: add OPEN_TREE_DROP_MNTNS_MOUNTS
Date: Tue, 06 Oct 2026 23:23:55 -0700
Message-Id: <20261006-nsfs-prune-rfc-v3-0-adb97ea52868@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/13MwQ6CMAzG8VchPVuzFMeCJ9+DcIBZoIkMsumiI
 Xt3B4kXj/8232+DwF44wLXYwHOUIIvLUZ4KsFPnRka55wZSVKmaNLowBFz9yzH6wSL3ZLUxte4
 tQR6tngd5H2DT5p4kPBf/OfxI+/VHVf9UJFSoS73/FF/Y3Ma5k8fZLjO0KaUvBMBe06wAAAA=
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

The flag requires AT_RECURSIVE: a non-recursive clone has no submounts,
so there is nothing to drop.  With OPEN_TREE_NAMESPACE, which never
copies these mounts, the flag is accepted and has no effect, so a runtime
can pass it with any recursive open_tree() call.
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

Changes since v2:
 - require AT_RECURSIVE, reject the flag with EINVAL without it (Andrei)

Changes since v1:
 - split into the kernel change and the selftest (Christian)
 - rename OPEN_TREE_SKIP_MNTNS to OPEN_TREE_DROP_MNTNS_MOUNTS (Christian)
 - shorten the commit message

v2: https://lore.kernel.org/linux-fsdevel/20260926-nsfs-prune-rfc-v2-0-53509260e4e7@gmail.com/
v1: https://lore.kernel.org/linux-fsdevel/20260923205028.711077-1-kolyshkin@gmail.com/

[1] https://lore.kernel.org/all/2026-01-07-oldest-grim-captions-spills-ywC2O3@cyphar.com/
[2] https://github.com/containers/crun/issues/2262

Signed-off-by: Kir Kolyshkin <kolyshkin@gmail.com>
---
Kir Kolyshkin (2):
      mount: add OPEN_TREE_DROP_MNTNS_MOUNTS
      selftests/filesystems: test OPEN_TREE_DROP_MNTNS_MOUNTS

 fs/namespace.c                                     |  16 +-
 include/uapi/linux/mount.h                         |   1 +
 .../filesystems/open_tree_ns/open_tree_ns_test.c   | 193 +++++++++++++++++++++
 3 files changed, 208 insertions(+), 2 deletions(-)
---
base-commit: b5a051f6b840d48f159166ef073d3021989bfb50
change-id: 20260925-nsfs-prune-rfc-eb2c57795bc2

Best regards,
-- 
Kir Kolyshkin <kolyshkin@gmail.com>

