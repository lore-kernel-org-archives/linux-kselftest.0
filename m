Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793902417;
	b=LlJnZ+6Aty78I5/KFG8lZ/tBndQc64ZT8keigIDnTVz7ANVl4OeV99mJ7J+luYUh7S6x
	 UMF4qHseuv0OqUzp3eVoL3DwySJCZ7nZHtzkw7SqAp/nQwYzkGnQJCd33qklICJDGIYXQ
	 0l9NpZuyi27NFPuOEHEruK33GY7QdNGfeX1c+7Lo9c90nXsuwO3WlcHknPEVj10jqa4Gh
	 BBL1XAr+M/PYyIjDNwmDrdBYG3Es7D65Yf/F1ugDyOX6KKvMwucWFDSCgYx99EEuSynmq
	 9joX7uy+Ityi101styi9r7bajCvPdzLoP4u6Q5RA4dgFfjg1b5WlajnTKQp3zF4qqiA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793902417;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type;
	bh=098pJ/mjCtdUXxQuc1quST9UBoetMnmWWS/d/SLNK1c=;
	b=cXDWkE3ibD1VjMgjs8iv4+LPG9af8GcVQ/Pdj5oPpBhQskDnIQZJbaF5BJojTdlQOVXi
	 YU0oaItInKiaP0HwBxwkgfQGwCfuMA6gyaO1cSqS18PCIXf1se8nlk1bgOZRdKpLvwycS
	 uFe58Pdi94S7geTLAxnFL1PPDKnyVce9drBV43IxnOkZMeaVpZo9iyI2o6Tiy1rp1Edi2
	 G2PvNq87LsUhmPu3Xe9T9kmEJAnv6vFLLvBwLBqLucOb2WSDAUInXp3mt27nVjJPNKkdO
	 ehaep73lhAEFaj3fkuzELuoPm9y+P6L2Trwp8PS7fSAAK5P/IjqimL18KVPjgpu1i6A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=student.oaklandcc.edu;
	spf=pass smtp.mailfrom=student.oaklandcc.edu;
	dkim=pass header.d=student.oaklandcc.edu header.i=@student.oaklandcc.edu header.a=rsa-sha256 header.s=google header.b=L6TU1sYs;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.179
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47C5C606A31B
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Nov 2026 18:13:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47C5C606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=student.oaklandcc.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=student.oaklandcc.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=student.oaklandcc.edu header.i=@student.oaklandcc.edu header.a=rsa-sha256 header.s=google header.b=L6TU1sYs
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-8b31ca7e0bcso22156587b3.0
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Nov 2026 10:13:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793902410; cv=none;
        d=google.com; s=arc-20260327;
        b=MJIMFum/R2WQv2re36Q44U10JByjA6kBoGRZpwtYsXYQ4hpXOJWanQ9jea4NkqQqKo
         UKvuXtD7MGKeXURgKe2IZor8cR3/UsN4n+7Qs1bcVjcg6o3LI7iM7pqBqPR2hROmT/CG
         XfPAcy2+S4O691rKiGECaaEgWu/B6Azm17ijLkFgpS6g5+2Rr5emDUwEVdbozb85/9+g
         jOCLRS6NNi8SUmZtIy3oheLj7cEvphyHfvHPJ2lc0IQF4YB//WH2vF8J4fC64w1KdczS
         GRcagjmeDa6C+FN+I2EUjBzCNPlxGOC04QkNVKw3nzHOPKj6uJxMpRGBGv/9IaQKFa9w
         E/yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=098pJ/mjCtdUXxQuc1quST9UBoetMnmWWS/d/SLNK1c=;
        fh=flZDCUGhAYz0BNXLsZnx1dUgGRiGU7UpbYRoXTThOoE=;
        b=qRWkejqYxSwiC/B2QcmyzQqcJCCFke+aIGRjE06dFvxGJISg6zK60OXncxOa+6CWZC
         7XG9wkVJRDv37H3Otv6bA7RoS9K8ptBLwqJwclXLVDsRW8MBCI7f+osZQzThqSl8YO8w
         rR3Ivvi1uLnrzrCPVwYq/qZW+8iAHsq0sm00oD1dAQBozcSolr39iqyfUpyNOw+OPKV5
         1+1E6RwUSZ9gbJeySpPV/ZL78OW/wJLsKM6qVeHl5QygfyjbWUelGwAr+MtBFwTvFGc8
         MAbCFqhqAqaZ842/Yuo1VqhSRk7wj3LTXnzNTdnQc4uR7ZQp17kdVLoUJaqBD7beMfxn
         l6pA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=student.oaklandcc.edu; s=google; t=1793902410; x=1794507210; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=098pJ/mjCtdUXxQuc1quST9UBoetMnmWWS/d/SLNK1c=;
        b=L6TU1sYs2Py+1Gm3B7HjgxQllc30Pdo9NZiMwe5bW4b96/wYLcAngHynXLRisbOe5f
         MUKBU8F8eFWJELnaETJsBcr7NUqpcZUo6yj0XF7Eu6qANVuiY0FELfwMZtyMWXjJDlj2
         X5lODsb+v6tzUaBb/OeihlWXlVjml8Yrl10cJwIOY4/zmD/dFItCXulgTv2Ieg/qRM2S
         2KJYzSqkGR90c8CDHcjbrFRS/2tDV0atiYuQbgQs/cftTL7DcUu9OHgWRU9xW/IlNmRe
         /XKM/LXkqGrx5gJbQOWBhM4Np+v153Sw7WiYR/czMdPwNm6oe3h0KxTATypFICzBocg+
         hPoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793902410; x=1794507210;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=098pJ/mjCtdUXxQuc1quST9UBoetMnmWWS/d/SLNK1c=;
        b=GAPv21+SzkMhf7W+bXjkWZR9mSKt7+W4HTOOzXeMUtRjs+8mtIym37FZ27rNi/7hkv
         AfvRFefjrzGhU30CfyhbJai+z0RQN3wUVamHxigRdrvvRtqso53S+RBcZRRlR6usERmG
         XATQvvsq6TMVwsl12FlzfN+oNjyH9CWmeE+657yW/8JoxvUNk1ZxEFHFJfWg/Jj8k0qu
         4ndDksCsXax4fVpc9YxeGBCPy7/HxUaXkPaLgP20mYJ/kAZB1VwT+7tCV7DQwXDibdmI
         mFU3AtCruoVMUVLZEVdRxEm2bjRHdDePFLiSWunU4QVCk+6SxJp8MaWo51qOpRhY9sxe
         x+VQ==
X-Forwarded-Encrypted: i=1; AL+hErGpZgzKJGV7v5g+7zWPOr1DD7Sd8ulwZqzaLzqCTbLrsXOKemIaj+ycSbrM39J7m04eAYmjSUNXwUScv+kgPys=@vger.kernel.org
X-Gm-Message-State: APuU4Z/d/rpuLUTvbOvvcq0Hv6Vy5aO96BCzNheVQFxGhMCUuPoeQuKs
	PPILkeXfVCM4j43PttGzZTvm7iHzfurxB8Vn/zAqSSjPTBs4E3yaiPmRpw2U3DpyTZfXN152QIz
	//EiHUEDdw1Pt6sjzHzCKmE46+WeiuCWeTRm2SfVHMQ==
X-Gm-Gg: AYBFou18kEBcBdsoV4ZQ3U+Fd4OXIeV2DB/L6aOVVEr+RXmWSZL6uBN44vMOjTOy7Hl
	hsh/4oKTi3Qw2rmzey8Zo70UTr3cI5w2nerp5vjmuYMZzHtwSongHh56jhkF3K+Fj6DwHDZnvk8
	9vsBMrHwbzvEtcpWvLV27K+Ahhix0fbkOwxSFh9IJFk3BpaJYw1bpmDX+AdyH7oGR+GlYtf8ioN
	Xb1h5mvG+SnPa+KNVsbFOJGMeKu21yFvKrRabR6cVaMJNc+0XnkiZAmyN6bpuzkl3dqOk4nL/W6
	paVNjXc25/xUVwolQQAqAMgdm8O9MTw4rgG5ooZrsgarMeux7wEyN7ZhPW5FK4dFgZRWwO18BV+
	0vNn4dpVTi0G1ZfskxOP2q03E1xRHc2g9lw==
X-Received: by 2002:a05:690c:e3c9:b0:8b0:e348:2586 with SMTP id
 00721157ae682-8b2b6738e32mr154837347b3.25.1793902410239; Thu, 05 Nov 2026
 10:13:30 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 5 Nov 2026 13:13:29 -0500
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 5 Nov 2026 13:11:32 -0500
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: "Louis H. Poulin II" <poulin.louis@student.oaklandcc.edu>
Date: Thu, 5 Nov 2026 13:13:29 -0500
X-Gm-Features: AclHuK-HkL__-odPAdZTujQIEQgQe1lLyEI3SQMyBF-rOk0k-MqpTUFrExyNMec
Message-ID: <CAGQButum4PYb4A+hmqg-bJZbf4L3KkH6rT9tn-0_NTs3xLhGYw@mail.gmail.com>
Subject: [PATCH 0/2] kunit: tool: Preserve failures in parsed KTAP results
To: brendan.higgins@linux.dev, david@davidgow.net
Cc: raemoar63@gmail.com, linux-kselftest@vger.kernel.org, 
	kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The KUnit tool's saved-log parser does not consistently propagate two
failure conditions. A suite reporting not ok with only skipped children
leaves the run SKIPPED. A result with an out-of-sequence number can
still be counted as successful, so kunit.py parse may exit 0 for that
malformed log.

Patch 1 preserves the suite's reported failure in aggregate counts.
Patch 2 marks out-of-sequence result records as failed. It depends on
patch 1 for a malformed parent suite whose child tests are all skipped.

The KTAP specification requires result numbers to start at 1 and
increase by one at each nesting level. The numbering change treats a
malformed result record as failed even when its keyword is ok. It
leaves the status policy for other parse diagnostics unchanged,
including a late TAP plan and truncated logs.

Tested locally: ./kunit_tool_test.py (100 tests), saved-log parsing
tests, Python syntax and strict checkpatch with the sign-off check
excluded. No live kernel run was performed.

Louis H. Poulin II (2):
  kunit: tool: Count failed suites with only skipped tests
  kunit: tool: Fail on out-of-sequence test numbers

 tools/testing/kunit/kunit_parser.py    | 15 +++--
 tools/testing/kunit/kunit_tool_test.py | 92 +++++++++++++++++++++++++-
 2 files changed, 98 insertions(+), 9 deletions(-)


base-commit: 05441d697f7f9a927264f4058cbbc6a03dfcac9d
-- 
2.53.0
