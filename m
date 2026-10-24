Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792843625;
	b=Wpt+aN4rpR4g2NmIGnGwVwUMDYT/Gbo/sT2DpicCVDClPS7NTKUFQmRvkHWDCGKfQRWx
	 8erxNN0q+1ubPNveqbseVfnFT58SkRjMtTtNYRXhtbG3AXevsIXuZ8xWkG42MLHzl4gUA
	 CDL4DHOnqZS9BUbPvoJrhLnO9xm1dH5+1L4uJt23+CLrzK9V6YwG6toSlPQiwNAm9gm8B
	 nCiphm2H+AdjU4NSGsnRcXMDJjIrPMvpKuhnXcJzyfOkci9MV9onwZgLsUghRpolwDenG
	 trlpxUD5WQpzLN5YbnRvqDxp5D4Pm1bptKA6r9u4dPgWD0sIAe15ndiX0nSbvAiDDFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792843625;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=uu2r4qQ7rKcf6lbXrzsJwe2/zZRt2DJE0rOckBQSdno=;
	b=k+hKg9WWx966qQsotIIne4AlWzQq0IB3LLm6SBNmcL+UTuHOa7ypwc+GSVmV+mduOGYV
	 PWRXEMJNEN3Ear2mBE1aEWK/MNc/wLQzY1njgqWZPOczREnWk4psfchTJCLLVybvXbQbp
	 jg/uFz15xatAdW4NItmXP8VEtJ7faacwLCcoTZ19RD1M7xWBmO4Am3EnDCjmc5m4OfzI1
	 /kOcDD3znWIJYcUq7z/J0AoK9uycYbGFAYkT5SZkf24KPS81y0bmAOjzHwY8q9Szqyi3P
	 gbsMXBzvu/+n1myFz0cbiorwNpGbtLHbVmmsh8XMNNp9g0UgTjiP5JVU7aHkUJ6/OWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=g6Wq47Lk;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C503B606A328
	for <linux-kselftest@vger.kernel.org>; Sat, 24 Oct 2026 12:07:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C503B606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=g6Wq47Lk
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-36681e85e87so376642eec.1
        for <linux-kselftest@vger.kernel.org>; Sat, 24 Oct 2026 05:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792843624; x=1793448424; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uu2r4qQ7rKcf6lbXrzsJwe2/zZRt2DJE0rOckBQSdno=;
        b=g6Wq47LkpNSXLVvWGqo+/fi+41t47IPWvkfYMZFDqx4EHQiiWc7J4b8x6w7zI3Pnie
         9fVZV44lvv8ZCyOT0bNan0aWOd/XwhORdEHjRtrMRbiqqDtlym9RtONcOJ4TIJ7SMRnq
         PMm10VAstwJffYFwx0sJHFX+Z/lnUaoVE8GdIUiKNpTzLGG53PDSODbaXqT77RizDjyG
         0EDCXbJbyR231ZfoTmdQm87gnYi+oCmmXGMc6tnNoQsTDZ/EwQeXLRZv2YT4xu6JFaYH
         NpjbJz385mrTGE+iB7i1dW4LsxsojO0zs7CPZeGr3sjT2sMLDJc58k6HDQRc3xRSq9Dv
         wO9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792843624; x=1793448424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uu2r4qQ7rKcf6lbXrzsJwe2/zZRt2DJE0rOckBQSdno=;
        b=e4h+HYb7OeVGAFKYRJ/gV9LHJm3WsAuSm5JMv5O2ZNFPTJGEe8J8ANovvPtJKUKQfw
         MhvVfaGABGdUJ7iyWLtsvco974jospnOMy9nwJBzC+EjE/oRdbGoMA9lOCmGzmb1xdjb
         gKlSoIYEx9PiZTefeBX7+dfNcAQ4h5SqPSq0v/xkBWI783nO+8PwxXrUc1mjPyMqpFqK
         n/k1oPkt+03EhZN18S7MRk5ypxAIjhiyYLrXW1DvkljUESVmP5ricUPgaIVk00Mjx2Hr
         kNmfjWHyRj//EQaQAol/GFXV4L6lUWgJpeV7ciiNqTa/tIZGuJC3D/XpY5ep1KG+TFR8
         RgCw==
X-Forwarded-Encrypted: i=1; AKwUvByPi1wV2IGcw52WtCQCijHmMDEfWTmuSTETSlXkC6KPmE34ZWcUMn8cBoVbvk5GLx5cBrPbGQqFVhlc4P9oau8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKThkT+XGAtJAGq0aoQbgeLM9YaiLmSIEwRQQO9ZSsVDh3eiLkO
	3Ovd8BAUOBMMlIpG3nu5GhNmFZCHS6xMDI3H29vpZeNTOQ1lOpiUYOfW
X-Gm-Gg: AYBFou1ACG7IRIFuUHQEjbslFyDjtlVCa0/uiAq1jNhWGJnyfnUmHDFtqgS574SXPqm
	6vHrnB0Kl6yxXlniQQFIZjIvH9IsWPTN6Bh/v35eIW9bp1dedmY3UOdLGTkAnls9ELusj2g8AEd
	uJ7JcuCxQ4JVn4wv5GRCoiZWSUIPghYv0QftiD7dt1Z2A9lC38yQTx8OkR2PhHiDGH/FTascZ1v
	2ZCiTM0uxVwaMwtNiz5v1sGNQX60/qIsVwu8WhD9qgWYwxbSsR/A4lbRais/+aPc0j5UxsLrKle
	cMyHAmrwo76TDsP9rr/lmsp2IBTAUn3vvU41ww3vsh2C7pZBerDLozmmFlPEIJGbodY69fURZ5R
	XG8eWPJOd1mPulBJ2IA6N/ztsIldVt+eSE2exVuFpYqfrL//q5+VQB8HPJ/IB2duCkPDl2fhcMe
	ysGUAHB6Fs9/4WeaXYSCRJ4LpxvcdhGAtAWWQ2dgg15wptFUkeZzKnVFxvupy02Mz+Qj3PPCtJD
	9SYk8cARX7YOrZ4ST1GIZqesqlWeaNvznV8We4xSLHy2dqFERnxGAbK4zfYyGchhmeLpSWxg+7G
	z2lUCjo2JswnGELShUeNzPQ/Yw==
X-Received: by 2002:a05:693c:8354:b0:35e:a117:8fd8 with SMTP id 5a478bee46e88-369e845c762mr2593551eec.17.1792843623579;
        Sat, 24 Oct 2026 05:07:03 -0700 (PDT)
Received: from localhost.localdomain ([136.25.42.214])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8d95e91sm8120722eec.15.2026.10.24.05.07.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 05:07:03 -0700 (PDT)
From: Tim Budding <tim.budding@gmail.com>
To: netdev@vger.kernel.org,
	linux-sctp@vger.kernel.org
Cc: Xin Long <lucien.xin@gmail.com>,
	Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tim Budding <tim.budding@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH net 1/4] sctp: purge abandoned I-DATA fragments by stream and MID, not by TSN
Date: Sat, 24 Oct 2026 05:06:24 -0700
Message-Id: <20261024120627.837568-2-tim.budding@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261024120627.837568-1-tim.budding@gmail.com>
References: <20261024120627.837568-1-tim.budding@gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When an I-FORWARD-TSN is received, sctp_report_iftsn() calls
sctp_intl_reasm_flushtsn(), which frees every fragment in reasm and
reasm_uo with a TSN at or below the New Cumulative TSN. That is only
correct for DATA chunks, where the fragments of a message use
consecutive TSNs. With I-DATA, fragments of messages on different
streams can be interleaved, and RFC 8260 section 2.2.3 says the receiver
"MUST NOT make any assumption about the TSN assignments of the sender".

So when a PR-SCTP message is abandoned while a large message on another
stream is still being received, the fragments of the large message below
the abandoned TSN are freed as well. They have already been acked and
are not retransmitted, so the large message is never delivered, its
remaining fragments stay queued until a later I-FORWARD-TSN covers them
or the association goes away, and on an ordered stream every later
message is blocked behind it. Also, received fragments of the abandoned
message above the New Cumulative TSN are only freed if a later
I-FORWARD-TSN happens to cover them.

The skip entries of the I-FORWARD-TSN already identify the abandoned
messages by stream, U bit and MID. Free the fragments from
sctp_intl_skip() based on those instead. An entry carries the largest
skipped MID for its stream and U bit (RFC 8260 section 2.3.1), and a
sender fragments only one message per stream at a time (section 2.2.2),
so all fragments on that stream with a MID at or below it can be freed.
The reassembly queues are sorted by stream and MID, so the walk stops
once it is past them. Fragments that no skip entry names, such as a late
copy of an abandoned fragment, are no longer freed by an unrelated
I-FORWARD-TSN; they stay until the association is freed. The association
reset paths that also call sctp_report_iftsn() are not affected: they
pass the highest TSN seen, so sctp_intl_abort_pd() still flushes the
whole ulpq for them.

Observed in real use as unexpected message loss when sending messages of
mixed sizes over one association; the cause was found by AI-assisted
code inspection. Reproduced on an unmodified kernel with the ordered and
unordered tests of the sctp_ifwdtsn.sh selftest added later in this
series, which pass with this fix.

Fixes: 47b20a88566f ("sctp: implement report_ftsn for sctp_stream_interleave")
Cc: stable@vger.kernel.org
Signed-off-by: Tim Budding <tim.budding@gmail.com>
---
 net/sctp/stream_interleave.c | 29 +++++++++++------------------
 1 file changed, 11 insertions(+), 18 deletions(-)

diff --git a/net/sctp/stream_interleave.c b/net/sctp/stream_interleave.c
index 840f24045ae2..f8c818a5533c 100644
--- a/net/sctp/stream_interleave.c
+++ b/net/sctp/stream_interleave.c
@@ -1203,28 +1203,21 @@ static void sctp_report_fwdtsn(struct sctp_ulpq *ulpq, __u32 ftsn)
 	sctp_ulpq_abort_pd(ulpq, GFP_ATOMIC);
 }
 
-static void sctp_intl_reasm_flushtsn(struct sctp_ulpq *ulpq, __u32 ftsn)
+static void sctp_intl_reasm_flush_mid(struct sk_buff_head *reasm, __u16 sid,
+				      __u32 mid)
 {
 	struct sk_buff *pos, *tmp;
 
-	skb_queue_walk_safe(&ulpq->reasm, pos, tmp) {
+	skb_queue_walk_safe(reasm, pos, tmp) {
 		struct sctp_ulpevent *event = sctp_skb2event(pos);
-		__u32 tsn = event->tsn;
 
-		if (TSN_lte(tsn, ftsn)) {
-			__skb_unlink(pos, &ulpq->reasm);
-			sctp_ulpevent_free(event);
-		}
-	}
-
-	skb_queue_walk_safe(&ulpq->reasm_uo, pos, tmp) {
-		struct sctp_ulpevent *event = sctp_skb2event(pos);
-		__u32 tsn = event->tsn;
+		if (event->stream < sid)
+			continue;
+		if (event->stream > sid || MID_lt(mid, event->mid))
+			break;
 
-		if (TSN_lte(tsn, ftsn)) {
-			__skb_unlink(pos, &ulpq->reasm_uo);
-			sctp_ulpevent_free(event);
-		}
+		__skb_unlink(pos, reasm);
+		sctp_ulpevent_free(event);
 	}
 }
 
@@ -1232,8 +1225,6 @@ static void sctp_report_iftsn(struct sctp_ulpq *ulpq, __u32 ftsn)
 {
 	/* Move the Cumulattive TSN Ack ahead. */
 	sctp_tsnmap_skip(&ulpq->asoc->peer.tsn_map, ftsn);
-	/* purge the fragmentation queue */
-	sctp_intl_reasm_flushtsn(ulpq, ftsn);
 	/* abort only when it's for all data */
 	if (ftsn == sctp_tsnmap_get_max_tsn_seen(&ulpq->asoc->peer.tsn_map))
 		sctp_intl_abort_pd(ulpq, GFP_ATOMIC);
@@ -1260,6 +1251,7 @@ static void sctp_intl_skip(struct sctp_ulpq *ulpq, __u16 sid, __u32 mid,
 			sctp_intl_stream_abort_pd(ulpq, sid, mid, 0x1,
 						  GFP_ATOMIC);
 		}
+		sctp_intl_reasm_flush_mid(&ulpq->reasm_uo, sid, mid);
 		return;
 	}
 
@@ -1271,6 +1263,7 @@ static void sctp_intl_skip(struct sctp_ulpq *ulpq, __u16 sid, __u32 mid,
 		sctp_intl_stream_abort_pd(ulpq, sid, mid, 0x0, GFP_ATOMIC);
 	}
 
+	sctp_intl_reasm_flush_mid(&ulpq->reasm, sid, mid);
 	sctp_mid_skip(stream, in, sid, mid);
 
 	sctp_intl_reap_ordered(ulpq, sid);
-- 
2.34.1

