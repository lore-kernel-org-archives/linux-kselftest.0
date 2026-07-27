Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87EAF202C48;
	Mon, 27 Jul 2026 00:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785112428; cv=none; b=JIMBuGRTuOpRzlRDnb5UPeC6ERUgsZgkZjNse69rC0w7HuFjvE7I6sIzLpiqFA0fB23v9HLfTGEuDOZ56cmX7PNCEwGJhym73LrVIa2BaYVie6D0q7NgKVgrO/qndYHhtetCwufaG3CQcsJqaSHneXEzp4vA9kGx4vh50J4bSW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785112428; c=relaxed/simple;
	bh=nsOWz/MbXr2t1ABogm6mWbUuPgeIfGJd3X7eWgc16jw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FPzAuO7VD91HNKss+6HPHYgsUG9IRrnwCatE9/sQt1zAQFArQCKSVMYLdB8B3B4gBGIcP+JDnQBaGkdar3HoKNPohpH9ct+w9xR/aN9IkqmbF8JH7eKiN9gthvxQ7xnEtLETzm9c9MxVoVeNIyiEPi439bQenuRuGoYaIyHkUvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cwlzeDgt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cwlzeDgt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4970B1F000E9;
	Mon, 27 Jul 2026 00:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785112427;
	bh=qZNYbqQO1Y6cxVz+FYDsPL6zANGKAshUXT9XqfqsACA=;
	h=From:Subject:Date:To:Cc;
	b=cwlzeDgt4ylyAoWs/+YAx0k9kLDo05u1v7DOZIXViVTUF5/s5PfUHVD8u6gDyWSuN
	 176TPJAWT8qVPwCuPKM1n1sxc5AROXd54e/+KQPXq+fRFk5U6R7zsbW5mnGPP3OH/b
	 gT3pHAD8hr2dQ5cx0PUHBoEOQSTEfE3F5PWBlWmBoXORPuuTKLMAMHLDeQKNgoRcLV
	 fGZQVidDoq4JKyV/c2dKbkwVKVq1OhBDJ2IQRc02nKTI6qP3pjZukwL6o+fRTIB5Vr
	 vpxsUGQzmEOJ09E0T8GBLd2JyuFDjQCOoRfh3rW55MRQaPiKffPADeVOGZ4U8DxgMR
	 opU6T9TR8I/hw==
From: Chuck Lever <cel@kernel.org>
Subject: [PATCH net 0/9] net/tls: Receive-path fixes for zero-length data
 records
Date: Sun, 26 Jul 2026 20:33:28 -0400
Message-Id: <20260726-tls-follow-on-v1-0-99bf4cc1c729@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMQQ7CIBBFr9LM2omUGGy8inHB4GAxCIahatL07
 oIu38v7fwXhEljgNKxQ+BUk5NRg3A3gZptujOHaGLTSRh21wRoFfY4xvzEnPEzGj2QnIlLQNs/
 CPnx+f2dIXOHyl7LQnV3tTz0jK4xUbHJzVy3cP2xIsG1fQ0b205EAAAA=
X-Change-ID: 20260726-tls-follow-on-486f1ba8bbb0
To: John Fastabend <john.fastabend@gmail.com>, 
 Jakub Kicinski <kuba@kernel.org>, Sabrina Dubroca <sd@queasysnail.net>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Chuck Lever <cel@kernel.org>, Dave Watson <davejwatson@fb.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org
X-Mailer: b4 0.16-dev-da966
X-Developer-Signature: v=1; a=openpgp-sha256; l=2732; i=cel@kernel.org;
 h=from:subject:message-id; bh=nsOWz/MbXr2t1ABogm6mWbUuPgeIfGJd3X7eWgc16jw=;
 b=owEBbQKS/ZANAwAKATNqszNvZn+XAcsmYgBqZqddyROL25D0eLrv+glNEj0MtQ4EvpfSrLIRU
 zl7xPCRug6JAjMEAAEKAB0WIQQosuWwEobfJDzyPv4zarMzb2Z/lwUCamanXQAKCRAzarMzb2Z/
 l++PD/9wrOQdMUST+pBRi5iG/ijMaikNDDPt0AgYuznYCgPVpAYzHzYxGVp0zCVjxIyD9N/Gfjb
 BYBPh1X5KGAuXgKNANtyB2tUQqt/S/M9xVvMbo2k4g14jyZ1SYHS+fIW0OkRGhOMTF9WBXbMp1+
 /QyrRYpX1YDLkZ40Lp3GYdVczMG665s5cUboabLt+fNMuHtcOZvuHhikBQUhJVAhbJQVf1TwAgP
 Gge5/BPvjjUuGAe9VCA8mDa81FRfpM6BjgVOvHSHlQoW6szsbZsgU0CCvcnB46Lt+rpPrR94VLY
 62hUdVmfDd92BnhUhDvQnjIDpCst5AlqLfW63agy+kbUMRGa5VZ8rQlI6xWgzxPHus9sDhu4oIg
 7MwWDWtu/QqQN9b8fehA+Wr1Sr4qN0sQrHET2rBG+mEQxdLrD40uJ0EDGSMimCYN5uQbqra1mpY
 w2uzx3GkWuGOY0z0tUGrEQvWC4jl/aNNojJhIMh5GkcfJuOMaO2dBYa3JNTUDyxTfzGGH5MuFZ3
 cPLCpEAL9SjfyArSIOrGdo0ThS/rbGRitybtm1QKR1yvAZcnh/+ncIbkHkPzWV7kNNuuhONTzw1
 +CcCX6ZOiXwc01OUyAQUQifdO5InUBJExvAJaF9ZJTh6/eyumkmUTBvMPQHCtLS7NS9xclzAuu5
 CHlhUnsJKcHZadQ==
X-Developer-Key: i=cel@kernel.org; a=openpgp;
 fpr=28B2E5B01286DF243CF23EFE336AB3336F667F97

Commit 3be28e2c9cd0 ("net/tls: Consume empty data records in
tls_sw_read_sock()") fixed one reader. TLS 1.2 and TLS 1.3 both
permit a zero-length application_data record as a traffic-analysis
countermeasure (RFC 5246, Section 6.2.1; RFC 8446, Section 5.1), so
a peer that pads its stream emits them by design. The other two
software readers still mishandle one. splice(2) reports the empty
record as EOF and the caller tears down a connection that is still
live. recvmsg(2) neither advances nor returns, so a peer that
streams such records holds the caller in the kernel past SIGKILL
while rx_list grows without bound.

Which fix a reader gets depends on where it returns to. splice and
recvmsg return to userspace and drop the socket lock, so consuming
the record and testing signal_pending() is enough. read_sock runs
from kernel context and holds the lock across the whole call, so it
needs the return boundary a system call would otherwise supply: a
deadline armed by the first record that delivers no bytes and
disarmed by the first that delivers some (patch 1). Scoping that
cap to read_sock alone is deliberate, since a flood on the other
two paths costs the caller only its own scheduler time.

Two user-visible changes follow, both toward what a plain TCP
socket already does. splice(2) on a nonblocking socket, and
sendfile(2) from one, now return -EAGAIN where they used to block.
A splice that reaches a control record behind an empty one now
returns -EINVAL rather than the zero that was the false EOF.

No existing selftest variant reads a zero-length record back any
way but recv(2), so neither the splice path nor MSG_PEEK was
exercised against a record that decrypts to no payload. New
variants cover both.

---
Chuck Lever (9):
      net/tls: Bound time spent on no-data records in tls_sw_read_sock()
      net/tls: Consume empty data records in tls_sw_splice_read()
      net/tls: Fail tls_sw_splice_read() after a failed async decrypt
      net/tls: Honor O_NONBLOCK in tls_sw_splice_read()
      net/tls: Consume empty data records in tls_sw_recvmsg()
      selftests: tls: add peek and splice coverage for zero-length records
      selftests: tls: skip the zero_len tests when TLS is unavailable
      selftests: tls: cover splice on a nonblocking socket
      selftests: tls: cover splice after a failed decrypt

 net/tls/tls_sw.c                  | 113 +++++++++++--
 tools/testing/selftests/net/tls.c | 322 ++++++++++++++++++++++++++++++++++++--
 2 files changed, 414 insertions(+), 21 deletions(-)
---
base-commit: 53658c6f3682967a5e76ed4bc7462c4bdcddaec3
change-id: 20260726-tls-follow-on-486f1ba8bbb0

Best regards,
--  
Chuck Lever <cel@kernel.org>

