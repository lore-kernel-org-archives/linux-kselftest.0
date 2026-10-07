Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF6993CF1E4;
	Wed,  7 Oct 2026 19:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791402589; cv=none; b=YXJFxq9APpDMcBzlOd8Omdr+lVsPWjnPPZOi6aDpfpXZkjcgQXetHiNEehwUrTOdxY7WQhWc2FxJsjEwJjLvFmQp2xNHbZIU+2MqZ5rwAEH9i7O+eWhSPMG/i8l1u6n1a15HLqV1PB9hTOaiYLvHVYc1mkdZER8SWGW9HY1065A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791402589; c=relaxed/simple;
	bh=c1VopkM7IUVLIk93aABQYe9KjIRNYiwyejP96Ne6OTE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=QD72ahncYhOaApo5JnGG/qDbNDp8US9ZXxY+t/i1ojy9mfzmzkQXPa9AcUdeizFnvjKwGhpnTW64x2N9pY5YAZcIvbpRuf7Q7P3AmCTy/y0+/2O6jI8kFLXutKSCubJY1QayHAV2upjVfBYEMasm/sF0KWTO5r802xmV5VszOeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KRuMv19n; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KRuMv19n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55CAA1F000FF;
	Wed,  7 Oct 2026 19:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791402587;
	bh=RCwrViG08gG1Wt4WrfkXXu0M9wkCYS/dAGqLxWSwyxw=;
	h=From:Subject:Date:To:Cc;
	b=KRuMv19nD3Y4niLIo5RKg0+kZSfWAFd5UdQ8UEEhHB30bFv+2BGRzmlXsIyplUzSu
	 h1lpRDl4Tz6eesZuxFyo306qOLUzrBvWNgZIaEomuDWfk3JKf1ATs5JSr7nyv493bL
	 mszE//+ydrRHaA5KRDVnQKrIh7qVZenpGk7uzNn08Cs74U1oIBj+e0eqg+zLYPLVF1
	 kuuuZT9l8Dq9XvVU11K2AcHnCSYdRw+A2s5eiTZWFm6NJPbCYspiA8SWKLN3kPQTlO
	 wYYxmEMNi/LrcSDgewnVVCwGpwnQBqkAyU9u/Lmyt1brV26OYiExX3YFHVA1EVbkRu
	 H71tQM5e/GxbQ==
From: Chuck Lever <cel@kernel.org>
Subject: [PATCH net-next v3 0/9] net/tls: Receive-path fixes for
 zero-length data records
Date: Wed, 07 Oct 2026 15:49:29 -0400
Message-Id: <20261007-tls-follow-on-v3-0-6d52d98389b3@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WOzQ6CMBCEX4X07GpbCT+efA/joVsWqWJr2ooYw
 7sLGE008Tg7883OgwXyhgLbJA/mqTPBODuK9SJhulH2QGCqUTPJZcZzmUFsA9Subd0NnIW0yGq
 BqkBEzkbm4qk2/dy3Y5YiWOoj27+ccMUj6TjVTVlUgQC9srqZTu/06qyMnfzGhOj8fZ7Wibnxz
 4pOAIeyxDrVWuhcltsTeUvt0vnD/LyTH1xwLn5xOeKyqkSZ5ohZKr/wYRieU3iDRyYBAAA=
X-Change-ID: 20260726-tls-follow-on-486f1ba8bbb0
To: John Fastabend <john.fastabend@gmail.com>, 
 Jakub Kicinski <kuba@kernel.org>, Sabrina Dubroca <sd@queasysnail.net>, 
 "David S. Miller" <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Chuck Lever <cel@kernel.org>, 
 Dave Watson <davejwatson@fb.com>, Shuah Khan <shuah@kernel.org>, 
 Qingfang Deng <qingfang.deng@linux.dev>, Eric Dumazet <edumazet@kernel.org>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 sashiko-bot <sashiko-bot@kernel.org>, 
 sashiko-bot <netdev-bot+sashiko@kernel.org>
X-Mailer: b4 0.16-dev-da966
X-Developer-Signature: v=1; a=openpgp-sha256; l=4967; i=cel@kernel.org;
 h=from:subject:message-id; bh=c1VopkM7IUVLIk93aABQYe9KjIRNYiwyejP96Ne6OTE=;
 b=owEBbQKS/ZANAwAKATNqszNvZn+XAcsmYgBqxqJOxv22DTqcrs2DoxlmQRbmwoNPB8YUErIM7
 3xFaKioHBaJAjMEAAEKAB0WIQQosuWwEobfJDzyPv4zarMzb2Z/lwUCasaiTgAKCRAzarMzb2Z/
 l7ifEACnCMCnFaf7LKOxx36qNf2uMHuYFOa2NbtMjvEYUYDi4lMHtDZSufL+zFXWEM4FxAG4zks
 minFyoFnGci/ysAVC21wZqZC4O/6LzepwSF+81f5Vjvp3NmqgcuD+F9HM82fDN8aiV3eJV2r7gf
 A1sBmbN+Nzax3/5jUadgojwIMpgi7YzIq0ykhdARRD4UAEUbrbuKorWEn4x2pGynJR9I1jDhNEG
 +Kr3y9MWfiF7rAgf3vk5CfFgjXL1ZlzDOfy+dYJfrFNazYzPlzlVMpP9+r8YMVB6VnUQBhQ8xh3
 HiDccD3s46DGXtjW21ZHTYDFrL/Iov58Ol2gDMVETcXhwkBXTq7Tbc8tV1NrAY2eNw/UzDUGyWn
 srcsTuddrxEdEhlVsasutX3m/ghGgJ7zKQGXZ08u7Gk+xwAN+mssaGlOdOPxIl1s9vIFnMGUONz
 5G8QPNy9p1U2jPJBMp5WeL2ilInygZfYdjcfZlniuJ5Dey+4E5Gwdpk9zvZGvZ2pHu/SC2hpoG2
 XQz2B4t8S7xMs8DwdEWXzjr0c10yfyMox0w5UyZh8XPcuu5FnVsAKU+4PdLgJZj0NJqnXEKL7+w
 uA6LQEGoJvW8U604AJ/AUlk7WKQ0pOEZt2P9kxBUqTLtT1SOopV1VAPPuqLYftnf26WUlSb1Nxw
 LnVoIVCZ5oqorSA==
X-Developer-Key: i=cel@kernel.org; a=openpgp;
 fpr=28B2E5B01286DF243CF23EFE336AB3336F667F97

Commit 3be28e2c9cd0 ("net/tls: Consume empty data records in
tls_sw_read_sock()") fixed one reader. TLS 1.2 and TLS 1.3 both
permit a zero-length application_data record as a traffic-analysis
countermeasure (RFC 5246, Section 6.2.1; RFC 8446, Section 5.1), so
a peer that pads its stream emits them by design. The other two
software readers still mishandle them. splice(2) reports an empty
record as EOF, and the caller tears down a connection that is still
live. recvmsg(2) makes no progress on one, so a peer that streams
them holds the caller in the kernel past SIGKILL. With MSG_PEEK or
async decryption, each record is also queued on rx_list, which
grows without bound.

This series supersedes "[PATCH net] tls: skip empty data records in
tls_sw_splice_read()", which fixes the splice case alone:
https://lore.kernel.org/netdev/20260930052636.166007-1-qingfang.deng@linux.dev/

Which fix a reader gets depends on its caller. splice(2) and
recvmsg(2) are system calls, so consuming the record and testing
signal_pending() is enough. A signal ends the call. An in-kernel
caller of sock_recvmsg() cannot take a signal, so a flood holds
that caller as it does today. Only tls_sw_read_sock() gets a bound
of its own. Its callers hold the socket lock across the whole call
and cannot act on a signal, so nothing else can stop the loop. A
count of consecutive records that deliver no bytes supplies the
bound (patch 1). The count is scoped to read_sock deliberately. A
flood on the other two paths costs the caller CPU time and nothing
else.

The series changes user-visible behavior. splice(2) on a
nonblocking socket, and sendfile(2) from one, now return -EAGAIN
where they used to block, as they do on a plain TCP socket. A
splice that reaches a control record behind an empty one now
returns -EINVAL rather than the zero that was the false EOF. A
nonblocking recvmsg(2) or splice(2) that has copied nothing and
finds a signal pending after an empty record returns -EINTR. A
recvmsg(2) that has copied data now returns at an empty record
rather than reading the records that follow.

SO_RCVTIMEO does not bound these calls. It is applied at the
reader lock and again on each call to tls_rx_rec_wait(), so a call
that keeps retrying can wait past it. recvmsg(2) behaves this way
today. The retry added to splice(2) extends the same behavior to
that path.

Tested on x86_64. The tls selftest suite passes, 937 tests with
no skips.

---
Changes in v3:
- Run the consumer's sk_data_ready() from a work item (sashiko).
- Move the sync decrypt of empty records to the signal patch (sashiko).
- Put the O_NONBLOCK patch before the splice retry patch (sashiko).
- Reword the O_NONBLOCK patch description to match (sashiko).
- Say that the recvmsg patch does not bound the receive loop (sashiko).
- Add a patch that returns copied data ahead of empty records (sashiko).
- Put the zero_len skip patch before the coverage patch (sashiko).
- Use poll() to check for records left on rx_list (sashiko).
- Link to v2: https://patch.msgid.link/20261001-tls-follow-on-v2-0-2dd1947bb642@kernel.org

Changes in v2:
- Bound no-data records by count, not elapsed time (Jakub).
- Drop the tls_rx_empty_data_rec() helper (Sabrina).
- Keep the strparser anchor out of tls_sw.c comments (Sabrina).
- Split the recvmsg signal test into its own patch.
- Drop tls_rx_intr_errno(); a nonblocking reader now gets -EINTR.
- Say why do_splice() misses the socket's O_NONBLOCK (Sabrina).
- Point the recvmsg patch's Fixes: at the commit that added rx_list.
- Reuse the new zero_len helpers in the existing fixture (Sabrina).
- Check errno unconditionally in the zero_len tests (Sabrina).
- Split the splice crypto-error fix and its test out (Jakub):
  https://patch.msgid.link/20260806-tls-splice-crypto-fix-v1-0-a2624005a286@kernel.org
- Link to v1: https://patch.msgid.link/20260726-tls-follow-on-v1-0-99bf4cc1c729@kernel.org

---
Chuck Lever (9):
      tls: Bound consecutive no-data records in tls_sw_read_sock()
      tls: Check for a pending signal after an empty record
      tls: Honor O_NONBLOCK in tls_sw_splice_read()
      tls: Consume empty data records in tls_sw_splice_read()
      tls: Consume empty data records in tls_sw_recvmsg()
      tls: Return copied data ahead of a run of empty records
      selftests: tls: Skip the zero_len tests when TLS is unavailable
      selftests: tls: Add peek and splice coverage for zero-length records
      selftests: tls: Cover splice on a nonblocking socket

 include/net/tls.h                 |   1 +
 net/tls/tls_sw.c                  |  98 +++++++++++++--
 tools/testing/selftests/net/tls.c | 256 +++++++++++++++++++++++++++++++++++---
 3 files changed, 328 insertions(+), 27 deletions(-)
---
base-commit: a5e7d8e446af9803e37a3b6a4d416fb41178348f
change-id: 20260726-tls-follow-on-486f1ba8bbb0

Best regards,
--  
Chuck Lever <cel@kernel.org>

