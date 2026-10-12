Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60E7D4A3D26;
	Mon, 12 Oct 2026 15:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791819013; cv=none; b=VpNz2Kl1NnDgrbQ7frSzC3Jobq6UugxxcEodugnVyoJj85Avafc0yJcdhheDe69+/HMSZGIhE1JETpFEaRRzpx3QS24LNa9y4BrymGFrsFJIy4tyDdgc2jFMlh0TEyqCZf7kBR4N7MlCjCiTykwZndLvWou3HFv1hIYmd4jzxWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791819013; c=relaxed/simple;
	bh=BYs6gMxOg5UbNMayRetmu6efijK6M6SPcZuk2Ei081E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DUdal+McNqAXQbeX84tfTPhuTlZHrD1eqASX+IbKvPZwD5nudcmOW73OIDhn5GaITtHpNegXLodohj5gU8kc26UG1Fk98LZ/4T/HxbHiO9bST0dc4WvtZMv3V2n/+iTnM/6BMvCnLLEyHSwFDGE56MKUVRmlvxgBn7wjkZTKLmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dx9Tf4Q6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dx9Tf4Q6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A4D51F0089F;
	Mon, 12 Oct 2026 15:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791819012;
	bh=+lUeL41p8+QDOa8M6twteDq0TLKUUsNyMD1RVFidbuE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Dx9Tf4Q6wGr0bG6XtmEon1znZ/85NS0IH1hWc67ZyauS3NVK/rPjcrhJGtayJP3H9
	 67E3UfNCB0B4upV1+H/yK7tpTaVHUUt05nRLHhkin3JrXMcRnQVDPHRfft5VArGzsu
	 C36yqjKGJRM1lrgUjYFqW657EjqraxmqbADCMge4rSI8XFPtDB4AM3jWAsBTF5207Q
	 pMsNg6vVX/YQamlyXVSzZhdhcjwDt3seg19QD8oiGBMb1E468D2Qnhz4DsG8ZdSUUN
	 gexEMrTQkhhzYo7eBwVA3Z2LAM4tpjrdEd04CvzHveF8UsGdLcPnpBhNAI7uknu4oH
	 o2VwgkYX19cbw==
From: Chuck Lever <cel@kernel.org>
Date: Mon, 12 Oct 2026 11:29:54 -0400
Subject: [PATCH net-next v4 6/9] tls: Return copied data ahead of a run of
 empty records
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-tls-follow-on-v4-6-8cea429565da@kernel.org>
References: <20261012-tls-follow-on-v4-0-8cea429565da@kernel.org>
In-Reply-To: <20261012-tls-follow-on-v4-0-8cea429565da@kernel.org>
To: John Fastabend <john.fastabend@gmail.com>, 
 Jakub Kicinski <kuba@kernel.org>, Sabrina Dubroca <sd@queasysnail.net>, 
 "David S. Miller" <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Chuck Lever <cel@kernel.org>, 
 Dave Watson <davejwatson@fb.com>, Shuah Khan <shuah@kernel.org>, 
 Qingfang Deng <qingfang.deng@linux.dev>, Eric Dumazet <edumazet@kernel.org>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 sashiko-bot <netdev-bot+sashiko@kernel.org>
X-Mailer: b4 0.17-dev-9c833
X-Developer-Signature: v=1; a=openpgp-sha256; l=1421; i=cel@kernel.org;
 h=from:subject:message-id; bh=BYs6gMxOg5UbNMayRetmu6efijK6M6SPcZuk2Ei081E=;
 b=owEBbQKS/ZANAwAKATNqszNvZn+XAcsmYgBqzPz6F3yL9JZ6KAYU3GOgJEx0MmE2hVIzJciNn
 baQji+RnyOJAjMEAAEKAB0WIQQosuWwEobfJDzyPv4zarMzb2Z/lwUCasz8+gAKCRAzarMzb2Z/
 l/0cD/9ISh0fg5pfKpj0Ugo7L+l69SZSNHFghjPFDFTeSfMCE0uuzspDaxq4KmX9WHVs+uoTj/G
 7WJmUDgbxJ+WGXemXIp2kNjN+wmho3bHXNHMTKLY0uzHSPZnmfkUwj7w53xzVKzyK/WQrnRRfhV
 xyDV/1gyJZKxspn8BpCW2WJrTr8JZzFRFPoOZksI1q4Ef5BKoWn31rJTx1kpBwLUKecToelbaJJ
 B5/B5WwfFXvJnvRsGVwevzAr1yCi3l7CAFCU6OUTnrt/9f7XwSLDoHz2DLS2LHRq+0osfPUsYGF
 lCzuP3tGfELcXpEIng0GPxp0gmVlfVYk4G4dC44XQSRhY9G26fEALaSIsEPmwH7oL9U164HEOFm
 Mjzg+vYUAChbgKtPmQUjYUrsoZz2zUfdPH2UNe9CjlB+e3SmemEb2fmSqSrI8HuUbXXmR97l932
 4qnWl7usfEZePmqHj64LnPEaEyMh+o5ioUnQA6/fAzLz2vP7SpqBerkcdivGEo+ZynqJ9Map5yw
 YMnUdp+ZGu5OhDXC5xh0nTRv78tryEp5cL8MOlzN+xkB2r7X17jEyFjEplNmFTKQAxqVSqmqV9/
 qupZoa5cdc42UCc4Y4wKtg9bLCLeYcTjq1qXBOitiXw5fNvRLZOa12xaap5D8iydwI/OqUlc3EP
 nOwVohvA1DWPcZw==
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

Fixes: 04b25a5411f9 ("net/tls: fix no wakeup on partial reads")
Suggested-by: sashiko-bot <netdev-bot+sashiko@kernel.org>
Link: https://lore.kernel.org/r/179124254665.434549.12245680127262431659@kernel.org
Signed-off-by: Chuck Lever <cel@kernel.org>
---
 net/tls/tls_sw.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/net/tls/tls_sw.c b/net/tls/tls_sw.c
index b7790b17f79c..15a3a6d3f638 100644
--- a/net/tls/tls_sw.c
+++ b/net/tls/tls_sw.c
@@ -1939,6 +1939,12 @@ int tls_sw_recvmsg(struct sock *sk,
 
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

