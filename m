Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C818E1EA65;
	Fri, 26 Jun 2026 15:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782489192; cv=none; b=XjJ1bSI8921YnIdNvGDn+2HLOmr4HaPk8HDYnQKHS/GAQMMY1X6xAF9pl06+Wei4KdbrMf096IPl7zRKTFUQi1QrM5ZTvlr81enP3+DLZSWUG+RKWscIUAwfhFGHuSGzMM0Xsc8BEL+g6TaNufdpIhDVwHDrR63KDHQpomfEgOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782489192; c=relaxed/simple;
	bh=uIuxE1WiXTZSAQtk01gH9qzDdqb3u0v+kJWkOXGnfCQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=cO/OdsVzDPFdieg39eigryJuD5PvahRnD5eZXbdjc3XepwejtI+cXfF9POjWgmGNX1kmeOY3wUY4X9x4tBFVNPypVx6/cCfhSBxVECzhh85Rt/+1vGcIOKvjwkahVX2NRt8TemXsK6YK922JdHCxuOyU04Yjo2z8h0PHuPCvCzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=jIR1RF3c; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="jIR1RF3c"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=21zdTXnN8j9g9E30mY+sGQ4wNLRdAYxZ+MLcSTpi/9w=; b=jIR1RF3cKKQEDZyIewZ4PN6quP
	OIEm0YfLCIJw5cNA5/Q3m3FxI24XdfaYzVLzK4GJqhB2WKo9YjVvoIu+VJBwh6XQnIWns2LEegwA1
	Q+J/RUpnEM0DuAh2Jq/FNlyTaEVSUOhFN1hf3MjD22Sw4rbicZ0/gSEHH1ofb/MWwR1eAhaEvUfyr
	HlVx2Xg8f7XPyYbIVBZDZfQAHm5wI2GkYf+nstW/Rv8+xKVp8hhMjNFw1AFK1/rXI2JJW2Ri2trI1
	4mxI3bWzBT2I0SULTcW285KYovqFQI7GY1i/0TTx7EE2HHnimzNSI34W4qCb7wS/A/Jz9Di/KC4vw
	8rhEWaFA==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wd8rX-0044nS-2S;
	Fri, 26 Jun 2026 15:53:04 +0000
From: Breno Leitao <leitao@debian.org>
Subject: [PATCH 0/2] mm/kmemleak: add min_unref_scans to suppress transient
 false positives
Date: Fri, 26 Jun 2026 08:52:01 -0700
Message-Id: <20260626-kmemleak_twice-v1-0-ab28f7cc0971@debian.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACGgPmoC/x3MUQqDMBQEwKs89ttAko8guUqREuPaPqxaErEF8
 e6Cc4A5UFmUFVEOFO5adV0QxTWC/E7Li0YHRIG3Ptjgg5lmzh+m6bn9NNNwsM67NjHnHo3gWzj
 q/w4f3XleAX3XQWAAAAA=
X-Change-ID: 20260626-kmemleak_twice-ed01218aeccb
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
 linux-kselftest@vger.kernel.org, Breno Leitao <leitao@debian.org>, 
 kernel-team@meta.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1844; i=leitao@debian.org;
 h=from:subject:message-id; bh=uIuxE1WiXTZSAQtk01gH9qzDdqb3u0v+kJWkOXGnfCQ=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBqPqBboewZLnOnAOQUwx766xin61f+L5f82gW8Y
 V0FafLSWXmJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaj6gWwAKCRA1o5Of/Hh3
 bccvEACBYoMAaTFArpKHYgLUA7KVEYv3QxBGgZkuOcydvUi3kUnTxD7DpSzD1XMoy5ltAIjgfgQ
 Tq+2xY0o/sssBVhJ/O6JL0U+88NB/1iVL+Muq86ZlD+rT+zM6Yqy2ZEUGIEAI4B+rNBkJfUMAa5
 YWbGJCskGq4pvFL7hlcLXFk+SR63aU3bydE1yJiJRs0KiAcKZPlahL3S1cPOCC1PuJWBbwvbXtj
 mvEXyuIes+Az+dgema5xcMd3Mtssxqq9Psg1/82uLYtZWb4Cxd6ausTOWjNlxUusz9KCbCb2M0Q
 hAxWLwm1MKUjD6BUdjcepyzp02dTt+CzMOyeJ1Er8WFHTlWnyUGzYqz1RKErFiFI/SwFJY0RGa8
 6OC8+NFIEC1FV3yG+anM/30kG8YkvB10rNL8CmFyG8haWUGkTq0hlrmW6MODQfVxaPOL5TOCBmX
 y7eF4nhwPUNawSHn23Fo4+sUuzDOJ7joBoAA287//MXvnzqk8EEXEyAP2xqdImrtqXAlNcP4GMY
 IaYbojOXP/LMyAA39PQrF3wlqBZMLUBS7E/z8Cv9WRJivsc8FUxhLYRN+9cNjJFZJ0NOSBIhwZg
 ZyqHVcNwQ8uCTlb++CqmDkdRshN8RI0opTgfOb/2eeWtF4Gjt9STqAAEQcw0qLg4fMqj3v2bwMh
 a9Oyeso4xk0z1dA==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao

I have kmemleak on some test tiers to find memory leaks in my fleet, with
the reports dumped to dmesg (CONFIG_DEBUG_KMEMLEAK_VERBOSE set). It works
super well.

The problem I have is some false positives that show up from time to time
and go away on a subsequent scan. Something transiently unreferenced --
whose only reference is briefly invisible during a concurrent RCU update,
e.g. a VMA moving between maple-tree nodes, or a page-cache xa_node -- is
seen as unreferenced for a single scan and reported as a leak that does
not exist.

This series adds a min_unref_scans module parameter requiring an object
to stay unreferenced across that many consecutive scans before it is
reported. Basically it is a trade-off between report latency and
reliability (false-positiveness?).

It defaults to 1 (the unchanged report-on-first-scan behaviour) and, set
to 2 or more, filters these single-scan races while still reporting
genuine leaks one scan later. Would it be acceptable upstream?

Patch 1 implements it; patch 2 adds an mm selftest that drives the
parameter via samples/kmemleak, in case this is useful.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
Breno Leitao (2):
      mm/kmemleak: report leaks only after N consecutive unreferenced scans
      selftests/mm: test kmemleak's N-consecutive-scan leak confirmation

 Documentation/dev-tools/kmemleak.rst               |   8 ++
 mm/kmemleak.c                                      |  14 ++-
 tools/testing/selftests/mm/Makefile                |   1 +
 .../testing/selftests/mm/ksft_kmemleak_confirm.sh  | 111 +++++++++++++++++++++
 4 files changed, 132 insertions(+), 2 deletions(-)
---
base-commit: 30ffa8de54e5cc80d93fd211ca134d1764a7011f
change-id: 20260626-kmemleak_twice-ed01218aeccb

Best regards,
-- 
Breno Leitao <leitao@debian.org>

