Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF4A1F427C;
	Fri,  7 Aug 2026 00:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786063459; cv=none; b=t5n0hNiPgjzJHajO59qAsLK1lFpyGv+xpKtdzGDNXMsapH7oEVswsUolrdGt0gjQMVS4tLrlrH3KzSOV+R19paq5sGb5Izp+8MNY/MythJkgij6gK0/yEZDmHdsSnESwgMCQMnvW/HDVfT6eY3MojQ/V85tYQ2CayhZSRdudu3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786063459; c=relaxed/simple;
	bh=vTSlRFsFMOHcSBeaYMHKVdBDYSAun+VmxGWefKxUvNE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jyw9KqCtfLF6VRpGCJC3UQtDR2nkEsjQdeqN1lWPJVq9i/5xXZbK6uPLV9PBo022+WA1Ne3grfZcAGVjMTe6arNABMZPsBszN1lx35z+FHxz2hKq/XcBsUoCet8G4tZrslkPib7o3aq38FXr8KFZqyqnUIA2MlQIjKdjfYPe6pY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ao1qXwk3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ao1qXwk3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EAE61F000E9;
	Fri,  7 Aug 2026 00:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786063458;
	bh=YzF3JU9PvjOyT5wjw7pqwLKhu38VQCSEUcm9ov65ISM=;
	h=From:Subject:Date:To:Cc;
	b=ao1qXwk3fwJ3kvG3YMdvvL41bkYZzkdfpg/f0IXEZJ1RDgMEZHrdvV5knXlcfXeM0
	 iYDzw8z8htdG+cgIkmro6QS2jpJ473feKsLYWfflRrWUSJH2GSsABflrqBpB8Yr2fO
	 32Qt5YGGQ4yWWxtl6e6lyYJdRkVaRSS2cd6QQ92qPZcDwmcnBFgx1udAVi53RmZI2E
	 ffuE8JpfSTRL8sWUx+5H9Vjm734JnpsKBJZYsh1CAzdCSWagesZcrVWc92gpMm2rMh
	 07HsQrZ+i5n0FwOiWsOr8yLz+FDBe2re3Z6LrAZNP4UP3loK+85S6IXqYDXV9+iY3l
	 r6QhoDRII3jLg==
From: Chuck Lever <cel@kernel.org>
Subject: [PATCH net 0/2] net/tls: Fail splice after a failed async decrypt
Date: Thu, 06 Aug 2026 20:44:06 -0400
Message-Id: <20260806-tls-splice-crypto-fix-v1-0-a2624005a286@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMQQrCMBBFr1Jm7WBMJYhXERfJdLQjNQ2ZKErp3
 Zvo8j3e/wsoZ2GFc7dA5reozLHCYdcBjT7eGWWoDNZYZ07GYZkUNU1CjJS/qcx4kw9a7wbuiYy
 1R6jblLnq3+8FIhe4/qW+woOptMeWBa+MIftIY1M13D+9RFjXDaoKLQGZAAAA
X-Change-ID: 20260806-tls-splice-crypto-fix-2a6de3cc0224
To: John Fastabend <john.fastabend@gmail.com>, 
 Jakub Kicinski <kuba@kernel.org>, Sabrina Dubroca <sd@queasysnail.net>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Chuck Lever <cel@kernel.org>
X-Mailer: b4 0.16-dev-da966
X-Developer-Signature: v=1; a=openpgp-sha256; l=1212; i=cel@kernel.org;
 h=from:subject:message-id; bh=vTSlRFsFMOHcSBeaYMHKVdBDYSAun+VmxGWefKxUvNE=;
 b=owEBbQKS/ZANAwAKATNqszNvZn+XAcsmYgBqdSpYehLoRalF96MH8GjWF7HSmdAVagqJUhLxj
 nAg2wAjgxiJAjMEAAEKAB0WIQQosuWwEobfJDzyPv4zarMzb2Z/lwUCanUqWAAKCRAzarMzb2Z/
 l0nvD/4jl1D+t0xupoNwvkkyu1NaAYX0ndSN3xdCvAJJEjcHsr3rXPe40/lQW4RQfNML+1ohgLz
 vVbBliS4PXftq2/czwrctjSzq4CTk6P1nd76rpu2ocatmNnLwo/n3VJWAa37tLZEMCXyiMPcrQv
 ozDeUtifyXciJKTt03+QLhobxz4E5aKt5b7tLBU3kRFmjLd9rlFhOyJErJ7fXGIayC8mZfCiBRL
 7G5koiE67qM8AEeout+C7IGqlonFjWX95r6t3tfLQHuNBTA3ulWVxTlSaRHJQoVp36HD8DQeYAn
 JVBsYl6oGieoQjI66aOFW8j6/0r1vcq6UbmGmbRZw4F4R2nApiguhpWJG1JWOW7K5JJf5xMPbXz
 hqbcy4NDbMe2a3DZNthuFNOPFcBBIc5wbmYk4WNf3nEMcB2cUfS7k49QJF2H70W1+AGSHnDwBKQ
 j6/ulAVIQrEDdParQEce0b00xbb8HCwETP5U0HoWqUXIkkLNHa59uAf5VNcwuUTVoeobbXxnb3g
 RTJ4F3e7oOqKZDGzMS+ePGGVW5C3/pjgIHEIxb8zl2sYvbv3sKoN4Ztpl7nWSn+Hrt9kzYy1c9V
 aZh8P6rV1Di8A2M7Y681YqzHsT6LQWc40Fs1QsWSaj47Zy+JuOWf95QF6qsnjDVYZwa+OIprWUX
 ajte5f9QdsAtShg==
X-Developer-Key: i=cel@kernel.org; a=openpgp;
 fpr=28B2E5B01286DF243CF23EFE336AB3336F667F97

tls_sw_recvmsg() and tls_sw_read_sock() both read ctx->async_wait.err
once they hold the reader lock, so a record that failed
authentication fails the call. tls_sw_splice_read() has no such
check. sk_err does not stand in for one. The first reader to reach
sock_error() clears sk_err, while async_wait.err persists. A splice
therefore keeps delivering records on a connection the other two
readers have already refused.

Both patches come from a receive-path series for zero-length data
records. Jakub asked for them separately, since the rest of that
series is still under discussion.

Link to the original series:
https://patch.msgid.link/20260726-tls-follow-on-v1-0-99bf4cc1c729@kernel.org

---
Chuck Lever (2):
      net/tls: Fail tls_sw_splice_read() after a failed async decrypt
      selftests: tls: cover splice after a failed decrypt

 net/tls/tls_sw.c                  |  5 +++
 tools/testing/selftests/net/tls.c | 75 +++++++++++++++++++++++++++++++++------
 2 files changed, 70 insertions(+), 10 deletions(-)
---
base-commit: 594d905195024b228c962627ae5ae7c17bd582a4
change-id: 20260806-tls-splice-crypto-fix-2a6de3cc0224

Best regards,
--  
Chuck Lever <cel@kernel.org>

