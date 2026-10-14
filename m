Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A183F0AAC;
	Wed, 14 Oct 2026 18:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792002531; cv=none; b=qKfGBeT3rNY0KvSVNQEohVaTWvztVb7EoAYITHDvF0Zh4CM87SOlukRedwSPTXTla/j9QDMVY3OH74gRXzkGl7b4cSZ+tSV9IeBmcz85H3TUKUCV+YU99AtWZl8a9vKqZ5rLR26Uwy+PnYxOkbHvJ33mbpdq/ew85O4qgfJDqHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792002531; c=relaxed/simple;
	bh=ZqBhY6bx1QpgWKr+hF+hVjXKcI5UTE31YhyqSflKTg0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hE/EGff4IjBA0bNzs0EB8KcobpxhWT7EMO8uxSddfy5tKG27/A7yxHpRZEVDfHuv+dwxvsd9vpDJjq1d+ti7dUrKQA9GN7csWCVpEanERhsje7aYEX5iH5PplL2pzNuUCJ7XWjc3VPfUFdmZqcS5IQ8JCz3dlNYP9qw9X1Ao0MA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DYRYWyDa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DYRYWyDa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B43021F000C4;
	Wed, 14 Oct 2026 18:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792002527;
	bh=PBwHnPJejpV0GyA6bgr2lRZ0CFQ2ATbojdkLsLJDkOQ=;
	h=From:Subject:Date:To:Cc;
	b=DYRYWyDaU1JpjGy42Z5hFtiS4bRXT9oaa6BXXn8c262Pq1CZcpBtvOMQCqmZS80P9
	 xT42IeQmhiwuenyw2G397ds92+nt9ofFm4vFGNYz/8qv4lfeZw2dqj2ztO6vfYsD4z
	 zW1dzjonEUMHfecae7639axmPqfJRZ2SjOUvYah5sSajZ5jFHp0slWEZ1H3QYdy3UA
	 oMRrOizOO6KnpHWzJMTUvGya6pnt7o201xjpNEksSDRRaoEBMDKzYVeJiEqkNv03F5
	 RZgFo+A0ALPP59W2N7GHrGXs79kQ7Z791+d3W0WnFcud7GW7BTfwlFc6psnaiazpZH
	 l2K9Y6qQXFoWQ==
From: Chuck Lever <cel@kernel.org>
Subject: [PATCH net-next v5 00/10] net/tls: Receive-path fixes for
 zero-length data records
Date: Wed, 14 Oct 2026 14:28:30 -0400
Message-Id: <20261014-tls-follow-on-v5-0-e76c301d4f05@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XO207EIBAG4FfZcC0KU0qLV76H8YLDdItWMIB1z
 abvLq3RrN14OYfvnzmTjMljJveHM0k4++xjqEV7cyB21OGI1LtaE2AgWQeSlinTIU5T/KAxUNH
 LgRvdG2MYqeYt4eBPW94jCVhowFMhT9+T/G6e0ZY1bt01OiM1SQc7rq2f7btX7cM6H30uMX1ur
 818S/zni5lTRpUyg7CW2w7UwwumgNNtTMft+Ay/nDPG9xwqB+e4Ep0xUsAVby55t+dN5dK14FT
 f9Mo0V1xccA57LirvLWoBqpWt03/4sixfMuQejaQBAAA=
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
X-Mailer: b4 0.17-dev-9c833
X-Developer-Signature: v=1; a=openpgp-sha256; l=6124; i=cel@kernel.org;
 h=from:subject:message-id; bh=ZqBhY6bx1QpgWKr+hF+hVjXKcI5UTE31YhyqSflKTg0=;
 b=owEBbQKS/ZANAwAKATNqszNvZn+XAcsmYgBqz8nV5N5jjneTcp5SQJ956eviSn4UJRpsWl7N1
 qqRgsiDuGGJAjMEAAEKAB0WIQQosuWwEobfJDzyPv4zarMzb2Z/lwUCas/J1QAKCRAzarMzb2Z/
 l0klD/sFccYVCq3LjrfD9mgPkBaVOMQPlG6crPjY+ouL1Q1nYaBu2Pwzf8LCXo6SlVRxbwAHpg5
 ODEpjZ6ehOPTVPqoes0NREytwXa95YDSMLafYj/IgbCJBw/XR2nWWAFTITfAmWMnztwFVmMdn8f
 a5b1Jcf0AMvZ7gM4QXvTEjBPCVD6h+ygQTqqQHszgNYgQEy3rv8Ik9p4xpCC5tP/VEidhlgt/u9
 ietlBk7w1ps3XUdUF2I7wtKRgx6xCUftrHPFgeEP6L8QHPJ5nEw6Uwg4TnJ7XiMhZ/dP/792fUM
 1BmrBuFyKutu83Ax+D/ayy6pgScLUulNMDtjUsf1ECfJyw4MchJit5IZlamnn4LgoL6PgtA1hox
 uZIBROSmDFJYSUzDx+7ZwkkjQfq2pTJX8B/aTYK21ZFDLTkbig+L7gA6YDcPH6g5ieRYBjhWyGw
 wsUpduE9t+LhvQb3MRhqAawpP+IH7t5+x38PbqGAgkvHbtPsD7sVDx0KHW6tC8YfS5qGHxguKAp
 gPtSRbmyY2tOc45ngIfViIYuSaoVHrb3O+NGrxXwu6R7JqTekwmHSPwBt/daVLb1J9L69seSkYE
 Ba+bWLef97aZiv5J0vMLdkWlmPppljgLRAvXXfRnGqpVekhoXZPACk6sq3CiAcjNLuT/Q4eCUAx
 kEugJ6pq0Rm23Ig==
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

Tested on x86_64. The tls selftest suite passes, 940 tests with
no skips.

---
Changes in v5:
- Restore the v3 data_ready work item in tls_sw_read_sock() (sashiko).
- Queue the work item on tls_strp_wq, not system_wq (sashiko).
- Queue the work item only when a record is left parsed at the break.
- Skip the work item's callback once the strparser is stopped.
- Reword the signal patch: -EAGAIN needs a pending signal (sashiko).
- Cap consecutive empty records in tls_sw_splice_read() (sashiko).
- Define TLS_RX_NODATA_LIMIT above tls_sw_splice_read().
- Add a zero_len_splice variant that reaches the cap.
- Link to v4: https://patch.msgid.link/20261012-tls-follow-on-v4-0-8cea429565da@kernel.org

Changes in v4:
- Drop the data_ready work item; the reader release announces (sashiko).
- Return -EAGAIN to a nonblocking reader with a signal pending (sashiko).
- Add a Fixes: tag to the low-water mark patch (sashiko).
- Add a zero_len variant that pins the low-water mark patch's behavior.
- Link to v3: https://patch.msgid.link/20261007-tls-follow-on-v3-0-6d52d98389b3@kernel.org

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
Chuck Lever (10):
      tls: Bound consecutive no-data records in tls_sw_read_sock()
      tls: Check for a pending signal after an empty record
      tls: Honor O_NONBLOCK in tls_sw_splice_read()
      tls: Consume empty data records in tls_sw_splice_read()
      tls: Consume empty data records in tls_sw_recvmsg()
      tls: Return copied data ahead of a run of empty records
      selftests: tls: Skip the zero_len tests when TLS is unavailable
      selftests: tls: Extend coverage for zero-length records
      selftests: tls: Cover splice on a nonblocking socket
      selftests: tls: Cover the empty-record cap in splice

 include/net/tls.h                 |   1 +
 net/tls/tls.h                     |   2 +
 net/tls/tls_strp.c                |   2 +-
 net/tls/tls_sw.c                  | 112 ++++++++++--
 tools/testing/selftests/net/tls.c | 346 ++++++++++++++++++++++++++++++++++++--
 5 files changed, 435 insertions(+), 28 deletions(-)
---
base-commit: 05b5019b01fb9443b09ae4ed34af1135a80a84c8
change-id: 20260726-tls-follow-on-486f1ba8bbb0

Best regards,
--  
Chuck Lever <cel@kernel.org>

