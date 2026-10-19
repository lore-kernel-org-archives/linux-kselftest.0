Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792428931;
	b=X2AB7WdCrRL0OK5fLP5MoppMyQrtQIDvRAB1oa59vLQ5NgjkV6Xa3kYeAGr/pXsEKAsq
	 +BSLdhwejq8urJ34Xi7+STnznr27N4dFJuh1Cn88d1RTYmRzmHSB6pprHyQYMwrtvIYxR
	 ls49xVeJiK3uyLkOi/u8xk4DZ62PfI2YjoNy28TxsIaIxod7nStyC09H15COkPAWu5BqH
	 mQ1TGB9zHxOlvDDTnHKXMpAut2IRCaWI3legtCmhHghl/edwxwHqdnuPbkLXpIa7by0vX
	 En9YypHiXYy+Y/Pd/zP2JxTedPOXjpqoGN6PlUkQcsjQ3iQd7luM7w+0FrygDLyNljg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792428931;
	h=Received:DKIM-Signature:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=Ci8Cm2jw1ezjETTeikEr3zJn3zOORrt6gyC+LSBdgIE=;
	b=3oypXIWiROA8/IdA5z3vw3LXSZT7GeeKtLpKnUHln5vB6gDESm9VYsjym4859d9AAhC/
	 a1jAEqRGeR9yJzoJ0qG/U9KPv9jfn2gZrQLndEkl4bp44ir5u2y6UaPMp+Izf5DF+n0DT
	 /o8KWPq2SoRB7z5grkQSMW2K4uTLy9Gm+tfBEEdiMVEaH40p1rjRNW4fyKJK57R5vkNW7
	 wzzBATX+3ZhnjZKZFlZwl+Flt1HaerTsA4exSYPdogoZ/wm1hvO6UHRli4o4qQtdcij5s
	 B9hSdhV61U/DXOFLRLFKStObpbz34T+L0XfnqY5S9qscxClWOY2AbuhILrKxBPAeiMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T+8R+CY4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92953606A31B;
	Mon, 19 Oct 2026 16:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T+8R+CY4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AF7F1F000C4;
	Mon, 19 Oct 2026 16:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792428931;
	bh=Ci8Cm2jw1ezjETTeikEr3zJn3zOORrt6gyC+LSBdgIE=;
	h=From:Subject:Date:To:Cc;
	b=T+8R+CY49guUWL4uT+cq9SPD+Yy3NLolKGNaqz2ZmG3JEYHrGflL486sWxJE5+4N1
	 wata7+QNhKp3nixfX188EgIZMUZPTvI5fdFcA6NA3k02BYvlKHSpo86qqevlKtbN6W
	 RZnvCZHaDKWbIKUeolDuvjXUnBwHFp71vyjY/B7jnCnjupB4VfaAqL5aoSs8YFaiMF
	 sPJ0DlUHdMMNoj+ldaBQUWVV9ZW4zLHCpoHMS0GQlRfSn2LhZnA/oE2GZ0ok9h/LVd
	 7ojqcFGtyCQqtzfhjRtTnKg2SRvEeEWZVpqpboLfX43UrNgoVyH+Dib9IKaXNwzrFP
	 lY+EduNCSVB0A==
From: Chuck Lever <cel@kernel.org>
Subject: [PATCH net-next v6 0/9] net/tls: Receive-path fixes for
 zero-length data records
Date: Mon, 19 Oct 2026 12:55:16 -0400
Message-Id: <20261019-tls-follow-on-v6-0-ab01c4ecca0c@kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XOy07FIBAG4Fc5YS0KFGhx5XsYF1ymp2gFA1iPO
 em7S2s0tY3LuXz/zBVlSB4yuj9dUYLJZx9DLeTNCdlBhzNg72qNGGGStEziMmbcx3GMHzgGzDv
 ZU6M7YwxB1bwl6P1lzXtEAQoOcCno6XuS380z2LLELbtGZ8Am6WCHpfWzffeqfVjmg88lps/1t
 Ymuif98MVFMsFKm59ZS2zL18AIpwHgb03k9PrFfTgmhe84qZ85RxVtjJGcH3mx5u+dN5dIJ5lT
 XdMo0B843nLI955V3FjRnSkjh9IGLLed7LiqHVtqGUMd7Iv7weZ6/ABqCo8jjAQAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6515; i=cel@kernel.org;
 h=from:subject:message-id; bh=Sh1mWDuUw2qFcpb4nVpa3/uH3MCwKiKo+z9qMCLkCiw=;
 b=kA0DAAoBM2qzM29mf5cByyZiAGrWS3nISENHJ/+UaZrUnbDb0XhpuEnGFF2hQUsfhOo8+fkRZ
 4kCMwQAAQoAHRYhBCiy5bASht8kPPI+/jNqszNvZn+XBQJq1kt5AAoJEDNqszNvZn+XflcP/RdK
 4o8S/aKHCRURDRQx1FlucX5Xn7OSu8Qxwcjb4qwIlgEL0XTbAhOMpEXuTw3EeRxH4P9J2hW/qtH
 SLio3SPbkE+D3CCsPhCIQJf9TwkXzTjMzj+jM59Jk9Jx8v226SOtvFvj7XWLeh29b5BzTncFkDK
 3BAHZKzH6mLshDGw/BP7FnkuzevTvIcaooSqHqV6EUw6ItMNtKb0MIyOLqVZL/OTbJ3Tr5cvUeK
 UsQE5BsVRaopI8cNuPVJ0aZWd47aIvlMs9jm7YteGxoFkarN7H506Sm2+1598bVswwbdM5whb9M
 O3t3dkCK2lW4a2tz3Dvib0a76Qs/SjZebJjoA39gloEcu+hIGk7a7QbsK2eXEEnEwfLG/Mae0vZ
 xDD8Fnowib9Er6TL0aDp7iVDskkNPPEiPGNUbCGtz1UXd2x3qXLyTgZmWurAPEnNL0xYIxQ+DsU
 XNcN8uT7v4XgiA3ocFbUEipZmA8uMQVBxCuOzQXKPv9HlvmzIEg6SanbDkK16GODbJz+VHJO3IX
 8aQfYrOcIJ0SCwKPrq+kO6lsR3KhQUjKtn0vSNhV8SFvRTZNi989IuvahFWpleH6RlKAKhR4XZc
 WhRxwtJbNuEuvQbbOmevRxnmd9F2zW0aHr9uJMsjdTiUv7+HjTrkv7RZpnJHFpi6Xrdpbj14ZVG
 0bF3P
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
Changes in v6:
- Drop the empty-record cap from tls_sw_splice_read() (sashiko).
- Drop the zero_len_splice variant that reached the cap.
- State why the read_sock consumer cannot bound the run (sashiko).
- Name the later patches the O_NONBLOCK description relies on (sashiko).
- Note the MSG_EOR change under MSG_PEEK in the recvmsg patch (sashiko).
- Link to v5: https://patch.msgid.link/20261014-tls-follow-on-v5-0-e76c301d4f05@kernel.org

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
Chuck Lever (9):
      tls: Bound consecutive no-data records in tls_sw_read_sock()
      tls: Check for a pending signal after an empty record
      tls: Honor O_NONBLOCK in tls_sw_splice_read()
      tls: Consume empty data records in tls_sw_splice_read()
      tls: Consume empty data records in tls_sw_recvmsg()
      tls: Return copied data ahead of a run of empty records
      selftests: tls: Skip the zero_len tests when TLS is unavailable
      selftests: tls: Extend coverage for zero-length records
      selftests: tls: Cover splice on a nonblocking socket

 include/net/tls.h                 |   1 +
 net/tls/tls.h                     |   2 +
 net/tls/tls_strp.c                |   2 +-
 net/tls/tls_sw.c                  |  98 +++++++++++++-
 tools/testing/selftests/net/tls.c | 261 +++++++++++++++++++++++++++++++++++---
 5 files changed, 340 insertions(+), 24 deletions(-)
---
base-commit: 05b5019b01fb9443b09ae4ed34af1135a80a84c8
change-id: 20260726-tls-follow-on-486f1ba8bbb0

Best regards,
--  
Chuck Lever <cel@kernel.org>

