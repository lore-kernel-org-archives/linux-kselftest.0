Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5750347AF5D
	for <linux-kselftest@vger.kernel.org>; Tue, 16 Jun 2026 17:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781631186; cv=none; b=TbASs4ExAk4/ACwmeZw09cJjHAgw0idb46uDrR2p4y1ur2xzvBGYuTmPirOn77bvUg09QOLcrnF4hr0UqjJeTrMqQelZCVCjGggB6y7sVqg3cm+6NqctB0PwTs3dYiun9lGjfEhCRIZ6ovss3ZwvG+0wYVjukUqptwtJ47gEUPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781631186; c=relaxed/simple;
	bh=+q/g007+aO/UHimxmV0Ih/bgR3YyUAWftdajmVeUjbQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PPzXsFvW6ZePxHXRkU6xx0Hloy6CyKUTCCZo21p8bTY6VUyw4PAl0SMrWCA6Gc/ZZfsB4iOqAfMf1siYGSlJQ49NfXrdU2xVLXZvDACp+ZUmtnI35PwpXqEHWyXA40WczkvgChHRwW+YBJaiYYv5RG1cXqGwhQmpbOytM4rOHLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b32hocRz; arc=none smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b32hocRz"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-13721dfd471so5346747c88.1
        for <linux-kselftest@vger.kernel.org>; Tue, 16 Jun 2026 10:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781631184; x=1782235984; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WMNZjiW8tS8vPiFakgGpgrB0JBuBFIJhbYt8HcOFzdU=;
        b=b32hocRz04br2LMqils4rylgbLdgemBzQvJslTEqgMdR24JQRsFMVbHJUYSOFq4AKL
         PmmLla+bEm1kF11VtvNOoqIOId3Pn/f2QjPgo0KyB1wHs3DiweFc+bWy0fZdC2RZmh4i
         /cVc7p27K07e5oG1Qb9HWX38tQIBYKu8RXnIaopZG0K17mOAXOu0RU8pLkgA5YamxYRz
         InsNGvirT0Sf93PcHksDHGkx+tPZ2S6d76a/o4GZh8BLxkX3uP3u4ewEGp6TNkffQtLn
         P6S6YvaY/N+B+/mzS1FzPR26uJ3cxwOjch5V3dJZlxYjghfzwBNQN635yulVAyloLzvs
         lpKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781631184; x=1782235984;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WMNZjiW8tS8vPiFakgGpgrB0JBuBFIJhbYt8HcOFzdU=;
        b=mj4TYVG6Vo+EiiQofq+pWRaE8WM3gyTN/BmHytaagkVRsHuSSpqepgLX6KPbyPvY7E
         6JQclEOEYQdc88KDwEliuEfhvUyyQqO+JTpJ9ccHD0NVyezYTWBD7WyW8IDqg+yrw7ac
         5yHeTqR8p59yxhcMsLcZUZlVnzrO9Cd9fiW5MCBApLFFZ2Q0JJ2qeBBvm6L9SzbxXefx
         cn3tRS6QbiMsn2hu0me+f2R0tfGL21Ix09A8APMYR+fQn7/yXpAFJun0fcLGg7Eq70GG
         9lzNFDEOE0umbFvyGspOfYE51HthLtyaKwiZz4vUaYkCPFxRLDtLBNVzm8OTpha5yiaK
         6zwQ==
X-Forwarded-Encrypted: i=1; AFNElJ8U8mN3OPC87cGNllmO3gnryeGMhMx0mws5YWzWAaf0NEGu+UDQJaQCd5YMxWllulOF+JvA+rJH6dVEsm8nJSk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqG/29aszXG4ypEkmffpUsvZGcyomt+y6dBl5dlAo/ukSGYzYk
	nbbktYWhnpsUaEhivSw80KYNmA8HAoVwq2HfElydXoM9KbU86yUpDLvt
X-Gm-Gg: Acq92OEuV8B5/jTrE5C4tnFuhVNi0P/7Tua8lYEVNmasV6Otw+9t6e+GxiMJlXe2wXN
	zEp7PTW1s3JvpRmcQGmGqqlKbB/iTwDLQi4H3+Uttyr1/m2qUHU8aE4bLBq4xsOhk4rke7XZGme
	/cTWbNgEH4nibky3B6Wg3H9iCSnxPJvh2b0zqfeznaXVTIDO7h2vb0Lg1yDQ2y2aq3RdgvOpXRW
	nUv/al82ZSpJ7Ec3n7DPVNxZiyQsyHYJjg2s/GQq4xaH/WFv2zd3Djap0lPpE2B0w5FOYkS4WWA
	C1BAFoNsrknLLed500So4rz6Dy56WT1Gi9Er3OvOrdm8uoMaHOHnxNvuv5txs9fMctsClWrHRJ3
	DtqM38bqeKv7Ov9bd4lnAP+mbcOlJRf0I7E8LqwFAC9M3IrUlHFkYr3J65Gdid+1yuMPnT1VaOC
	EDDt70sYaW9AZNSxxSfF1AN4QJyAxwxtciO31jlOo+4hfakpa2vog+oajtiR0d/QYlLEjo
X-Received: by 2002:a05:7300:4347:b0:304:8364:e95c with SMTP id 5a478bee46e88-30bc9f12a25mr177854eec.15.1781631184354;
        Tue, 16 Jun 2026 10:33:04 -0700 (PDT)
Received: from fx.tailc0aff1.ts.net ([206.206.192.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ba6b7f840sm5431554eec.19.2026.06.16.10.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 10:33:03 -0700 (PDT)
From: Weiming Shi <bestswngs@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Cc: "Starke, Daniel" <daniel.starke@siemens.com>,
	Xiang Mei <xmei5@asu.edu>,
	linux-serial@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Weiming Shi <bestswngs@gmail.com>
Subject: [PATCH v2 0/2] tty: n_gsm: fix gsm_queue() UAF and add a base regression test
Date: Tue, 16 Jun 2026 10:32:38 -0700
Message-ID: <20260616173240.3665059-1-bestswngs@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The receive worker walks gsm->dlci[] without gsm->mutex while a
concurrent GSMIOC_SETCONF -> gsm_cleanup_mux() frees the DLCIs, so the
control handlers can dereference a freed gsm_dlci. v1's NULL check only
narrowed the window; v2 fixes the use-after-free itself.

The fix pins each DLCI the dispatch dereferences with its existing
tty_port reference (option 2), so the data path stays lock-free. See the
patch 1 commit message for details, including why the late destructor
uses cmpxchg() so it cannot wipe a re-created mux (Daniel's teardown
concern).

Changes since v1:
 - Fix the UAF by reference-pinning instead of a NULL check in the
   handlers; no gsm->mutex in the data path (Greg, Daniel).
 - Pin every DLCI the dispatch touches, not just the addressed one:
   MSC/RLS/PN operate on gsm->dlci[k] named in the payload.
 - Add a base selftest (patch 2), as Greg asked.

Verification (KASAN, panic_on_warn=1): the originally reported splat is
the gsm_control_reply() / CMD_TEST path (see the Link in patch 1). A
reproducer targeting the MSC handler crashes the unpatched kernel and
survives 270 race rounds on v2. The selftest passes on both the clean
and patched kernel (pass:3 fail:0 skip:0).

Weiming Shi (2):
  tty: n_gsm: fix use-after-free in gsm_queue() control frame dispatch
  selftests: tty: add base regression test for n_gsm line discipline

 drivers/tty/n_gsm.c                          | 105 +++++-
 tools/testing/selftests/tty/.gitignore       |   1 +
 tools/testing/selftests/tty/Makefile         |   2 +-
 tools/testing/selftests/tty/config           |   1 +
 tools/testing/selftests/tty/tty_n_gsm_test.c | 344 +++++++++++++++++++
 5 files changed, 443 insertions(+), 10 deletions(-)
 create mode 100644 tools/testing/selftests/tty/tty_n_gsm_test.c

-- 
2.43.0

