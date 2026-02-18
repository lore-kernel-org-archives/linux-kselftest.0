Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D81C2EC0A4
	for <linux-kselftest@vger.kernel.org>; Wed, 18 Feb 2026 09:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771406423; cv=none; b=YyqOdtWiaWeQwIOHqMvTBspJWk2926sBVZnVWpzUWgRoI09Zmj0KWRixWDtBpj0ToQKMJOQqt/njfMVR4EFl56voeUIRwsD2gcxgX8saJZhFCYYOpk/zd8nSJeom1QGSONOs32PD3i44AfaYfFJVEjA6XU9BD6GsxcWPzxPypt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771406423; c=relaxed/simple;
	bh=G8i8l1HaUJwIvvVaqfhi1fhbz840otW5i4iqXUQWS+4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=O6+9SDEKXslKyZBfpAoR9E4+vwz/SkkFJork9EIW3FY9Xrmf7lyHt/1wZERZG8XATTCsN83Mf18a3BArqqy6UX+/zE1mfpI18D18Dpyl6ee4fpsQdV24wrujUqB2QA57udOia/n4w9CVajtiG3a+rJHAwlAbA2hMxN77PZl1r40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jabSSRve; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jabSSRve"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4834826e555so50532355e9.2
        for <linux-kselftest@vger.kernel.org>; Wed, 18 Feb 2026 01:20:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771406421; x=1772011221; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GT47+DDqY1qh+uutKLyaKTWw+O5qS7pkg63HL+xIqBo=;
        b=jabSSRvekg3DRCyMFsYJyuYp83OWeRHZaHI5fK7PIr/UCygBn1xAUdvA3B7EMX2Dnt
         MqmDPoW7BPIWFp0JnK5kM1dLpSWON8QGv1wVs7yEgj/+RTAhMfHGHTGgxjLErJMqEZqb
         zGjZc8CXEgMseEgVrpzhQtdPs/yk/QIcMlnh7O668DbXmK+Ulj+AJ/C2kxatZWvToGg/
         fPB76rK7QmP0T0aoHUJyRdYMhYyjfqOh342vToFR1+6oHEG8VUQClmheIdKU3zGHwfXs
         GpRALIDSXrj9SJTy3ZGWRtQW6E+J77/7vaTizLrKOybQbtmR/f4UP08RaoEH0p7rb7bI
         /Hsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771406421; x=1772011221;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GT47+DDqY1qh+uutKLyaKTWw+O5qS7pkg63HL+xIqBo=;
        b=ljdD+gfto/DjrO3iq66KAX/upphRzD0jW+GxADO8XGDO/WpXpNEXoxhuhc6opUcDv2
         XToKFmAIBnb0FjtcX4PVIknicaiuEvBttyTWyiGxXaRVukUFtKmqhY404NQpNvFSiR3F
         VvsKrgXS9pluUNrGqNoDlicIIpY9b8S3xxqPkCdbNZT/MkXp+E1bpUADBFSluwIgrcct
         NnP2R8qwGBPizN0OPY9wYsC4CfVtFbalgQoJzGYJUpBSk1hFggojKAyncUpj3RPxcAS7
         LVTUcyLCp7S/1uv1dS8tbxmVsRnSKUrjK8LJTw21epgD9/B8qxK9JwAlH6RFqDYHPtn2
         3m3g==
X-Forwarded-Encrypted: i=1; AJvYcCUvh80ZR9ob1YMNHpAfheE26C40zgHv4SO3tMskBrBN0uCm43LgQKz+rBbIZMn85ZA3cfp4GAq+r5bSCUhTHNI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVS3uOJmfHQxHaVsWDRY2IRqxhCFg7WKA8/dMxAk3pL0n0qaZY
	H+ZhI6LvQjvkPBb7MxgN/LYldvoXnvhDsE/QuCRTPFlLFl2CrAjc6Igu
X-Gm-Gg: AZuq6aKlnO/3M7fALgdP3RhIPbyRsKwCtloMjHfSWJ6jYklJ1VXiEkWIIcNIZv7yuul
	SKXfghY0kT6Q8MrlaelkIzyfhCzN2YGdxik5olrsYcZ/WFHeg9my8Hi5vST88CF4OH1mDvW690E
	AXHyLNmfoOiYNaj79ydoxR6Aby2f6TfU2dn7FbVkAmbxOVB8Z30ePWqkh4SMfkuQgcvt73GeGdY
	ecgYzauu+/btX0/m+o15RNXkC6lF4EZg6zAgiSP2cX/aSQ1u5Y+jC6JTBCtIN+FstgpGgQUdDG9
	4bhRVzlgAUcG+28s74PwrJpClmV2pIpPaqaUfHsSkTMtJXBY+UwrsNshXULRBgB4ZLIxYnBydIT
	rzPef9QuEW87JnRSsgs+BaZcfTos5mHGBfGNS5/JFUW470xU7sb0PCAF7cr0VYBZWa3Ue+z3xiy
	v4B/CWxL+oDea3
X-Received: by 2002:a05:600c:154f:b0:483:3384:a873 with SMTP id 5b1f17b1804b1-48379c15d86mr228677965e9.36.1771406420254;
        Wed, 18 Feb 2026 01:20:20 -0800 (PST)
Received: from wdesk. ([86.57.23.242])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796ac8d46sm41352691f8f.32.2026.02.18.01.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 01:20:19 -0800 (PST)
From: Mahdi Faramarzpour <mahdifrmx@gmail.com>
X-Google-Original-From: Mahdi Faramarzpour <mahdifrmz@gmail.com>
To: bpf@vger.kernel.org
Cc: Magnus Karlsson <magnus.karlsson@intel.com>,
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>,
	Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mahdi Faramarzpour <mahdifrmx@gmail.com>
Subject: [PATCH bpf-next] bpf: fix selftest/xsk single test selection
Date: Wed, 18 Feb 2026 12:50:02 +0330
Message-Id: <20260218092002.147306-1-mahdifrmz@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mahdi Faramarzpour <mahdifrmx@gmail.com>

This commit fixes the integer parsing of -t option. The cli parser
only relies on errno to detect parsing errors. The manpage for
strtol (https://man7.org/linux/man-pages/man3/strtol.3.html)
states that the said function "MAY" set errno to EINVAL in case the
conversion fails. Currently on some systems, this leads to a silent
failure with return value not being exactly documented in the
manpages (probably zero). The reliable way to validate the input is
to check whether the endptr has been bumped all the way to the end
of the string or not.

Fixes: 146e30554a53 ("selftests/xsk: add option to run single test")
Signed-off-by: Mahdi Faramarzpour <mahdifrmx@gmail.com>
---
v2:
  - fix style issues
v1: https://lore.kernel.org/all/20260217080326.50564-1-mahdifrmz@gmail.com/
---
 tools/testing/selftests/bpf/xskxceiver.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/bpf/xskxceiver.c b/tools/testing/selftests/bpf/xskxceiver.c
index 05b3cebc5..5e4095fd1 100644
--- a/tools/testing/selftests/bpf/xskxceiver.c
+++ b/tools/testing/selftests/bpf/xskxceiver.c
@@ -200,6 +200,7 @@ static void parse_command_line(struct ifobject *ifobj_tx, struct ifobject *ifobj
 	struct ifobject *ifobj;
 	u32 interface_nb = 0;
 	int option_index, c;
+	char *eptr;
 
 	opterr = 0;
 
@@ -248,8 +249,8 @@ static void parse_command_line(struct ifobject *ifobj_tx, struct ifobject *ifobj
 			break;
 		case 't':
 			errno = 0;
-			opt_run_test = strtol(optarg, NULL, 0);
-			if (errno)
+			opt_run_test = strtol(optarg, &eptr, 0);
+			if (errno || *eptr)
 				print_usage(argv);
 			break;
 		case 'h':
-- 
2.34.1

