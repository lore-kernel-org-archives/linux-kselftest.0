Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794681955;
	b=eKBTqmS+Di/BRSBMAjeioN4uV+lsxwa2l/5mUXPV70ak489WoVEthwsDr2p0UuWeGov4
	 aY0KyqXCSc3eft+vI0b2kU0i/iM9BuTmdmkX16dQ6s/OROWZpinNUO/KElYyhV1oDZopy
	 rBGc185BiQhy1fs5RMT3KnyOxoBPX0RNfQnHJn2/JOjEI9nWFDVwe1Rxj/Yt6MX4E1/oN
	 ItjE679LrqsUxiegezOI5IGotrFJUFky3tJarlvvAIw4gM1gBxmRebQe/sd/t1dJic84K
	 7IP/+zMS/zlbFu448i/jrqYJ/bTkKYFtDdi4woCrL5Oh5/PlGHPOhblML9BCZLlfmTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794681955;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 To:Cc:Subject:From:X-Mailer:References:In-Reply-To;
	bh=mhjMuwlcmmA6xmnk85ku3gy5AP9/nFkfmboSqD/BPaw=;
	b=vIoK7AVC6A99V74N9p+2qjj53rsdQv6ceayJZl0ajfV21H+6+ahCn3KRXoEWYzm8ohe0
	 j/2MvX68bMTAprPhurdAp8TFGS813TSu2TeKGXq5rAMzoVGr/x4jrbMQ4/YEU1ELFgUB+
	 uTD71846XBpNldFX4x78X84n9c4TnWXC0EMWecDY/0sLbmKOiyh30qxaNPhoO53ogguFy
	 j35IpvNgHOYSgeCgNpd/Ww8fge4ddWnFpCGg4oxV8QS9tV/ScFW0SEhMlJvuTacHYKMJx
	 hkNADDk9vRgc6CIMNLJeir36EPOM/r+6jh9aMgFKELW4Ju1fWnIUUF8yZn//ooMNFDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JUeDpqG+;
	arc=none smtp.remote-ip=209.85.222.178
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE99606A327
	for <linux-kselftest@vger.kernel.org>; Sat, 14 Nov 2026 18:45:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ADE99606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JUeDpqG+
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-93f2b8cf037so274327185a.1
        for <linux-kselftest@vger.kernel.org>; Sat, 14 Nov 2026 10:45:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794681954; x=1795286754; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mhjMuwlcmmA6xmnk85ku3gy5AP9/nFkfmboSqD/BPaw=;
        b=JUeDpqG++mf++7m4owPYQY97vDM1BdXIWpPWR9xMWUZo/jdQTQsMwApPcqakMIy9T4
         bxBTvAMMz8cKj90Y6hp8UVgQ08iHpVMTDGMkUDTTZhVtpCSlyDuLv23ZnhonAuYDQgX8
         oKPmJkcSN/LwL2vss6NxVKCVeiDgu6Jb9i1asyhayqdGhm3Z2qCoxUSeMlF0vthK2ck5
         xAz0/N+HElRMTaHFWZq2OAQvjEq5u87HjKalMvOkcw0cuyITO7+1Q1tMelM41VswOSma
         eUXZCNlTSp9PzhYqOD42jYE7WEurOcBwmyk9tMnP0YI2OkSYeC7Oqkb+p2tb0NKGtJCS
         ZZBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794681954; x=1795286754;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mhjMuwlcmmA6xmnk85ku3gy5AP9/nFkfmboSqD/BPaw=;
        b=iG8xhd+uloV3/9DqKMWF+TG58YqHtnHCR7uV/l3jDBHgCkmyy1mojlTjA9Uan9fgzs
         mXoNGFUIa+4olvygANt0A8scl6F7W+gQjVTwYcXm9WiDy0L++GG9REyXd4uJ1pYFTD+Z
         kSasVFEwz66vl6hxXlYRglQD+shIbXorBdSjKWwcFXWnNHXo5f/2Fbxh2ENDS4SMxtA8
         G0fTi4EG9xs6sVTR+HAqPrgIdHS5ifPIw4LpzhIOvKeRqz5pxCf+6509YiWdsY7n8oAV
         BO2icpbzX8VPZlYe+yuawF3X6i+/Uwzeap6eR+L/e8Dan1PkR52Q3dGvauHeAPJKfBQ5
         JgTg==
X-Forwarded-Encrypted: i=1; AL+hErGwG2tpTLUmlt9+n7/g1QQHcQNf4dq1Ycb8bwYtatsnLgbm36bFW7OV7MKJuL/hydy6o79IakunQ9FSujnpEMA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8kFrAOzQrpMci32J64mGwGLU06fme8Do/TzzWRPUK4Enqbnaic
	I83fMAc1hvFIWdSi5/q31M5eFr8dXbl0XjF9SmLmn/Tz+munBkmjvSbc
X-Gm-Gg: AYBFou0bVVYeJTlp0ibw0WOYQcc/Gm7zKgcmgE+htVFiiar6wd1Dnq6Qdm22uBvyZt6
	XK1CggfoUu4u+WHZQU3+1H44nyU0PPOd6uQsC97jSDsbng/IFEGRFWarWYjuWGSRlxVSwHxu/DF
	ailMudH8BoVcKhqtCxcT9WgkYB59djVB//UDzcIop+lsOlhhjfzwvUdUhnAIQH/hxwpGJrASO7/
	Qd8rX38Owg2h8SK44yoAMTMzBPtlpB8CYI9z9DopS7gtDZvWftcD849/pY2R1hZtk7X7JZx0prf
	4Ue7T8pak/pA6qp/4CZpgt47fAr5Qa23d1D6MTJTKqGQMZW9sI5yjCzfqZZ1TQDGnTkNWSeRSZW
	DXK/qbVm03dD0UQUlNssOoi8H2eod1Reg2f6oirSoOXTflw+Sh0FaLlyxhOdhgqf/Vep6614uy2
	Dvq7It8sySdN72eF8mYg2Cks6waExgL4IWoqreH68LnCJaseFWI94z1M7MKE3yfs/7TtCYU0jPn
	5sNsudL4dSU43iIYcm3/2JwOk6n94/SNgz1U7C0JSQnXpECEJaJ7Uz7utO6mlA5NMLfkc6xVdyG
	q5o3k1oCyaNtH//XxLihLPxXFb/LEIyQpzhzPFQbOr2X209nPPbDF11ALE+r2hbx3yYMTl2Z1ez
	alxykrHiqIGmBti3jj0u5sCRpMMZk1itLpA==
X-Received: by 2002:a05:620a:25c6:b0:93f:1936:b229 with SMTP id af79cd13be357-9494bbfe4ecmr937435085a.77.1794681953514;
        Sat, 14 Nov 2026 10:45:53 -0800 (PST)
Received: from localhost ([153.61.198.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9495a5ef5c4sm338706085a.6.2026.11.14.10.45.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Nov 2026 10:45:52 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 14 Nov 2026 18:45:49 +0000
Message-Id: <DMV5NLOEYFGF.C7ITHCRCNA7P@gmail.com>
To: "Michal Luczaj" <mhal@rbox.co>, "Alexei Starovoitov" <ast@kernel.org>,
 "Daniel Borkmann" <daniel@iogearbox.net>, "Andrii Nakryiko"
 <andrii@kernel.org>, "Eduard Zingerman" <eddyz87@gmail.com>, "Kumar
 Kartikeya Dwivedi" <memxor@gmail.com>, "Martin KaFai Lau"
 <martin.lau@linux.dev>, "Song Liu" <song@kernel.org>, "Yonghong Song"
 <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>, "Emil
 Tsalapatis" <emil@etsalapatis.com>, "Ihor Solodrai"
 <ihor.solodrai@linux.dev>, "Shuah Khan" <shuah@kernel.org>, "John
 Fastabend" <john.fastabend@gmail.com>, "Eric Dumazet"
 <edumazet@kernel.org>, "Kuniyuki Iwashima" <kuniyu@google.com>, "Paolo
 Abeni" <pabeni@redhat.com>, "Willem de Bruijn" <willemb@google.com>, "Jakub
 Sitnicki" <jakub@cloudflare.com>, "Jiayuan Chen" <jiayuan.chen@linux.dev>,
 "David S. Miller" <davem@davemloft.net>, "Jakub Kicinski"
 <kuba@kernel.org>, "Simon Horman" <horms@kernel.org>, "Jonathan Corbet"
 <corbet@lwn.net>, "Shuah Khan" <skhan@linuxfoundation.org>, "Randy Dunlap"
 <rdunlap@infradead.org>, "Stanislav Fomichev" <sdf@fomichev.me>
Cc: <bpf@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, "Sashiko" <sashiko-bot@kernel.org>
Subject: Re: [PATCH bpf-next v3 0/8] bpf, sockmap: Restrict iter-context
 sockmap updates to sockmap iterators
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
X-Mailer: aerc 0.20.1-355-gf870624f6c37
References: <20261107-sockmap-update-limit-iter-v3-0-7c0bad1ad036@rbox.co>
In-Reply-To: <20261107-sockmap-update-limit-iter-v3-0-7c0bad1ad036@rbox.co>

On Sat Nov 7, 2026 at 5:58 PM UTC, Michal Luczaj wrote:
> Follow-up to Sashiko's report [1] and the decision to restrict which
> iterator may perform sockmap updates [2]. Series started short: remove
> about-to-be-stale test, restrict updates, add a negative test. Then it
> expanded: mark bpf_iter__sockmap::sk as PTR_TRUSTED, restrict
> bpf_sock_destroy() callers to iter/{tcp,udp}, few little tweaks.
>
> [1]: https://msgid.link/20260626205814.BAC3C1F000E9@smtp.kernel.org
> [2]: https://msgid.link/87echn2fhd.fsf@cloudflare.com
>
> Signed-off-by: Michal Luczaj <mhal@rbox.co>
> ---
> Changes in v3:
> - Drop RFC prefix
> - Update bpf_iter_reg::feature docs
> - Fix tcp_request_sock BTF build error
> - Restrict allowed callers of bpf_sock_destroy() to iter/{tcp,udp} (Alexe=
i)
> - Link to v2: https://patch.msgid.link/20261102-sockmap-update-limit-iter=
-v2-0-e96a63c43b39@rbox.co

Sorry for the delay. Applied.
