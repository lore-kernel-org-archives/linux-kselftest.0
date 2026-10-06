Received: from mail-yx2-f40.google.com (mail-yx2-f40.google.com [74.125.224.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7338217723
	for <linux-kselftest@vger.kernel.org>; Tue,  6 Oct 2026 14:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791296000; cv=none; b=frmTkQ0zlHjXlAkDs+hAC7DZ6s/3lcl245iT6h4WGAPYV+77Qz+DTGZcVo2V2oZ+F50A1L8bxwp/TxeYpMgwRusEnOv3Z0m0uIx5caj1eOs0sXgziOI+6J/cVS+SdnCPShpGln0l1bdw3OmfG37Sb/GmUuN32QEeLEGeli02u60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791296000; c=relaxed/simple;
	bh=YthvZh996WmS97p3yScvHgPu1ITU5mXYvRDBy99QpIA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RApT6RNRJHAgbQ93cModkT1P8pl9QsM97Yn0ZOETLRc78L8DCjXOEZizsGH4fWiuMp8PUwmP6BEnMU0Fi6aNv4yLBlXLthp9lz+neP+uogp5NfaTXyMzgshwpU8yK9ZrqpDsPFFzsSADwME5aExzrrq2EVKqFOsqjng3ADCejDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tq1EZm9E; arc=none smtp.client-ip=74.125.224.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tq1EZm9E"
Received: by mail-yx2-f40.google.com with SMTP id 956f58d0204a3-6741b102537so325480d50.0
        for <linux-kselftest@vger.kernel.org>; Tue, 06 Oct 2026 07:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791295998; x=1791900798; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hyEGomIzuBoHIvPyjH0DgVGZJd6w+q9JDDJqvGFGDIU=;
        b=Tq1EZm9EfKyIAQTU8rmGy0hjPDEGN3zHgqHAgVakRlMJYPUnK7miO6GDyUK3Unxh+j
         ZzgNkNDQOVqgIgPbkN37PjEKMtyJIBhZ9SPH1gqMZ2T2SiUizuqYjIxwo2tryQyIPPRg
         D/qsxVL0vkePab0DN4LHmDBdjH0yIFDrCxai2V7mPrkqO9ObgOhzE+8LE9o7CxvN8M7G
         5YuRJTXfrPWbv/5ri5MN6OL+SlMoAeB08twH36GB29aOZ37w4XLwpE3l2XFuq3PEAPyw
         /sIqNacJ01JahrX4pdDT0yAct17Ue+iZYoT/xGSAOl/D97uv2dbWxXDLL2W1PPQExHEM
         inEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791295998; x=1791900798;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hyEGomIzuBoHIvPyjH0DgVGZJd6w+q9JDDJqvGFGDIU=;
        b=juOlXT2+FfcqdECrr1w1r4Mjij9WoRb0A+6RZO7rIGyy7PnRKjPgbMRohmbgOp+DQU
         HGmsBIXK0b4nG7Opds9rrsEgMQodd7GfDtSSAJbtY2mMJjVo8ix7nRkX3d3uy6G1Oufm
         q3XKApNUVXruxr0F1r/UeSIgHz2Ff+X/YW2e5pIOtv7uBq/f5iyFNDnD9HCISN/LimzY
         ZonRLppSuM6Bu6b+rUzdL2feGGxKVC3ypcCD7M7pcbjeILDoBnH25CNhnIZixlpNVSwf
         uwCvKbtEnFohOCg6PSBId2FBkS5Y+n2hTJCA9ZubbohwfcUxpHK3ktirEojhV8q6ARXH
         u61Q==
X-Forwarded-Encrypted: i=1; AKwUvByxRxKG9KVTgkfuyoO6+IzLZBUBVyVgjstcPheB1DEqMo/ra9EzkMlY6J9J49SlL2Z055HOrV3PSKOPAcbC2xw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJOH4S20OV+CWGJtMRRs9eDZJrbTo5QKp20cpv3qazKpCqzIkoW
	BI/rXbMy607WBKK29IT/+uUUQFAPJbsnbXYW/fPOci8vSXnuV0YdPAoJ
X-Gm-Gg: AYBFou2eI8vtBN7mx7LXvEjPsK9R8tsERNGgz2tiePgVhwJMptyAc88Uf2E3g35T0Y8
	OHNhJMoF9DjR4k94wMJNT7f4QeZzUlR8AtoFRA3EGCvUSYpJ/hbIZ/rRk0ald06GIuk2vQzE9B1
	cASAbXt8frZyM7zc5HV0XCTjx+tY7AkIMg3hPBPq+a+LBH20yLbAo82mUSReJ5X+DMfWWwMte2Z
	cu83TTGOE9r4TgF1x7YvKBTxTqARg5Cye35XxjJISaXl5kytC0c/3/K8oNZStRNoAxR9htTVaYo
	ZFhPGs1bichjHGO3wjhqZhMtKthsXPxQ+qHygcGE3Tf9wTKaNtuqaKKLjhwpSEoCHMIJbqk+xUf
	oTI4sxmHVfO6TsJ0rZtMgJuNbFlmmsSWIf2bbja5XwZRux2SGVW/ek5DayGYEKWCepaF4PNX6Tv
	sC5FXxUClnn4ANC5g17QSk6z0a/TUy6ZvZp6NdnFve/eZ/Hr0YzdqU+bV3xubyrGjMsD2tLg5l1
	K/DNMl+rxlFGtBpdmRg2ZI1VQskzCoiQsoKdgm895FNLlf9QfAOYyHPEZQ=
X-Received: by 2002:a05:690e:1585:10b0:677:bd0d:52b4 with SMTP id 956f58d0204a3-677bd0d5635mr5641309d50.2.1791295997457;
        Tue, 06 Oct 2026 07:13:17 -0700 (PDT)
Received: from yes.c.googlers.com.com (215.177.86.34.bc.googleusercontent.com. [34.86.177.215])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-678ff67ee9asm438458d50.22.2026.10.06.07.13.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 07:13:16 -0700 (PDT)
From: Neal Cardwell <ncardwell.sw@gmail.com>
To: edumazet@kernel.org
Cc: davem@davemloft.net,
	horms@kernel.org,
	jiayuan.chen@linux.dev,
	kuba@kernel.org,
	kuniyu@google.com,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	ncardwell@google.com,
	netdev@vger.kernel.org,
	nramaswamy@openai.com,
	pabeni@redhat.com,
	shuah@kernel.org,
	ycheng@google.com
Subject: Re: [PATCH net v2 1/2] tcp: restore RACK list membership when undoing loss
Date: Tue,  6 Oct 2026 07:13:00 -0700
Message-ID: <20261006141300.1722466-1-ncardwell.sw@gmail.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
In-Reply-To: <CAL4WiipKWgA-EcFWDQd3t7nBwU7AnkLvqs6j--he-dR-SAgqiw@mail.gmail.com>
References: <CAL4WiipKWgA-EcFWDQd3t7nBwU7AnkLvqs6j--he-dR-SAgqiw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Neal Cardwell <ncardwell@google.com>

Hi Neil,

Thanks for your TCP patch and packetdrill test! I agree this is worth
improving.

I share Eric's concerns about the performance costs of this current TCP
patch. And Yuchung and I were chatting about this out of band a few days ago;
we were both concerned about the performance costs of that approach.

Yuchung and I were thinking that perhaps a better trade-off would be to
leverage the fact that most of the time when there is an undo there are no lost
packets in the scoreboard that were retransmitted, in which case all skbs that
are marked as lost have a transmission order that is the same as their sequence
order. That means that in most cases in the existing skb_rbtree_walk iterating
through the tcp_rtx_queue we can do a kind of fast "merge sort" of the (already
time-sorted) lost skbs in tcp_rtx_queue into the (already time-sorted) skbs in
tp->tsorted_sent_queue.  This should allow us to keep the cost of
tcp_undo_cwnd_reduction() as O(packets_out) (without any extra list_sort()
cost), while still integrating all the lost packets back into
tp->tsorted_sent_queue in the vast majority of cases.

And in the rare case when somehow there is an undo while there are lost packets
that were EVER_RETRANS, it would be OK to fall back to an RTO for this rare
case. That is no worse than the behavior we have been living with for a long
time.

And with this approach we would not need to add any per-socket or per-skb
state.

Along those lines, what do you think about something like the following (which
compiles and passes your nice packetdrill test):

diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
index 92bc60716..cd7c3e408 100644
--- a/net/ipv4/tcp_input.c
+++ b/net/ipv4/tcp_input.c
@@ -2840,15 +2840,62 @@ static void DBGUNDO(struct sock *sk, const char *msg)
 #endif
 }
 
+/* Is skb @a after skb @b in tp->tsorted_sent_queue (send) order? */
+static bool tcp_tsorted_after(const struct list_head *a,
+			      const struct list_head *b)
+{
+	const struct sk_buff *skb_a = list_entry(a, struct sk_buff,
+						 tcp_tsorted_anchor);
+	const struct sk_buff *skb_b = list_entry(b, struct sk_buff,
+						 tcp_tsorted_anchor);
+
+	return tcp_skb_sent_after(tcp_skb_timestamp_us(skb_a),
+				  tcp_skb_timestamp_us(skb_b),
+				  TCP_SKB_CB(skb_a)->end_seq,
+				  TCP_SKB_CB(skb_b)->end_seq);
+}
+
+/* Link skb back into tp->tsorted_sent_queue in send order, at or after
+ * pos, and advance pos to it. Leave skb alone if it was sent before
+ * pos. As pos only moves forward, each call is amortized O(1).
+ */
+static void tcp_tsorted_relink_skb(struct tcp_sock *tp, struct sk_buff *skb,
+				    struct list_head **pos_ptr)
+{
+	struct list_head *head = &tp->tsorted_sent_queue;
+	struct list_head *node = &skb->tcp_tsorted_anchor;
+	struct list_head *pos = *pos_ptr;
+
+	if (pos != head && !tcp_tsorted_after(node, pos))
+		return;
+	while (pos->next != head && !tcp_tsorted_after(pos->next, node))
+		pos = pos->next;
+	if (pos != node)		/* not already linked in place */
+		list_move(node, pos);
+	*pos_ptr = node;
+}
+
 static void tcp_undo_cwnd_reduction(struct sock *sk, bool unmark_loss)
 {
 	struct tcp_sock *tp = tcp_sk(sk);
 
 	if (unmark_loss) {
+		struct list_head *pos = &tp->tsorted_sent_queue;
 		struct sk_buff *skb;
 
 		skb_rbtree_walk(skb, &sk->tcp_rtx_queue) {
-			TCP_SKB_CB(skb)->sacked &= ~TCPCB_LOST;
+			u8 sacked = TCP_SKB_CB(skb)->sacked;
+
+			TCP_SKB_CB(skb)->sacked = sacked & ~TCPCB_LOST;
+			/* RACK unlinked the skbs it marked lost. Skbs never
+			 * retransmitted keep their original send times, which
+			 * increase with sequence, so in one forward pass we
+			 * relink them all. For the rare case of undo after
+			 * lost retransmissions, we will fall back to RTO.
+			 */
+			if ((sacked & (TCPCB_LOST | TCPCB_EVER_RETRANS)) ==
+			    TCPCB_LOST)
+				tcp_tsorted_relink_skb(tp, skb, &pos);
 		}
 		tp->lost_out = 0;
 		tcp_clear_all_retrans_hints(tp);
