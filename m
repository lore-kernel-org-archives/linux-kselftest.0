Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A89B3F6610
	for <linux-kselftest@vger.kernel.org>; Fri, 27 Mar 2026 14:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774620985; cv=none; b=iZJelYrM+nHIqAIDLZwSD7/ErWwbTsu08KTyWP2xycoQZ4aKm5T/4gB6ypobg6ot4lC0HEq/LBrlLK2pk0oKhaHCIo3cFSHuHWielqrx+Fwv6/H54QF8FD4hxPEExZd392ibT8t5mTHfkdW2qYE0eJ2xK0hMjMY/o9QU1oMyJKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774620985; c=relaxed/simple;
	bh=e2+JS5Yp1/AVGJk+LSABDSeuGsPf3k3Eor161jNWxWk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iK8BRBISwzPnaD3pJ6qFpB1CCbOoqI5+e61S3fXLwZSq/l6jpguGhGeYdckOkc8nYUoZV1D3+MyWrp2apC0EdiJlMx4CIJI/OxhvEkV9L6aHY71qKDUbEs7N3/Poxzq1E2L6MDQfniCO8WF/MQ0lL+dzaYCWAN4YUSP7+Ro7Um4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z4v9uhrc; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z4v9uhrc"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2b0ba3bfe16so18608525ad.1
        for <linux-kselftest@vger.kernel.org>; Fri, 27 Mar 2026 07:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774620980; x=1775225780; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HdOqqV7IplzNrdbF0+0H27VtKzl7S3MD/ZAuINMKre4=;
        b=Z4v9uhrcztq13ZpqT+KQELZ+zq3lfD1cuyPG4GrsXvoMx3uC5xftgzUUWi58AxZj0e
         EhGxKpZArQBOuZ0mGDTcSHswWU/7SZYRSWRld4oRRgR0LbEAtRuobAFUy4rLehW4N4c2
         obmSg9qBBUgkWUS9r7CVBBTbWoi6yoi30TNJp4fcw58loqCchy3C7phf5X8QrCNaOIiS
         a0lx1OMEIGX6jg2xlpjbLaFL/6quWZc1tw7RilGCxY8vWghxPpv4VM3UYTm4dQKd/v0z
         /Tu1rU6ffCflMK+lAbXZObNUmGvNmmdBqG15mNOflZFW83x7KFMayuw/us543busrX9U
         EFWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774620980; x=1775225780;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HdOqqV7IplzNrdbF0+0H27VtKzl7S3MD/ZAuINMKre4=;
        b=LEicu2oZ/jDMBo9guUbMoSOPaXFfM8RSSK7cRLsLsrMtZdgl+hVA2u0WL8CyqLmnWh
         Sv4epnB2aoXGVKo8mvi212x8AE9rutn0XQVw4GEQJk00r5XEILIKqYkSZW9hzfmv0zWI
         MkNfrHVHEoLqm8VdNpevTFwiCybU2k3jncjhkOdg5qUx6rNiAvYifaD724VvNbu2mVck
         +KM/FnNAY0j5HZSeM34RxNQoNuKqqWEgzQUFXdaVlw6aivm+FSDq487P9ZlsgdfYypC9
         SozEF3u2jE7PdvX7gG4BkZv7SC78TSxFIDVhrL2GW5SXhIXE2xgFDUttRzuSUo9uzngz
         JONg==
X-Forwarded-Encrypted: i=1; AJvYcCXrPXz3qZVllITShjr6HNfVerK7YXTcfJusJ0CwnJmX4nBwBQUiyMKkeuTIKcfv5dSabtT5sJuTzU3LMRa0xGo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzr/ZqU2RS6VVIe35G2c+UPZVQ+XP7H/KufCHEHj9lueI6qLX30
	NM0T2G0CamjIH1so2JuFQhwoQz43wvoSoA8nTUJGoxXZrbcx78nnFw0u
X-Gm-Gg: ATEYQzz/rNo1SznoF+Lwsst8JOMMkT2ScyR56fYm9NCjaLkY797fvz8DXzCqafYcuMI
	+R5LJl5QAyU7Pl7ETmMK5D1d6co7EUz+gxUFwbvjIq0uJN5Cs9NoG55D3Eiyf2O66jSAHycnTpI
	iQoYlp5vgluW9XU4k66CWrhC0lqlw0vv1SMd6hYZRnPc+6f+lWdgcBjnZ7ud87Q/Mc7ucjE2BdI
	TeHAL5/LSscaprkhdBwCDaUMp+UnnkSDAuofiGbTzhQr3BfxsUC9sBB/ufKxD5RT+xu1x3J3qkg
	clyfbyzbeSOz8HQnM7DLz9VmGxgceGqJErIuLb2RCgjhPfx/gYL94l7otmMXwmIWnvLewSH1cn/
	PnrwqawORWHM80TB7oVvRghlrCwKk/5MwP4u4YI1yYI115S/fx+5Bj8jt/4tOhOFfY/1chbBmDK
	x/Ff5P5cKT1n4lepxYByhFVapLa71etpl7Ne43zsKADwHQxHzRRYt6m7OYEQDnUVNar5ljFIHa+
	AWUW/GwoD3KmvMnwPWi87hbW1qGOUdnrg==
X-Received: by 2002:a17:903:2288:b0:2b0:bcda:76c3 with SMTP id d9443c01a7336-2b0c4929f65mr53849025ad.23.1774620979961;
        Fri, 27 Mar 2026 07:16:19 -0700 (PDT)
Received: from lab-kiba-ocxma-dut-01.. (191.68.231.218.rev.ocx2915.net. [218.231.68.191])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0bc8e958csm61371365ad.66.2026.03.27.07.16.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 07:16:19 -0700 (PDT)
From: Takeru Hayasaka <hayatake396@gmail.com>
To: ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org
Cc: bpf@vger.kernel.org,
	x86@kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH bpf-next 0/2] bpf: enable x86 fentry on tail-called programs
Date: Fri, 27 Mar 2026 14:16:00 +0000
Message-ID: <20260327141616.1961457-1-hayatake396@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series enables fentry on x86 BPF programs reached via tail calls
and adds a focused selftest for the expected behavior.

Patch 1 fixes the x86 mirrored text-poke lookup so the tail-call landing
slot is patched on both IBT and non-IBT JITs.

Patch 2 adds a selftest that checks both direct entry and tail-called
entry for a tailcall callee with fentry attached.

Takeru Hayasaka (2):
  bpf, x86: patch tail-call fentry slot on non-IBT JITs
  selftests/bpf: cover fentry on tailcalled programs

 arch/x86/net/bpf_jit_comp.c                   |  47 +++++++-
 .../selftests/bpf/prog_tests/tailcalls.c      | 110 ++++++++++++++++++
 .../bpf/progs/tailcall_fentry_probe.c         |  16 +++
 .../bpf/progs/tailcall_fentry_target.c        |  27 +++++
 4 files changed, 197 insertions(+), 3 deletions(-)
 create mode 100644 tools/testing/selftests/bpf/progs/tailcall_fentry_probe.c
 create mode 100644 tools/testing/selftests/bpf/progs/tailcall_fentry_target.c

-- 
2.43.0

