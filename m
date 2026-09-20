Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4533D3C7696
	for <linux-kselftest@vger.kernel.org>; Sun, 20 Sep 2026 17:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789924010; cv=none; b=Bevr0lE6UUEenbfZaC07Ml+jmTvQ1gS/NZDWwD1PtXyOixE2GBP9GsUZxNJGL8AETFWLMXkgC2FZarwyuWU3NITenoh6/CABzWNFkb6iKK/BeNH9oyHRHMTyuBPPZM5VJ/0o4is0kaYZdjOV650hWGczXtDDaZLVoHTKW/mYmGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789924010; c=relaxed/simple;
	bh=zyIl1YnF/JeDemR1K+Qanp4L+ZXF5mP582Kn34vWEy8=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:In-Reply-To:
	 References:MIME-Version; b=ja2JzVAT9LQFOX9H8c5tprmgRuJIFgXgka/E2dcIgAsxm5EdfFhjMlZI4r8kFZrGW1zcDb+b3dszPItQr5l2oWmUIJSijim/39Yq7texrzAnqcdGjCdBJJH2TkfAURVAjDeQnMNuF7fflyuXDvYD+tYQuaTc9lbOyH1JUjekgRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ISqT5DKM; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ISqT5DKM"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-396ccafb752so1862813a91.0
        for <linux-kselftest@vger.kernel.org>; Sun, 20 Sep 2026 10:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789924008; x=1790528808; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:from
         :subject:cc:to:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YjWfIDJ8pChJcBT+tDEEp1v7Bwad+KNaOWOCVwGIFkE=;
        b=ISqT5DKM960lQRUriozMuzkHZLrb7N1gpYgZklj3uckDCsFJtJzKVKkbqwKO5hUGKi
         zDQYcoKYG4TGAb/ZupyK9u44lWqSBGDjwE8zjJpSJc90tZANict9P4G63mHO6EwsS1kw
         xdE19gyxnUR9NGWWmDoSVKqh5m+rkQBjuHy0tJZiZEzch2bnl8jE6X+8NOWFgoKN1KCw
         DgkJByv6P+Qf/CgX2matMw66vLlf/mM+9cNw9r+dRAt0GDXYRATo33F8bAZBH9ZSgG6Z
         WxDzlOEDBGBl4xawrGtuomiEtN++daha1qP0mC2kkkWbp18h03D4ElMBLfIUYzmJFNqS
         0wvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789924008; x=1790528808;
        h=mime-version:content-transfer-encoding:references:in-reply-to:from
         :subject:cc:to:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YjWfIDJ8pChJcBT+tDEEp1v7Bwad+KNaOWOCVwGIFkE=;
        b=izKACF3PfX8p8mf6m9ZCh7e5pJgLOUs1OAwUHCXA+Lx5PNlnloVlEXI+5c0ERiOL0k
         RZJRw5mVEwmEzCkIt/aObXTQrZSADRcMCCHddqZgKSVNDU643f4aiSlF6/3QBZWXHBvQ
         WS9tbUKd+70Qfz1uFmUN1h05p6X0CZs9JXIeRjSvmU5QDzUJ71rBik2+IQdVAlJ0f9BR
         hHvtO32czbjwDLBSNPQDWMGPosfOe4gvfvdOCFgMu0KBnwl6HANisjhvKDxXXNuJPObx
         qBQR8pS4lZDIO4jMsFEOcrTfeCuT9jezM22AiLyb3OK5zFkpar6q2ENm2iCic8pwAFhP
         p5jQ==
X-Forwarded-Encrypted: i=1; AKwUvBymGwdZEFO4OhfE9S54ZNOSDKn31THr03gGYI67d7Gi1gQhcPRseJZJn3TLvRjMrcycfz7FE0gPl3DADEa8xPc=@vger.kernel.org
X-Gm-Message-State: AFuF++nufXry1Cf583JH6RwzP9qH/QumF+tfg5qJd9h8FU1KGqIWZHHv
	++qKet8LeupSytRLUw/KhZAfy4rmI/MxJmzvpBOp3dLYlyDAkdKORaWx
X-Gm-Gg: AYBFou1JJM7p7y+F8LYk86l6KQYhtg0tIBxms5SYwmgC1nt+EGZhmWyrgnhYqiyYE1n
	mdstDC/wlvgamKFzKIyxVvUWCeYr2WrT9br5xVtHtTb9BBqQkMCRIDsbs5PXljcSr548qIVHzcZ
	n5GzDW649tHDL/kZIQ7CnkobdwPjAQIK7LjinYC1Gpe0nIt0vo+9DNNMHqO60U0kS2+k/qe1qlm
	YVBX6cAC0NBw9tLEL2RNbbM4ax6U51BuUILwFRnDrRq/Z8cdJDQZ7cjB4cKzTkpN0FfKHXI5j4o
	1m5hg1TZ5C6sOnIl0fQ38HizVqiYJ/7hwBsh5CSOcpCEwd6pamCDXnRrH3ewXgungVx0ElaP8ts
	wQfDEk9oeEWSn6AuX6FJvTqQib051GwbFm9vVHNgk4pHm3aDj6odts7E9T4ot+gy9/1v7mqeQ/b
	k5zLOv3/ZtVC4+7VGzgiQ3uNcwGK0hc+U3LFO2FWLssN3gQHUdsKJem+3QVypQV+/eDE/PkxstN
	MqSZxRb2SWb8EKfT/JK6L1ejhL+fOY9OOTxM+OTY5SM9eCa3kK74bLqHnT4SIjhD6aqoFvPhZRG
	VkNu
X-Received: by 2002:a17:90b:2d87:b0:39d:e54c:8658 with SMTP id 98e67ed59e1d1-39e54d8ecdemr20165760a91.5.1789924008366;
        Sun, 20 Sep 2026 10:06:48 -0700 (PDT)
Received: from localhost ([153.61.198.243])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6bd191aesm10168886a91.0.2026.09.20.10.06.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Sep 2026 10:06:47 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Sun, 20 Sep 2026 17:06:47 +0000
Message-Id: <DLKB3T7PYCND.3FLS0I8UEX9NL@gmail.com>
To: "Weiming Shi" <bestswngs@gmail.com>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "John Fastabend" <john.fastabend@gmail.com>,
 "Andrii Nakryiko" <andrii@kernel.org>, "Eduard Zingerman"
 <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi" <memxor@gmail.com>, "Martin
 KaFai Lau" <martin.lau@linux.dev>, "Song Liu" <song@kernel.org>, "Yonghong
 Song" <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>, "Emil
 Tsalapatis" <emil@etsalapatis.com>, "Ihor Solodrai"
 <ihor.solodrai@linux.dev>, "David S . Miller" <davem@davemloft.net>, "Eric
 Dumazet" <edumazet@google.com>, "Jakub Kicinski" <kuba@kernel.org>, "Paolo
 Abeni" <pabeni@redhat.com>, "Simon Horman" <horms@kernel.org>, "Shuah Khan"
 <shuah@kernel.org>
Cc: <linux-kernel@vger.kernel.org>, <bpf@vger.kernel.org>,
 <netdev@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 =?utf-8?q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>, "Peter
 Oskolkov" <posk@google.com>, "Xiang Mei" <xmei5@asu.edu>,
 <stable@vger.kernel.org>
Subject: Re: [PATCH v3 2/3] bpf: clear stale IPv4 options after LWT
 encapsulation
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
In-Reply-To: <20260920163211.795547-3-bestswngs@gmail.com>
References: <20260920163211.795547-1-bestswngs@gmail.com> <20260920163211.795547-3-bestswngs@gmail.com>
X-Mailer: mkdraft (claude review draft; edit before sending)
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, Sep 21, 2026 at 12:32 AM Weiming Shi <bestswngs@gmail.com> wrote:
> Select the reset layout from the protocol callback which consumes the
> packet: the original family for BPF_OK and unsupported redirects, or the
> new family for supported reroute and redirect paths. Preserve the ingress
> interface and L3-slave state from the restored original control block and
> initialize the IPv6 next-header offset when needed. Save and restore the
> marker around nested LWT runs.

What Daniel sketched in v2 was 20 lines. This is still an overkill.

[...]

> +static void bpf_lwt_reset_cb(struct sk_buff *skb, __be16 orig_proto,
> +			     bool use_new_proto)
> +{
> +	__be16 cb_proto = use_new_proto ? skb->protocol : orig_proto;
> +	int iif = skb->skb_iif;
> +	bool l3slave = false;
> +
> +	/* VRF may have replaced skb_iif with the master device index. */
> +	if (orig_proto == htons(ETH_P_IP)) {
> +		iif = IPCB(skb)->iif;
> +		l3slave = ipv4_l3mdev_skb(IPCB(skb)->flags);



When the family doesn't change only IPCB(skb)->opt is stale.
Clear just that like ip_tunnel_xmit() and udp_tunnel_xmit_skb() do.
iif and flags stay as they are and the VRF special casing goes away.
When the family changes do what seg6_do_srh_encap() does.

[...]

> +	use_new_proto = (ret == BPF_LWT_REROUTE &&
> +			 lwt->prog->type != BPF_PROG_TYPE_LWT_OUT) ||
> +			(ret == BPF_REDIRECT && can_redirect);
> +	if (lwt_ip_encap)
> +		bpf_lwt_reset_cb(skb, orig_proto, use_new_proto);

Not needed. BPF_OK after the prog changed the family is broken no
matter which layout the cb has. bpf_xmit() drops such skb and
bpf_input() hands a v6 packet to ip_forward().
Use skb->protocol.

pw-bot: cr
