Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A14E934D92C
	for <linux-kselftest@vger.kernel.org>; Sat, 26 Sep 2026 17:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790442128; cv=none; b=H+Ko4v25i113dptx4URRYPR7weB8iQR/UKVRBte8U9reRqGvq+fSGRk/aAbyqHotT2rqNRTy06DBMLmwOSFams7aVWLe2F23z5ae+X8ymQUpghqjIiJeXjo9q8kRsxdc13/oJWINiQbCSCpo95Q7mIUnMBkHr+mA9c5k6ZT/RYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790442128; c=relaxed/simple;
	bh=PO4Asqbm6xg0p9PEtplbTbQWCJddZDAjr8ZpkJSrqq8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u+MBQ2AXUU4lWt0bHUWJ3+ZAAoNEUE8ozamspSS8H/MxrsI5hBWEUQWeaOwZbniSMi7tsQo5PKSDU/a2CeS3LuARUzD8fJy2+pp3fLm9Qh4mPxWUTVi/RAEb7ULLwKBLfdd4vVqO50/Rp1JbbMS24sZpmPVHSoKjl7U62GViF/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LRh/uNH5; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LRh/uNH5"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b8eacb7c8fso1224011e87.3
        for <linux-kselftest@vger.kernel.org>; Sat, 26 Sep 2026 10:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790442124; x=1791046924; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WIO/jazHiQG0bTHUGT5bBrt1D5Tg4W6mEh3vUq+12sY=;
        b=LRh/uNH5a7nkvX9glzzjR3zjIrcOD3tcDp514P7SIqHF3XyXbw/te+zOQY9H7r5gWr
         4xuWWe3Dfe9MzFrEeK1nyovyNKUAJoAh9cxCSw+bIddTDGf6o7L2RoxyxkEGAGOXcoh7
         XuD99XdOdPdAhoeQeAAstWNF9+XamRPMjAVSBe0lIRkno7M/OCA3rXa20y0S3CgpRxHZ
         PODoFQrJzJi3x3s2Q/cRB5Ij562oGb28j+RwBjACKlwHyezsUP3ktDs/IVB0v5REVEL7
         wbYAh7SdB3t5to8yViihEcDbETlaPchoAAP1JUlKjL9kneataiStiXiVd8LmwoRDJAlr
         WfJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790442124; x=1791046924;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WIO/jazHiQG0bTHUGT5bBrt1D5Tg4W6mEh3vUq+12sY=;
        b=HrSFQIGuzcVcjmM/UgigmukbaoK+B2vCxqrjuTdUmeckuNoA+ZnoyTPJOAVnEYCD/E
         Xr72XYYlHsThrhBwqxWEDFfxroX/AVgECp2aU0pTw/AtLkJwJ1u2Ts+3PmP5M9QaTFlE
         J0UYEiiWJsZW1BNO2lLWJdRrsR89bf5Wl1AT4JKH2XhfKspHhNKU9gI6G3fmsC2JlbgQ
         9RlMtI/tHn5N4J1mx3dn7EBF8zQ7FBB8T8uJicf94U6x2cWZc5ZNuNQLWSteg479qNyr
         ecF8sJg7lQGeieCrixIgL7mQw5bxe8mXJypI9DCl4yKWKrrlSDfwRYZmmPVmCb8UzBpl
         iY5g==
X-Forwarded-Encrypted: i=1; AKwUvBzzds98aT2n4sn/shr5UQ7oetfGhSzCNdIqBCIvcB8h9PLJRn5J6hw4FC9Ou69xkKSbV4NPVJi9wSyKpZf/Cwc=@vger.kernel.org
X-Gm-Message-State: AFuF++nYkrPoGiG4KrnV6UQmWCgoOTLIDBQ2oxadDk8L0Agd7J3b7Onl
	Fuy9jXQZoqFeuum3wfDeSs8xzse1bj4frlI8aBbWRKnbEyEVRSHyd5CT
X-Gm-Gg: AYBFou0lDKhxPgViWLvZJ3V/TZGIYXigMPHR3KNUIlEgQaZ8/ShtSKPX9jCGq8FjT0m
	X+WullozU9+gWAwKCN4tjrIlp9LVqH5LOx+PkaJ6c93V6iUDNi9RY+Zd1F5W0AWeFi3+LDKWbqu
	0up+Fh/hwbArXZdTdpHDsxyEtiwMvsRkt7Np33aWtMLdFNTuuoMWI5yZiH0NRRTgtetIsFTGvf+
	ulWDAO/qVnjPV1alwu904LIPlsfcH2qqAC/mxJ5P1mTRuC1KgHH+Y0ja2x9CWzP2HCdCLO3CULF
	7bhmhf/AReHMWLCqP7FfhnC4dn6FRg5JjSS4CDQ7Z7TdAIxwDkmXlHLPjrwH05n9Ay4E8ZBNH1Z
	0oDuH5gz/pMMMmO5HMqqfJ4Dx1Bs8hhznPO8XcdJ9Dblf/BbnCa/6cUPJ53ZOY3iaSYG6BqZODZ
	V/KogWTAmfP76Am3PX/a5S04UMkDqUIkJ6sVFllCvd3Fqz5FQ4BojWL3tm/Q2mxgXWB7WsnSvw4
	h8DToxhDTAf3M00
X-Received: by 2002:a05:6512:3f09:b0:5b8:cfd0:a1fd with SMTP id 2adb3069b0e04-5b8e6df04a4mr1635019e87.65.1790442124223;
        Sat, 26 Sep 2026 10:02:04 -0700 (PDT)
Received: from localhost.localdomain ([80.66.93.117])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8e6b078d2sm1317178e87.63.2026.09.26.10.01.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 10:02:03 -0700 (PDT)
From: Maxim Skokov <skokovmaksimevg@gmail.com>
To: bpf@vger.kernel.org
Cc: qmo@kernel.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	ihor.solodrai@linux.dev,
	kuba@kernel.org,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	hi@tychen.cc,
	Maxim Skokov <skokovmaksimevg@gmail.com>
Subject: [PATCH bpf-next v3 0/2] bpftool: Fail map dump for maps that can't be iterated
Date: Sat, 26 Sep 2026 20:01:25 +0300
Message-ID: <20260926170149.541352-1-skokovmaksimevg@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

"bpftool map dump" treats only ENOENT from bpf_map_get_next_key() as the
end of the map. Map types that can't be iterated (local storage, ringbuf,
bloom filter, arena, queue, stack) fail on the first key, and bpftool
prints an empty dump, "[]" or "Found 0 elements", with only a non-zero
exit status.

Patch 1 asks for the first key before printing anything and fails with
the map type and the error. Patch 2 adds a test_progs case on a socket
storage map.

The new test fails without patch 1 and passes with it; the other bpftool_*
selftests pass. Tested on x86_64 under a bpf-next kernel with KASAN and
lockdep, by hand on queue, stack, bloom filter, ringbuf, arena, sk_storage
and empty and filled hash maps, and through BPF CI (x86_64, aarch64,
s390x). That testing was done on v2; v3 only shortens a comment and
moves an unlink.

Changes in v3:
- shorter comment on the probe (Quentin)
- selftests: unlink the pin on every exit path, so a killed run doesn't
  leave a stale pin that fails every later run with EEXIST (Sashiko)
- collect Acked-by on patch 1

Changes in v2:
- probe the first key before any output instead of printing a hint for
  ENOTSUPP only, so every non-iterable type gets an error and stdout gets
  no "[]" (Alexei)
- drop the Fixes tag and use a neutral example map (Alexei)
- selftests: check that JSON output is only the error object and plain
  stdout has no elements or count; clear the output buffer before each
  run (Sashiko)
- multi-line comment style (bpf-ci)

v2: https://lore.kernel.org/bpf/20260925162031.27259-1-skokovmaksimevg@gmail.com/
v1: https://lore.kernel.org/bpf/20260924160732.485650-1-skokovmaksimevg@gmail.com/

Maxim Skokov (2):
  bpftool: Fail map dump for maps that can't be iterated
  selftests/bpf: Check that bpftool map dump fails for socket storage

 tools/bpf/bpftool/map.c                       | 23 ++++-
 .../bpf/prog_tests/bpftool_map_dump.c         | 88 +++++++++++++++++++
 2 files changed, 109 insertions(+), 2 deletions(-)
 create mode 100644 tools/testing/selftests/bpf/prog_tests/bpftool_map_dump.c


base-commit: 4f3a5eae895b9995e93425a75235d8f1f3268caa
-- 
2.47.3

