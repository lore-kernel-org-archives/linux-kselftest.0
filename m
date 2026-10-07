Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B38D47D45B;
	Wed,  7 Oct 2026 19:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791402597; cv=none; b=Z5WU2jVyDMLt0OX50qu5mU9mYKrAXap+SUx6gfpdGxk14eFLNl580/daPqh+I4iFll0skfsMwqvK1POu9n1BXjT9OmgQKjfbBr3OmM6z1zSC8uPF/EgWRJwBOAPwHx278jhFk9a77F/M4KyEYXxw0mWetMHlbXxZwEXEt7RIvhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791402597; c=relaxed/simple;
	bh=JzKWEAby+tDbB0EdUVkajzhgx/KzizvHFHxLwCiPuy0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VeI5dQF91PmlXKy0zsiDishC/m9A+YvcXjip8xqq+l+4J1gISw+HoZatPUDn5kzFR8PNnFKMFp2OdhehPWU5ZUNLeczGMGZG3Zmi6BDkDI5+TkcK7BD0B+G5J1dg3CdEmW9hG3PWaE1qR+c5wu68q+GraASS3yISecmCL1MSu6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ctu3EvW8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ctu3EvW8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA6911F0089A;
	Wed,  7 Oct 2026 19:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791402594;
	bh=v2WiG8tfgK/1yVWDAimZloojlcegeXc2bK0ZrUia2xY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ctu3EvW8K7IMEXRTcE/BXY36sNJTyhMvXM6mD9Y/JDs/ghUi3BxKmRHeq4sTVqlZv
	 N3MnWUb2ZrsP9JnntFiGMeAjws/B5EFYpievs84qM2pFTQowC8Pma+ZqothP8X93IX
	 fI3QW/GMlbkwLXlUk1OtwyeFl5E5qmItWFYpNRy0AwBEv9dURIKud2jIA+HrH86C7/
	 ev2M0AgkaPMT9mW169usISHwcK36KgFueFI8VclTxWefg6Ttdy5yjGUIv6pRMU9bcy
	 Vn4+wfLo90DQJe0zAXi1UbeRnNy5k6AWg+nDehff7bLfJdw4wg4Ndj2YPFgisY3BHK
	 ItgSEr88z6djg==
From: Chuck Lever <cel@kernel.org>
Date: Wed, 07 Oct 2026 15:49:35 -0400
Subject: [PATCH net-next v3 6/9] tls: Return copied data ahead of a run of
 empty records
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-tls-follow-on-v3-6-6d52d98389b3@kernel.org>
References: <20261007-tls-follow-on-v3-0-6d52d98389b3@kernel.org>
In-Reply-To: <20261007-tls-follow-on-v3-0-6d52d98389b3@kernel.org>
To: John Fastabend <john.fastabend@gmail.com>, 
 Jakub Kicinski <kuba@kernel.org>, Sabrina Dubroca <sd@queasysnail.net>, 
 "David S. Miller" <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Chuck Lever <cel@kernel.org>, 
 Dave Watson <davejwatson@fb.com>, Shuah Khan <shuah@kernel.org>, 
 Qingfang Deng <qingfang.deng@linux.dev>, Eric Dumazet <edumazet@kernel.org>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 sashiko-bot <netdev-bot+sashiko@kernel.org>
X-Mailer: b4 0.16-dev-da966
X-Developer-Signature: v=1; a=openpgp-sha256; l=1356; i=cel@kernel.org;
 h=from:subject:message-id; bh=JzKWEAby+tDbB0EdUVkajzhgx/KzizvHFHxLwCiPuy0=;
 b=owEBbQKS/ZANAwAKATNqszNvZn+XAcsmYgBqxqJZQ8YfyUSAMeAph5saJnooncy06zTYK8lh9
 rlMIYTZdC+JAjMEAAEKAB0WIQQosuWwEobfJDzyPv4zarMzb2Z/lwUCasaiWQAKCRAzarMzb2Z/
 lzecEACd5J8oTywZOWN0fa8Z5619sabCEqz2GkHBZ9KP3BfYDDoa4r+osPTFagDZ5a2LIEYElSi
 kRVRUPT9UTvjdGWm2N9EvKF0iwxJHIK4dQx/2mLtE49XMB6HV4LsXCZWZzUCW5PiKK+gy2v1Jej
 +ENxDoJaok1C1e7oQ/oyBsXXuNuHyrbwYjkidQv06D8UkrPoRdAmYveoQpuAK5MrCm3+kAJh63H
 XRKsRHal3jNQ7ZDRiR6kJ6YznUKk/QoRQp27/WvsXgDYbkw13P3/c1r8oU09INjQJPp9mHTFz1E
 9oCT+Qo6pHhUVDJtwGD1397vsa/hZOgiakkNJxk1kW1XYzRB9McSS5A+NiZVd+qjxx+/e8omVTB
 ZaWyKhiT/XnHoS/2cCpFTIWmiB9nnEy5lEqkSW5gTWsWp1mnsAte9okHvfBckUTdGfdf0mEvQJ0
 tFMCGc9yrkKhTqcOTq3p59UF4jmDJMGfYLvwkf97jE1RBxjW/VUVCWrpSzOZ90/dCvKnA/wKpVf
 wEBIxy+LBf8UGa1xVa8Lp8pn+sezsYT807kXQq885LpgxpQKaRYmbZ7aRIukQ4tPi+QUNUT2Tub
 kZLUjImck0MwabydHiqRpx3ALxIQ1MVT7OFmTCkAbPP3kKHT1JRFgdzAXa+bKBzEbG1Zcoo+hVC
 2B4F/Pscfxqyx2g==
X-Developer-Key: i=cel@kernel.org; a=openpgp;
 fpr=28B2E5B01286DF243CF23EFE336AB3336F667F97

Once tls_sw_recvmsg() has copied enough data to meet the receive
low-water mark, the receive loop continues only while another
record is ready. A zero-length application_data record is consumed
without advancing len, so a peer that follows data with a stream of
empty records keeps the reader in the loop. The reader does not get
the data already copied until the stream stops or a signal is
pending. The delay has not been reproduced.

Leave the receive loop at an empty record once the low-water mark
is met. A reader that has copied nothing still reads empty records
for as long as they arrive.

Suggested-by: sashiko-bot <netdev-bot+sashiko@kernel.org>
Link: https://lore.kernel.org/r/179124254665.434549.12245680127262431659@kernel.org
Signed-off-by: Chuck Lever <cel@kernel.org>
---
 net/tls/tls_sw.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/net/tls/tls_sw.c b/net/tls/tls_sw.c
index b7f3edf9828e..fd6f944ffd67 100644
--- a/net/tls/tls_sw.c
+++ b/net/tls/tls_sw.c
@@ -1937,6 +1937,12 @@ int tls_sw_recvmsg(struct sock *sk,
 
 			/* An empty record still marks a boundary. */
 			msg->msg_flags |= MSG_EOR;
+
+			/* Return data already copied instead of holding it
+			 * through a run of empty records.
+			 */
+			if (decrypted + copied >= target)
+				break;
 			continue;
 		}
 

-- 
2.55.0

