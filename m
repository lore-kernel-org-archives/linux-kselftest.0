Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED0031E823
	for <linux-kselftest@vger.kernel.org>; Fri, 19 Jun 2026 05:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781846874; cv=none; b=XBfhUkTVrqGS+nYAzmIBjRERmVQcpxzhZLfPpAyblL6YKWXy0qnnQ32MdOZ5pCjZAQ6JpatzNXCf/0TT7cegjDrFF5w5fOtfvjU8by8O0g+zJ3cZRlVkDDN4kU5PI3P4TuJ494bEDJKQstT9P+LGD7X/pVQkcUqd2SIi6534Qh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781846874; c=relaxed/simple;
	bh=1xYUQuEJGMisyUSD8yUCi+h0r0/aFvN7+YM/tQTSNF0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dD67nwTgHdd9pCQWLwVuGCAW1ckDkJ9t8kwxocucsFQWl4KfIRKRX/92aRcuG+NxIKV7bHYgbLn7SfDMVXTFD2lZokqY/oHaE2rt46JrFq8iJwgNkXS+YBWMZmMOk087gGKt14V8p+GQuHmhGS1GHja+s7blZJZxkSRDye4DOvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p8ZfD/P8; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p8ZfD/P8"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-84232e83ca9so746865b3a.2
        for <linux-kselftest@vger.kernel.org>; Thu, 18 Jun 2026 22:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781846873; x=1782451673; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jT5ucJxS3AylJogy+VJoQXNUQw9OyolCVtNHaI3XYUY=;
        b=p8ZfD/P89scY7aHF3DDmt4188opoU/bj2m0cZ7nztD73fcmuS4mFyANacI+++wBTV7
         fvmXhNA7ki9tbxXIceT3H1ICYOOUW/l3LlivOFGQH6Nq8fNC8pusEAcMk61GRRONsUDB
         owYEb7Y88JNQ8cQax12csfRm+VIPnZV9OSNthOT61Xt6w5aW0mvNoEqgbZ4V3ssLGGuE
         is9XTCKwKp+mihMfeHbAoEPGCo0E+QfsbehwFgjn2IJXVhz77BVExrKQA6j8DXojVK2B
         Q+yZiLq3Ebwzy2QQdgqXwC2SmFGW0xMZrlrDaCh+CEpEPFUwVdmuV0pUgkh7opVuV9Xb
         D+4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781846873; x=1782451673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jT5ucJxS3AylJogy+VJoQXNUQw9OyolCVtNHaI3XYUY=;
        b=MLtjou73Ur36DVO8bKRBMFZbu97iEv8fTqoywWLnHMjVbuACsT1/9qCjAyKLuU5g5l
         HfHBehOUrkA0GZdFTFL2Noi2Nn/RTXlJBL2mBSCVm8l4pGl4gOvNDLc4nXYEoHksutcK
         osASNrgSB0YqXiPHficHvSt+h1EwDnQ44neELTymNEushruruvAhQNifsWAzPxMhOlGS
         nUR/uvUk2owst8d4MD/Mjw986CCcWdLOjJ5gH29LddyZIfhJllPMhl+yfYW9DILxOTbL
         ZD+BuySyg3/ouBcRJS08rhRrVG7l5SDiT6s3T9NR5jTJP7lGW1o+1IQ1Azy3KXLyC1VL
         UqPw==
X-Forwarded-Encrypted: i=1; AFNElJ8zWvEdIKNt2ymwvAyXr31+BmTtDN3drLP67tAP1Q4mTFDUSZ9ew7rtV+R7AfUGrbitYC7Ndf92DvE667FNZ64=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5YSsXBDSmQtGHzb6sZiikPvQIDSapcUj63Af1QRVnSNSyfveB
	rUCzeuugcHcfWpPUKQGvaEv4BjmCS2Gw/lT+eFgxw0hUN6LnBSs1mj7J
X-Gm-Gg: AfdE7ck8H/4kQ/oFpXxmfaz4wMFMclzp6a8ZxjI0qa9DgA+xKxlUukWakGIWorggKNb
	am0AP2kgk61XICVxFQ5pPlvwlGNdn+t0lzb4y7CVT/DNm26BKfQFo2OczrbvHPBz1Va17eXwZgr
	RlEoNxSKQjtgPKz6kdvzczXYtA3Srfc0OwYi94i4CkEg/Z/PUlw09AasnfiO6tEPHoGjSEK2HLL
	gFaWf+fZF87tOPYJINeDOpZBS25u1CV36MDCAM65VfDAG8kd+u2blum7ZiBfM84rxqW2YgcT0Vk
	OtpTTXIFhf05ERWW6druojvd7twYR7YijCz3s+KZ78DATRe8pVVMEkyy+vLDIBC9PCgJVGK7MlE
	ZKwimcUO8yiuyU1GQC0PB1i/9SppAXmJaY0ZQ3cY0RMGLuHc18bF7f4wfJZsZruKmcKsynDT8BX
	aiG+8gow==
X-Received: by 2002:a05:6a00:8d8d:b0:841:d0c0:d9dc with SMTP id d2e1a72fcca58-8455619dc41mr1133217b3a.44.1781846872511;
        Thu, 18 Jun 2026 22:27:52 -0700 (PDT)
Received: from dev ([163.43.103.131])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84553858d22sm1163644b3a.55.2026.06.18.22.27.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 22:27:51 -0700 (PDT)
From: Yuya Kusakabe <yuya.kusakabe@gmail.com>
To: andrea@common-net.org
Cc: Yuya Kusakabe <yuya.kusakabe@gmail.com>,
	andrea.mayer@uniroma2.it,
	davem@davemloft.net,
	edumazet@google.com,
	dsahern@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	justin.iurman@gmail.com,
	shuah@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-doc@vger.kernel.org,
	stefano.salsano@uniroma2.it,
	ahabdels@cisco.com
Subject: Re: [PATCH v2 4/7] seg6: add End.M.GTP6.D behavior
Date: Fri, 19 Jun 2026 14:27:39 +0900
Message-ID: <20260612032313.24062-03-yuya.kusakabe@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260607020517.0c6bbb8beba505ac9447545e@common-net.org>
References: <20260607020517.0c6bbb8beba505ac9447545e@common-net.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Andrea,

Thank you for the review. The points shared with patches 1-3 will be
addressed as described in those replies; below the
End.M.GTP6.D-specific ones.

> The "src" attribute is used verbatim here as the outer IPv6 source address,
> same as patch 3. The src dual-semantics overload flagged in the patch 3
> reply applies here too.

Covered in the patch 3 reply: with the End.M.GTP4.E template use
gone, verbatim outer IPv6 SA becomes the single meaning of the src
attribute for the IPv6-emitting behaviors.

> Thank you for the follow-up in the cover letter thread. The finish callback
> writes orig_dst into SRH[0] and Args.Mob.Session into SRH[1]. As far as I
> can see, this matches neither Section 6.3 (Args.Mob.Session in SRH[0], no
> D) nor Section 6.4 (D in SRH[0], no Args.Mob).

Confirmed, that is the bug from my May 10 note. The next version of
End.M.GTP6.D will push the configured SR Policy verbatim and stamp
Args.Mob.Session into SRH[0] (at the locator length given by the
explicit sr_prefix_len attribute) per Section 6.3 S08; preserving the
original outer DA in a prepended slot will be exclusive to
End.M.GTP6.D.Di.

> Same reverse Christmas tree as patch 2; same issue in the other functions
> introduced by this patch.
> gtp is only used as a cast intermediary. Could it be inlined?

Will fix both.

> Nit: gtphl and hdrlen are assigned before the GTP1_F_EXTHDR check. On the
> path where the E flag is not set, gtphl is unused. Moving the gtphl
> assignment after the check would make the flow clearer.

Will move the gtphl dereference after the check; the pull has to stay
before it, since the long header is also consumed for S/PN-only
flags.

> Maybe ext could be renamed to ext_hdr? It would be easier to distinguish
> from ext_units and ext_bytes.
> ext_units is only used to derive ext_bytes. A single ext_len would
> remove the intermediate variable.

Will do both.

> If the extension chain contains more than one PDU Session Container, *qfi
> is silently overwritten. Is that intentional, or should the function reject
> a duplicate?

Not intentional; will reject a duplicate PDU Session Container as
malformed, with a selftest case for it.

> ext[ext_bytes - 1] reads the Next Extension Header Type field from the last
> byte of the current extension. Would a short comment help the reader?

Will add one.

> input_action_end_m_gtp6_d() does not change skb_dst(skb) before this call,
> so dst and lwtstate are the same ones the caller already dereferenced. When
> can this NULL check trigger?

It cannot: for a route installed with LWTUNNEL_STATE_INPUT_REDIRECT,
lwtunnel_set_redirect() always populates orig_input before dst.input
is replaced. I will drop the checks and call orig_input directly.

> Same dst/lwtstate issue as patch 2. Not introduced by this patch.
> Same missing iptunnel_handle_offloads() as patch 2.

The NF_HOOK split goes away per the cover letter thread, and the SRv6
push will go through a shared helper that calls
iptunnel_handle_offloads(skb, SKB_GSO_IPXIP6) before
seg6_do_srh_encap().

> Same BAD_INNER misuse as patch 2. seg6_do_srh_encap() can also fail from
> seg6_push_hmac(), which is an HMAC error on the new SRH, not an inner-T-PDU
> problem.
[...]
> segments[0], segments[1], saddr, and daddr are written after
> seg6_do_srh_encap() already called skb_postpush_rcsum(). skb->csum can
> be stale. Same for any later change to the outer header or SRH.
>
> HMAC, if configured, is computed on non-final SRH and saddr, hence invalid.

Thanks, both of these are real issues. My plan for the next version:

- every field stamped after seg6_do_srh_encap() (Args.Mob.Session, the
  preserved DA in the drop-in variant, the outer saddr/daddr refresh,
  and the dsfield propagation in H.M.GTP4.D) will go through a small
  helper that applies the corresponding diff to skb->csum when the skb
  is CHECKSUM_COMPLETE;

- the D-side behaviors will reject an HMAC-flagged SRH template at
  configuration time: stamping the per-packet fields after
  seg6_do_srh_encap() has signed the SRH would always invalidate the
  HMAC. Inbound HMAC validation is unaffected. Would you prefer the
  stamp-before-sign ordering solved from the start instead?

> The initializer on reason is dead. Every goto drop path sets reason
> explicitly before the jump. The variable can be left uninitialized here.

This goes away with the drop-reason rework: the MUP drop reasons will
be out of the initial series per the prep series plan, so the variable
itself is removed.

> Same SRH validation concerns as patch 1. HMAC is not validated here.

The ingress will use the same three-state SRH helper as the other
behaviors, which validates the HMAC whenever an SRH is present.

> Limitation note for both input_action_end() calls above: correct per RFC
> 9433 Section 6.3 S10-S11, but the SRH is absent or SL == 0 here, so
> input_action_end() will always drop without signaling non-GTP-U traffic.
> Perhaps you meant to drop directly with BAD_GTPU?

Right, the End fallback could only ever drop here. Instead of
dropping, I plan to hand non-UDP, non-GTP-U and non-T-PDU packets to
the route's original input path (the orig_input saved by the lwtunnel
input redirect), so a downstream owner of the GTP-U control plane
still receives e.g. Echo Request; the selftests will cover that
passthrough.

> Nit: inner_first could be an inner_ver with the shift done at assignment.
> The name would say what the variable holds.
[...]
> Same repeated size-selection ternary as patch 2.

Will do both: the inner version, header length and protocol computed
once in the switch.

> The anonymous { } block scopes three variables that should be declared at
> function top. Splitting into smaller helpers would make this easier to
> follow.

Will split the dispatch and outer strip into a decap helper shared
with End.M.GTP6.D.Di, with declarations at function top.

> Same missing frag_off check as patch 2.

Will add.

> The "{,.Di}" shell brace notation is unusual. Emitting the actual
> behavior name (End.M.GTP6.D or End.M.GTP6.D.Di) would be clearer.
> Same applies wherever this notation appears in the patchset.

Will replace it with the concrete behavior name everywhere.

Thanks,
Yuya
