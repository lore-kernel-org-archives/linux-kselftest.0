Received: from mail-dl2-f43.google.com (mail-dl2-f43.google.com [74.125.229.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76F8A1172E
	for <linux-kselftest@vger.kernel.org>; Mon, 28 Sep 2026 04:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790570058; cv=none; b=rlfN+VFXlhn3CadOtu171kvvxbNG+6jPe2leyESqrkNFuilN1+OpBnnRsFnCEZbuq9tXWMfQVUk3yoiTd0US8+Zj6uYywQzYUGhNePnp1jlygPJ93ta+ttvHdWgZD0FkW4dG/dZZdBDDdjhs9OhYRUVN9TPLce6UGz/rpwT3tuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790570058; c=relaxed/simple;
	bh=8URoYWDkdFnc7wu98Aykk7vM00DX6zXxMA+kJkJhync=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pZf4vV4Zr5sZwBovt4XV0bMAaIfrArqPMca54hMYoRzidNjzd5yCyQQ11ydOeGtPR1hantwKqqixeayJUpJT4VjqYqq/PaLYxmg+jtazujt/iRUnzGU9+clZp5ZR2PyS8RPbt1WTQKgA5RxUqrwMhhzTjU+IVurwH2Soaey8vWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XUpwwFeL; arc=none smtp.client-ip=74.125.229.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XUpwwFeL"
Received: by mail-dl2-f43.google.com with SMTP id a92af1059eb24-143880e27dfso438274c88.1
        for <linux-kselftest@vger.kernel.org>; Sun, 27 Sep 2026 21:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790570055; x=1791174855; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qCSCsxfpeFRT3FvC58Mpv9YAqG4Y65eHsvaTh9jj6ec=;
        b=XUpwwFeLVBilXTrVOz1eHaPnG/gIFuUU+7+8S7gWBhpVvpthbNqS/0+fyFJqtlvOnR
         OrxPnCNrHHu+2Gef0u1Ple6xmlwWFXZ7NzePSxNShhSJMpWfuo0e/SQj1NVQlrfmCEby
         sQ4DPBu8g7YvVQCxXiN4MDnDiSFB4Bmn66S5kwsFaHPeloGzvAFZbi1IZ17BpBXCTqhD
         yQByox2TnCUSqCsL5kVKeGB4DJvZ3lIP6BFAVX/ynd8jFk3s6QLW4VD/qJXb7RJvcoDE
         T220LiYQqd+Nb90T48elGQqqXfqgIkkRVnKNFhCpRbBMieUx0XHubTquhHQqgDR6nxbH
         7n+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790570055; x=1791174855;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qCSCsxfpeFRT3FvC58Mpv9YAqG4Y65eHsvaTh9jj6ec=;
        b=LHi9myEPALYv8ZWa8MYjMgUHT+BfmwBPDfHX4n+eFcFJQoCdSoY2xZJeIpJExCutcR
         E7Il+qc8kD3A+VDL9sFJPOtqMSCJoRU+Gpkz0SbQSS7SDV0KSQMNtCmOWkyXtSE5z0h+
         /ELzxsrjJ5ZGbf8ZtyRjE1VCf4TorU3AdLC5AUSA6AnYFKMT48ZHK5s7Q7F5VWeRQcAh
         F8MbjGKtXEfvLCLN8XYZjAP0WSFLH796+83OzrfgDrLoNEs4pdenYfkzFU6U1O3RqlPe
         hYL59ac/98lycZS4AcG8Yb/5J0fv6zBTzxRr41/lpxeTf8GHKPjdbyphEGG1v9AR59H3
         Rplw==
X-Forwarded-Encrypted: i=1; AKwUvBwmCllxdg0VQny8TFl7UjzmBwH+EBzCRlisZ243jEqN/IH7xcl3QCHWdesXbW4KY2yRApdLSgjIyDUa7fxeXB8=@vger.kernel.org
X-Gm-Message-State: AFuF++kO1xw3PRcALWqxajSYNrkgYrTFr7JTBacadVyw/IRY9K18gF7I
	ch5qRRSHgfxuf97xIYR4x0sqs6VvaXLxlu11ktS3PeCTu/4f+kvEIb/q
X-Gm-Gg: AYBFou0HcY2m29EreYK+uvChLFPRZh7lqLgowewFsjFd4SP1UKYzs7IQZl84aZGBXim
	jgecGJVdl+MGFQ0pZ1MlCs1la1PiqXbEnW7bqVU27E6pXusPAMMuBrzvpyT7AcQXjrNxF1Yrgjj
	4Vl+udElRa9VHApWDh97IeKdLXnOwLmpKAy2k7ROu5e7penH2h+INay2jiWX0eblBVbutl5xASb
	hue2s7JKstK9o9W+UF9qjfp/CBkusmy7KT5EEA6EIRbsQCkX5x96+4k3TyS3DKdMFRl/+w2J4G6
	gg7d1COUEL3FpaajAdXHDuub2gR3hGa2JcwFdIZrJBLaVE2hS3V/UU/UvukTNxmoa6zCsOcI45T
	DNcY6LZmmKeCvMkenxZp+YAok9YaFglwQyi4TfV+Cc+meepjKXRHLC40Np6pAji2g7NRj8uJNxx
	IumiXZVaGonLLDZ5nVXhN0svIsvEvJlHWnlMjEOwaxBY+pqtjwx+/4p3Jos0JSLxVJ3A75T7wFN
	xE8KZLUuYNCuCTno3fg808eT9527S4KF8la2Owg8AzUReuT1klsUOho7cE0D9swbLEkoCYKaGCy
	XW++2ks=
X-Received: by 2002:a05:7022:f515:b0:141:b2c3:d878 with SMTP id a92af1059eb24-146cdebd135mr9019464c88.7.1790570054439;
        Sun, 27 Sep 2026 21:34:14 -0700 (PDT)
Received: from Inspiron-14-5420.. ([2402:e280:21c6:671:571a:2a:d409:bce3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145adbcd1bcsm27921045c88.14.2026.09.27.21.34.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 21:34:14 -0700 (PDT)
From: "Hemendra M. Naik" <hemendranaik@gmail.com>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	jiri@resnulli.us,
	jhs@mojatatu.com,
	shuah@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	vishy0777@gmail.com,
	tahiliani@nitk.edu.in,
	"Hemendra M. Naik" <hemendranaik@gmail.com>
Subject: [PATCH net-next v9 0/3] net/sched: sch_fq_pie: add per-flow class statistics
Date: Mon, 28 Sep 2026 10:03:55 +0530
Message-Id: <20260928043358.6866-1-hemendranaik@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

FQ-PIE runs an independent PIE controller per flow but exposes no
per-flow statistics. This series wires up fq_pie_class_ops to expose
per-flow AQM state (prob, delay, deficit, avg_dq_rate) via
'tc -s class show', following a similar pattern as FQ-CoDel.

This patch series is accompanied by a companion iproute2 patch series that
will be posted on net-next as well.

Both the kernel and iproute2 patches can also be found in GitHub:
- https://github.com/H-N41K/linux-net-next/tree/fq_pie_class_stats/
- https://github.com/H-N41K/iproute2-next/tree/fq_pie_class_stats

---
Changelog:

v9:
- Add a blank line between structs in commit 1/3.

v8: https://lore.kernel.org/netdev/20260922205924.32173-1-hemendranaik@gmail.com/
- No code changes since v7.
- Reword commit message to reflect usage of div_u64().

v7: https://lore.kernel.org/netdev/20260919060125.38063-1-hemendranaik@gmail.com/
- No code changes since v6.
- Rebased over the latest net-next tree and re-submitted patch.

v6: https://lore.kernel.org/netdev/20260917204225.275251-1-hemendranaik@gmail.com/
- Address Sashiko review comments:
  - Revert the fq_pie flows range to [1..65536]. 
  - Also drop the accompanying selftest 83be change.
  - Compute the per-flow delay with div_u64() on the full 64-bit
    nanosecond value.
  - Widen avg_dq_rate to u64 before scaling it by PSCHED_TICKS_PER_SEC.
  - Document the 36 to 64 byte xstats growth in the patch 1 commit message.
  - Fix selftest 83c0. The ping payload exceeded the TBF burst so no
    packet ever reached fq_pie, and the missing -W left the run waiting
    out ping's default timeout.

v5: https://lore.kernel.org/netdev/20260902035231.81866-1-hemendranaik@gmail.com/
- Addressed Sashiko review comments:
 - Omitted .tcf_block / .bind_tcf / .unbind_tcf from cl_ops (statistics
   only being exported; filter attach to fq_pie is now disabled).
 - Dropped empty tc_fq_pie_xqd_stats placeholder; class_stats is a direct
   struct member.
 - Limited flows to [1..65535] so per-flow class handles fit in a 16-bit
   TC minor.
 - Rewrote selftest 83c0 with TBF + fq_pie, ping traffic, and
   matchCount 1 on per-flow stats output.
 - Updated selftest 83be for the new flows limit.
 - Dropped the tools/include UAPI mirror changes from patch 3/3.

v4: https://lore.kernel.org/netdev/20260727164056.106203-1-hemendranaik@gmail.com/
- Fixed unaligned commit message; moved typo fixes to another patch.

v3: https://lore.kernel.org/netdev/20260630183702.170798-1-hemendranaik@gmail.com/
- No changes since v2.
- Resent after the previous submission was deferred due to the
  net-next tree closing during review.
- Updated corresponding iproute2 patch in response to review comments;
  kernel patches unchanged.

v2: https://lore.kernel.org/netdev/20260614125000.6058-1-hemendranaik@gmail.com/
- Addressed ABI backward compatibility issue for tc_fq_pie_xstats.

v1: https://lore.kernel.org/netdev/20260531125314.22492-1-hemendranaik@gmail.com/
- Initial submission

Hemendra M. Naik (3):
  net/sched: sch_fq_pie: add per-flow statistics via class ops
  selftests: tc-testing: add fq_pie per-flow class stats test
  net/sched: pie: correct tc_pie_xstats field documentation

 include/uapi/linux/pkt_sched.h                | 21 ++++-
 net/sched/sch_fq_pie.c                        | 88 ++++++++++++++++++-
 .../tc-testing/tc-tests/qdiscs/fq_pie.json    | 27 ++++++
 3 files changed, 133 insertions(+), 3 deletions(-)

-- 
2.34.1

