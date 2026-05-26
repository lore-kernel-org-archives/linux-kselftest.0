Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644FE378D8D
	for <linux-kselftest@vger.kernel.org>; Tue, 26 May 2026 15:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779810135; cv=none; b=iA4gEl88XNEvSr8AvhlSrBtTpCKvyGRBgIcrJ5zr/bwCRzK8B5OK3gVBGr6l47Rx4B74y+o2qdyWViyArUId3t9ddpuui0yd0UbR9NgvGeJ9soM4Yu5F+/pB/R/G5P6w1yKojqvkpee8QODrVHJ4pgOjfLaB7AM2lo3BDhlwCyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779810135; c=relaxed/simple;
	bh=GX2vdzDQw0orDpF1KNiOJ+YXbUSF7H7c0zdw6D2rYGM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=rD46Fp8k3XE+BYVV/BI6kiv12WAHjuQ9wPWt2NLY1ExOH7IRHQS+RS9M0EW2KjzVA4CTLDRMlCddtixgBIaL7CLwMH1ABOkgsuGQxrGk5JnDjAK/BPZmufvQ5ph/ppVRCiq7Ce3+wO0fgDTJde9RxUCNVMZegVBGhOPcHwp433E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DH2k2lZ6; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DH2k2lZ6"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-45ed18d8a1bso989577f8f.0
        for <linux-kselftest@vger.kernel.org>; Tue, 26 May 2026 08:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779810130; x=1780414930; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TDZTHc6BBusOWypWkW0rlAgV9n3xRkLBnweZCKkigSA=;
        b=DH2k2lZ6A15JD90r1OmMU6mZ/DWSu0W1PsL1Sgf/iurcWFvCjeIsg+E5kSIsKdS+0U
         PrP8Kd9EBqgI3QGB05S1hCS8eDjV70OQt/6sc2hvyjhG+ohrFXkYjNM4SZaTfco+dlxV
         pcpJLIfTxoXY6+Z1/Xl2rh88Q4SJQeZ/RxH05CdfYt1yzVo1W3BOsoB1kVdCzJWsxtTZ
         DXYubUPS1Gh2yDfdJfohRpM9zJC5Ig/S/oc35EOd7qnBu+559/wa22WVtvUl1HQfnVKi
         0j7QzF1NncKAhJ+f8xx43odTZrM5Eg5emJdPvbEjy0maYOh+7XGv3N/dEX5MpYHpyNDM
         Lg2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779810130; x=1780414930;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TDZTHc6BBusOWypWkW0rlAgV9n3xRkLBnweZCKkigSA=;
        b=MsGlrBY+C5FYe7cnoPRDY+KcCb3O8iwv0lr9roFGRHddwycUANIoIeSbmKda8lgwtZ
         opFMjfO3Oo3K793OSO390hdOXJzr+t014suS6fl/1gPe53jEt7iF6PcTjxX2Flgug326
         GycnUmZRd9Q3zUu9/GHRnyLQkqUj0Kf0vQyKcr/kisFtDgaCaVk9BTvg4U1Yxoiwo1P+
         6ZzT+h/8rpmZ5ykF5Xz6ow/Xqbf+IRbN1T5STAuXTQCwTPPu+S4YyjWtEdQUw5A+ZMCp
         K6+pdIm4ZhmCWAXYhnGkfvFkN0olJwFUn5emUUg3PtYPztPdeWhmWSJUtrcBTLg7Dgp8
         KmDw==
X-Forwarded-Encrypted: i=1; AFNElJ8I6DBR0enhrgFFXlImFUucxEf5Xj8dxecwfVgIQKojmsAA0aX8Qbr60IvLURTtVgJDakrR9BifLqRvjm5f910=@vger.kernel.org
X-Gm-Message-State: AOJu0YyrlLrdXMgKmGLddFTUIJs+wT2RRgLhAXtNuXNL1/JLIhN9j8r4
	P7E3UA6qYfCRuN7HmEnxhHwpvg2ryEIw3m0ZFh/p2J3ZZNJAKx8liuRL
X-Gm-Gg: Acq92OHXLrYcRmtDSXukIzu511urDT9ySHNZJ6hu1W1bZxe7UwWHcQJbzOwVXaGQ81L
	RF64T1qVdSbbLbsEfluoqvr7mR2nQtwoFdSAOcWE0hsfXCMpxmA4+86OpScFHlmdXRsErtXGKng
	e2jTkw8ot6KLazVEWdnTsjOEdTvq/wbJ2842ZWu6GhDdRcXILyJAm5Jskf0TxyvFGgPBoTKo5C5
	QfrFjOqKAk/vUfXcqRR4Q3S6wfH5jh+QO9AZ/oAtK85rQen15qS04uwXHmAEMiOP2N7IiFzNGiR
	t1zJyacOlPnOL1ICdvFeNGGhSpijxP+8N4rhhFGINMzNFaPniMccZStFsb6NzOP3fETfhb1Lsj0
	1LtoL38pHj9jHOfcssu+OTOFmdJ+dFMfcDJr88xniUtwo+0dKfMav3LvGaY0Dm6wd7FRu0g3T0g
	kM6Gvu4e3HU0bmn+6jw8FP2M7EWMONlmE=
X-Received: by 2002:a05:6000:2688:b0:45e:c60d:ac2a with SMTP id ffacd0b85a97d-45ec60dac3bmr24637687f8f.12.1779810130080;
        Tue, 26 May 2026 08:42:10 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:4b00:f03c:ba00:3081:348a:50c4:2d80])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6d5c32esm35301088f8f.26.2026.05.26.08.42.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 08:42:09 -0700 (PDT)
From: Jamie Hill-Daniel <clubby789@gmail.com>
X-Google-Original-From: Jamie Hill-Daniel <jamie@hill-daniel.co.uk>
Subject: [PATCH RESEND 0/2] seccomp: Allow using `SECCOMP_MODE_STRICT` with
 `SECCOMP_MODE_FILTER`
Date: Tue, 26 May 2026 16:32:14 +0100
Message-Id: <20260526-seccomp-combined-v1-0-304b1cc3ad24@hill-daniel.co.uk>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: Kees Cook <kees@kernel.org>, Andy Lutomirski <luto@amacapital.net>, 
 Will Drewry <wad@chromium.org>, Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 bpf@vger.kernel.org, Jamie Hill-Daniel <jamie@hill-daniel.co.uk>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779810129; l=1608;
 i=jamie@hill-daniel.co.uk; s=20260302; h=from:subject:message-id;
 bh=GX2vdzDQw0orDpF1KNiOJ+YXbUSF7H7c0zdw6D2rYGM=;
 b=OXrTw6xF/ecZYZ1dxc2m8CiFjiL33PvMa/qxStGbXxcF2fu7PQpVWt5ZPg4CpA40udjy1wjVl
 Vw9J7i3HoF2BLujaECVs2iAJHWiPTPqBGHiPOQVfzmhuRgu37yKLdvI
X-Developer-Key: i=jamie@hill-daniel.co.uk; a=ed25519;
 pk=ovqCXSlFUjrT82WuRtIuXB13U5n1yfxM6o0M5O5J2tA=

This patch adjusts the logic used by seccomp to allow applying both
`SECCOMP_MODE_FILTER` and `SECCOMP_MODE_STRICT` to the same process.

Currently, once seccomp has been initialized, a process may not
transition to a different mode (only add additional filters).
This means that in container environments such as Docker, which by
default runs with `SECCOMP_MODE_FILTER`, processes may not enable
`SECCOMP_MODE_STRICT`. This is an obstacle to using applications
requiring `SECCOMP_MODE_STRICT` in these environments, and requires
disabling these security measures.

This patch introduces a new `SECCOMP_MODE_COMBINED` (used internally,
not exposed to userspace). When a process attempts to apply
`SECCOMP_MODE_FILTER` or `SECCOMP_MODE_STRICT`, this mode will be used
instead if the other mode is already enabled.

When subsequently running secure computing checks, we run the strict
checks followed by any installed filters.

Link: https://github.com/moby/moby/issues/42082

Signed-off-by: Jamie Hill-Daniel <jamie@hill-daniel.co.uk>
---
Jamie Hill-Daniel (2):
      seccomp: Allow using `SECCOMP_MODE_STRICT` with `SECCOMP_MODE_FILTER`
      selftest: seccomp: Adjust test for using both `STRICT` and `FILTER`

 kernel/seccomp.c                              | 46 +++++++++++++++------------
 tools/testing/selftests/seccomp/seccomp_bpf.c |  5 ++-
 2 files changed, 28 insertions(+), 23 deletions(-)
---
base-commit: 7d0a66e4bb9081d75c82ec4957c50034cb0ea449
change-id: 20260302-seccomp-combined-24bc3dbe32fd

Best regards,
-- 
Jamie Hill-Daniel <jamie@hill-daniel.co.uk>

