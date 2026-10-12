Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B63446C4A2;
	Mon, 12 Oct 2026 15:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791819006; cv=none; b=MVMrzkiiijhhhwCr3mb0LYFnzeYyHtuQH598p4pRVLOe8KPeeYM8byQJIudvPhulbvZ0DMFEXgQTCc3s1/YlON6fBnCHSa94ihSwrRYffrOeEzlkA0nYlEL906gNP7doKIkDVv3qcWjXDdZ1k+KZt9UnjJIt17+c69MjqEQS2DQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791819006; c=relaxed/simple;
	bh=AzQS5tb1ZscGG3jWsdkTaNmde+f98oNCiULD+M9ePAI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CqGrsvfh4phZjueFaKXzBPRigEs/JqJHmRx5pMNGFap0IYoBNzUOcwA+t4bqwKHBYENbqkfIwGZSpD0x7h5atkh9Nf2JFAv++YNdYNueWudJ1rXD3ygvx77WcUJ/4LK/F+EpZR+1gv5nW01kWnLPgQMVcnimh/yUv4ixs17fMT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=To00rTU7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="To00rTU7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7BFC1F0089B;
	Mon, 12 Oct 2026 15:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791819004;
	bh=+JL7KlwxoHKKUvRbn3u7ffVTeigoRO2Pbhx9b07QL3s=;
	h=From:Subject:Date:To:Cc;
	b=To00rTU7Eod3/dTyuA+ont2/VxwQ+mvydxbttCzrXXaSxfr2QpexaUt7nMgtfCVsp
	 qVRQY5xZjzPkMoTTDlyXCZf3DWyMud+NpecQDYY0SPdkJzNTzj6Ugl7sro22qgslgB
	 QZp2QVrAHX2Nl4hrV2k3wQs9xHU27R1YfsbJI7wgBuSB+5yRxuc2XPZyr5EndpaWQJ
	 7WDU/rbFvb0fRVQt92mJXaM67KG4W4OMd1Vlep3ZzSesnpId0QnQ1GfyCYWkqV4FP3
	 fPLVAB6dD8YsrkAjeCM9R9xmaxxuNbb2c/kFccOPZEI6aXNy7kvn4IV3kwR0tmt8vU
	 /Cm7uKyltoYUQ==
From: Chuck Lever <cel@kernel.org>
Subject: [PATCH net-next v4 0/9] net/tls: Receive-path fixes for
 zero-length data records
Date: Mon, 12 Oct 2026 11:29:48 -0400
Message-Id: <20261012-tls-follow-on-v4-0-8cea429565da@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XOzVLDIBAH8FfpcBYFQknoqe/R8cDCpkFT6ADGO
 p28uyQdHa3jcT9+/90ryZg8ZrLbXEnCyWcfQy3kw4bYwYQjUu9qTQQTirVC0TJm2sdxjO80Bio
 71XMwHQAwUs05Ye8va96BBCw04KWQ59skv8EL2rLELbtgMlJIJthhaX1tP52MD8t88LnE9LG+N
 vE18Z8vJk4Z1Rp6aS23rdD7V0wBx8eYjuvxSXxzzhi/56Jy4RzXsgVQUvzhzU/e3vOmcuW2wum
 u6TQ0v/g8z5+X2UHNZQEAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5299; i=cel@kernel.org;
 h=from:subject:message-id; bh=AzQS5tb1ZscGG3jWsdkTaNmde+f98oNCiULD+M9ePAI=;
 b=owEBbQKS/ZANAwAKATNqszNvZn+XAcsmYgBqzPzwrFDNUcOL5AWOQHWAa0tjKPJdm9VYUnGbY
 FRWVI9xhReJAjMEAAEKAB0WIQQosuWwEobfJDzyPv4zarMzb2Z/lwUCasz88AAKCRAzarMzb2Z/
 l0fXEACuovkDMbIFEh2RP6N/avRR03Kcz6ANLvTLNlbxz3CN/FyFRtx042nN1AOIcYhF1WVCDVJ
 s3tq72dDkAlzYRsmyKowixFdvulSG6WUysLZdndUAMnyr6mBT1gDwpKPljltOum9Xzy5y9q/vKX
 m4pyRW7Xts3W4CHm3j5E+lrjwJH4VbsC4eHc7G08LnbcTUlmp755wVWJ84aH89JuznpQw4KgUtm
 +8ywzhwFWkexowTWM4Pzti3pE2iaWXkqoGkEyB4DAHEisg2r2i03couRGK/tKTNH2nyMdt9SK0e
 xnHZ3v2DG8W7RU3TSGlHhqCf9A9KaEVAdrqfmdfZxdyM5NnERUbCe42yZ3EgmEFw8r3e4ueN0rg
 xKm5YCpxe3U44QEalhiW9v8omKn06t5exeADlP2G6XZzev5eYE74YM5BIqvj1ubqfC2H3ybSk5T
 +HY+1hVJObVM7budJDjjlCdbgHe4zJPBiQwxVkVtuTsQEUNjxgSGrUpPFBwlxehuzVlxeyuBB8X
 XJH6/btop4Xi0peRxr9uia9/DQ1NUfghvkmo0kqQe3oB9bSMB67naK8dCqu1U6lEjmosPeVGKVQ
 rGNcZC5pE5douxkajemaYQYZqCQRsf+V6Nd5dkDQXXAQEyjq9mK22aTv7jOuyt6c4fLKS4TImpO
 VZjuQ8liT7Y5xiw==
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

 net/tls/tls_sw.c                  |  87 +++++++++++--
 tools/testing/selftests/net/tls.c | 262 +++++++++++++++++++++++++++++++++++---
 2 files changed, 322 insertions(+), 27 deletions(-)
---
base-commit: 29f144016f03608abfddcd6ebaeabafd7aeaadd2
change-id: 20260726-tls-follow-on-486f1ba8bbb0

Best regards,
--  
Chuck Lever <cel@kernel.org>

