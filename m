Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B0433DBD41
	for <linux-kselftest@vger.kernel.org>; Tue, 30 Jun 2026 18:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782844642; cv=none; b=GB3/K1pgMWKshc1S2fyo25GzvwaCUuo0xa4dKvxiemEpf4iusHlVAH3gpjRGYhm1qmQFg8Rv8wvVPKDicHF+T8bwJ4SQi1PKxT5X8B5lB7kYM/d7UYuK3VniwYyblo4mrF51I8kV0kjnS81e59UtB8dgS1yitj8bOfaxe6gCAKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782844642; c=relaxed/simple;
	bh=DYD1JUeHIQBn+tSBBpX4SXFw4uV7JZpeKR5pyZgwgpE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lLQI7nVi4GK9Dh6uTGTZEw6AYg/OgBeIzdPG8iMrpeAr/lEyCHhPF1rwZgLbAWiocqhA02xS8P3wTu/nF8wG2DuSJfaRn08gbpISccAC3ivXePw4la5dwcWVwsLnlEh+ZMHz9KG09xtzP5uYgM2NKJbwcA6UKXslD2BYRZy+dLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bRvwnvvi; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bRvwnvvi"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-30bbe98c3f0so1350098eec.0
        for <linux-kselftest@vger.kernel.org>; Tue, 30 Jun 2026 11:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782844641; x=1783449441; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ih45vlyCqTdxWz3Y+8yYeJgcebBFtFeu2WVvm7KcQZ8=;
        b=bRvwnvvifNqRu+ekKhHbQ0XuskXSyiiQTubAZV3rcDjHWY06eMMMAIglEbTCnTo1Ab
         uQcogMaXac6/ORw1lpsfPg2Vg4h7MxEzwmU8Nrow9F00v+GCPbpBG+9+QQgTcen2T0sc
         ve8BadPXiZERTSTjzbnuMeNQiFCwQDNjXKPPaTYQ2TxEDa50DPQ3dsK9EfOX+tqtATjT
         R9qqbWtkngpL9wYdImTh23HR+ZMMfv917VZ49NIGVv/Ldt8Xtu1KsFc+6j6OKfDbLDaC
         5OeFOr5Hd6PY1NUBs+e3iJZLdzb7Lrs7dCxZinlj5/L46ZUkwWaf/+ZES/EiwpBaAGPy
         kq/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782844641; x=1783449441;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ih45vlyCqTdxWz3Y+8yYeJgcebBFtFeu2WVvm7KcQZ8=;
        b=BaSwn0PtZoZFQlJ6ECVFqpd95v4dkCvgOdxmUOposnt6Bx6/eVS0nhPNNUUj7BTscU
         cRCbtTaJU0gOP+8fOP9Guvn/6ZueNXwQ4SisF/RjsnyUvhyyXnL6XsfbClZnShHoqX3e
         r8IZjEdgYvtxvxAAYqqNSrdhvgVlposRIk7+4f+3zFtI7bBP7iqTElARE/kzfQZBSvaF
         zBqFV/+34YZBiAcrVwlXU8l/pFF2fj9aw2I7sDM7rB9rm3bSDomDsHyza7Qa9m3qN1uq
         JCXU13Sq5flrEMl9g6g0i37OMoXNVWTpFL4BAvwVb6jelQkn46nmSEhTbmT/yXYEtGm/
         XwJg==
X-Forwarded-Encrypted: i=1; AHgh+RrKzwh6Y0os/IFdNBdPlmlQfpBgqEcOgg6WrfY+XPLVY3gOXwcaAV81mozxz5fAUomxHM4VdPzmf7hIqU/pPYU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwATux7kBIwOC3lDUvbeBzIQ+vHLXrpdq8A5Znqw5j0l9J0QGqV
	2gn+XW29PLKxlfEWVdPAP2dHxEWmnRuYpixpexJJ+wknmkk6MyUPyizi
X-Gm-Gg: AfdE7cnampih/br4ARp/EzM+UwtcBNGpD6XdrbMtR6R3oz8mB25+k/a8Q2eZ7T0KhUN
	gNmOXdXTAYOJO9ALxUpqUmD8XyW49Z2njbAK9Y7GdtbrkLE4mgzO0TweTIY5MEJ2aE6mrmT8dhx
	0jhLwg4dfivCt0Wc49uk/FskeHg7x3QutuR2ouI7MA9qwsFRw3mq5fjQwX4dgz/f6qIlZ94OSCf
	CITCqBi11OxYmp2CnAPOLDkaS7YK8TamQRRN+q4IubYbzrS+N1ETcSwkCzfDoZzRRByvWpWFtUp
	VEujV0giJ8g/bJKUqhiuofbY7XVYAknVEOr1wexFQtP99MWtl3N5YaMeruaOvZqIX2Oqwfw47HP
	9ooSyjgugvLcgqBj5MIrTvKoxC5c25RHhVBZMdo5UB1BGFLhmErG7vUxaepzQDNJKbGADW1N0RC
	nr+RRTmHDxjuXBRAsJrltZPdObosM=
X-Received: by 2002:a05:7300:6144:b0:30e:c24e:2f01 with SMTP id 5a478bee46e88-30ee1404a70mr3317602eec.35.1782844640668;
        Tue, 30 Jun 2026 11:37:20 -0700 (PDT)
Received: from Inspiron-14-5420.. ([2402:e280:21c6:671:b5a1:965b:86fd:756])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee3205993sm10888191eec.24.2026.06.30.11.37.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 11:37:20 -0700 (PDT)
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
Subject: [PATCH net-next v3 0/2] net/sched: sch_fq_pie: add per-flow class statistics
Date: Wed,  1 Jul 2026 00:07:00 +0530
Message-Id: <20260630183702.170798-1-hemendranaik@gmail.com>
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
 per-flow AQM state (prob, delay, deficit, avg_dq_rate) 
 via 'tc -s class show', following a similar pattern as FQ-CoDel.
---
 Changelog:

 v3: 
  - No changes since v2.
  - Resending as the previous submission was deferred when the net-next tree closed during review.
  - Corresponding iproute2 patch updated in response to review comments; no changes required for this patch.

 v2: 
 - Addressed ABI backward compatibility issue for tc_fq_pie_xstats. (https://lore.kernel.org/netdev/20260614125000.6058-1-hemendranaik@gmail.com/)

 v1: 
 - https://lore.kernel.org/netdev/20260531125314.22492-1-hemendranaik@gmail.com/

Hemendra M. Naik (2):
  net/sched: sch_fq_pie: add per-flow statistics via class ops
  selftests: tc-testing: add fq_pie per-flow class stats test

 include/uapi/linux/pkt_sched.h                |  29 ++++-
 net/sched/sch_fq_pie.c                        | 118 +++++++++++++++++-
 tools/include/uapi/linux/pkt_sched.h          |   4 +-
 .../tc-testing/tc-tests/qdiscs/fq_pie.json    |  22 ++++
 4 files changed, 163 insertions(+), 10 deletions(-)

-- 
2.34.1

