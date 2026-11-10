Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794335173;
	b=eYlliPleOuW7Whl/+y2iUPoH3yy/1bYWHL0iHQAGMgwAm75qhZxiNs0YvEDCkDmrslB2
	 IwJ20U54GYh8Zw0gXC7/qRM48ce+drxDBvCRRBBb9OawBrQHYLFsL/JtG2Td9mZStfTpm
	 twmcElv0tNuXqCSJmyTtLf5YRThsZMq7y1gChDoGitRM8SRT5/E85N7GJ7230NI82SB8z
	 QyaifSd/nZBfIOXW1SyR5V+e4SJPw3tF8B73nNhBj2bBCzKv9aX9yRJeTnPIBUd7Y4d9v
	 6K7sTToJjGBdc4zjJwsbGFY0SxpNm9jEkJExZmb+gaqjHv+7pE+CWbVAPFR+ZTdJarg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794335173;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=o/zk2YQgV579zMwD3M9nV9Vt6kgb+n47Jpfk4DZuUto=;
	b=NiYbkWy9JCIMVCnZQYm0Uv7QRfNNGuVghaOGgkLMTwqtwgb4RQfFQhWa1qWQTlgTvJd8
	 qG+1tsonrmpXu1b+Np38xZ35170sJpvQSbi4ncfgV/S4x854s6jTpsljj4C6d8V4CM44g
	 A3xksdVhIlonTceAVeA8lxjNkIvJ/zhT6GzWIwrSCs6uYYmNHk91Xash/rZ53f84GElQ4
	 svdvK64hyYBz+xnMwfOoTrmwxRzT1rPZPL2zwZmRzY8iqJAdp6s2d94vTW2AD0lioJgPo
	 udf2nLcFwifuq14J0LMkNoGctU5cZi9HZoGEHdip+i/0xp/sLbXvbox3dqzTtviQAJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YdpXQV46;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DDE3606A325
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 18:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YdpXQV46
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 397211F008A4
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 18:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794335172;
	bh=o/zk2YQgV579zMwD3M9nV9Vt6kgb+n47Jpfk4DZuUto=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=YdpXQV46t0dzvXfp0xl/75HDZIaRMCUC4TDUx3OSiqmVKQbub10YLJlNEwyOsvLAv
	 Cc9l7r1AUD0BDcHI6FRUngDEwjaJxjLxS9gc5b+ojK1s+T7+jl62oN+07gfFkkmtuq
	 6SUguWs/2dEpfd/810mUSV1QjV4Ox3TuOGdncVfoTID+ayBaxYNtaNGTCMxUuaGKnp
	 oRpS3AGwiKK8K30MYJhVMzEqY30dJpjLMrURsUPe1qQ863SUhb2mJW485VRw16Q9p6
	 O/Lz9FwsodYPHOZY950eUlNab3cN1+gtHdCF1fZXCaQEouXmZOrqoaQ7qThNIZvObf
	 QQc2rc3SS8mSw==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3ac97e45a79so18981191fa.3
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 10:26:12 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHm1+IENqriM8YITZkZEnIb4Zbu3wpMSnC8JOBBYcgVbZyoq3t4tg9E8HrSYS1zO+MTfTs51kqk7ZOa6EUsxAc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8WKNwKV5YFsS84BUYexyKf3Fs2EiFvt+EJvT9hn7BHgsavmOnq
	Tn8SPp+3YU8KqVNrdDNcxlrm9flepgJ6wuLpwsq0NNy8tki1oBROUMJ18DvRWBNHJSBdaXzBNmE
	Tdco1+v3qZV5tDquqxiMBAbbNdu0Kb+o=
X-Received: by 2002:a05:651c:556:b0:3ac:a2b0:ac56 with SMTP id
 38308e7fff4ca-3ae0967bd7amr6657991fa.29.1794335170933; Tue, 10 Nov 2026
 10:26:10 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <QDISC-TIAE.v3.r0.20261109173518@mojatatu.com> <QDISC-TIAE.v3.r0.20261109173518-2@mojatatu.com>
In-Reply-To: <QDISC-TIAE.v3.r0.20261109173518-2@mojatatu.com>
From: Eric Dumazet <edumazet@kernel.org>
Date: Tue, 10 Nov 2026 19:25:57 +0100
X-Gmail-Original-Message-ID: <CAL4Wiir0Gev+Uh6+S9oMkKnb6Keq=84PZWj81zTEySbv0zqOvQ@mail.gmail.com>
X-Gm-Features: AclHuK9PGaJG-lc-A3PNIbFpeP8DspAFjQpIiIvsAC-3-FXg1x-0OGkVO3q5aPo
Message-ID: <CAL4Wiir0Gev+Uh6+S9oMkKnb6Keq=84PZWj81zTEySbv0zqOvQ@mail.gmail.com>
Subject: Re: [PATCH net-next v3 2/3] net/sched: fq, fq_codel, fq_pie: skip
 empty rounds in the deficit-refill dequeue loop
To: Victor Nogueira <victor@mojatatu.com>
Cc: netdev@vger.kernel.org, Jiri Pirko <jiri@resnulli.us>, 
	"David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Jamal Hadi Salim <jhs@mojatatu.com>, 
	sashiko-bot <sashiko-bot@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mar. 10 nov. 2026 =C3=A0 15:30, Victor Nogueira <victor@mojatatu.com> a =
=C3=A9crit :
>
> The issue: fq, fq_codel and fq_pie refill the head flow one quantum per
> iteration until it has credit. With a size table that inflates the packet
> length to 1 MiB and a quantum of 256 that is ~4096 iterations per packet,
> so a dequeue over N flows can spin N * 4096 times under the qdisc lock
> with BH disabled.

I am quite worried by the complexity this series adds to six dequeue paths,
for a problem that needs a pretty unusual size table to show up.

I do not think the round tracking (first/scanned) is needed.

As long as no flow can be served, a round gives one quantum to every flow
and leaves the list in the same order. So the number of rounds needed
before the first flow can be served can be computed from the current head,
at any time, and added to all flows in one pass. There is no need to know
where the round started, nor to fix up 'first' in the throttle, drop and
detach paths.

Empty flows do not need to be removed in the bulk pass either: give them
the credit they would have had when detached, and let the normal path
detach them on their next visit. For fq_codel, this also keeps the reset
of the CoDel vars done by codel_dequeue(), which was one of the v2 issues.

To bound the cost of the scans, a dequeue-local refill counter is enough:
scan after a few refills, then allow the next scan only after as many
refills as flows scanned. The scan stops at the first flow with credit,
so normal setups only look at a couple of flows.

Something like the following for fq. It adds a helper and a few lines
where the head flow is refilled, and does not touch the other paths.
All flows share the same quantum, so the scan needs a single divide,
plus one per empty flow about to be detached.

With a setup close to yours (8192 flows, stab overhead 1MB, quantum 256,
fq under tbf), the longest fq_dequeue() goes from 8.4 ms to 19 us, and
the total time spent in fq_dequeue() during the drain goes from 138 ms
to 3.4 ms. The dequeue order captured with tcpdump on four mixed loads
is the same before and after.

The same helper shape should work for fq_codel, fq_pie, drr and sfq.
For DRR, a class whose child returns NULL from peek() can simply abort
the scan, as the main loop already handles that case.

ETS has at most 16 bands, I would leave it alone.

Also please, one patch per qdisc.

diff --git a/net/sched/sch_fq.c b/net/sched/sch_fq.c
index a282812c192eedea36320c21df2fdde793880b14..d0515ab14956af0b6a63d896b7c=
f659fbb77cf1d
100644
--- a/net/sched/sch_fq.c
+++ b/net/sched/sch_fq.c
@@ -732,11 +732,82 @@ static struct fq_flow_head
*fq_pband_head_select(struct fq_perband_flows *pband)
        return pband->old_flows.first ? &pband->old_flows : NULL;
 }

+/* Called from fq_dequeue() when the first flow of pband->old_flows has
+ * no credit, and new_flows is empty.
+ *
+ * As long as no flow can be served, each round gives one quantum to every
+ * flow and leaves old_flows in the same order. When packets are much bigg=
er
+ * than the quantum (for example inflated by a size table), thousands of s=
uch
+ * rounds can be needed. Add them all at once.
+ *
+ * An empty flow gets the credit it would have had when detached by the
+ * one-quantum loop. It stays in the list and is detached on its next visi=
t.
+ *
+ * Returns true if credits were changed, and the number of flows looked at
+ * in *scanned.
+ */
+static bool fq_skip_rounds(const struct fq_sched_data *q,
+                          const struct fq_perband_flows *pband,
+                          unsigned int *scanned)
+{
+       u32 add =3D U32_MAX, quantum =3D q->quantum;
+       int max_credit =3D INT_MIN;
+       unsigned int n =3D 0;
+       bool changed =3D false;
+       struct fq_flow *f;
+
+       for (f =3D pband->old_flows.first; f; f =3D f->next) {
+               n++;
+               /* fq_flow_add_tail() would move f to another band. */
+               if (f->band !=3D q->band_nr)
+                       goto out;
+               if (!f->qlen)
+                       continue;
+               if (f->credit > 0)
+                       goto out;
+               max_credit =3D max(max_credit, f->credit);
+       }
+
+       /* All flows have the same quantum: the non-empty flow with the
+        * highest credit is the first one to get credit.
+        */
+       if (max_credit !=3D INT_MIN)
+               add =3D DIV_ROUND_UP(1U - (u32)max_credit, quantum) * quant=
um;
+
+       for (f =3D pband->old_flows.first; f; f =3D f->next) {
+               int credit =3D f->credit;
+
+               if (!f->qlen) {
+                       if (credit > 0)
+                               continue;
+                       /* Only flows to be detached need a divide. */
+                       if (add > (u32)-credit) {
+                               f->credit =3D credit + DIV_ROUND_UP(1U -
(u32)credit,
+
quantum) * quantum;
+                               changed =3D true;
+                               continue;
+                       }
+               }
+               f->credit =3D credit + add;
+               changed =3D true;
+       }
+out:
+       *scanned =3D n;
+       return changed;
+}
+
+/* Number of one-quantum refills in fq_dequeue() before fq_skip_rounds()
+ * is tried.
+ */
+#define FQ_SKIP_ROUNDS_THRESH  8
+
 static struct sk_buff *fq_dequeue(struct Qdisc *sch)
 {
        struct fq_sched_data *q =3D qdisc_priv(sch);
        u64 offload_horizon =3D fq_offload_horizon(sch, q);
+       unsigned int next_skip =3D FQ_SKIP_ROUNDS_THRESH;
        struct fq_perband_flows *pband;
+       unsigned int refills =3D 0;
        struct fq_flow_head *head;
        u64 time_next_packet =3D 0;
        struct sk_buff *skb;
@@ -782,6 +853,16 @@ static struct sk_buff *fq_dequeue(struct Qdisc *sch)
        f =3D head->first;
        retry =3D 0;
        if (f->credit <=3D 0) {
+               if (unlikely(++refills >=3D next_skip) &&
+                   head =3D=3D &pband->old_flows) {
+                       unsigned int scanned;
+                       bool skipped =3D fq_skip_rounds(q, pband, &scanned)=
;
+
+                       /* Bound the cost of scans to the number of refills=
. */
+                       next_skip =3D refills + scanned;
+                       if (skipped)
+                               goto begin;
+               }
                f->credit +=3D q->quantum;
                head->first =3D f->next;
                fq_flow_add_tail(q, f, OLD_FLOW);
