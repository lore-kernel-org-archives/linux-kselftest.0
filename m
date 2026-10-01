Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30B4D3264F7;
	Thu,  1 Oct 2026 22:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790894508; cv=none; b=GbWnbw4C2HsmAJh73yEFffvB3UCxykEB71SK9+wy5GdhGxyvEsE1JLf+V9OXc1GNaF30IblUt6up0hF7SU3ODX+8S3vwuZ3TMelUlyAngDJEH5hNe06lCrl+sAn5clzDGch4ao08dd0vrX3WkzAGrTBuzwuCvGDfAyMH8Wlczao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790894508; c=relaxed/simple;
	bh=7OdB3at4l/uaJGeAVT6iVc64VMioIueFKBHiMskvDms=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=tdzJThid8I8acqRV4e3tqmUt0pjKG1pjVA5ZqYyqDpXCNZdLifKNiAulXE5UAfW8vPUNpF6xNsWWGdLZx+oHCuFgOqTSmkmGA3f0fd2R6QzZ/oX+mkwP6p36Lj8DP7FEuq3/GW/UZYn2DVkCzygLybuVNwZlIEfS82DB+vUv1P8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZYM/abvt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZYM/abvt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43CE51F000FF;
	Thu,  1 Oct 2026 22:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790894506;
	bh=oQ28QrTWscMr/hQrAIdiYPr43eWZ9H50WAaCOGuwT0w=;
	h=From:Subject:Date:To:Cc;
	b=ZYM/abvt0cgSphmYWOtn6brqab73mzz6hMm+ZH4nS4+bAMVSsWC8XaUmVDUQS6bye
	 ROVwgdGugm0yAtY3KCApYAf5aAsFs4uwe7+WZg4W2Uj7Lw3xuPYd7CjUzy2CNDxhbA
	 8G1RYpd2PC3j61tTGm5hEcILoksIzT7OttUaTZCKBtMcuhjryLRIbeV4rrkB51Ea/z
	 V9j/rUH4yAzOHDb9uZzO0vGypgkehXTELuewYhNvuv+3Hfox2xIeb09q0s37HY2CZJ
	 FufeUpsKP5cS4koiJpwMABjql4ALy88TKKrfwNekKg1WsASIjwrPUbRmlJ422NOC5i
	 WIePC2sgsHyYA==
From: Chuck Lever <cel@kernel.org>
Subject: [PATCH net-next v2 0/8] net/tls: Receive-path fixes for
 zero-length data records
Date: Thu, 01 Oct 2026 18:41:32 -0400
Message-Id: <20261001-tls-follow-on-v2-0-2dd1947bb642@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WOyw6CMBBFf4XM2tG2ITxc+R+GRVsHqNbWtBUxh
 H8XMC5d3tfJnSBSMBThmE0QaDDReLcIsctA99J1hOayaBBMFKwUBSYbsfXW+hd6h3lVtFzJSin
 FYNk8ArVm3HhncJTQ0Zig+Sbxqa6k04pbu0pGQhWk0/1q/dqHuzRuzXsTkw/v7drAN+KfFwNHh
 nWt2lxrrktRn24UHNm9Dx008zx/AIbvxcXnAAAA
X-Change-ID: 20260726-tls-follow-on-486f1ba8bbb0
To: John Fastabend <john.fastabend@gmail.com>, 
 Jakub Kicinski <kuba@kernel.org>, Sabrina Dubroca <sd@queasysnail.net>, 
 "David S. Miller" <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Chuck Lever <cel@kernel.org>, 
 Dave Watson <davejwatson@fb.com>, Shuah Khan <shuah@kernel.org>, 
 Qingfang Deng <qingfang.deng@linux.dev>, Eric Dumazet <edumazet@kernel.org>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org
X-Mailer: b4 0.16-dev-da966
X-Developer-Signature: v=1; a=openpgp-sha256; l=3979; i=cel@kernel.org;
 h=from:subject:message-id; bh=7OdB3at4l/uaJGeAVT6iVc64VMioIueFKBHiMskvDms=;
 b=owEBbQKS/ZANAwAKATNqszNvZn+XAcsmYgBqvuGfeKh+Xrhnr3IEabGS59oHMsjxuVTPlrCYx
 qoyZEclPumJAjMEAAEKAB0WIQQosuWwEobfJDzyPv4zarMzb2Z/lwUCar7hnwAKCRAzarMzb2Z/
 l4AIEACp7Euc+5mtQwi4IZxYtEMD8WU6cOTdBUSDUSBJeegrGzQM/Qe6MRTXO0Sa/LwigF4jmMp
 VYfIU+UrWvD5g/UsK1TWF6yESdak7F4/9H+t/Wlg7eyLQCyNjS64T+a/DrWVWvD/o0s/cHjRSzq
 eIEmpgZBHUocnLWq4EnR/917UI9LIDW9UFaU7NC5ekymWfD5r4blYfzNVg1lPIkwk1hKk3cg2G3
 OMHCNdytzaiiG4koVSnGxv5mlLPLWf7hQc7L8SLsDojEQfKu1EVqR1s1aLuiVMMLdq1QpYPrFUs
 iEkmdB5VGLXyDalOvIYqEGdCYyEKJUovHO0CLvS3y2ial3z9Kle8Yql4JxMd4KQ1FT5LdUCSmFv
 8J9SySeYWA5Bt5KW6Z/re3nHb9RImzXsE1Ur6ze0Q60fuXeZoAnpbblgUQIy6CE5Z/tscmjArNe
 hHI68oUPg/YhCBhQZkgbLZX/XExyyepPqRDGBVarpHKZpb5NVZSS/cZDsbbWUXZGY4jTu5HfPbF
 YRmM8K/EhD74CCZhM03PlAt+jeRSAIWaJMPXMSflub13BimvucW5LwEvKa2gBsP1iSERmUv194p
 uJBS8MuIcpaIcMxdT8cr3Q8grine4WdQdqQGtjHJuKu6fBICdEVWBFKXBYCuQ3hkUjRUKsDobDO
 gTWO0acyBGYPoJA==
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
signal_pending() is enough. A signal ends the call. Only
tls_sw_read_sock() needs a bound of its own. Its callers hold the
socket lock across the whole call and cannot act on a signal, so
nothing else can stop the loop. A count of consecutive records that
deliver no bytes supplies the bound (patch 1). The count is scoped
to read_sock deliberately. A flood on the other two paths costs the
caller CPU time and nothing else.

The series changes user-visible behavior. splice(2) on a
nonblocking socket, and sendfile(2) from one, now return -EAGAIN
where they used to block, as they do on a plain TCP socket. A
splice that reaches a control record behind an empty one now
returns -EINVAL rather than the zero that was the false EOF. A
nonblocking recvmsg(2) or splice(2) that has copied nothing and
finds a signal pending after an empty record returns -EINTR.

SO_RCVTIMEO does not bound these calls. It is applied at the
reader lock and again on each call to tls_rx_rec_wait(), so a call
that keeps retrying can wait past it. recvmsg(2) behaves this way
today. The retry added to splice(2) extends the same behavior to
that path.

Tested on x86_64. The tls selftest suite passes, 935 tests with
no skips.

---
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
Chuck Lever (8):
      tls: bound consecutive no-data records in tls_sw_read_sock()
      tls: check for a pending signal after an empty record
      tls: consume empty data records in tls_sw_splice_read()
      tls: honor O_NONBLOCK in tls_sw_splice_read()
      tls: consume empty data records in tls_sw_recvmsg()
      selftests: tls: add peek and splice coverage for zero-length records
      selftests: tls: skip the zero_len tests when TLS is unavailable
      selftests: tls: cover splice on a nonblocking socket

 net/tls/tls_sw.c                  |  78 ++++++++++--
 tools/testing/selftests/net/tls.c | 255 +++++++++++++++++++++++++++++++++++---
 2 files changed, 306 insertions(+), 27 deletions(-)
---
base-commit: f49defea7668d8c68ec19fa085ef3da6075561c7
change-id: 20260726-tls-follow-on-486f1ba8bbb0

Best regards,
--  
Chuck Lever <cel@kernel.org>

