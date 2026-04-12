Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81420346E5D
	for <linux-kselftest@vger.kernel.org>; Sun, 12 Apr 2026 06:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775973851; cv=none; b=JVs1rB+wtFGic2tsZ9JcwoP9WaEnlCMgkefnf9S9Jq8k5JNN1TrZfjY4Lm5EMIwJQTB1XISsAo3DGD1fpp45RWLNVf8gFcW275QrdV7QxszKEj/WB30z8lO5BSU1E0kmd7nDB10OEf2ZvjrY/UVJ4IKdJah2VHHEu0BL2hn9MlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775973851; c=relaxed/simple;
	bh=RleSJLoVaTjmfnRxdJcEIkGnEJrHRqhSfW+mLBZVtvs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=POf1vucVzDMbzuZ0KV3FAcHLc0N2NBABcC8Ko1AGXwST4hGyKfcFmqD6QADltkZof3Ow5hT+TmT6Ua7fQQFBSfm/hc8bGEk7eHz1huBWGggjEoFEIz4cp/Il0IZkeyTdV2j0fx6v4fHyO8QOOuUISCnZW0chP6YZfWk0NNaiYdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BPukNvwJ; arc=none smtp.client-ip=209.85.210.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BPukNvwJ"
Received: by mail-pf1-f194.google.com with SMTP id d2e1a72fcca58-82748257f5fso1811977b3a.1
        for <linux-kselftest@vger.kernel.org>; Sat, 11 Apr 2026 23:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775973850; x=1776578650; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6a0dQ9uzvfDCLsmODly0L83y+okdi18YeC6c2nIa4uw=;
        b=BPukNvwJuEL3GTLXi5dRtQ1TJNfrn1MALcJtCQ5yrlTVB7HMqSYBRtDnr8Eu+s+PWT
         5soOk7CDyCQiQIJpt9+l18jUo+CutdPVsPlgWi5iIrfYUNFcS6np4C2OnJqHiAPkRh1p
         6qeVg9K4fEXDdbSxpbg+lW5236cAbkA5vJxOdTciygPXmemz4F/qV1kEb+tQ7b6PMw85
         mgMKJlURvoYh42kZ88otZFGcXnAogChErl9jrXy9vgGxa6cEDdryesq7dSBlE0EhNo04
         7uvNOvpU8cKywtZrMl9HcTs/dEks38iG5RSluBk1JpNV2PUQa2REIOK18FudVPYjxBow
         RqKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775973850; x=1776578650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6a0dQ9uzvfDCLsmODly0L83y+okdi18YeC6c2nIa4uw=;
        b=SInXOWcA2Fxx4JHVWWxPA+hRgoMLy1J6ByXqg9Jn4M6vUwofMFdhO/+AaZQvh1Wr4e
         KwEYM6parPyQP23VWQLxAz+GqT9mLAS1AkE6Zp6sfbNR+hbwEXP1xTcClwM9WQLKrgeE
         o27udSmBHYzgsc/Evd/6AGMzyl9V0+V6hzzJjTOhMeo5093AhDllf/gXFEOC/97O8cZs
         7nHb9F9diWA/DxMQdUDQHkw8OKcLsjviipLjKyedpf8QMbbzg0WUsbDWaE18xIkElEyS
         fIBfckYE9d9798q4yH0al2GI1iKNRHEllRWnpfKSz3vHNofs/EEueeGH/4AP1EHGDtIU
         HU7A==
X-Forwarded-Encrypted: i=1; AJvYcCUitne4TUchNknrqfRepy2Ey3xfyIiJanGlUQIVi6LB217xhZy0LyNx7Ke2Ezez9IcmDpQn6qHMvIE8Q8a8IS4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzsir83W3JJacrGFqZQ6UxpB72wMvuuJlE+0K2E0LJZ1CWuARcl
	d5vzMPJ0SbFY3CRS+zfmHNqSdkX9I7y/dgEYVIVwk/fgWYeoVNw49tEL
X-Gm-Gg: AeBDieukwpqQhS+j4+rvmu6JNWZkgJBvC6MS90ctAXk7EaN2oSjUmzYWoWbjPQML/ct
	bSygAl8s/KSBWTFKr2+niJOtrMI110k7kWuqCptgQh+WYx6zbpADMBEj2EnXVK/erjtQ83vroUs
	NAYbq/IrdM0JwrmrGrg69TPyBav3xRjbCHDofnyelRVA3nChAv2qKT8SvLAB8aN6mWlYpv93RaS
	e5Lwht+cI1v+33WMH4zjBxmY5+kz3ivWhpQAbqSdD24Sh7q6OAlqVj9NQVsZEL1THTifkbvRQdT
	4jZcGijP1geQcxUGnknHk4h5IdzoDDknjHIhqD9A6gV1GKfERa8X/qeRST7H93QEj28g6h8/leu
	2eUzFC8W9y0XAHQlEv2D+j3iAE4X8fWSKN3Amp2AzT6IRD8jx/cQXwdnJ9ASHRaJBYvMsawwUmR
	V7kPsmU9FAXXgCxbR9ZjLv
X-Received: by 2002:a05:6a00:c83:b0:81c:5bca:8104 with SMTP id d2e1a72fcca58-82f0d36ad0cmr8491297b3a.24.1775973849870;
        Sat, 11 Apr 2026 23:04:09 -0700 (PDT)
Received: from 7950hx ([103.173.155.241])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c4b251esm7072645b3a.37.2026.04.11.23.04.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 23:04:09 -0700 (PDT)
From: Menglong Dong <menglong8.dong@gmail.com>
X-Google-Original-From: Menglong Dong <dongml2@chinatelecom.cn>
To: ast@kernel.org
Cc: daniel@iogearbox.net,
	john.fastabend@gmail.com,
	andrii@kernel.org,
	martin.lau@linux.dev,
	eddyz87@gmail.com,
	memxor@gmail.com,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	shuah@kernel.org,
	emil@etsalapatis.com,
	leon.hwang@linux.dev,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH bpf-next v3 2/3] docs/bpf: add missing fsession attach type to docs
Date: Sun, 12 Apr 2026 14:03:45 +0800
Message-ID: <20260412060346.142007-3-dongml2@chinatelecom.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260412060346.142007-1-dongml2@chinatelecom.cn>
References: <20260412060346.142007-1-dongml2@chinatelecom.cn>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the fsession attach type to program_types.rst and drgn.rst.

Acked-by: Leon Hwang <leon.hwang@linux.dev>
Signed-off-by: Menglong Dong <dongml2@chinatelecom.cn>
---
 Documentation/bpf/drgn.rst                 | 4 ++--
 Documentation/bpf/libbpf/program_types.rst | 4 ++++
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/bpf/drgn.rst b/Documentation/bpf/drgn.rst
index 41f223c3161e..cabf702eb75a 100644
--- a/Documentation/bpf/drgn.rst
+++ b/Documentation/bpf/drgn.rst
@@ -26,8 +26,8 @@ about these objects, including id, type and name.
 
 The main use-case `bpf_inspect.py`_ covers is to show BPF programs of types
 ``BPF_PROG_TYPE_EXT`` and ``BPF_PROG_TYPE_TRACING`` attached to other BPF
-programs via ``freplace``/``fentry``/``fexit`` mechanisms, since there is no
-user-space API to get this information.
+programs via ``freplace``/``fentry``/``fexit``/``fsession`` mechanisms, since
+there is no user-space API to get this information.
 
 Getting started
 ===============
diff --git a/Documentation/bpf/libbpf/program_types.rst b/Documentation/bpf/libbpf/program_types.rst
index 3b837522834b..3a07ce3b7f79 100644
--- a/Documentation/bpf/libbpf/program_types.rst
+++ b/Documentation/bpf/libbpf/program_types.rst
@@ -207,6 +207,10 @@ described in more detail in the footnotes.
 +                                           +                                        +----------------------------------+-----------+
 |                                           |                                        | ``fexit.s+`` [#fentry]_          | Yes       |
 +                                           +----------------------------------------+----------------------------------+-----------+
+|                                           | ``BPF_TRACE_FSESSION``                 | ``fsession+`` [#fentry]_         |           |
++                                           +                                        +----------------------------------+-----------+
+|                                           |                                        | ``fsession.s+`` [#fentry]_       | Yes       |
++                                           +----------------------------------------+----------------------------------+-----------+
 |                                           | ``BPF_TRACE_ITER``                     | ``iter+`` [#iter]_               |           |
 +                                           +                                        +----------------------------------+-----------+
 |                                           |                                        | ``iter.s+`` [#iter]_             | Yes       |
-- 
2.53.0

