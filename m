Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0BC5346ACD
	for <linux-kselftest@vger.kernel.org>; Mon, 22 Jun 2026 04:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782103183; cv=none; b=cMnHMHoLHdi8RUU+9vDp29EqHZ9bBnWoSxNCHkDSIM1sO9rOG8AoC+SU8Qnbul4SnPbo6XbIFot/ux87GvipTX5jnwTxxYUhStCdAD46dE9+9zYcpMTyhpfY3fGxBHnMjONlMEtGKgfAmsfey/NfMTOFCXZeOdpM9MtUZfelBe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782103183; c=relaxed/simple;
	bh=QRlGIdhxVJez3ArgaIw3nHcRgcOp/IS9Jhys52DHq5E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VMDsRCiz03J0KT/XdHnPdFfP0FyRaaTCkA5p92QbaA4Nf5Q3q7EZXAzxPlRHqKU1YK2quxTOIXai+375BaS+ANDIBhdRZgzlI/BP6fBdcXEIcz4yQEBWkglqEjhTjL3PXwx4jZ/3oNMEgAaOkq5KK0Ec/ianfSoHmY6hCD+UQNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bfFXE/RY; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bfFXE/RY"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7e94d272a86so857284a34.2
        for <linux-kselftest@vger.kernel.org>; Sun, 21 Jun 2026 21:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782103181; x=1782707981; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LWLk8vwBsRQV/8chPVVuiTE+2TLYOW07i2z27bitdoE=;
        b=bfFXE/RYlxUv40EUqJ5obhRsAH5b7ql29tGvdA3nlKTxLHonmjAjQmQWSRlWm+qeGh
         0bZh6SKWi/r6hOAf8G2ft0y9gqi0ldUbaxdtiVQ0u7FJoDBTnkhhaLbQJI5V89SSx+/x
         fR64tGb4bb4w5rEb3WWU4GSuPfoHfTV7pn4PuFveOorKAcQhaKTyr+S0H975/7qKWNM8
         +Z45+f9evpl5hSb3l/nYkh1YuibdS8J01/LM2PQmnBxJFECJUrF73Sbu7d91P0qRbzrt
         6bRZFSgc07wxfaA/BQwrCI61pB+LA3efb6frq9VKzSbYQucSFf9pDgfItb9PA8bd0E1C
         JsPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782103181; x=1782707981;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LWLk8vwBsRQV/8chPVVuiTE+2TLYOW07i2z27bitdoE=;
        b=mgoxDl9L66h96zPrkHOXglCruDDfO6zTSI7yN1RDEzYv3kkRhaKmhijKBYWUIhIRAc
         504ODACi6k/gDMZ3HOkz//8vTWp3xRgypO/Z1s+N0Y5Qk6rJag6qmbrnKD4qmMf05QRn
         BdwEq8UpyoP+VRaF3Nv9XCxPm8OfAybVfVXMAp/aOqSNSkZP6OqQpXyCmO03CKk9OGl7
         nLyPqyhCqc4q8IzHqyXL+k8VwFwDEf02WexAwe/DJayfLpC32SXo43jEaOlum9KRlKhX
         nfy9hUJuDw0O5hiCqVn8te69+BGwQW8Fku0slfgQzE17PtcI1XmYOfVu/SYcIaJFIS/D
         LYqQ==
X-Forwarded-Encrypted: i=1; AFNElJ9SI4ZzAuqLi66apAKJ3Sad82iOibcbe+dPcFig1gcM0NeKV4BSVX5Ou6hJlnwI4c8kk/SYGLKK7ep6+zBTvdA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzE/1LCNPxPBavYK0GBBjb8ljlRYGjN7Qbq6LKBV5iErxByYmxM
	vNiPl9ugXU6/Ui8ZIjbobg9N2/K6cXK0EZDyBxGzPvQiloQNxaG8J4Y2
X-Gm-Gg: AfdE7clsBO3uD2eU0PFJYGrMrB6fvCdw3qG1atEC2oZfeass5TKuxC9EI/8S8iaXNfF
	HU49tp6FFNp2OK+A0wobLu2LNev1F9C50OciJDzJpMqTVEUNKpnvB3btBXmgqykzoDc0+qAkIOV
	eb2StqYCpKguj2dvnE+Bs/0ncFuJKzmh7HuQeGyEfnW6WjDpsbMkxaXA0o6tn/hrxb/mOHTfq8+
	wugQJ5jBtkwrBXXAmEqqsbvyVpBDu2nMvbi9sY5zt7/3/Hkf92MlWJAzcoxkGt7Vs12jFc3ogJK
	lEm3lezTuKRCN5abGfIUFDiRaZbu/ki3gz6jGyD64U43/P83n2PvklLfUNCLcB+M8YW33gnKVYm
	TikK+DjmFye7R+ODBQcBNxLGFXFXEzngoSnddmu6vE17AjrG0IsJgH12okeGNlOeFBaSEqb7qgG
	lX9Y+1kAGcGDj5r5vktyA6MGThRM6ZaoHFdYi43tpQd+Qi
X-Received: by 2002:a05:6830:83aa:b0:7e6:f5bc:496 with SMTP id 46e09a7af769-7e92d8eedc8mr11244425a34.16.1782103180884;
        Sun, 21 Jun 2026 21:39:40 -0700 (PDT)
Received: from nyx.tail25a6.ts.net ([2605:59c8:74db:6e0c:3a80:a3f:f9f0:1b3c])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e9442ea144sm5428453a34.27.2026.06.21.21.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 21:39:40 -0700 (PDT)
From: Farid Zakaria <farid.m.zakaria@gmail.com>
To: kees@kernel.org,
	brauner@kernel.org,
	viro@zeniv.linux.org.uk
Cc: jack@suse.cz,
	shuah@kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Farid Zakaria <farid.m.zakaria@gmail.com>
Subject: [PATCH 0/2] fs: support $ORIGIN in ELF interpreter paths
Date: Sun, 21 Jun 2026 21:39:32 -0700
Message-ID: <20260622043934.179879-1-farid.m.zakaria@gmail.com>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, standard ELF and ELF FDPIC loaders require a fixed, absolute
path to the dynamic linker/interpreter (specified via PT_INTERP). This
creates significant inflexibility for relocatable dynamic interpreters,
where binaries are packaged independent of global system paths.

The primary goal of this patch series is to support relocatable binaries
in Nix, where packages are stored in a read-only store (typically /nix/store).
Allowing the ELF interpreter path to be resolved dynamically relative to
the binary's location via $ORIGIN enables Nix packages to be relocated
without needing patchelf or wrapper scripts.

For details on the design and motivation for this in Nix, see:
https://fzakaria.com/2026/06/21/nix-needs-relocatable-binaries

This series introduces support for resolving the $ORIGIN placeholder in 
the ELF interpreter path, bringing the kernel's binary loading behavior
in line with user-space dynamic linker origin resolution. 

To achieve this cleanly:
- We introduce a shared 'resolve_elf_interpreter()' helper in the VFS
  exec subsystem to avoid code duplication across loader implementations.
- For security, we restrict detection strictly to the prefix string
  "$ORIGIN" to prevent complex parsing exploits in kernel space.

Testing & Verification:
- Added a KUnit test case verifying path resolution logic.
- Added a kselftests integration test checking that a dynamically
  linked binary with its interpreter set to '$ORIGIN/mock_interp' successfully
  loads the mock interpreter (built statically using nolibc to avoid
  glibc TLS setup constraints during interpreter load-time).
- Verified end-to-end correct execution (PASS) using a minimal initramfs
  under QEMU.

Farid Zakaria (2):
  fs: support $ORIGIN in ELF interpreter paths
  selftests/exec: add test suites for $ORIGIN interpreter resolution

 fs/binfmt_elf.c                               | 11 ++++-
 fs/binfmt_elf_fdpic.c                         | 15 ++++++-
 fs/exec.c                                     | 42 +++++++++++++++++++
 fs/tests/exec_kunit.c                         | 26 ++++++++++++
 include/linux/binfmts.h                       |  2 +
 tools/testing/selftests/exec/Makefile         | 12 ++++--
 tools/testing/selftests/exec/mock_interp.c    |  6 +++
 tools/testing/selftests/exec/origin_interp.sh | 16 +++++++
 tools/testing/selftests/exec/test_prog.c      |  5 +++
 9 files changed, 128 insertions(+), 7 deletions(-)
 create mode 100644 tools/testing/selftests/exec/mock_interp.c
 create mode 100755 tools/testing/selftests/exec/origin_interp.sh
 create mode 100644 tools/testing/selftests/exec/test_prog.c

-- 
2.51.2

