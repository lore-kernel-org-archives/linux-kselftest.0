Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 987F0453A5D;
	Mon, 14 Sep 2026 12:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789387840; cv=none; b=lcUHObhF5ttCN4ZJVIH1djwGfuj317cUjb6LvpCkiCyXaNj0HbpQq7XvJa3HsWZ0HndUjiAdhtBgtWOVvLMa1fB3//nwmCDWmk5JpMaZX/LNzbLw1u+2kDRAEo8z35sFcy7+2cBQTg0EL1JhB8jB6zz/AzQOLCfzJm+d7QAMCPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789387840; c=relaxed/simple;
	bh=hIe5P8i/tRyknhr6WT2uL6WYgTAsFEi+rD40H4hTT7w=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=EWi8HWchbteOUHA0/1uoqY0PZGKDSbRdJCBM2nIKNpbou/+yIBt7JGpv1aZgObDlOdYEWby8p834Auj7+ajYHGlKcxR7DZD3Xqy8ylmNHZLVK40ZKiqcrHhk6A2GQp7EzwBVkIDy2Y2iUexaZ7hpDtmT+IFYT6kIbMdBCXff2vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=lcggmS9J; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="lcggmS9J"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=lafXIwPAtxRGPpgqbQIXFiai7PzxNad67tNm4Ywy9ZE=; b=lcggmS9JOLMft+et9jDtyK/Oem
	KMhrHIQFhiXuSwvQlM/Ze5DXM2tguQ4uNnTUVqpo5PECkO/ABvQXAspe0/neTcp9fqPqmpDMNKuIU
	izXKmrlu1xnUIh+ffKlKkHoZzAdX3/sPmpjkTRQTKYklHcOrn7pbtPpUvrcIefTkqDh3zYPeXADxI
	Z2ShobH9evzyf9KxHNh+4xXxEAWSldqOsjBP4FJnin2kSKyiBM9lPP/3JiDfHlc/mi1HiK+zNcx/i
	yhE3MjayIBPpOcEb+DrFAUG3/FhyC6JQmH1NCS+Snm+//0gyDGLiWKMG3a4o099x3JpvTwwqID+Ac
	UwqTMiBw==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1x65W2-003bYk-29;
	Mon, 14 Sep 2026 12:10:31 +0000
From: Breno Leitao <leitao@debian.org>
Subject: [PATCH net-next v3 0/5] netconsole: Support messages ratelimit-ing
Date: Mon, 14 Sep 2026 05:09:50 -0700
Message-Id: <20260914-netcons_ratelimit-v3-0-8e81b789ab37@debian.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA/kp2oC/23N0QqDIBSA4VeRc51DbaV2tfcYY5Se6sBmQyUa0
 bsPYjAGXf/w/SskjIQJGrZCxJkSTQEaVhYM3NiGATl5aBgooWphpOYBs5tCusc244OelHmtbCf
 OrS5dpaFg8IrY07KbVwiYecAlw61gMFLKU3zvs1nu/euaA3eWXHDjKq+81NpYd/HYURtOUxx2b
 lY/wkpxRCguOHa98N5KVDX+Edu2fQD3rt/cAAEAAA==
X-Change-ID: 20260817-netcons_ratelimit-629b04a73c57
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Shuah Khan <shuah@kernel.org>
Cc: Randy Dunlap <rdunlap@infradead.org>, paulmck@kernel.org, 
 gustavold@gmail.com, asantostc@gmail.com, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Breno Leitao <leitao@debian.org>, 
 kernel-team@meta.com
X-Mailer: b4 0.16-dev-f8e9d
X-Developer-Signature: v=1; a=openpgp-sha256; l=3983; i=leitao@debian.org;
 h=from:subject:message-id; bh=hIe5P8i/tRyknhr6WT2uL6WYgTAsFEi+rD40H4hTT7w=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBqp+QxmUihE6qU/1DYCWfqubAE+DMgbASq4jtL9
 Li+k3P6paiJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaqfkMQAKCRA1o5Of/Hh3
 beiAD/47/kNsSaTzGMe5T9Eb0HwazXLuBp6npC6yeYQXtTva30uAgtJ4GJVJgi/OVLhBK0AgrN/
 iP2QWGI9xcaD2TPWP0KXmXwVl6HOTkgkiCnsqTiANh/GSsiGXY4kEVg062sPqbihDDzqQPXvhNU
 gBE3VmXD0usNOQSgAz+2rRzJ6FRTS2ccWfJU9YWLghY+F+WX1wnz+/laAW3gvuO+oQwCvyYvUAh
 +nfcLj8GwfPYxwhsSrgu9n8fVflHfTFqGkbZpi9Wq9/gisGevpP0lAoZVSCEx2zsMJpLCta6A6H
 WK1dJPrsigjLbQx33goXkFFObGS6V2iGFkTuHhbRChqCEUJxN0oZxfrbTdAtBH15UK4TryZLaPK
 A+BIRoz70A1tT1KjvsHaED9/FHjFxYgBojSSRE3QCDd2t1m+ynj/Ek0dqjh+3weViyLXxUGxd4l
 GIrMciqlz8UX6X295vWuQ3Y3h7d96pdrFNmHvPyVz/QwThebnI9n8djpUzp4SCkfJgD1xLgjIOT
 ULWEtKLXqHQ9TaVjn1U+P+/ZyyolwVdn4z9GAixzLGFUqzGu46Xsu2McSQud4x17Z3LyTIQUiyZ
 YYxRVVVU5stRSdoQrkVTT8JJ7WllqrtnBjJoZSl/VTsxwrkdYK5UTeq1KukDbibHn0H38h0Cfkr
 yPy3hcBznUch7zg==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao

netconsole hands every console message to every enabled target, with no
bound on the rate.

At Meta, a few hosts caused some DoS and netconsd was OOM killed in
some regions, fed by 3 billion RCU messages from thousand hosts and by
a swap fault that retries forever, which logged 6 million copies of one
line on a single host in a few hours.

Both floods are being fixed where they are printed, by Paul and me for RCU
Tasks [1][2] and by me for the swap fault fix [3], but that only ever
covers the flood already found, not new issues that might be happening.

Use the ratelimit in the kernel to ratelimit messages from netconsole.

Give each target a token bucket, consulted once per message so that a
message split into several ncfrag packets is sent whole or dropped
whole.

It starts with a zero interval, which struct ratelimit_state treats as
unlimited, so nothing changes until ratelimit_interval_ms and
ratelimit_burst are written.

What the bucket discards leaves nothing on the wire. An extended target
sees the loss as a gap in the sequence number the header carries:

	7.2.0-rc7-01460-g75848acaf136,13,628,252392647,-;netconsole selftest: netcons_AGujw 1
	7.2.0-rc7-01460-g75848acaf136,13,629,252392782,-;netconsole selftest: netcons_AGujw 2
	7.2.0-rc7-01460-g75848acaf136,13,678,254742125,-;netconsole selftest: netcons_AGujw 1

Crash output is exempt. The bucket is skipped once
netconsole_kernel_dying() is true, which the first patch adds:
oops_in_progress covers panic(), TAINT_DIE covers an oops or a BUG(),
whose records only reach netconsole from the printer thread, after
oops_end() cleared the flag.

A target that has seen the kernel die stays unlimited until reboot.

[1] https://lore.kernel.org/all/anw8Qw8lfeIykski@gmail.com/
[2] https://lore.kernel.org/all/20260810-rcu_task_shrink_lruvec-v1-1-4d9f7d5251cb@debian.org/
[3] https://lore.kernel.org/all/20260813-swap-v2-0-4a625ccabdae@debian.org/

Signed-off-by: Breno Leitao <leitao@debian.org>
---
Changes in v3:
- New first patch, a fix that stands on its own: oops_only=1 receives
  nothing on an oops today, because the backtrace reaches netconsole
  from the printer thread, after oops_end() cleared oops_in_progress.
  It tests TAINT_DIE too, behind netconsole_kernel_dying(), which the
  bucket then reuses so that a limit cannot truncate a crash either.
  (Sashiko)
- Restart the interval when either knob is written. A target is
  configured while it floods, with the bucket already empty, and the
  new limit only applied one interval later. (Sashiko)
- Reject an interval above INT_MAX ms. msecs_to_jiffies() saturates
  below INT_MAX on 32-bit, so checking the jiffies value alone took a
  write there that a 64-bit kernel turns down. (Sashiko)
- List both files in the target parameter table, and qualify the rule
  underneath it, which says that only a disabled target can be updated.
  (Sashiko)
- Link to v2: https://patch.msgid.link/20260910-netcons_ratelimit-v2-0-ebf0dd91e26e@debian.org

Changes in v2:
- Drop the patch that sent a "N messages dropped by rate limit" notice
  to the target. (Gustavo Luiz Duarte).
- Link to v1: https://patch.msgid.link/20260818-netcons_ratelimit-v1-0-8c5d2d17789c@debian.org

---
Breno Leitao (5):
      netconsole: send the oops when oops_only is set
      netconsole: add a per-target message rate limit
      netconsole: allow configuring the rate limit interval through configfs
      netconsole: allow configuring the rate limit burst through configfs
      docs: netconsole: document rate limit feature

 Documentation/networking/netconsole.rst |  71 ++++++++++++++----
 drivers/net/netconsole.c                | 126 +++++++++++++++++++++++++++++++-
 2 files changed, 181 insertions(+), 16 deletions(-)
---
base-commit: c68a982815dcce5464e3bf2a31ac94f5146c04ca
change-id: 20260817-netcons_ratelimit-629b04a73c57

Best regards,
--  
Breno Leitao <leitao@debian.org>

