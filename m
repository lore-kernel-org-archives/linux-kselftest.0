Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C1D036215A
	for <linux-kselftest@vger.kernel.org>; Wed,  8 Apr 2026 06:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775629305; cv=none; b=atn87TQx9yh/Aj6teVYygJ6hD1aJgkq7zXoBN2V9hA9t233ovKeZcc28+Xq0XIQ/VEdGq/5H+woROW4lYKmSaaNoY5FRLYH1WDkWYnDgXZxmW43jjiTE3o5Apt7WBurbt7KrmPVbWPmWd1CHA2qnBrnJsP4XS8Ci/bE/zOX0cZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775629305; c=relaxed/simple;
	bh=bFdBj9bbHDLyz2yZxEb5IcrG/27D5JU264pttwp06WY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kYINfASzy6PZAqDy9tptuRMa+N49OLTF6oBnD5jRV1ANeBFCiRR4fs0DQ2LqW7is9RjsnqnJDLH0EIPI4TLlvfc0U7pvox1dbZMJAIWIKVpo6LZip+IlgWlFncAULI14FscWikDg/WEMGD0bQGA1TXkvY3udtLxOAm51qzW0HFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hk6UZCR9; arc=none smtp.client-ip=209.85.210.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hk6UZCR9"
Received: by mail-pf1-f195.google.com with SMTP id d2e1a72fcca58-82cf636dac8so2705078b3a.3
        for <linux-kselftest@vger.kernel.org>; Tue, 07 Apr 2026 23:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775629304; x=1776234104; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rvsEcC9YBgoHRcgVgcVWA9zsiCb/IHA0zRMar9dtNCc=;
        b=Hk6UZCR9xRTZBheqV3cSG1RdMeaetI9HN9O9rkKNefW3nY7cq8ARJcWo/x1I2FYPPF
         bCyGg5054TA2H3vqrEHpgUXC5aBJrysQBG1ckojW9DGNB9FlVKWzxjRwLIsIhnqK2t/K
         yyrQ9ISx7EAtb7NzEmiErczOTv2pAQS0lb6zTsCj3sqr1v3DVzRWsKNdmyMLGxEYcSfj
         PZ9mer14KmWktoEKBjV9k1qxSHOABb+x1yfK40wq2B19kkfpXr9ZIAdWT/9mSxsaTh4s
         dAaI6Q3xhFChz8cSYHZtbdRKv55ixwVEHoANaP2rjIDFuGxt2FCCXqS9ZggshqyBgbcK
         t7JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775629304; x=1776234104;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rvsEcC9YBgoHRcgVgcVWA9zsiCb/IHA0zRMar9dtNCc=;
        b=AqI1Q+pmSbc5vtE+OuszPOwXlFSXFF7y5MAHX7uvaSrBb5uK5QJNM68CGqDlKucXK9
         3V18pCIuKOcIpvYFNJ/o5Z6DmZopEhCYxyehq2ZPiUfMOZdzuo8/Hygi6oHIkwtC7D+C
         5y1kAltrn1+Yf1bGuR7adFB0EnExZbtn3Qe0gtg7ysavFzETYJYZ7g5lXWeQZfHKdqjL
         5wcKhZvsjfEUzFEdwvB8h3lMNLwyfaElcFgQId4uu6F/PE5roiR2etMTtblpTwg4W9JG
         F7P8OUdpwGtCXNJOnPK8K5w0MWRU0iq0jgeWR+ydapqPmWwylQVBRgveotFd4MQ0qPJX
         lahg==
X-Forwarded-Encrypted: i=1; AJvYcCUeRPyjK5qqsJA0UxTLdtIamHh9AbB9ogf2y7LX7t7IKmHmeeeyurmrQnUuxWaZoVlgrZIdImEjNFpuSsfxcj0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXzg8kRI8+p6s6PpCQmdFlrFBwsWRVTwBRgmweAAOnpElyRag3
	z8gk3HeoOEhPVpGoR2lH/YdXNkukwMBllXYBYhGD8NKbels0w33AZz8o
X-Gm-Gg: AeBDietlmTrnKMuCS2pLo+W4YdNBGoW9j/4IiPPkuov1d/cNWh3GeeVL2Z/RIdpR5Zx
	nzf/6ArhLxw/y9qlBCWhxDnj0lEvtBGi4fs6Qu1YACyNl2os/0O9KGKuCPTkndjiYd95hpnHIHz
	HJUJdhZDZ1z1BU9ZUf1zz+V/lAhjWutVh/qLCPIzR6ckI4eDAyzBDKrKlwOqjU3am1tCZgrWQeZ
	MrxhCm4rbC3Put1ok84bwqMDWKhDo/JBYLKEq2qbvb2QoDZdCdbMNLSNPLnNiuH1TBkRkmOZ5dL
	ex6e+30OijEI7lv7RCzYTsfn5vFRo0eO9PzJL7t7veiXgwRJvNbAlvW0jLfGc7dkFhB5BPhXnZm
	OQyr72pvjX+uV/uzXufZDl6QpEk0+6UycPzptjT+sGU7rnqhJSVNwZg7lv6BHc9wC+FtV7uJqPs
	N5xPaA/QmWCZjjSOx//RRu
X-Received: by 2002:a05:6a00:800f:b0:82c:e60c:f36d with SMTP id d2e1a72fcca58-82d0dbf1a4emr17998807b3a.48.1775629303845;
        Tue, 07 Apr 2026 23:21:43 -0700 (PDT)
Received: from 7940hx ([103.173.155.241])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b60199sm17827638b3a.25.2026.04.07.23.21.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 23:21:43 -0700 (PDT)
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
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH bpf-next v2 2/3] docs/bpf: add missing fsession attach type to docs
Date: Wed,  8 Apr 2026 14:21:08 +0800
Message-ID: <20260408062109.386083-3-dongml2@chinatelecom.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260408062109.386083-1-dongml2@chinatelecom.cn>
References: <20260408062109.386083-1-dongml2@chinatelecom.cn>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the fsession attach type to program_types.rst and drgn.rst.

Signed-off-by: Menglong Dong <dongml2@chinatelecom.cn>
Acked-by: Leon Hwang <leon.hwang@linux.dev>
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

