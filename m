Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02770C2FF
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Mar 2026 03:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772594184; cv=none; b=FpsiWVl5HPE9QWYqv++lU7Jlxn2S7ghJmgI7WHKrAemGiHdKquvJz3cz2Pj+pXXBlmYNA6D8jDvetlZcybp50y/Qh2Vb5I+KTWXOpKj6yTV22StWtBDCqVCbJMqdXdsR+cHKb9TAnPQDkgoN9/HV3Z74Qws/sSNIdn4PMmzFM3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772594184; c=relaxed/simple;
	bh=So92N9StmJ2/HW3sZtZqLRTTKfgcTZ7gOdSXyepwb5E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oGavSb1jTiGCfKkAKvpEN/KFWc6s+LaxSOglxEHTxRLo4hEb/gSZD8+WUrsjR8i2XfBTcGhGW0rkcFqADFxIpjJme8xPxfaHErLH3udoH9Z3ZPUilNpznrLrhH+kCurmGa265tDsozJv7cnLW/hFjZRTXB+12y0hts0p4wYPyVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PrdjYPqL; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PrdjYPqL"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-359866a1d02so2783851a91.0
        for <linux-kselftest@vger.kernel.org>; Tue, 03 Mar 2026 19:16:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772594182; x=1773198982; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rhyuWZAAM7GaWavKLhRBU/I9cRSlzqfQcxXvGUKsI78=;
        b=PrdjYPqLfpEoscnXeQ5UpaK1qWRhDo889HaPNr/3kYbz32SI9EaJ5ebUU7upm4r6VG
         uc4i/m2r80P0H1n9Vh24RUsVtcl3LcibETVfHyLbBZ6EchQoX702xZW0LzoY+NIEKpKx
         5yDu2x/etfWrFxGjd55S3ewRxteWa3bpC7qYU1sZKyHDPkl0qv4AnRqKKP/A4sk3xdO0
         z16/Zfg+rJJjgcmZyuvnobEu33rDculFsVGoS6LggnG34x2XJ2rjJKMvt36oRsGCNon2
         4epTtBrK9HadRb7DQ/CB5u/2PtmnKDqZez+wr26/ZW2VmZLzzqEoImz8+6L1JkFy5ssR
         YT+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772594182; x=1773198982;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rhyuWZAAM7GaWavKLhRBU/I9cRSlzqfQcxXvGUKsI78=;
        b=WGNfPg/17jChyMPnVE+u7FSmPSzS1g3ejDvJmO6PT2Mlwd6goy9pEVFe/Tgcp2Yc7S
         uM3ezpCyx6fiLCdcWXjlBxvu/DTC1fg7dauQLqMXAVxKnh7LXe2h+YfI8y9W1x7TZred
         VSY9rytftdFnNrLDP6FyR7jquYaa52IOAMtvF/Oo+MCcgA5kdEYXNuFHpchUNjiYSvtp
         uimJF9YZ8MAQ5ILoV06NsICNyPpoQqOa2ZIgxqgWJarlFln3D5wYI69JAoPFbm6Zv9w6
         JDx4Ko2C1VWHFZohmPoNTxmWltrVNcLfOSUaMw8Crz3ny4PcH/NKRqXCgjWwHUjeP9jt
         5q6A==
X-Forwarded-Encrypted: i=1; AJvYcCUeFNk8kgy9YPnUX0+YbdpAguXR8utPhJslEChmMVtFI4KViXniH85doO/mho5dhyM8D+Ys8IozJcsEbZ+ecyM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqjnTOuzMmqas4TMcuBpP2+ZBsucRWl64wKX7W6GrFuBKtpxSr
	veTm9QVFRdpqbA7f4awUrsehV8U3xLyBy6odEWkcEvXsvEuVXpXvHf9K
X-Gm-Gg: ATEYQzzSrugW+uz2hq89+D/KfwGAQ+52ezf3dOvyZH2eWJ9/Z1ZJA7C7Owidy3YEIaG
	GCQjQF8Z2Bay/ALEtabiD2pUDamDL7fXb8TiRP04YkP9ZHN7un3P+6BHhDopJLGZOPNFdLvjzi1
	MhnCWymD+MoyoIyVDug1fiKG3SZpQKcEWA0jXH0Z462nax36h2QGW9JZj3TzvGjIuVL6jY8NpKc
	nv2qQPNE43B+YBMfVo3qebyiS5ZAYu2eNjB9+1Dexrz/tNN9XABDX34qjTdHaLNA6mIXh3cg3db
	Owv8bYcmXIIa2Z3i8z4GXWEpRoatBkVzwa+MOrEY0UOhj4mWqtzIZbUAOOx7m/XIhY7UtDbEFbF
	qm969ueVhaO3hjIC2Z+ZzFKPEA6JS0LTEXZxOP75ZAWR/d4BvG0GCOXs0Otw6FwK0jQ7FP510HG
	uv8JVu9mA56RQfejTdbM3wuHPBIIwq/r1Z73UOK/ZlmSwpDOduTQ==
X-Received: by 2002:a17:90b:1fc5:b0:338:3d07:5174 with SMTP id 98e67ed59e1d1-359a69a86b7mr619013a91.5.1772594182328;
        Tue, 03 Mar 2026 19:16:22 -0800 (PST)
Received: from localhost.localdomain ([116.128.244.171])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3599c3ab946sm3610648a91.13.2026.03.03.19.16.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 03 Mar 2026 19:16:21 -0800 (PST)
From: Chengkaitao <pilgrimtao@gmail.com>
To: martin.lau@linux.dev,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	song@kernel.org,
	yonghong.song@linux.dev,
	john.fastabend@gmail.com,
	kpsingh@kernel.org,
	sdf@fomichev.me,
	haoluo@google.com,
	jolsa@kernel.org,
	shuah@kernel.org,
	chengkaitao@kylinos.cn,
	linux-kselftest@vger.kernel.org
Cc: bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/6] bpf: Extend the bpf_list family of APIs
Date: Wed,  4 Mar 2026 11:16:00 +0800
Message-ID: <20260304031606.43884-1-pilgrimtao@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kaitao Cheng <chengkaitao@kylinos.cn>

In BPF, a list can only be used to implement a stack structure.
Due to an incomplete API set, only FIFO or LIFO operations are
supported. The patches enhance the BPF list API, making it more
list-like.

Five new kfuncs have been added:
bpf_list_del: remove a node from the list
bpf_list_add_impl: insert a node after a given list node
bpf_list_is_first: check if a node is the first in the list
bpf_list_is_last: check if a node is the last in the list
bpf_list_empty: check if the list is empty

Changes in v5:
- Fix bpf_obj leak on bpf_list_add_impl error

Changes in v4:
- [patch v3 1/6] Revert to version v1
- Change the parameters of bpf_list_add_impl to (head, new, prev, ...)

Changes in v3:
- Add a new lock_rec member to struct bpf_reference_state for lock
  holding detection.
- Add test cases to verify that the verifier correctly restricts calls
  to bpf_list_del when the spin_lock is not held.

Changes in v2:
- Remove the head parameter from bpf_list_del
- Add bpf_list_add/is_first/is_last/empty to API and test cases

Link to v4:
https://lore.kernel.org/all/20260303135219.33726-1-pilgrimtao@gmail.com/

Link to v3:
https://lore.kernel.org/all/20260302124028.82420-1-pilgrimtao@gmail.com/

Link to v2:
https://lore.kernel.org/all/20260225092651.94689-1-pilgrimtao@gmail.com/

Link to v1:
https://lore.kernel.org/all/20260209025250.55750-1-pilgrimtao@gmail.com/

Kaitao Cheng (6):
  bpf: Introduce the bpf_list_del kfunc.
  selftests/bpf: Add test cases for bpf_list_del
  bpf: add bpf_list_add_impl to insert node after a given list node
  selftests/bpf: Add test case for bpf_list_add_impl
  bpf: add bpf_list_is_first/last/empty kfuncs
  selftests/bpf: Add test cases for bpf_list_is_first/is_last/empty

 kernel/bpf/helpers.c                          |  85 ++++++++
 kernel/bpf/verifier.c                         |  30 ++-
 .../testing/selftests/bpf/bpf_experimental.h  |  42 ++++
 .../selftests/bpf/progs/refcounted_kptr.c     | 182 ++++++++++++++++++
 4 files changed, 335 insertions(+), 4 deletions(-)

-- 
2.50.1 (Apple Git-155)

