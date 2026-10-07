Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC88F4718F9
	for <linux-kselftest@vger.kernel.org>; Wed,  7 Oct 2026 23:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791414894; cv=none; b=uUo07a4MdjyHOZa31sX/fcdiiffmBJFuJpkgtwOiPB2sU6ftVc5iC1FyGiGU7r+ibJf1QoCnKAlvadf9FZFdZVf5tNhC9aAqRXm5Mp/bNHf9lKCxTMfLhddolaov8lacmY2MYFJo6e+t6yJUHn8X26vcp42HjcNXSSrw8nEsGGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791414894; c=relaxed/simple;
	bh=5114g4GwAMLsvBYWWh4v6Uv/o65R2Ivnng+bjyX/hb0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XomFF7ZMCLwK0f1/jRGdaWltuAiKCgmmxo0sKD4J2Y+YJ1F/yiAhyooaZJG+GIXRwfYQcPOdhIoIrzAn9JwWMFq0cqVAHROBPR5NESoLroK7fsJzHYhf0H8f3ZMAlKKe8OLSurszRh6Rbv0D5ut28mMna24n9t8KI5+kO7pqCE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=erHB6NOQ; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="erHB6NOQ"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2dd9ec41bc4so16024645ad.2
        for <linux-kselftest@vger.kernel.org>; Wed, 07 Oct 2026 16:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791414892; x=1792019692; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3X41AIkS/dsp/EHn6K3Ci0TU6cqt5IO83pSbJ3jRHLw=;
        b=erHB6NOQpykt8DMOwgHaBmL9deuUGIojBc/sGj9nMCGrSbnrwB98+94vhSUILiy1z7
         Z56A0isyJoAbVBTAPqAApR0bJF7UP2mLb9/w8gTbBtIcp0EgVqyeYO6bPvU8z0d7Mj4r
         QmnbotdOUVzQwljOUv3CZlStX0D1KDOyktTtUVEExBxQipVw+s0PqFL97fcUXIkedYdg
         5a0Q46Jhu0dP1/d+3EQDAmGiHtksGCxn/Bw3Ez73vUhKBc6mBlsU1dw8fUgUPrVlQe1P
         L9vl/EtfrzWpjnUJB+zXEqrheCSszlvEfo1I1TXua7Bk5aHRbNlVZJDNhpPBYzb29KW7
         eyEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791414892; x=1792019692;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3X41AIkS/dsp/EHn6K3Ci0TU6cqt5IO83pSbJ3jRHLw=;
        b=Ckdlss/nN+gHPNUEwtqYQkFh3n9ZQv90y0QEF9z7TRFFsLs2qNz4vaMHm1/NMCcxSY
         cO8L7V/G1GzrMLKen7YLwlasnUscQB11NvXjUxY+P8zYLABMvTkaP1LwnpZu1Ciybdtw
         1J4/XG7OBmyRjkEFYYnAEp57enKdSEy67FA4kGY+aIKy9/beRTGYkumE2mJQF+5iREza
         2+3bz7TwS36/MnRXfYewreF2fZhKM6b7T1yUa6laLIKUPFXAjXP0JfRt+L68c5ZYCpXe
         zRDHy6nRgr6+BuqUnDNl0pyVoq74yrEvjKY6GvkmAXJum8rXGV2GtCUAxUhKdSpxITNK
         Eqeg==
X-Forwarded-Encrypted: i=1; AKwUvBycIF8ODU94B4AtsbZH1PibYCDmAUIbvi6Gb0GuYdodqa2P8OirbuoHkN1FUwltMiE3HhrLcxtS4XqKjiMje7Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYKGLWmSaJAEkfzWr8+hFr8qIB5DU7OWBpdcJ16A8p9V4W/qgdu0
	77t42/7rcNXvP9EJmME3wo4L8qJceHzGcKf2uGtElPBhYJKsCbOxtPKY
X-Gm-Gg: AYBFou0ts3GjGMlHQ1whwV9aIT7iKb87GTcvmvnYCzfWWdlqeHO46JSwliraQEuon+i
	tTBd1ZVvhwB5RRtT0Pr+S0R5T08KkOwpYNE8GkFkialdr8tkbp+r285uucjtR49NwfUnku2zyZD
	BCAXF/pMDxXt0B9363UI5DoxxrVXjzFOEicWdnTXuNmKXnPxW7O/wLQX3jFtN+f+A9kGgIPnm7I
	GU5PjQYmllXhlsds99WbFerso6mRNwKTZUDR5E0xw/A/jKFcgzAmihKTWvesxV9C/5qoOkAuYE+
	/McGLPb5tNjP7SD5utKDOAWH5j5ozuUYZI2offurXUFXWmFLz+A5KiFDKVdNIoto2uZbLJe+zHq
	UbthkKLPMWQqoVr08vBR+sGYipQu8C3LoUrWXT0FzPW5IGI6jGwXPNFnk6WjrGRryZhuhT60/M+
	sD4NAlQa6Ni++47jj3ihJjUjfO5oC+eRAARC0OJtCr3HV5Stcu276ySunbWkeCcvGQK/i+l8eXH
	/Jet8pndXNv4hNdXQ==
X-Received: by 2002:a17:90b:3ec9:b0:3a2:b4bb:91ca with SMTP id 98e67ed59e1d1-3a8a072a99cmr3054120a91.1.1791414892110;
        Wed, 07 Oct 2026 16:14:52 -0700 (PDT)
Received: from [192.168.0.160] ([76.135.114.51])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a9ff7ff13esm1356270a91.7.2026.10.07.16.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 16:14:51 -0700 (PDT)
From: Stanislav Kinsburskii <skinsburskii@gmail.com>
Subject: [PATCH 0/2] fuse: support per-inode open and release suppression
Date: Wed, 07 Oct 2026 16:14:33 -0700
Message-Id: <20261007-fuse-per-inode-no-open-v1-0-be5229fe89f5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFnSxmoC/x3MMQqFMBBF0a3I1A7EICpu5WORmKdOMwkJXwRx7
 wbLU9x7U0EWFJqbmzJOKRK1omsbWg+nO1hCNVljh86Ykbd/ASdkFo0BrJFjgnLoDazvnfeToxq
 njE2ub/xbnucFOvqUbmgAAAA=
To: Miklos Szeredi <miklos@szeredi.hu>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Shuah Khan <shuah@kernel.org>
Cc: Robert Byrnes <byrnes@wildpumpkin.net>, fuse-devel@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, 
 Stanislav Kinsburskii <skinsburskii@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791414890; l=2541;
 i=skinsburskii@gmail.com; s=20260722; h=from:subject:message-id;
 bh=5114g4GwAMLsvBYWWh4v6Uv/o65R2Ivnng+bjyX/hb0=;
 b=n05G5uQcf4QRi9Y5MPe2UuJul9ToeFOPrxf6HhNrLuiiBDsT85iYVRHQq4oZwrzVkgMGPWViP
 KcIj0Mvlx9mAv88eV+oqCwhzN/z4xKkgIo6zas3O5Llrp7e6TX8+vRc
X-Developer-Key: i=skinsburskii@gmail.com; a=ed25519;
 pk=bDpriHBYgeTdkIDweZDCemxsU93neJBOCn3YLIuJpnE=

For FUSE filesystems serving immutable data, warm-cache workloads can
still spend much of their time sending OPEN/OPENDIR and RELEASE/RELEASEDIR
requests. Data, attributes, lookups and directory entries may already be
cached, but opening each object still requires a userspace round trip.

The existing connection-wide no-open support cannot distinguish these
objects from control files that need the server's open and release
callbacks.

This series adds negotiated per-inode suppression. A server negotiates
FUSE_PER_INODE_NO_OPEN during INIT and marks eligible inodes with
FUSE_ATTR_NO_OPEN in their attribute replies. The kernel then handles
opens locally for those inodes, using a zero file handle and the existing
no-open cache defaults. Subsequent requests identify the object by nodeid.

Release suppression follows how each handle was opened, so changing the
inode's hint does not create an unmatched release or lose the release of
a server-opened handle. Atomic O_TRUNC still sends OPEN to the server,
and CREATE retains its existing open and release lifecycle.

The second patch adds a raw /dev/fuse selftest without requiring libfuse
support for the new protocol flags. It covers capability negotiation,
files and directories, LOOKUP and READDIRPLUS attributes, hint changes
through GETATTR, hint preservation across STATX, atomic truncation and
CREATE. The cases also run with writeback caching enabled.

Signed-off-by: Stanislav Kinsburskii <skinsburskii@gmail.com>
---
Stanislav Kinsburskii (2):
      fuse: add negotiated per-inode open and release suppression
      selftests: fuse: test per-inode open suppression

 Documentation/filesystems/fuse/fuse-no-open.rst    |  39 ++
 Documentation/filesystems/fuse/index.rst           |   1 +
 fs/fuse/file.c                                     |  26 +-
 fs/fuse/fuse_i.h                                   |  17 +-
 fs/fuse/inode.c                                    |   9 +
 fs/fuse/ioctl.c                                    |   3 +-
 include/uapi/linux/fuse.h                          |  11 +-
 .../testing/selftests/filesystems/fuse/.gitignore  |   1 +
 tools/testing/selftests/filesystems/fuse/Makefile  |   2 +
 .../selftests/filesystems/fuse/no_open_test.c      | 511 +++++++++++++++++++++
 10 files changed, 612 insertions(+), 8 deletions(-)
---
base-commit: b018686719706a781c45a874ed51374a2dc4b767
change-id: 20261007-fuse-per-inode-no-open-d40e2b4abb8a

Best regards,
-- 
Stanislav Kinsburskii <skinsburskii@gmail.com>

